#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Table 69030 "Payroll Header"
{
    DrillDownPageID = "Payroll Processing List";
    LookupPageID = "Payroll Processing List";

    fields
    {
        field(1; "No."; Code[30])
        {
            Editable = false;

            trigger OnValidate()
            begin


                if "No." <> xRec."No." then begin
                    NoSetup.Get;
                    NoSeriesMgt.TestManual(NoSetup."Salary Voucher Nos");
                    "No. Series" := '';
                end;
            end;
        }
        field(2; "Document Date"; Date)
        {
        }
        field(3; "Payroll Period"; Date)
        {
            Editable = true;
            TableRelation = "Payroll PeriodX"."Starting Date";

            trigger OnValidate()
            begin
                if PayPeriod.Get("Payroll Period") then
                    "payroll Month" := PayPeriod.Name;
            end;
        }
        field(4; "Account Type"; Option)
        {
            OptionCaption = 'Sponsor';
            OptionMembers = Customer;
        }
        field(5; "Account No."; Code[30])
        {

            trigger OnValidate()
            begin
                if CUST.Get("Account No.") then begin
                    "Receivable Account Name" := CUST.Name;
                end;
            end;
        }
        field(6; "Receivable Account Name"; Text[50])
        {
            Editable = false;
        }
        field(7; "Gross Pay"; Decimal)
        {
            CalcFormula = sum("Payroll Lines"."Gross Pay" where("Payroll Header" = field("No.")));
            Editable = false;
            FieldClass = FlowField;
        }
        field(8; "Net Pay"; Decimal)
        {
            CalcFormula = sum("Payroll Lines".Netpay where("Payroll Header" = field("No.")));
            Editable = false;
            FieldClass = FlowField;
        }
        field(9; Posted; Boolean)
        {
            Editable = false;
        }
        field(10; "No. Series"; Code[20])
        {
            Description = 'Stores the number series in the database';
        }
        field(11; "Pension Administrator"; Code[30])
        {
            Editable = false;
            TableRelation = "User Setup";
        }
        field(13; Status; Option)
        {
            Editable = true;
            OptionCaption = 'Open,Pending Approval,Pending Prepayment,Released,Rejected';
            OptionMembers = Open,"Pending Approval","Pending Prepayment",Released,Rejected;

            trigger OnValidate()
            begin
                // IF Status=Status::Released THEN BEGIN
                // IF ("Document Type"="Document Type"::Payroll) THEN BEGIN
                //  Commitment.LPOCommittment(Rec);
                // END;
                // END;
            end;
        }
        field(14; "Posted By"; Code[100])
        {
        }
        field(15; "Time Posted"; Time)
        {
        }
        field(16; Description; Text[50])
        {
        }
        field(20; "Total Deductions"; Decimal)
        {
            CalcFormula = sum("Payroll Lines"."Total Deduction" where("Payroll Header" = field("No.")));
            Editable = false;
            FieldClass = FlowField;
        }
        field(21; Authorize; Boolean)
        {
        }
        field(38; "payroll Month"; Text[30])
        {
            Editable = false;
        }
        field(39; "Acitvity Code"; Code[10])
        {
            Editable = false;
            TableRelation = "Dimension Value".Code where("Global Dimension No." = const(1));
        }
        field(40; "Branch Code"; Code[10])
        {
            Editable = false;
            TableRelation = "Dimension Value".Code where("Global Dimension No." = const(2));
        }
        field(41; "Cheque Date"; Date)
        {
        }
        field(42; "Global Dimension 1 Code"; Code[20])
        {
            CaptionClass = '1,1,1';
            TableRelation = "Dimension Value".Code where("Global Dimension No." = const(1));
        }
        field(43; "Global Dimension 2 Code"; Code[20])
        {
            CaptionClass = '1,1,2';
            TableRelation = "Dimension Value".Code where("Global Dimension No." = const(2));
        }
        field(44; "Shortcut Dimension 1 Code"; Code[20])
        {
            CaptionClass = '1,2,1';
            Caption = 'Shortcut Dimension 1 Code';
            TableRelation = "Dimension Value".Code where("Global Dimension No." = const(1));

            trigger OnValidate()
            begin
                TestField(Status, Status::Open);
                ValidateShortcutDimCode(1, "Shortcut Dimension 1 Code");
            end;
        }
        field(45; "Shortcut Dimension 2 Code"; Code[20])
        {
            CaptionClass = '1,2,2';
            Caption = 'Shortcut Dimension 2 Code';
            TableRelation = "Dimension Value".Code where("Global Dimension No." = const(2));

            trigger OnValidate()
            begin
                TestField(Status, Status::Open);
                ValidateShortcutDimCode(2, "Shortcut Dimension 2 Code");
                //loans.setCurrentKey("Shortcut Dimension 2 Code");
                //loans.GET("Shortcut Dimension 2 Code");
                //custno:=loans."Client Code";
                // message('%1',custno);
                // message('%1',"Loan No.");
                TestField(Status, Status::Open);
            end;
        }
        field(480; "Dimension Set ID"; Integer)
        {
            Caption = 'Dimension Set ID';
            Editable = false;
            TableRelation = "Dimension Set Entry";

            trigger OnLookup()
            begin
                //ShowDimensions;

                ShowDocDim;
            end;
        }
        field(481; "Document Type"; Option)
        {
            OptionCaption = 'Contribution,Transfer-Ins,Interest,Payroll';
            OptionMembers = Contribution,"Transfer-Ins",Interest,Payroll;
        }
        field(482; "Channel ID"; Code[30])
        {
            TableRelation = "Salesperson/Purchaser".Code;
        }
        field(483; "Allocation Period"; Date)
        {
            TableRelation = "Accounting Period"."Starting Date";
        }
        field(484; Currency; Code[30])
        {
            TableRelation = Currency;
        }
        field(485; "Created By"; Code[30])
        {
        }
        field(486; "Date Created"; Date)
        {
        }
        field(487; "Time Created"; Time)
        {
        }
        field(488; "Interest Amount"; Decimal)
        {
            Editable = false;
        }
        field(489; Reversed; Boolean)
        {
        }
        field(490; "Department Name"; Code[100])
        {
            CalcFormula = lookup("Dimension Value".Name where(Code = field("Global Dimension 1 Code")));
            Editable = false;
            FieldClass = FlowField;
        }
        field(491; "Project Name"; Code[100])
        {
            CalcFormula = lookup("Dimension Value".Name where(Code = field("Global Dimension 2 Code")));
            Editable = false;
            FieldClass = FlowField;
        }
    }

    keys
    {
        key(Key1; "No.")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }

    trigger OnInsert()
    begin


        if "No." = '' then begin
            NoSetup.Get;
            NoSetup.TestField(NoSetup."Salary Voucher Nos");
            //NoSeriesMgt.InitSeries(NoSetup."Salary Voucher Nos", xRec."No. Series", 0D, "No.", "No. Series");
            "No.":= NoSeriesMgt.GetNextNo(NoSetup."Salary Voucher Nos", WorkDate(), true);
        end;


        GenLedgerSetup.Get;
        "Shortcut Dimension 1 Code" := GenLedgerSetup."Global Dimension 1 Code";
        "Shortcut Dimension 2 Code" := GenLedgerSetup."Global Dimension 2 Code";
        "Document Type" := "document type"::Payroll;
        "Pension Administrator" := UserId;
        "Document Date" := Today;
        "Created By" := UserId;
        "Date Created" := Today;
        "Time Created" := Time;
    end;

    var
        CUST: Record Customer;
        Receipt: Record "Receipts Header1";
        NoSeriesMgt: Codeunit "No. Series";
        UserSetup: Record "User Setup";
        NoSetup: Record "Human Resources Setup";
        DimMgt: Codeunit DimensionManagement;
        GenLedgerSetup: Record "General Ledger Setup";
        PayPeriod: Record "Payroll PeriodX";
        Commitment: Codeunit "Procurement Processing";


    procedure ShowDocDim()
    var
        OldDimSetID: Integer;
    begin

        OldDimSetID := "Dimension Set ID";
        "Dimension Set ID" :=
          DimMgt.EditDimensionSet(
            "Dimension Set ID", StrSubstNo('%1 %2', "Document Type", "No."),
            "Shortcut Dimension 1 Code", "Shortcut Dimension 2 Code");
        if OldDimSetID <> "Dimension Set ID" then begin
            Modify;
            if PurchLinesExist then
                UpdateAllLineDim("Dimension Set ID", OldDimSetID);
        end;
    end;

    local procedure UpdateAllLineDim(NewParentDimSetID: Integer; OldParentDimSetID: Integer)
    var
        NewDimSetID: Integer;
    begin
        /*// Update all lines with changed dimensions.
        
        IF NewParentDimSetID = OldParentDimSetID THEN
          EXIT;
        IF NOT CONFIRM(Text051) THEN
          EXIT;
        
        PurchLine.RESET;
        PurchLine.SETRANGE("Document Type","Document Type");
        PurchLine.SETRANGE("No.","No.");
        PurchLine.LOCKTABLE;
        IF PurchLine.FIND('-') THEN
          REPEAT
            NewDimSetID := DimMgt.GetDeltaDimSetID(PurchLine."Dimension Set ID",NewParentDimSetID,OldParentDimSetID);
            IF PurchLine."Dimension Set ID" <> NewDimSetID THEN BEGIN
              PurchLine."Dimension Set ID" := NewDimSetID;
              DimMgt.UpdateGlobalDimFromDimSetID(
                PurchLine."Dimension Set ID",PurchLine."Shortcut Dimension 1 Code",PurchLine."Shortcut Dimension 2 Code");
              PurchLine.MODIFY;
            END;
          UNTIL PurchLine.NEXT = 0;
          */

    end;


    procedure ValidateShortcutDimCode(FieldNumber: Integer; var ShortcutDimCode: Code[20])
    var
        OldDimSetID: Integer;
    begin


        OldDimSetID := "Dimension Set ID";
        DimMgt.ValidateShortcutDimValues(FieldNumber, ShortcutDimCode, "Dimension Set ID");
        if "No." <> '' then
            Modify;

        if OldDimSetID <> "Dimension Set ID" then begin
            Modify;
            if PurchLinesExist then
                UpdateAllLineDim("Dimension Set ID", OldDimSetID);
        end;
    end;


    procedure PurchLinesExist(): Boolean
    begin
        /*PurchLine.RESET;
        PurchLine.SETRANGE("Document Type","Document Type");
        PurchLine.SETRANGE("No.","No.");
        EXIT(PurchLine.FINDFIRST);
        */

    end;
}
