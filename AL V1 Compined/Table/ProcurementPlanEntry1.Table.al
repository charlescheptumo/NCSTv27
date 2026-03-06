#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Table 70038 "Procurement Plan Entry1"
{
    Caption = 'Procurement Plan Entry';
    DrillDownPageID = "Procurement Plan Entries";
    LookupPageID = "Procurement Plan Entries";

    fields
    {
        field(1; "Entry No."; Integer)
        {
            Caption = 'Entry No.';
        }
        field(2; "Budget Name"; Code[10])
        {
            Caption = 'Budget Name';
        }
        field(3; "G/L Account No."; Code[20])
        {
            Caption = 'G/L Account No.';
            TableRelation = "G/L Account";

            trigger OnValidate()
            begin
                if (xRec."G/L Account No." <> '') and (xRec."G/L Account No." <> "G/L Account No.") then
                    VerifyNoRelatedAnalysisViewBudgetEntries(xRec);
            end;
        }
        field(4; Date; Date)
        {
            Caption = 'Date';
            ClosingDates = true;

            trigger OnValidate()
            begin
                if (xRec.Date <> 0D) and (xRec.Date <> Date) then
                    VerifyNoRelatedAnalysisViewBudgetEntries(xRec);
            end;
        }
        field(5; "Global Dimension 1 Code"; Code[20])
        {
            CaptionClass = '1,1,1';
            Caption = 'Global Dimension 1 Code';
            TableRelation = "Dimension Value".Code where("Global Dimension No." = const(1));

            trigger OnValidate()
            begin
                if "Global Dimension 1 Code" = xRec."Global Dimension 1 Code" then
                    exit;
                GetGLSetup;
                ValidateDimValue(GLSetup."Global Dimension 1 Code", "Global Dimension 1 Code");
                UpdateDimensionSetId(GLSetup."Global Dimension 1 Code", "Global Dimension 1 Code");
            end;
        }
        field(6; "Global Dimension 2 Code"; Code[20])
        {
            CaptionClass = '1,1,2';
            Caption = 'Global Dimension 2 Code';
            TableRelation = "Dimension Value".Code where("Global Dimension No." = const(2));

            trigger OnValidate()
            begin
                if "Global Dimension 2 Code" = xRec."Global Dimension 2 Code" then
                    exit;
                GetGLSetup;
                ValidateDimValue(GLSetup."Global Dimension 2 Code", "Global Dimension 2 Code");
                UpdateDimensionSetId(GLSetup."Global Dimension 2 Code", "Global Dimension 2 Code");
            end;
        }
        field(7; Amount; Decimal)
        {
            AutoFormatType = 1;
            Caption = 'Amount';

            trigger OnValidate()
            begin
                if (xRec.Amount <> 0) and (xRec.Amount <> Amount) then
                    VerifyNoRelatedAnalysisViewBudgetEntries(xRec);
            end;
        }
        field(9; Description; Text[100])
        {
            Caption = 'Description';
        }
        field(10; "Business Unit Code"; Code[20])
        {
            Caption = 'Business Unit Code';
            TableRelation = "Business Unit";
        }
        field(11; "User ID"; Code[50])
        {
            Caption = 'User ID';
            DataClassification = EndUserIdentifiableInformation;
            Editable = false;
            TableRelation = User."User Name";
            //This property is currently not supported
            //TestTableRelation = false;

            trigger OnLookup()
            var
                UserMgt: Codeunit "User Management";
            begin
                UserMgt.DisplayUserInformation("User ID");
            end;
        }
        field(12; "Budget Dimension 1 Code"; Code[20])
        {
            AccessByPermission = TableData Dimension = R;
            CaptionClass = GetCaptionClass(1);
            Caption = 'Budget Dimension 1 Code';

            trigger OnLookup()
            begin
                "Budget Dimension 1 Code" := OnLookupDimCode(2, "Budget Dimension 1 Code");
                ValidateDimValue(GLBudgetName."Budget Dimension 1 Code", "Budget Dimension 1 Code");
                UpdateDimensionSetId(GLBudgetName."Budget Dimension 1 Code", "Budget Dimension 1 Code");
            end;

            trigger OnValidate()
            begin
                if "Budget Dimension 1 Code" = xRec."Budget Dimension 1 Code" then
                    exit;
                if GLBudgetName.Name <> "Budget Name" then
                    GLBudgetName.Get("Budget Name");
                ValidateDimValue(GLBudgetName."Budget Dimension 1 Code", "Budget Dimension 1 Code");
                UpdateDimensionSetId(GLBudgetName."Budget Dimension 1 Code", "Budget Dimension 1 Code");
            end;
        }
        field(13; "Budget Dimension 2 Code"; Code[20])
        {
            AccessByPermission = TableData Dimension = R;
            CaptionClass = GetCaptionClass(2);
            Caption = 'Budget Dimension 2 Code';

            trigger OnLookup()
            begin
                "Budget Dimension 2 Code" := OnLookupDimCode(3, "Budget Dimension 2 Code");
                ValidateDimValue(GLBudgetName."Budget Dimension 2 Code", "Budget Dimension 2 Code");
                UpdateDimensionSetId(GLBudgetName."Budget Dimension 2 Code", "Budget Dimension 2 Code");
            end;

            trigger OnValidate()
            begin
                if "Budget Dimension 2 Code" = xRec."Budget Dimension 2 Code" then
                    exit;
                if GLBudgetName.Name <> "Budget Name" then
                    GLBudgetName.Get("Budget Name");
                ValidateDimValue(GLBudgetName."Budget Dimension 2 Code", "Budget Dimension 2 Code");
                UpdateDimensionSetId(GLBudgetName."Budget Dimension 2 Code", "Budget Dimension 2 Code");
            end;
        }
        field(14; "Budget Dimension 3 Code"; Code[20])
        {
            AccessByPermission = TableData "Dimension Combination" = R;
            CaptionClass = GetCaptionClass(3);
            Caption = 'Budget Dimension 3 Code';

            trigger OnLookup()
            begin
                "Budget Dimension 3 Code" := OnLookupDimCode(4, "Budget Dimension 3 Code");
                ValidateDimValue(GLBudgetName."Budget Dimension 3 Code", "Budget Dimension 3 Code");
                UpdateDimensionSetId(GLBudgetName."Budget Dimension 3 Code", "Budget Dimension 3 Code");
            end;

            trigger OnValidate()
            begin
                if "Budget Dimension 3 Code" = xRec."Budget Dimension 3 Code" then
                    exit;
                if GLBudgetName.Name <> "Budget Name" then
                    GLBudgetName.Get("Budget Name");
                ValidateDimValue(GLBudgetName."Budget Dimension 3 Code", "Budget Dimension 3 Code");
                UpdateDimensionSetId(GLBudgetName."Budget Dimension 3 Code", "Budget Dimension 3 Code");
            end;
        }
        field(15; "Budget Dimension 4 Code"; Code[20])
        {
            AccessByPermission = TableData "Dimension Combination" = R;
            CaptionClass = GetCaptionClass(4);
            Caption = 'Budget Dimension 4 Code';

            trigger OnLookup()
            begin
                "Budget Dimension 4 Code" := OnLookupDimCode(5, "Budget Dimension 4 Code");
                ValidateDimValue(GLBudgetName."Budget Dimension 4 Code", "Budget Dimension 4 Code");
                UpdateDimensionSetId(GLBudgetName."Budget Dimension 4 Code", "Budget Dimension 4 Code");
            end;

            trigger OnValidate()
            begin
                if "Budget Dimension 4 Code" = xRec."Budget Dimension 4 Code" then
                    exit;
                if GLBudgetName.Name <> "Budget Name" then
                    GLBudgetName.Get("Budget Name");
                ValidateDimValue(GLBudgetName."Budget Dimension 4 Code", "Budget Dimension 4 Code");
                UpdateDimensionSetId(GLBudgetName."Budget Dimension 4 Code", "Budget Dimension 4 Code");
            end;
        }
        field(16; "Last Date Modified"; Date)
        {
            Caption = 'Last Date Modified';
            Editable = false;
        }
        field(480; "Dimension Set ID"; Integer)
        {
            Caption = 'Dimension Set ID';
            Editable = false;
            TableRelation = "Dimension Set Entry";

            trigger OnLookup()
            begin
                ShowDimensions;
            end;

            trigger OnValidate()
            begin
                if not DimMgt.CheckDimIDComb("Dimension Set ID") then
                    Error(DimMgt.GetDimCombErr);
            end;
        }
        field(5701; "Job ID"; Code[10])
        {
            DataClassification = ToBeClassified;
            TableRelation = Job."No.";
        }
        field(5702; "Job Task No."; Code[10])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Job Task"."Job Task No." where("Job No." = field("Job ID"));
        }
        field(50000; "Budget Dimension 5 Code"; Code[10])
        {

            trigger OnValidate()
            begin
                /*
                IF "Budget Dimension 5 Code" <> xRec."Budget Dimension 5 Code" THEN BEGIN
                  IF Dim.CheckIfDimUsed("Budget Dimension 5 Code",12,Name,'',0) THEN
                    ERROR(Text000,Dim.GetCheckDimErr);
                  MODIFY;
                  UpdateBudgetDim("Budget Dimension 5 Code",4);
                END;
                */

            end;
        }
        field(50001; "Budget Dimension 6 Code"; Code[20])
        {
            Caption = 'Budget Dimension 4 Code';
            TableRelation = Dimension;

            trigger OnValidate()
            begin
                /*
                IF "Budget Dimension 6 Code" <> xRec."Budget Dimension 6 Code" THEN BEGIN
                  IF Dim.CheckIfDimUsed("Budget Dimension 6 Code",12,Name,'',0) THEN
                    ERROR(Text000,Dim.GetCheckDimErr);
                  MODIFY;
                  UpdateBudgetDim("Budget Dimension 6 Code",5);
                END;
                */

            end;
        }
        field(50002; "Transferred from Item Budget"; Boolean)
        {
            DataClassification = ToBeClassified;
            Description = 'Added';
        }
        field(50003; "Procurement Item"; Code[20])
        {
            DataClassification = ToBeClassified;
            Description = 'Added';
        }
        field(50004; Votehead; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = Voteheads.Code;

            trigger OnValidate()
            begin
                VoteheadRec.Reset;
                VoteheadRec.SetRange(Code, Votehead);
                if VoteheadRec.Find('-') then begin
                    VoteheadRec.TestField("G/L Account");
                    "G/L Account No." := VoteheadRec."G/L Account";
                end;
            end;
        }
        field(50005; "Budgeted Amount"; Decimal)
        {
            DataClassification = ToBeClassified;

            trigger OnValidate()
            begin
                Amount := "Budgeted Amount";
            end;
        }
        field(50006; Quantity; Decimal)
        {
            DataClassification = ToBeClassified;

            trigger OnValidate()
            begin
                "Budgeted Amount" := "Unit Price" * Quantity;
                Validate("Budgeted Amount");

                "Revised Estimate" := "Unit Price" * Quantity;
                Validate("Budgeted Amount");

                "Budgeted Amount" := "Unit Price" * Quantity;
                Validate("Budgeted Amount");

                "Revised Estimate" := "Unit Price" * Quantity;
                Validate("Budgeted Amount");
            end;
        }
        field(50007; "Unit Price"; Decimal)
        {
            DataClassification = ToBeClassified;

            trigger OnValidate()
            begin
                "Budgeted Amount" := "Unit Price" * Quantity;
                Validate("Budgeted Amount");
            end;
        }
        field(50008; "Revised Estimate"; Decimal)
        {
            DataClassification = ToBeClassified;

            trigger OnValidate()
            begin
                Amount := "Budgeted Amount";
            end;
        }
        field(50009; "Date Filter"; Date)
        {
            Caption = 'Date Filter';
            FieldClass = FlowFilter;
        }
        field(50010; "Revised 2"; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(50011; "Amount 2"; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(50012; "Budgeted 2"; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(50013; "Global Dimension 1"; Text[50])
        {
            DataClassification = ToBeClassified;
        }
        field(50014; "Global Dimension 2"; Text[50])
        {
            DataClassification = ToBeClassified;
        }
        field(50015; "Budget Dimension 1"; Text[50])
        {
            DataClassification = ToBeClassified;
        }
        field(50016; "Budget Dimension 2"; Text[50])
        {
            DataClassification = ToBeClassified;
        }
        field(50017; "Budget Dimension 3"; Text[50])
        {
            DataClassification = ToBeClassified;
        }
        field(50018; "Budget Dimension 4"; Text[50])
        {
            DataClassification = ToBeClassified;
        }
        field(50019; "Sub Ledger Type"; Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = ',Customer,Vendor';
            OptionMembers = ,Customer,Vendor;
        }
        field(50020; "SL Code"; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = if ("Sub Ledger Type" = const(Customer)) Customer
            else if ("Sub Ledger Type" = const(Vendor)) Vendor;
        }
        field(50021; "Budget Type"; Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = 'Approved,Revised,Suplimentary';
            OptionMembers = Approved,Revised,Suplimentary;
        }
        field(50022; Status; Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = 'New,Pending Approval,Approved,Rejected';
            OptionMembers = New,"Pending Approval",Approved,Rejected;
        }
        field(50023; "Shortcut Dimension 3 Code"; Code[20])
        {
            Caption = 'Sub Department Code';
            DataClassification = ToBeClassified;
            TableRelation = "Dimension Value".Code where("Global Dimension No." = const(3));
        }
        field(50024; "Shortcut Dimension 4 Code"; Code[20])
        {
            Caption = 'Project Code';
            DataClassification = ToBeClassified;
            TableRelation = "Dimension Value".Code where("Global Dimension No." = const(4));
        }
    }

    keys
    {
        key(Key1; "Entry No.")
        {
            Clustered = true;
        }
        key(Key2; "Budget Name", "G/L Account No.", Date)
        {
            SumIndexFields = Amount;
        }
        key(Key3; "Budget Name", "G/L Account No.", "Business Unit Code", "Global Dimension 1 Code", "Global Dimension 2 Code", "Budget Dimension 1 Code", "Budget Dimension 2 Code", "Budget Dimension 3 Code", "Budget Dimension 4 Code", Date)
        {
            SumIndexFields = Amount;
        }
        key(Key4; "Budget Name", "G/L Account No.", Description, Date)
        {
        }
        key(Key5; "G/L Account No.", Date, "Budget Name", "Dimension Set ID")
        {
            SumIndexFields = Amount;
        }
        key(Key6; "Last Date Modified", "Budget Name")
        {
        }
    }

    fieldgroups
    {
    }

    trigger OnDelete()
    begin
        CheckIfBlocked;

        bCommitment.SetRange(bCommitment."Account No.", "G/L Account No.");
        bCommitment.SetRange("Entry No.", "Entry No.");
        if bCommitment.FindSet then begin
            bCommitment.CalcFields("Commited Amount Imprest", "Commited Amount Orders", "Commited Amount PRN");
            totalCommitments := (bCommitment."Commited Amount Imprest" + bCommitment."Commited Amount Orders" + bCommitment."Commited Amount PRN");
            if totalCommitments <> 0 then
                Error(Text57021, totalCommitments)
            else
                bCommitment.Delete;
        end;

        DeleteAnalysisViewBudgetEntries;
    end;

    trigger OnInsert()
    var
        TempDimSetEntry: Record "Dimension Set Entry" temporary;
    begin
        CheckIfBlocked;
        TestField(Date);
        TestField("Budget Name");
        LockTable;
        "User ID" := UserId;
        "Last Date Modified" := Today;
        if "Entry No." = 0 then
            "Entry No." := GetNextEntryNo;

        GetGLSetup;
        DimMgt.GetDimensionSet(TempDimSetEntry, "Dimension Set ID");
        UpdateDimSet(TempDimSetEntry, GLSetup."Global Dimension 1 Code", "Global Dimension 1 Code");
        UpdateDimSet(TempDimSetEntry, GLSetup."Global Dimension 2 Code", "Global Dimension 2 Code");
        UpdateDimSet(TempDimSetEntry, GLBudgetName."Budget Dimension 1 Code", "Budget Dimension 1 Code");
        UpdateDimSet(TempDimSetEntry, GLBudgetName."Budget Dimension 2 Code", "Budget Dimension 2 Code");
        UpdateDimSet(TempDimSetEntry, GLBudgetName."Budget Dimension 3 Code", "Budget Dimension 3 Code");
        UpdateDimSet(TempDimSetEntry, GLBudgetName."Budget Dimension 4 Code", "Budget Dimension 4 Code");
        OnInsertOnAfterUpdateDimSets(TempDimSetEntry, Rec);
        Validate("Dimension Set ID", DimMgt.GetDimensionSetID(TempDimSetEntry));

        //Budget Commitment entries added by David 25-01-2018
        bCommitment.Reset;
        bCommitment."Entry No." := "Entry No.";
        bCommitment."Account No." := "G/L Account No.";
        bCommitment."Budget Name" := "Budget Name";
        Validate(Amount);
        bCommitment."Budgeted Amount" := Amount;
        bCommitment."Account Name" := Description;
        bCommitment."Budget Start Date" := Date;
        bCommitment.Insert;
    end;

    trigger OnModify()
    begin
        CheckIfBlocked;
        "User ID" := UserId;
        "Last Date Modified" := Today;
        bCommitment.SetRange(bCommitment."Account No.", "G/L Account No.");
        bCommitment.SetRange("Entry No.", "Entry No.");
        if bCommitment.FindSet then begin
            Validate(Amount);
            bCommitment."Budgeted Amount" := Amount;
            bCommitment."Account Name" := Description;
            bCommitment.Modify;
        end;
    end;

    var
        Text000: label 'The dimension value %1 has not been set up for dimension %2.';
        Text001: label '1,5,,Budget Dimension 1 Code';
        Text002: label '1,5,,Budget Dimension 2 Code';
        Text003: label '1,5,,Budget Dimension 3 Code';
        Text004: label '1,5,,Budget Dimension 4 Code';
        GLBudgetName: Record "G/L Budget Name";
        GLSetup: Record "General Ledger Setup";
        DimVal: Record "Dimension Value";
        DimMgt: Codeunit DimensionManagement;
        GLSetupRetrieved: Boolean;
        bCommitment: Record "Budget Commitment";
        totalCommitments: Decimal;
        Text57021: label 'The budget line has commited entries and thefore cannot be deleted.';
        AnalysisViewBudgetEntryExistsErr: label 'You cannot change the amount on this G/L budget entry because one or more related analysis view budget entries exist.\\You must make the change on the related entry in the G/L Budget window.';
        VoteheadRec: Record Voteheads;

    local procedure CheckIfBlocked()
    begin
        /*IF "Budget Name" = GLBudgetName.Name THEN
          EXIT;
        IF GLBudgetName.Name <> "Budget Name" THEN
          GLBudgetName.GET("Budget Name");
        GLBudgetName.TESTFIELD(Blocked,FALSE);*/

    end;

    local procedure ValidateDimValue(DimCode: Code[20]; var DimValueCode: Code[20])
    var
        DimValue: Record "Dimension Value";
    begin
        if DimValueCode = '' then
            exit;

        DimValue."Dimension Code" := DimCode;
        DimValue.Code := DimValueCode;
        DimValue.Find('=><');
        if DimValueCode <> CopyStr(DimValue.Code, 1, StrLen(DimValueCode)) then
            Error(Text000, DimValueCode, DimCode);
        DimValueCode := DimValue.Code;
    end;

    local procedure GetGLSetup()
    begin
        if not GLSetupRetrieved then begin
            GLSetup.Get;
            GLSetupRetrieved := true;
        end;
    end;

    local procedure OnLookupDimCode(DimOption: Option "Global Dimension 1","Global Dimension 2","Budget Dimension 1","Budget Dimension 2","Budget Dimension 3","Budget Dimension 4"; DefaultValue: Code[20]): Code[20]
    var
        DimValue: Record "Dimension Value";
        DimValueList: Page "Dimension Value List";
    begin
        if DimOption in [Dimoption::"Global Dimension 1", Dimoption::"Global Dimension 2"] then
            GetGLSetup
        else
            if GLBudgetName.Name <> "Budget Name" then
                GLBudgetName.Get("Budget Name");
        case DimOption of
            Dimoption::"Global Dimension 1":
                DimValue."Dimension Code" := GLSetup."Global Dimension 1 Code";
            Dimoption::"Global Dimension 2":
                DimValue."Dimension Code" := GLSetup."Global Dimension 2 Code";
            Dimoption::"Budget Dimension 1":
                DimValue."Dimension Code" := GLBudgetName."Budget Dimension 1 Code";
            Dimoption::"Budget Dimension 2":
                DimValue."Dimension Code" := GLBudgetName."Budget Dimension 2 Code";
            Dimoption::"Budget Dimension 3":
                DimValue."Dimension Code" := GLBudgetName."Budget Dimension 3 Code";
            Dimoption::"Budget Dimension 4":
                DimValue."Dimension Code" := GLBudgetName."Budget Dimension 4 Code";
        end;
        DimValue.SetRange("Dimension Code", DimValue."Dimension Code");
        if DimValue.Get(DimValue."Dimension Code", DefaultValue) then;
        DimValueList.SetTableview(DimValue);
        DimValueList.SetRecord(DimValue);
        DimValueList.LookupMode := true;
        if DimValueList.RunModal = Action::LookupOK then begin
            DimValueList.GetRecord(DimValue);
            exit(DimValue.Code);
        end;
        exit(DefaultValue);
    end;

    local procedure GetNextEntryNo(): Integer
    var
        GLBudgetEntry: Record "Procurement Plan Entry1";
    begin
        GLBudgetEntry.SetCurrentkey("Entry No.");
        if GLBudgetEntry.FindLast then
            exit(GLBudgetEntry."Entry No." + 1);

        exit(1);
    end;

    procedure GetCaptionClass(BudgetDimType: Integer): Text[250]
    begin
        if GetFilter("Budget Name") <> '' then begin
            GLBudgetName.SetFilter(Name, GetFilter("Budget Name"));
            if not GLBudgetName.FindFirst then
                Clear(GLBudgetName);
        end;
        case BudgetDimType of
            1:
                begin
                    if GLBudgetName."Budget Dimension 1 Code" <> '' then
                        exit('1,5,' + GLBudgetName."Budget Dimension 1 Code");

                    exit(Text001);
                end;
            2:
                begin
                    if GLBudgetName."Budget Dimension 2 Code" <> '' then
                        exit('1,5,' + GLBudgetName."Budget Dimension 2 Code");

                    exit(Text002);
                end;
            3:
                begin
                    if GLBudgetName."Budget Dimension 3 Code" <> '' then
                        exit('1,5,' + GLBudgetName."Budget Dimension 3 Code");

                    exit(Text003);
                end;
            4:
                begin
                    if GLBudgetName."Budget Dimension 4 Code" <> '' then
                        exit('1,5,' + GLBudgetName."Budget Dimension 4 Code");

                    exit(Text004);
                end;
        end;
    end;

    procedure ShowDimensions()
    var
        DimSetEntry: Record "Dimension Set Entry";
        OldDimSetID: Integer;
    begin
        OldDimSetID := "Dimension Set ID";
        "Dimension Set ID" :=
          DimMgt.EditDimensionSet(
            "Dimension Set ID", StrSubstNo('%1 %2 %3', "Budget Name", "G/L Account No.", "Entry No."));

        if OldDimSetID = "Dimension Set ID" then
            exit;

        GetGLSetup;
        GLBudgetName.Get("Budget Name");

        "Global Dimension 1 Code" := '';
        "Global Dimension 2 Code" := '';
        "Budget Dimension 1 Code" := '';
        "Budget Dimension 2 Code" := '';
        "Budget Dimension 3 Code" := '';
        "Budget Dimension 4 Code" := '';

        if DimSetEntry.Get("Dimension Set ID", GLSetup."Global Dimension 1 Code") then
            "Global Dimension 1 Code" := DimSetEntry."Dimension Value Code";
        if DimSetEntry.Get("Dimension Set ID", GLSetup."Global Dimension 2 Code") then
            "Global Dimension 2 Code" := DimSetEntry."Dimension Value Code";
        if DimSetEntry.Get("Dimension Set ID", GLBudgetName."Budget Dimension 1 Code") then
            "Budget Dimension 1 Code" := DimSetEntry."Dimension Value Code";
        if DimSetEntry.Get("Dimension Set ID", GLBudgetName."Budget Dimension 2 Code") then
            "Budget Dimension 2 Code" := DimSetEntry."Dimension Value Code";
        if DimSetEntry.Get("Dimension Set ID", GLBudgetName."Budget Dimension 3 Code") then
            "Budget Dimension 3 Code" := DimSetEntry."Dimension Value Code";
        if DimSetEntry.Get("Dimension Set ID", GLBudgetName."Budget Dimension 4 Code") then
            "Budget Dimension 4 Code" := DimSetEntry."Dimension Value Code";

        OnAfterShowDimensions(Rec);
    end;

    procedure UpdateDimSet(var TempDimSetEntry: Record "Dimension Set Entry" temporary; DimCode: Code[20]; DimValueCode: Code[20])
    begin
        if DimCode = '' then
            exit;
        if TempDimSetEntry.Get("Dimension Set ID", DimCode) then
            TempDimSetEntry.Delete;
        if DimValueCode = '' then
            DimVal.Init
        else
            DimVal.Get(DimCode, DimValueCode);
        TempDimSetEntry.Init;
        TempDimSetEntry."Dimension Set ID" := "Dimension Set ID";
        TempDimSetEntry."Dimension Code" := DimCode;
        TempDimSetEntry."Dimension Value Code" := DimValueCode;
        TempDimSetEntry."Dimension Value ID" := DimVal."Dimension Value ID";
        TempDimSetEntry.Insert;
    end;

    local procedure UpdateDimensionSetId(DimCode: Code[20]; DimValueCode: Code[20])
    var
        TempDimSetEntry: Record "Dimension Set Entry" temporary;
    begin
        DimMgt.GetDimensionSet(TempDimSetEntry, "Dimension Set ID");
        UpdateDimSet(TempDimSetEntry, DimCode, DimValueCode);
        OnAfterUpdateDimensionSetId(TempDimSetEntry, Rec, xRec);
        "Dimension Set ID" := DimMgt.GetDimensionSetID(TempDimSetEntry);
    end;

    local procedure DeleteAnalysisViewBudgetEntries()
    var
        AnalysisViewBudgetEntry: Record "Analysis View Budget Entry";
    begin
        AnalysisViewBudgetEntry.SetRange("Budget Name", "Budget Name");
        AnalysisViewBudgetEntry.SetRange("Entry No.", "Entry No.");
        AnalysisViewBudgetEntry.DeleteAll;
    end;

    local procedure VerifyNoRelatedAnalysisViewBudgetEntries(GLBudgetEntry: Record "Procurement Plan Entry1")
    var
        AnalysisViewBudgetEntry: Record "Analysis View Budget Entry";
    begin
        AnalysisViewBudgetEntry.SetRange("Budget Name", GLBudgetEntry."Budget Name");
        AnalysisViewBudgetEntry.SetRange("G/L Account No.", GLBudgetEntry."G/L Account No.");
        AnalysisViewBudgetEntry.SetRange("Posting Date", GLBudgetEntry.Date);
        AnalysisViewBudgetEntry.SetRange("Business Unit Code", GLBudgetEntry."Business Unit Code");
        if not AnalysisViewBudgetEntry.IsEmpty then
            Error(AnalysisViewBudgetEntryExistsErr);
    end;

    [IntegrationEvent(false, false)]
    local procedure OnAfterShowDimensions(var GLBudgetEntry: Record "Procurement Plan Entry1")
    begin
    end;

    [IntegrationEvent(false, false)]
    local procedure OnAfterUpdateDimensionSetId(var TempDimensionSetEntry: Record "Dimension Set Entry" temporary; var GLBudgetEntry: Record "Procurement Plan Entry1"; xGLBudgetEntry: Record "Procurement Plan Entry1")
    begin
    end;

    [IntegrationEvent(false, false)]
    local procedure OnInsertOnAfterUpdateDimSets(var TempDimensionSetEntry: Record "Dimension Set Entry" temporary; var GLBudgetEntry: Record "Procurement Plan Entry1")
    begin
    end;
}
