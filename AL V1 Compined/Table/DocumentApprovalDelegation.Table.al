#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Table 50017 "Document Approval Delegation"
{
    // DrillDownPageID = UnknownPage51511600;
    //LookupPageID = UnknownPage51511600;

    fields
    {
        field(1; "Delegation No"; Code[20])
        {

            trigger OnValidate()
            begin
                if xRec."Delegation No" <> "Delegation No" then begin
                    SSetUp.Get;
                    //cc//  SSetUp.TestField("Delegation Nos");
                    //cc//NoSeriesMgt.TestManual(SSetUp."Delegation Nos");
                    "No. Series" := '';
                end;
            end;
        }
        field(2; "Current Approver ID"; Code[80])
        {
            TableRelation = "User Setup";

            trigger OnLookup()
            begin
                LoginMgt.DisplayUserInformation("Current Approver ID");
            end;

            trigger OnValidate()
            begin
                LoginMgt.ValidateUserName(users1, users1, "Current Approver ID");
            end;
        }
        field(3; "New Approver ID"; Code[80])
        {
            TableRelation = "User Setup";

            trigger OnLookup()
            begin
                LoginMgt.DisplayUserInformation("New Approver ID");
            end;

            trigger OnValidate()
            begin
                LoginMgt.ValidateUserName(users1, users1, "New Approver ID");
            end;
        }
        field(4; "Start Date"; Date)
        {

            trigger OnValidate()
            begin
                CompInfo.Get;
                //cc//  if CalendarMgmt.CheckDateStatus(CompInfo."Base Calendar Code", "Start Date", Description) then
                Error(Text003);
            end;
        }
        field(5; Duration; DateFormula)
        {

            trigger OnValidate()
            begin
                CompInfo.Get;
                EndDate := "Start Date";
                NoOfDays := (CalcDate(Duration, "Start Date") - "Start Date");
                //Calculate the end date based on working days
                repeat
                    // cc// //cc// if not CalendarMgmt.CheckDateStatus(CompInfo."Base Calendar Code", EndDate, Description) then
                    NoOfWorkingDays := NoOfWorkingDays + 1;
                    EndDate := CalcDate('1D', EndDate);

                until NoOfWorkingDays = NoOfDays;
                "End Date" := EndDate;
                //cc////   //cc// if not CalendarMgmt.CheckDateStatus(CompInfo."Base Calendar Code", "End Date", Description) then
                //cc    Loop := true
                ////  else
                //    begin
                //cc      Loop := false;
                repeat
                    "End Date" := CalcDate('1D', "End Date");
                    //   //cc// if not CalendarMgmt.CheckDateStatus(CompInfo."Base Calendar Code", "End Date", Description) then
                    Loop := true;
                until Loop = true;
            end;
            //     end;
        }
        field(6; "End Date"; Date)
        {
        }
        field(7; Status; Option)
        {
            OptionCaption = 'Open,Processed,Expired';
            OptionMembers = Open,Processed,Expired;
        }
        field(8; "Delegation Limits Approver ID"; Code[80])
        {
            TableRelation = "User Setup";

            trigger OnLookup()
            begin
                LoginMgt.DisplayUserInformation("Delegation Limits Approver ID");
            end;

            trigger OnValidate()
            begin
                LoginMgt.ValidateUserName(users1, users1, "Delegation Limits Approver ID");
            end;
        }
        field(9; "No. Series"; Code[20])
        {
            TableRelation = "No. Series";
        }
        field(10; Description; Text[250])
        {
        }
        field(11; "Alternate Approver ID"; Code[80])
        {
            TableRelation = "User Setup";

            trigger OnLookup()
            begin
                LoginMgt.DisplayUserInformation("Alternate Approver ID");
            end;

            trigger OnValidate()
            begin
                LoginMgt.ValidateUserName(users1, users1, "Alternate Approver ID");
            end;
        }
    }

    keys
    {
        key(Key1; "Delegation No")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }

    trigger OnInsert()
    begin
        if "Delegation No" = '' then begin
            SSetUp.Get;
            //cc//   SSetUp.TestField("Delegation Nos");
            //cc//  NoSeriesMgt.InitSeries(SSetUp."Delegation Nos", xRec."No. Series", 0D, "Delegation No", "No. Series");
        end;
    end;

    var
        LoginMgt: Codeunit "User Management";
        Text000: label 'Processing Approval Delegation \From #1#########\ To   #2#########\ Delegated Authority #3#########';
        Text001: label 'There is a current Delegation that is already open, Do u want to replace it?';
        NoSeriesMgt: Codeunit "No. Series";
        ApprovalSetup: Record "User Setup";
        Text002: label 'Processing Approval Resumption \From #1######### To   #2#########\ Delegated Authority From #3########  to#4#########';
        CalendarMgmt: Codeunit "Calendar Management";
        CompInfo: Record "Company Information";
        NoOfWorkingDays: Integer;
        EndDate: Date;
        NoOfDays: Integer;
        Loop: Boolean;
        Text003: label 'The Date you have entered is not a working day of the calendar';
        SSetUp: Record "Sales & Receivables Setup";


    procedure Delegate(Rec: Record "Document Approval Delegation")
    var
        UserSetup: Record "User Setup";
        CurrentDelegations: Record "Document Approval Delegation";
        Window: Dialog;
        ApprovalEntry: Record "Approval Entry";
        DelegationEntries: Record "Delegation Entries";
        EntryNo: Integer;
        DimensionRec: Record Dimension;
        DimensionValueRec: Record "Dimension Value";
    begin
        //Check if there is an already open delegation
        Window.Open(Text000, Rec."Current Approver ID", Rec."New Approver ID", Rec."Delegation Limits Approver ID");
        Rec.TestField("Start Date");
        Rec.TestField("End Date");
        Rec.TestField("Current Approver ID");
        Rec.TestField("Alternate Approver ID");

        //Change in User Setup=========================================================================================
        UserSetup.Reset;
        UserSetup.SetFilter(UserSetup."Approver ID", Rec."Current Approver ID");
        if UserSetup.FindSet(true) then begin
            //cc//   UserSetup."Original Approver ID" := UserSetup."Approver ID";
            //cc//  UserSetup."From Date" := Rec."Start Date";
            //cc//  UserSetup."To Date" := Rec."End Date";
            UserSetup."Approver ID" := Rec."New Approver ID";
            UserSetup.Modify;
            Window.Update(3, 'User Setup');
            // MESSAGE('User Setup Done...');
        end;
        //=============================================================================================================

        //Approval Entry setup=========================================================================================
        ApprovalEntry.Reset;
        ApprovalEntry.SetFilter(ApprovalEntry."Approver ID", Rec."Current Approver ID");
        ApprovalEntry.SetFilter(ApprovalEntry.Status, '%1|%2', ApprovalEntry.Status::Open, ApprovalEntry.Status::Created);
        if ApprovalEntry.FindSet then
            repeat
                ApprovalEntry."Approver ID" := Rec."New Approver ID";
                //cc//   ApprovalEntry."From Date" := Rec."Start Date";
                //cc//   ApprovalEntry."To Date" := Rec."End Date";
                //cc//   ApprovalEntry."Original Approver ID" := ApprovalEntry."Approver ID";
                ApprovalEntry.Modify;
                Window.Update(3, 'Approval Entry');
            until ApprovalEntry.Next = 0;
        //=============================================================================================================
        //Changing Current Record======================================================================================
        Rec.Status := Rec.Status::Processed;
        Rec.Modify;
        Window.Update(3, 'Delegation Record');
        Message('Approval Delegation Done!!');
        Window.Close;
    end;


    procedure Resume(var Rec: Record "Document Approval Delegation")
    var
        UserSetup: Record "User Setup";
        CurrentDelegations: Record "Document Approval Delegation";
        Window: Dialog;
        ApprovalEntry: Record "Approval Entry";
        DelegationEntries: Record "Delegation Entries";
        EntryNo: Integer;
        DimensionRec: Record Dimension;
        DimensionValueRec: Record "Dimension Value";
        CurrentDelegation: Boolean;
        NewApprover: Code[50];
        i: Integer;
        OpenDelegations: array[100, 5] of Code[50];
    begin
        Window.Open(Text002, Rec."New Approver ID", Rec."Current Approver ID", Rec."Delegation Limits Approver ID", Rec."Current Approver ID");
        //Change in User Setup=========================================================================================
        UserSetup.Reset;
        UserSetup.SetFilter(UserSetup."Approver ID", Rec."Current Approver ID");
        if UserSetup.FindSet then begin
            //cc//   UserSetup."Original Approver ID" := '';//UserSetup."Approver ID";
            //cc//  UserSetup."From Date" := 0D;
            //cc//    UserSetup."To Date" := 0D;
            //cc//   UserSetup."Approver ID" := UserSetup."Original Approver ID";
            UserSetup.Modify;
            Window.Update(3, 'User Setup');
        end;
        //=============================================================================================================

        //Approval Entry setup=========================================================================================
        ApprovalEntry.Reset;
        ApprovalEntry.SetFilter(ApprovalEntry."Approver ID", Rec."Current Approver ID");
        ApprovalEntry.SetFilter(ApprovalEntry.Status, '%1|%2', ApprovalEntry.Status::Open, ApprovalEntry.Status::Created);
        if ApprovalEntry.FindSet then
            repeat
                //cc//   ApprovalEntry."Approver ID" := ApprovalEntry."Original Approver ID";//Rec."New Approver ID";
                //cc//   ApprovalEntry."From Date" := 0D;//Rec."Start Date";
                //cc//  ApprovalEntry."To Date" := 0D;//Rec."End Date";
                //cc//   ApprovalEntry."Original Approver ID" := '';//ApprovalEntry."Approver ID";
                ApprovalEntry.Modify;
                Window.Update(3, 'Approval Entry');
            //MESSAGE('Approval Entry Done...');

            until ApprovalEntry.Next = 0;
        //=============================================================================================================
        //Changing Current Record======================================================================================
        Rec.Status := Rec.Status::Expired;
        Rec.Modify;
        Window.Update(3, 'Delegation Resumption');
        Message('Approval Resumption Done...');
        Window.Close;
        //=============================================================================================================
    end;


    procedure ResumeJobQueue(var Rec: Record "Document Approval Delegation")
    var
        UserSetup: Record "User Setup";
        CurrentDelegations: Record "Document Approval Delegation";
        Window: Dialog;
        ApprovalEntry: Record "Approval Entry";
        DelegationEntries: Record "Delegation Entries";
        EntryNo: Integer;
        DimensionRec: Record Dimension;
        DimensionValueRec: Record "Dimension Value";
        CurrentDelegation: Boolean;
        NewApprover: Code[50];
        i: Integer;
        OpenDelegations: array[100, 5] of Code[50];
    begin
        CurrentDelegation := false;
        UserSetup.Reset;
        UserSetup.SetRange("Approver ID", Rec."New Approver ID");
        //cc//   UserSetup.SetFilter("Relieved Approver", '%1|%2', Rec."Current Approver ID", Rec."Alternate Approver ID");
        if UserSetup.Find('-') then begin
            repeat
                UserSetup."Approver ID" := Rec."Current Approver ID";
                UserSetup.Modify;
                CurrentDelegation := true;
            until
            UserSetup.Next = 0;
        end;


        if not CurrentDelegation then
            CheckPriorDelegation(Rec);

        //Modify all open approval entries other than Delagated Authority
        ApprovalEntry.Reset;
        ApprovalEntry.SetFilter(Status, '%1|%2', ApprovalEntry.Status::Open, ApprovalEntry.Status::Created);
        ApprovalEntry.SetRange("Approver ID", Rec."New Approver ID");
        if ApprovalEntry.Find('-') then begin
            repeat
                if CheckIfRelieved(Rec."New Approver ID", Rec."Current Approver ID", ApprovalEntry."Approval Code") then begin
                    ApprovalEntry."Approver ID" := Rec."Current Approver ID";
                    ApprovalEntry.Modify;
                end;
            until
            ApprovalEntry.Next = 0;
        end;

        if not CurrentDelegation then begin

            GetCurrentDelegation(Rec, OpenDelegations, i);

            ApprovalEntry.Reset;
            ApprovalEntry.SetFilter(Status, '%1|%2', ApprovalEntry.Status::Open, ApprovalEntry.Status::Created);
            ApprovalEntry.SetFilter("Approver ID", '%1|%2', OpenDelegations[i] [2], OpenDelegations[i] [3]);
            if ApprovalEntry.Find('-') then begin
                repeat
                    if CheckIfRelieved(OpenDelegations[i] [1], OpenDelegations[i] [2], ApprovalEntry."Approval Code") then begin
                        ApprovalEntry."Approver ID" := Rec."Current Approver ID";
                        ApprovalEntry.Modify;
                    end;
                until
                ApprovalEntry.Next = 0;
            end;

        end;

        //Insert Delegation Entries
        if DelegationEntries.Find('+') then
            EntryNo := DelegationEntries."Entry No"
        else
            EntryNo := 1;

        DelegationEntries.Init;
        DelegationEntries."Entry No" := EntryNo + 1;
        DelegationEntries."Delegation No" := Rec."Delegation No";
        DelegationEntries."Current Approver ID" := Rec."Current Approver ID";
        DelegationEntries."New Approver ID" := Rec."New Approver ID";
        DelegationEntries."Start Date" := Rec."Start Date";
        DelegationEntries.Duration := Rec.Duration;
        DelegationEntries."End Date" := Rec."End Date";
        DelegationEntries."Delegation Limits Approver ID" := Rec."Delegation Limits Approver ID";
        DelegationEntries."No. Series" := Rec."No. Series";
        DelegationEntries.Description := Rec.Description;
        DelegationEntries."Entry Type" := DelegationEntries."entry type"::Resumption;
        DelegationEntries."Alternate Approver ID" := DelegationEntries."Alternate Approver ID";
        if not DelegationEntries.Get(DelegationEntries."Entry No") then
            DelegationEntries.Insert;


        Rec.Status := Rec.Status::Expired;
        Rec.Modify;
    end;


    procedure CheckIfRelieved(SenderID: Code[50]; ApproverID: Code[50]; ApprovalCode: Code[50]): Boolean
    var
        UserSetup: Record "User Setup";
    begin
        UserSetup.Reset;
        UserSetup.SetRange("Approver ID", SenderID);
        //cc//    UserSetup.SetRange("Relieved Approver", ApproverID);
        if UserSetup.Find('-') then begin
            exit(true);
        end else
            exit(false);
    end;


    procedure CheckPriorDelegation(PriorDelegation: Record "Document Approval Delegation")
    var
        UserSetup: Record "User Setup";
        OpenDelegations: array[100, 5] of Code[50];
        i: Integer;
        DelegationsRec: Record "Document Approval Delegation";
        z: Integer;
    begin

        GetCurrentDelegation(PriorDelegation, OpenDelegations, i);

        UserSetup.Reset;
        UserSetup.SetRange("Approver ID", OpenDelegations[i] [2]);
        //cc//  UserSetup.SetFilter("Relieved Approver", '=%1', OpenDelegations[i] [1]);
        if UserSetup.Find('-') then begin
            repeat
                UserSetup."Approver ID" := PriorDelegation."Current Approver ID";
                UserSetup.Modify;
            until
            UserSetup.Next = 0;
        end;


        //Close all Open delgations related
        for z := 1 to i do begin
            if DelegationsRec.Get(OpenDelegations[z] [4]) then begin
                DelegationsRec.Status := DelegationsRec.Status::Expired;
                DelegationsRec.Modify;
            end;
        end;
        //
    end;


    procedure GetCurrentDelegation(CurrentDelegation: Record "Document Approval Delegation"; var Approvers: array[100, 5] of Code[50]; var i: Integer)
    var
        DelegationEntries: Record "Delegation Entries";
        DelegationEntries2: Record "Delegation Entries";
    begin
        i := 0;
        DelegationEntries.Reset;
        DelegationEntries.CalcFields(Status);
        DelegationEntries.SetRange(Status, DelegationEntries.Status::Processed);
        DelegationEntries.SetRange("Entry Type", DelegationEntries."entry type"::Delegation);
        if DelegationEntries.Find('-') then
            repeat
                DelegationEntries2.Reset;
                DelegationEntries2.CalcFields(Status);
                DelegationEntries2.SetRange(Status, DelegationEntries2.Status::Processed);
                DelegationEntries2.SetRange("Entry Type", DelegationEntries2."entry type"::Delegation);
                DelegationEntries2.SetFilter("Current Approver ID", '%1|%2', DelegationEntries."New Approver ID",
                                             DelegationEntries."Alternate Approver ID");
                if DelegationEntries2.Find('-') then begin
                    i := i + 1;
                    Approvers[i] [1] := DelegationEntries2."Current Approver ID";
                    Approvers[i] [2] := DelegationEntries2."New Approver ID";
                    Approvers[i] [3] := DelegationEntries2."Alternate Approver ID";
                    Approvers[i] [4] := DelegationEntries2."Delegation No";
                end;
            until
             DelegationEntries.Next = 0;
    end;

    var
        users1: Record "User";
}
