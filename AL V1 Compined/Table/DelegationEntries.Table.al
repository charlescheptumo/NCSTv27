#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Table 50016 "Delegation Entries"
{

    fields
    {
        field(1; "Entry No"; Integer)
        {
        }
        field(2; "Delegation No"; Code[80])
        {
            TableRelation = "Document Approval Delegation";
        }
        field(3; "Current Approver ID"; Code[80])
        {
            TableRelation = "No. Series";

            trigger OnLookup()
            begin
                LoginMgt.DisplayUserInformation("Current Approver ID");
            end;

            trigger OnValidate()
            begin
                LoginMgt.ValidateUserName(users1, users1, "Current Approver ID");
            end;
        }
        field(4; "New Approver ID"; Code[80])
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
        field(5; "Start Date"; Date)
        {
        }
        field(6; Duration; DateFormula)
        {

            trigger OnValidate()
            begin
                "End Date" := CalcDate(Duration, "Start Date");
            end;
        }
        field(7; "End Date"; Date)
        {
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
        field(11; "Entry Type"; Option)
        {
            OptionCaption = 'Delegation,Resumption';
            OptionMembers = Delegation,Resumption;
        }
        field(12; "Approval Code"; Code[20])
        {
        }
        field(14; "Alternate Approver ID"; Code[80])
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
        field(15; Status; Option)
        {
            CalcFormula = lookup("Document Approval Delegation".Status where("Delegation No" = field("Delegation No")));
            FieldClass = FlowField;
            OptionCaption = 'Open,Processed,Expired';
            OptionMembers = Open,Processed,Expired;
        }
    }

    keys
    {
        key(Key1; "Entry No")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }

    var
        LoginMgt: Codeunit "User Management";
        Text000: label 'Processing Approval Delegation \From #1#########\ To   #2#########\ Delagated Authority #3#########';
        Text001: label 'There is a current Delegation that is already open, Do u want to replace it?';
        NoSeriesMgt: Codeunit "No. Series";
        ApprovalSetup: Record "User Setup";
        users1: Record User;


    procedure Delegate(Rec: Record "Document Approval Delegation")
    var
        UserSetup: Record "User Setup";
        CurrentDelegations: Record "Document Approval Delegation";
        Window: Dialog;
        ApprovalEntry: Record "Approval Entry";
    begin
        //Check if there is an already open delegation
        Window.Open(Text000, Rec."Current Approver ID", Rec."New Approver ID", Rec."Delegation Limits Approver ID");
        CurrentDelegations.Reset;
        CurrentDelegations.SetRange("Current Approver ID", Rec."Current Approver ID");
        CurrentDelegations.SetRange("New Approver ID", Rec."New Approver ID");
        CurrentDelegations.SetRange("Delegation Limits Approver ID", Rec."Delegation Limits Approver ID");
        CurrentDelegations.SetFilter("Start Date", '>=%1', Rec."Start Date");
        CurrentDelegations.SetFilter("End Date", '<=%1', "End Date");
        CurrentDelegations.SetFilter("Delegation No", '<>%1', Rec."Delegation No");
        if CurrentDelegations.Find('-') then begin
            if Confirm(Text001, false) then begin
                repeat
                    CurrentDelegations."New Approver ID" := Rec."New Approver ID";
                    CurrentDelegations."Current Approver ID" := Rec."Current Approver ID";
                    CurrentDelegations."Start Date" := Rec."Start Date";
                    CurrentDelegations.Duration := Rec.Duration;
                    CurrentDelegations."End Date" := Rec."End Date";
                    CurrentDelegations.Modify;
                until CurrentDelegations.Next = 0
            end
            else
                exit;
        end else begin
            UserSetup.Reset;
            UserSetup.SetRange("Approver ID", Rec."Current Approver ID");
            if UserSetup.Find('-') then begin
                repeat
                    UserSetup."Approver ID" := Rec."New Approver ID";
                    UserSetup.Modify;
                until
                UserSetup.Next = 0;
            end;

            //Modify all open approval entries other than Delagated Authority
            ApprovalEntry.Reset;
            ApprovalEntry.SetFilter(Status, '%1|%2', ApprovalEntry.Status::Open, ApprovalEntry.Status::Created);
            ApprovalEntry.SetRange(ApprovalEntry."Approver ID", Rec."Current Approver ID");
            if ApprovalEntry.Find('-') then begin
                repeat
                    ApprovalEntry."Approver ID" := Rec."New Approver ID";
                    ApprovalEntry.Modify;
                until
                ApprovalEntry.Next = 0;
            end;

            //Modify all open approval entries for Delagated Authority
            ApprovalEntry.Reset;
            ApprovalEntry.SetFilter(Status, '%1|%2', ApprovalEntry.Status::Open, ApprovalEntry.Status::Created);
            ApprovalEntry.SetRange(ApprovalEntry."Approver ID", Rec."Delegation Limits Approver ID");
            if ApprovalEntry.Find('-') then begin
                repeat
                    ApprovalEntry."Approver ID" := Rec."Delegation Limits Approver ID";
                    ApprovalEntry.Modify;
                until
                ApprovalEntry.Next = 0;
            end;

            Rec.Status := Rec.Status::Processed;
            Rec.Modify;
            Window.Update();
            Sleep(2000);
            Window.Close();
        end;
    end;
}
