#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Table 65035 "GFA Opportunity Entry"
{
    Caption = 'Opportunity Entry';
    DrillDownPageID = "GFA Opportunity Entries";
    LookupPageID = "GFA Opportunity Entries";

    fields
    {
        field(1; "Entry No."; Integer)
        {
            Caption = 'Entry No.';
        }
        field(2; "Opportunity No."; Code[20])
        {
            Caption = 'Opportunity No.';
            TableRelation = "Grant Funding Application";

            trigger OnValidate()
            var
                OppEntry: Record "GFA Opportunity Entry";
            begin
                OppEntry.SetCurrentkey(Active, "Opportunity No.");
                OppEntry.SetRange(Active, true);
                OppEntry.SetRange("Opportunity No.", "Opportunity No.");
                if OppEntry.FindFirst then begin
                    "Estimated Value (LCY)" := OppEntry."Estimated Value (LCY)";
                    "Chances of Success %" := OppEntry."Chances of Success %";
                    "Date of Change" := OppEntry."Date of Change";
                    if OppEntry."Date of Change" > WorkDate then
                        "Date of Change" := OppEntry."Date of Change"
                    else
                        "Date of Change" := WorkDate;
                    "Estimated Close Date" := OppEntry."Estimated Close Date";
                    "Previous Sales Cycle Stage" := OppEntry."Sales Cycle Stage";
                    "Action Taken" := OppEntry."Action Taken";
                end else
                    "Date of Change" := WorkDate;
            end;
        }
        field(3; "Sales Cycle Code"; Code[10])
        {
            Caption = 'Sales Cycle Code';
            TableRelation = "Sales Cycle";
        }
        field(4; "Sales Cycle Stage"; Integer)
        {
            Caption = 'Sales Cycle Stage';
            MinValue = 1;
            TableRelation = "Sales Cycle Stage".Stage where("Sales Cycle Code" = field("Sales Cycle Code"));

            trigger OnValidate()
            begin
                if SalesCycleStage.Get("Sales Cycle Code", "Sales Cycle Stage") then
                    "Sales Cycle Stage Description" := SalesCycleStage.Description;
            end;
        }
        field(5; "Contact No."; Code[20])
        {
            Caption = 'Contact No.';
            TableRelation = Contact;
        }
        field(6; "Contact Company No."; Code[20])
        {
            Caption = 'Contact Company No.';
            TableRelation = Contact where(Type = const(Company));
        }
        field(7; "Salesperson Code"; Code[20])
        {
            Caption = 'Salesperson Code';
            TableRelation = "Salesperson/Purchaser";
        }
        field(8; "Campaign No."; Code[20])
        {
            Caption = 'Campaign No.';
            TableRelation = Campaign;
        }
        field(9; "Date of Change"; Date)
        {
            Caption = 'Date of Change';
        }
        field(10; Active; Boolean)
        {
            Caption = 'Active';
        }
        field(11; "Date Closed"; Date)
        {
            Caption = 'Date Closed';
        }
        field(12; "Days Open"; Decimal)
        {
            Caption = 'Days Open';
            //DecimalPlaces = 0 : 0;
            MinValue = 0;
        }
        field(13; "Action Taken"; Option)
        {
            Caption = 'Action Taken';
            OptionCaption = ' ,Next,Previous,Updated,Jumped,successful,Not Successful';
            OptionMembers = " ",Next,Previous,Updated,Jumped,Won,Lost;

            trigger OnValidate()
            begin
                if "Action Taken" <> xRec."Action Taken" then
                    Clear("Close Opportunity Code");
            end;
        }
        field(14; "Estimated Value (LCY)"; Decimal)
        {
            AutoFormatType = 1;
            Caption = 'Estimated Value (LCY)';
        }
        field(15; "Calcd. Current Value (LCY)"; Decimal)
        {
            AutoFormatType = 1;
            Caption = 'Calcd. Current Value (LCY)';
        }
        field(16; "Completed %"; Decimal)
        {
            Caption = 'Completed %';
            //DecimalPlaces = 0 : 0;
        }
        field(17; "Chances of Success %"; Decimal)
        {
            Caption = 'Chances of Success %';
            //DecimalPlaces = 0 : 0;
            MaxValue = 100;
        }
        field(18; "Probability %"; Decimal)
        {
            Caption = 'Probability %';
            //DecimalPlaces = 0 : 0;
        }
        field(19; "Close Opportunity Code"; Code[10])
        {
            Caption = 'Close Opportunity Code';
            TableRelation = if ("Action Taken" = const(Won)) "Funding Decision Reasons" where(Type = const(Won))
            else if ("Action Taken" = const(Lost)) "Funding Decision Reasons" where(Type = const(Lost));
        }
        field(20; "Previous Sales Cycle Stage"; Integer)
        {
            Caption = 'Previous Sales Cycle Stage';
            TableRelation = "Sales Cycle Stage".Stage where("Sales Cycle Code" = field("Sales Cycle Code"));
        }
        field(21; "Estimated Close Date"; Date)
        {
            Caption = 'Estimated Close Date';
        }
        field(9501; "Wizard Step"; Option)
        {
            Caption = 'Wizard Step';
            Editable = false;
            OptionCaption = ' ,1,2,3,4,5,6';
            OptionMembers = " ","1","2","3","4","5","6";
        }
        field(9502; "Cancel Old To Do"; Boolean)
        {
            Caption = 'Cancel Old Task';
        }
        field(9503; "Action Type"; Option)
        {
            Caption = 'Action Type';
            OptionCaption = ' ,First,Next,Previous,Skip,Update,Jump';
            OptionMembers = " ",First,Next,Previous,Skip,Update,Jump;
        }
        field(9504; "Sales Cycle Stage Description"; Text[100])
        {
            Caption = 'Sales Cycle Stage Description';
        }
        field(9505; Challenges; Text[250])
        {
            DataClassification = ToBeClassified;
        }
        field(9506; "Lessons Learnt"; Text[250])
        {
            DataClassification = ToBeClassified;
        }
        field(9507; "Mitigating Factors"; Text[250])
        {
            DataClassification = ToBeClassified;
        }
    }

    keys
    {
        key(Key1; "Entry No.")
        {
            Clustered = true;
        }
        key(Key2; "Opportunity No.")
        {
        }
        key(Key3; "Contact Company No.", "Contact No.", Active)
        {
            SumIndexFields = "Estimated Value (LCY)", "Calcd. Current Value (LCY)";
        }
        key(Key4; "Campaign No.", Active)
        {
            SumIndexFields = "Estimated Value (LCY)", "Calcd. Current Value (LCY)";
        }
        key(Key5; Active, "Sales Cycle Code", "Sales Cycle Stage", "Estimated Close Date")
        {
            SumIndexFields = "Estimated Value (LCY)", "Calcd. Current Value (LCY)", "Days Open";
        }
        key(Key6; Active, "Opportunity No.")
        {
            SumIndexFields = "Estimated Value (LCY)", "Calcd. Current Value (LCY)", "Days Open";
        }
        key(Key7; Active, "Salesperson Code", "Date of Change")
        {
            SumIndexFields = "Estimated Value (LCY)", "Calcd. Current Value (LCY)";
        }
        key(Key8; "Close Opportunity Code")
        {
        }
    }

    fieldgroups
    {
        fieldgroup(DropDown; "Entry No.", "Opportunity No.", Active)
        {
        }
        fieldgroup(Brick; "Opportunity No.", "Sales Cycle Stage Description")
        {
        }
    }

    trigger OnInsert()
    var
        Opp: Record "Grant Funding Application";
        SalesCycleStage: Record "Sales Cycle Stage";
    begin
        Opp.Get("Opportunity No.");
        case "Action Taken" of
            "action taken"::" ",
            "action taken"::Next,
            "action taken"::Previous,
            "action taken"::Updated,
            "action taken"::Jumped:
                begin
                    if SalesCycleStage.Get("Sales Cycle Code", "Sales Cycle Stage") then
                        "Sales Cycle Stage Description" := SalesCycleStage.Description;
                    if Opp."Application Status" <> Opp."application status"::InProgress then begin
                        Opp."Application Status" := Opp."application status"::InProgress;
                        Opp.Modify;
                    end;
                end;
            "action taken"::Won:
                begin
                    TestCust;
                    if Opp."Application Status" <> Opp."application status"::Won then begin
                        Opp."Application Status" := Opp."application status"::Won;
                        Opp.Closed := true;
                        Opp."Date Closed" := "Date of Change";
                        "Date Closed" := "Date of Change";
                        "Estimated Close Date" := "Date of Change";
                        Opp.Modify;
                    end;
                end;
            "action taken"::Lost:
                if Opp."Application Status" <> Opp."application status"::Lost then begin
                    Opp."Application Status" := Opp."application status"::Lost;
                    Opp.Closed := true;
                    Opp."Date Closed" := "Date of Change";
                    "Date Closed" := "Date of Change";
                    "Estimated Close Date" := "Date of Change";
                    Opp.Modify;
                end;
        end;
    end;

    var
        Text000: label 'You can not create a Customer from contact %1 before you assign a Contact Company No. to the contact.';
        TempSalesCycleStageFirst: Record "Sales Cycle Stage" temporary;
        TempSalesCycleStageNext: Record "Sales Cycle Stage" temporary;
        TempSalesCycleStagePrevious: Record "Sales Cycle Stage" temporary;
        TempSalesCycleStageSkip: Record "Sales Cycle Stage" temporary;
        TempSalesCycleStageUpdate: Record "Sales Cycle Stage" temporary;
        TempSalesCycleStageJump: Record "Sales Cycle Stage" temporary;
        OppEntry: Record "GFA Opportunity Entry";
        SalesCycleStage: Record "Sales Cycle Stage";
        PreviousDateOfChange: Date;
        EntryExists: Boolean;
        Text005: label 'You cannot go to this stage before you have assigned a sales quote.';
        Text006: label 'There are no stages in sales cycle %1.';
        Text007: label 'The Date of Change has to be after last Date of change.';
        Text008: label '%1 must be greater than 0.';
        Text009: label 'The Estimated closing date has to be later than this change.';
        Text011: label 'You must select either Won or Lost.';
        Text012: label 'Sales (LCY) must be greater than 0.';
        Text013: label 'You must fill in the %1 field.';


    procedure InsertEntry(var OppEntry: Record "GFA Opportunity Entry"; CancelOldTask: Boolean; CreateNewTask: Boolean)
    var
        OppEntry2: Record "GFA Opportunity Entry";
        EntryNo: Integer;
    begin
        OppEntry2.Reset;
        if OppEntry2.FindLast then
            EntryNo := OppEntry2."Entry No."
        else
            EntryNo := 0;
        OppEntry2.SetCurrentkey(Active, "Opportunity No.");
        OppEntry2.SetRange(Active, true);
        OppEntry2.SetRange("Opportunity No.", OppEntry."Opportunity No.");
        if OppEntry2.FindFirst then begin
            OppEntry2.Active := false;
            OppEntry2."Days Open" := OppEntry."Date of Change" - OppEntry2."Date of Change";
            OppEntry2.Modify;
        end;

        OppEntry2 := OppEntry;
        OppEntry2."Entry No." := EntryNo + 1;
        OppEntry2.Active := true;
        OppEntry2.CreateTask(CancelOldTask, CreateNewTask);
        OppEntry2.Insert(true);
        OppEntry := OppEntry2;
    end;

    procedure UpdateEstimates()
    var
        SalesCycle: Record "Sales Cycle";
        SalesCycleStage: Record "Sales Cycle Stage";
        Opp: Record "Grant Funding Application";
        SalesHeader: Record "Sales Header";
    begin
        if SalesCycleStage.Get("Sales Cycle Code", "Sales Cycle Stage") then begin
            SalesCycle.Get("Sales Cycle Code");
            if ("Chances of Success %" = 0) and (SalesCycleStage."Chances of Success %" <> 0) then
                "Chances of Success %" := SalesCycleStage."Chances of Success %";
            "Completed %" := SalesCycleStage."Completed %";
            case SalesCycle."Probability Calculation" of
                SalesCycle."probability calculation"::Multiply:
                    "Probability %" := "Chances of Success %" * "Completed %" / 100;
                SalesCycle."probability calculation"::Add:
                    "Probability %" := ("Chances of Success %" + "Completed %") / 2;
                SalesCycle."probability calculation"::"Chances of Success %":
                    "Probability %" := "Chances of Success %";
                SalesCycle."probability calculation"::"Completed %":
                    "Probability %" := "Completed %";
            end;
            "Calcd. Current Value (LCY)" := "Estimated Value (LCY)" * "Probability %" / 100;
            if ("Estimated Close Date" = "Date of Change") or ("Estimated Close Date" = 0D) then
                "Estimated Close Date" := CalcDate(SalesCycleStage."Date Formula", "Date of Change");
        end;

        case "Action Taken" of
            "action taken"::Won:
                begin
                    Opp.Get("Opportunity No.");
                    // IF SalesHeader.GET(SalesHeader."Document Type"::Quote,Opp."Sales Document No.") THEN
                    //   "Calcd. Current Value (LCY)" := GetSalesDocValue(SalesHeader);

                    "Completed %" := 100;
                    "Chances of Success %" := 100;
                    "Probability %" := 100;
                end;
            "action taken"::Lost:
                begin
                    "Calcd. Current Value (LCY)" := 0;
                    "Completed %" := 100;
                    "Chances of Success %" := 0;
                    "Probability %" := 0;
                end;
        end;
        Modify;
    end;


    procedure CreateTask(CancelOldTask: Boolean; CreateNewTask: Boolean)
    var
        SalesCycleStage: Record "Sales Cycle Stage";
        Task: Record "To-do";
        Opp: Record "Grant Funding Application";
        TempRMCommentLine: Record "Rlshp. Mgt. Comment Line" temporary;
        TempAttendee: Record Attendee temporary;
        TempTaskInteractionLanguage: Record "To-do Interaction Language" temporary;
        TempAttachment: Record Attachment temporary;
    begin
        /*IF CancelOldTask THEN
          Task.CancelOpenTasks("Opportunity No.");
        
        IF CreateNewTask THEN
          IF SalesCycleStage.GET("Sales Cycle Code","Sales Cycle Stage") THEN
            IF SalesCycleStage."Activity Code" <> '' THEN BEGIN
              Opp.GET("Opportunity No.");
              Task."No." := '';
              Task."Campaign No." := "Campaign No.";
              Task."Segment No." := Opp."Segment No.";
              Task."Salesperson Code" := "Salesperson Code";
              Task.VALIDATE("Contact No.","Contact No.");
              Task."Opportunity No." := "Opportunity No.";
              Task."Opportunity Entry No." := "Entry No.";
              Task.Date := "Date of Change";
              Task.Duration := 1440 * 1000 * 60;
              Task.InsertTask(
                Task,TempRMCommentLine,TempAttendee,
                TempTaskInteractionLanguage,TempAttachment,
                SalesCycleStage."Activity Code",FALSE);
            END;*/

    end;

    procedure GetSalesDocValue(SalesHeader: Record "Sales Header"): Decimal
    var
        TotalSalesLine: Record "Sales Line";
        TotalSalesLineLCY: Record "Sales Line";
        SalesPost: Codeunit "Sales-Post";
        VATAmount: Decimal;
        VATAmountText: Text[30];
        ProfitLCY: Decimal;
        ProfitPct: Decimal;
        TotalAdjCostLCY: Decimal;
    begin
        SalesPost.SumSalesLines(
          SalesHeader, 0, TotalSalesLine, TotalSalesLineLCY,
          VATAmount, VATAmountText, ProfitLCY, ProfitPct, TotalAdjCostLCY);
        exit(TotalSalesLineLCY.Amount);
    end;

    local procedure TestCust()
    var
        Cont: Record Contact;
        ContBusRel: Record "Contact Business Relation";
    begin
        //Cont.GET("Contact No.");

        /*IF Cont.Type = Cont.Type::Person THEN
          IF NOT Cont.GET(Cont."Company No.") THEN
            ERROR(Text000,Cont."No.");
        
        ContBusRel.SETRANGE("Contact No.",Cont."No.");
        ContBusRel.SETRANGE("Link to Table",ContBusRel."Link to Table"::Customer);
        
        IF NOT ContBusRel.FINDFIRST THEN
          Cont.CreateCustomer('');*/

    end;

    procedure InitOpportunityEntry(Opp: Record "Grant Funding Application")
    begin
        Validate("Opportunity No.", Opp."Application No");
        /*"Sales Cycle Code" := Opp."Sales Cycle Code";
        "Contact No." := Opp."Contact No.";
        "Contact Company No." := Opp."Contact Company No.";
        "Salesperson Code" := Opp."Salesperson Code";
        "Campaign No." := Opp."Campaign No.";*/

    end;

    procedure CloseOppFromOpp(var Opp: Record "Grant Funding Application")
    begin
        Opp.TestField(Closed, false);
        DeleteAll;
        Init;
        Validate("Opportunity No.", Opp."Application No");
        StartWizard;
    end;

    local procedure StartWizard()
    begin
        Insert;
        if Page.RunModal(Page::"GFA Close Opportunity", Rec) = Action::OK then;
    end;

    procedure CheckStatus()
    begin
        if not ("Action Taken" in ["action taken"::Won, "action taken"::Lost]) then
            Error(Text011);
        if "Close Opportunity Code" = '' then
            ErrorMessage(FieldCaption("Close Opportunity Code"));
        if "Date of Change" = 0D then
            ErrorMessage(FieldCaption("Date of Change"));
        if "Action Taken" = "action taken"::Won then
            if "Calcd. Current Value (LCY)" <= 0 then
                Error(Text012);
    end;


    procedure FinishWizard()
    var
        OppEntry: Record "GFA Opportunity Entry";
    begin
        UpdateEstimates;
        OppEntry := Rec;
        InsertEntry(OppEntry, "Cancel Old To Do", false);
        Delete;
    end;

    local procedure ErrorMessage(FieldName: Text[1024])
    begin
        Error(Text013, FieldName);
    end;

    procedure UpdateOppFromOpp(var Opp: Record "Grant Funding Application")
    begin
        Opp.TestField(Closed, false);
        DeleteAll;
        Init;
        Validate("Opportunity No.", Opp."Application No");
        /*"Sales Cycle Code" := Opp."Sales Cycle Code";
        "Contact No." := Opp."Contact No.";
        "Contact Company No." := Opp."Contact Company No.";
        "Salesperson Code" := Opp."Salesperson Code";
        "Campaign No." := Opp."Campaign No.";*/

        StartWizard2;

    end;

    local procedure StartWizard2()
    begin
        "Wizard Step" := "wizard step"::"1";
        CreateStageList;
        Insert;
        if Page.RunModal(Page::"Update Opportunity", Rec) = Action::OK then;
    end;

    procedure CheckStatus2()
    begin
        if "Action Type" = "action type"::" " then
            Error(Text006, "Sales Cycle Code");

        if EntryExists then
            if "Date of Change" < PreviousDateOfChange then
                Error(Text007);
        if "Date of Change" = 0D then
            ErrorMessage(FieldCaption("Date of Change"));

        ValidateStage;

        if "Estimated Value (LCY)" <= 0 then
            Error(Text008, FieldCaption("Estimated Value (LCY)"));
        if "Chances of Success %" <= 0 then
            Error(Text008, FieldCaption("Chances of Success %"));
        if "Estimated Close Date" = 0D then
            ErrorMessage(FieldCaption("Estimated Close Date"));
        if "Estimated Close Date" < "Date of Change" then
            Error(Text009);
    end;


    procedure FinishWizard2()
    var
        CreateNewTask: Boolean;
        CancelOldTask: Boolean;
    begin
        /*CancelOldTask := "Cancel Old To Do";
        CreateNewTask := "Action Taken" <> "Action Taken"::Updated;
        "Wizard Step" := "Wizard Step"::" ";
        "Cancel Old To Do" := FALSE;
        UpdateEstimates;
        "Action Type" := "Action Type"::" ";
        "Sales Cycle Stage Description" := '';
        OppEntry := Rec;
        InsertEntry(OppEntry,CancelOldTask,CreateNewTask);
        DELETE;*/

    end;

    procedure WizardActionTypeValidate2()
    var
        Task: Record "To-do";
    begin
        case "Action Type" of
            "action type"::First:
                begin
                    TempSalesCycleStageFirst.FindFirst;
                    "Sales Cycle Stage" := TempSalesCycleStageFirst.Stage;
                    "Sales Cycle Stage Description" := TempSalesCycleStageFirst.Description;
                    "Action Taken" := "action taken"::" ";
                    "Cancel Old To Do" := false;
                end;
            "action type"::Next:
                begin
                    TempSalesCycleStageNext.FindFirst;
                    "Sales Cycle Stage" := TempSalesCycleStageNext.Stage;
                    "Sales Cycle Stage Description" := TempSalesCycleStageNext.Description;
                    "Action Taken" := "action taken"::Next;
                end;
            "action type"::Previous:
                begin
                    TempSalesCycleStagePrevious.FindFirst;
                    "Sales Cycle Stage" := TempSalesCycleStagePrevious.Stage;
                    "Sales Cycle Stage Description" := TempSalesCycleStagePrevious.Description;
                    "Action Taken" := "action taken"::Previous;
                end;
            "action type"::Skip:
                begin
                    TempSalesCycleStageSkip.FindFirst;
                    "Sales Cycle Stage" := TempSalesCycleStageSkip.Stage;
                    "Sales Cycle Stage Description" := TempSalesCycleStageSkip.Description;
                    "Action Taken" := "action taken"::Jumped;
                end;
            "action type"::Update:
                begin
                    TempSalesCycleStageUpdate.FindFirst;
                    "Sales Cycle Stage" := TempSalesCycleStageUpdate.Stage;
                    "Sales Cycle Stage Description" := TempSalesCycleStageUpdate.Description;
                    "Action Taken" := "action taken"::Updated;
                    "Cancel Old To Do" := false;
                end;
            "action type"::Jump:
                begin
                    TempSalesCycleStageJump.FindLast;
                    "Sales Cycle Stage" := TempSalesCycleStageJump.Stage;
                    "Sales Cycle Stage Description" := TempSalesCycleStageJump.Description;
                    "Action Taken" := "action taken"::Jumped;
                end;
        end;
        Task.Reset;
        Task.SetCurrentkey("Opportunity No.");
        Task.SetRange("Opportunity No.", "Opportunity No.");
        if Task.FindFirst then
            "Cancel Old To Do" := false;
        Modify;
    end;

    procedure WizardSalesCycleStageValidate2()
    begin
        case "Action Type" of
            "action type"::Skip:
                begin
                    if TempSalesCycleStageNext.Get("Sales Cycle Code", "Sales Cycle Stage") then
                        "Action Taken" := "action taken"::Next;
                    Modify;
                end;
            "action type"::Jump:
                begin
                    if TempSalesCycleStagePrevious.Get("Sales Cycle Code", "Sales Cycle Stage") then
                        "Action Taken" := "action taken"::Previous;
                    Modify;
                end;
        end;
        ValidateStage;
    end;

    procedure CreateStageList()
    var
        Stop: Boolean;
    begin
        TempSalesCycleStageFirst.DeleteAll;
        TempSalesCycleStageNext.DeleteAll;
        TempSalesCycleStagePrevious.DeleteAll;
        TempSalesCycleStageSkip.DeleteAll;
        TempSalesCycleStageUpdate.DeleteAll;
        TempSalesCycleStageJump.DeleteAll;

        OppEntry.Reset;
        OppEntry.SetCurrentkey(Active, "Opportunity No.");
        OppEntry.SetRange(Active, true);
        OppEntry.SetRange("Opportunity No.", "Opportunity No.");
        SalesCycleStage.Reset;
        SalesCycleStage.SetRange("Sales Cycle Code", "Sales Cycle Code");

        if OppEntry.Find('-') then begin
            PreviousDateOfChange := OppEntry."Date of Change";
            EntryExists := true;
        end else begin
            PreviousDateOfChange := WorkDate;
            EntryExists := false;
        end;

        // Option 1 Activate first Stage
        if not OppEntry.Find('-') then
            if SalesCycleStage.Find('-') then begin
                TempSalesCycleStageFirst := SalesCycleStage;
                TempSalesCycleStageFirst.Insert;
            end;

        // Option 2 Goto next Stage
        if OppEntry.Find('-') then
            if SalesCycleStage.Find('-') then begin
                SalesCycleStage.Get(OppEntry."Sales Cycle Code", OppEntry."Sales Cycle Stage");
                if SalesCycleStage.Find('>') then begin
                    TempSalesCycleStageNext := SalesCycleStage;
                    TempSalesCycleStageNext.Insert;
                end;
                "Sales Cycle Stage" := SalesCycleStage.Stage;
                "Action Taken" := "action taken"::Next;
            end;

        // Option 3 Goto Previous Stage
        if OppEntry.Find('-') then
            if SalesCycleStage.Find('-') then begin
                SalesCycleStage.Get(OppEntry."Sales Cycle Code", OppEntry."Sales Cycle Stage");
                if SalesCycleStage.Find('<') then begin
                    TempSalesCycleStagePrevious := SalesCycleStage;
                    TempSalesCycleStagePrevious.Insert;
                end;
            end;

        // Option 4 Skip Stages
        if OppEntry.Find('-') then
            if SalesCycleStage.Find('-') then begin
                SalesCycleStage.Get(OppEntry."Sales Cycle Code", OppEntry."Sales Cycle Stage");
                if SalesCycleStage.Find('>') then
                    if SalesCycleStage."Allow Skip" then begin
                        Stop := false;
                        repeat
                            TempSalesCycleStageSkip := SalesCycleStage;
                            TempSalesCycleStageSkip.Insert;
                            Stop := not SalesCycleStage."Allow Skip";
                        until (SalesCycleStage.Next = 0) or Stop;
                    end;
            end else
                if SalesCycleStage.Find('-') then
                    if SalesCycleStage."Allow Skip" then begin
                        Stop := false;
                        repeat
                            TempSalesCycleStageSkip := SalesCycleStage;
                            TempSalesCycleStageSkip.Insert;
                            Stop := not SalesCycleStage."Allow Skip";
                        until (SalesCycleStage.Next = 0) or Stop;
                    end;

        // Option 5 Update Current
        if OppEntry.Find('-') then
            if SalesCycleStage.Find('-') then begin
                SalesCycleStage.Get(OppEntry."Sales Cycle Code", OppEntry."Sales Cycle Stage");
                TempSalesCycleStageUpdate := SalesCycleStage;
                TempSalesCycleStageUpdate.Insert;
            end;

        // Option 6 jump to Previous Stage
        if OppEntry.Find('-') then
            if SalesCycleStage.Find('-') then begin
                Stop := false;
                repeat
                    TempSalesCycleStageJump := SalesCycleStage;
                    if TempSalesCycleStageJump.Stage <> OppEntry."Sales Cycle Stage" then
                        TempSalesCycleStageJump.Insert
                    else
                        Stop := true;
                until (SalesCycleStage.Next = 0) or Stop;
            end;

        case true of
            NoOfSalesCyclesFirst > 0:
                "Action Type" := "action type"::First;
            NoOfSalesCyclesNext > 0:
                "Action Type" := "action type"::Next;
            NoOfSalesCyclesUpdate > 0:
                "Action Type" := "action type"::Update;
            NoOfSalesCyclesPrev > 0:
                "Action Type" := "action type"::Previous;
            NoOfSalesCyclesSkip > 1:
                "Action Type" := "action type"::Skip;
            NoOfSalesCyclesJump > 1:
                "Action Type" := "action type"::Jump;
        end;
    end;

    local procedure TestQuote()
    var
        Opp: Record "Grant Funding Application";
        SalesHeader: Record "Sales Header";
    begin
        /*Opp.GET("Opportunity No.");
        IF NOT SalesHeader.GET(SalesHeader."Document Type"::Quote,Opp."Sales Document No.") THEN
          ERROR(Text005);*/

    end;

    procedure ValidateStage()
    begin
        case "Action Type" of
            "action type"::First:
                TempSalesCycleStageFirst.Get("Sales Cycle Code", "Sales Cycle Stage");
            "action type"::Next:
                begin
                    ;
                    TempSalesCycleStageNext.Get("Sales Cycle Code", "Sales Cycle Stage");
                    if TempSalesCycleStageNext."Quote Required" then
                        TestQuote;
                end;
            "action type"::Previous:
                TempSalesCycleStagePrevious.Get("Sales Cycle Code", "Sales Cycle Stage");
            "action type"::Skip:
                begin
                    TempSalesCycleStageSkip.Get("Sales Cycle Code", "Sales Cycle Stage");
                    if TempSalesCycleStageSkip."Quote Required" then
                        TestQuote;
                end;
            "action type"::Update:
                TempSalesCycleStageUpdate.Get("Sales Cycle Code", "Sales Cycle Stage");
            "action type"::Jump:
                TempSalesCycleStageJump.Get("Sales Cycle Code", "Sales Cycle Stage");
        end;
    end;

    procedure NoOfSalesCyclesFirst(): Integer
    begin
        exit(TempSalesCycleStageFirst.Count);
    end;

    procedure NoOfSalesCyclesNext(): Integer
    begin
        exit(TempSalesCycleStageNext.Count);
    end;

    procedure NoOfSalesCyclesPrev(): Integer
    begin
        exit(TempSalesCycleStagePrevious.Count);
    end;

    procedure NoOfSalesCyclesSkip(): Integer
    begin
        exit(TempSalesCycleStageSkip.Count);
    end;

    procedure NoOfSalesCyclesUpdate(): Integer
    begin
        exit(TempSalesCycleStageUpdate.Count);
    end;

    procedure NoOfSalesCyclesJump(): Integer
    begin
        exit(TempSalesCycleStageJump.Count);
    end;

    procedure ValidateSalesCycleStage()
    begin
        case "Action Type" of
            "action type"::First:
                TempSalesCycleStageFirst.Get("Sales Cycle Code", "Sales Cycle Stage");
            "action type"::Next:
                begin
                    ;
                    TempSalesCycleStageNext.Get("Sales Cycle Code", "Sales Cycle Stage");
                    if TempSalesCycleStageNext."Quote Required" then
                        TestQuote;
                end;
            "action type"::Previous:
                TempSalesCycleStagePrevious.Get("Sales Cycle Code", "Sales Cycle Stage");
            "action type"::Skip:
                begin
                    TempSalesCycleStageSkip.Get("Sales Cycle Code", "Sales Cycle Stage");
                    if TempSalesCycleStageSkip."Quote Required" then
                        TestQuote;
                end;
            "action type"::Update:
                TempSalesCycleStageUpdate.Get("Sales Cycle Code", "Sales Cycle Stage");
            "action type"::Jump:
                TempSalesCycleStageJump.Get("Sales Cycle Code", "Sales Cycle Stage");
        end;

        if SalesCycleStage.Get("Sales Cycle Code", "Sales Cycle Stage") then
            "Sales Cycle Stage Description" := SalesCycleStage.Description;
    end;

    procedure LookupSalesCycleStage()
    begin
        case "Action Type" of
            "action type"::First:
                if Action::LookupOK = Page.RunModal(0, TempSalesCycleStageFirst) then
                    "Sales Cycle Stage" := TempSalesCycleStageFirst.Stage;
            "action type"::Next:
                if Action::LookupOK = Page.RunModal(0, TempSalesCycleStageNext) then
                    "Sales Cycle Stage" := TempSalesCycleStageNext.Stage;
            "action type"::Previous:
                if Action::LookupOK = Page.RunModal(0, TempSalesCycleStagePrevious) then
                    "Sales Cycle Stage" := TempSalesCycleStagePrevious.Stage;
            "action type"::Skip:
                if Action::LookupOK = Page.RunModal(0, TempSalesCycleStageSkip) then
                    "Sales Cycle Stage" := TempSalesCycleStageSkip.Stage;
            "action type"::Update:
                if Action::LookupOK = Page.RunModal(0, TempSalesCycleStageUpdate) then
                    "Sales Cycle Stage" := TempSalesCycleStageUpdate.Stage;
            "action type"::Jump:
                if Action::LookupOK = Page.RunModal(0, TempSalesCycleStageJump) then
                    "Sales Cycle Stage" := TempSalesCycleStageJump.Stage;
        end;
        Validate("Sales Cycle Stage");
    end;
}
