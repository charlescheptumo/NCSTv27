#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Table 70046 "Disposal Requisition Lines"
{
    // DrillDownPageID = UnknownPage51511172;
    //LookupPageID = UnknownPage51511172;

    fields
    {
        field(1; "Requisition No"; Code[22])
        {

            trigger OnValidate()
            begin


                if ReqHeader.Get("Requisition No") then begin
                    "Procurement Plan" := ReqHeader."Procurement Plan";
                    "Global Dimension 1 Code" := ReqHeader."Global Dimension 1 Code";
                    "Global Dimension 2 Code" := ReqHeader."Global Dimension 2 Code";
                    "FN Code" := ReqHeader."Global Dimension 4 Code";
                    "Cost Centre Code" := ReqHeader."Global Dimension 3 Code";
                end;
            end;
        }
        field(2; "Line No"; Integer)
        {

            trigger OnValidate()
            begin

                if ReqHeader.Get("Requisition No") then begin
                    "Procurement Plan" := ReqHeader."Procurement Plan";
                    "Global Dimension 1 Code" := ReqHeader."Global Dimension 1 Code";
                    "Global Dimension 2 Code" := ReqHeader."Global Dimension 2 Code";
                    "FN Code" := ReqHeader."Global Dimension 4 Code";
                    "Cost Centre Code" := ReqHeader."Global Dimension 3 Code";
                end;
            end;
        }
        field(3; Type; Option)
        {
            OptionCaption = ' ,Non Stock,Item,Asset,Maintenance';
            OptionMembers = " ","Non Stock",Item,Asset,Maintenance;
        }
        field(4; No; Code[10])
        {
            TableRelation = if (Type = const("Non Stock")) "G/L Account"
            else if (Type = const(Item)) Item
            else if (Type = const(Asset)) "Fixed Asset"
            else if (Type = const(Maintenance)) "G/L Account";

            trigger OnValidate()
            begin
                TestField("Procurement Plan Item");

                if Type = Type::Item then begin
                    if ItemRec.Get(No) then begin
                        Inventory.Reset;
                        Inventory.SetRange(Inventory."Invt. Posting Group Code", ItemRec."Inventory Posting Group");
                        if Inventory.Find('-') then begin
                            GLlines.Reset;
                            GLlines.SetRange(GLlines."G/L Account No.", Inventory."Inventory Account");
                            if GLlines.Find('-') then begin
                                GLlines.CalcSums(GLlines.Amount);
                                "Actual Expense" := GLlines.Amount;
                            end;
                            ReqHeader.Reset;
                            ReqHeader.SetRange(ReqHeader."No.", "Requisition No");
                            if ReqHeader.Find('-') then begin
                                BudgetLines.Reset;
                                BudgetLines.SetRange(BudgetLines."G/L Account No.", Inventory."Inventory Account");
                                BudgetLines.SetRange(BudgetLines."Budget Name", "Procurement Plan");
                                BudgetLines.SetRange(BudgetLines."Global Dimension 1 Code", ReqHeader."Global Dimension 1 Code");
                                BudgetLines.SetRange(BudgetLines."Global Dimension 2 Code", ReqHeader."Global Dimension 2 Code");
                                BudgetLines.SetRange(BudgetLines."Budget Dimension 1 Code", ReqHeader."Global Dimension 3 Code");
                                BudgetLines.SetRange(BudgetLines."Budget Dimension 2 Code", ReqHeader."Global Dimension 4 Code");
                                if BudgetLines.Find('-') then
                                    BudgetLines.CalcSums(BudgetLines.Amount);
                                Budgeted := BudgetLines.Amount;
                                "Approved Budget Amount" := Budgeted;
                                "Budget Line" := Inventory."Inventory Account";

                                Description := ItemRec.Description;
                                "Unit of Measure" := ItemRec."Base Unit of Measure";

                                ItemRec.CalcFields(ItemRec.Inventory);
                                "Quantity in Store" := ItemRec.Inventory;
                                "Unit Cost" := ItemRec."Unit Price";

                            end;
                        end;
                    end;
                end;

                if Type = Type::"Non Stock" then begin
                    if GLAccount.Get(No) then
                        Description := GLAccount.Name;
                    "Budget Line" := No;
                end;
                if Type = Type::Asset then begin
                    if GLAccount.Get(No) then
                        Description := GLAccount.Name;
                    "Budget Line" := No;
                end;
                if Type = Type::Maintenance then begin
                    if GLAccount.Get(No) then
                        Description := GLAccount.Name;
                    "Budget Line" := No;
                end;
            end;
        }
        field(5; Description; Text[250])
        {
        }
        field(6; Quantity; Decimal)
        {

            trigger OnValidate()
            begin
                if ReqHeader.Get("Requisition No") then begin
                    if ReqHeader."Requisition Type" = ReqHeader."requisition type"::"Store Requisition" then begin
                        if Type = Type::Item then begin
                            if ItemRec.Get(No) then begin
                                Description := ItemRec.Description;
                                ItemRec.CalcFields(ItemRec.Inventory);
                                "Quantity in Store" := ItemRec.Inventory;

                            end;

                        end;
                        //END;
                        //END;
                        "Quantity Approved" := Quantity;

                        Validate("Unit Cost");
                        Validate(Amount);

                        if "Quantity in Store" < Quantity then
                            Error('Quantity in store of %1 of Stock Item %2 is less than that requisitioned of %3', "Quantity in Store", Description, Quantity);
                        /*
                          BEGIN
                          IF CONFIRM(Text002,FALSE,"Quantity in Store",Description,Quantity) THEN
                            GeneratePR;
                        END;
                        */
                    end;
                    //UNTIL RequsitionLines.NEXT=0;
                end;
                // added by Debbie
                Amount := Quantity * "Unit Cost";
                /*
                ProcurementPlan.RESET;
                ProcurementPlan.SETRANGE(ProcurementPlan."Plan Year","Procurement Plan");
                ProcurementPlan.SETRANGE(ProcurementPlan."Plan Item No","Procurement Plan Item");
                ProcurementPlan.CALCSUMS(ProcurementPlan."Requisition Items");
                IF (ProcurementPlan."Requisition Items"+Amount)>ProcurementPlan."Estimated Cost" THEN
                 ERROR('Requisitioned amounts have exceeded the amount budgeted for the Procurement Plan Item %1',Procurement Plan Item);
                */

                ReqHeader.Reset;
                if ReqHeader.Get("Requisition No") then begin

                    "Requisition Date" := ReqHeader."Requisition Date";
                    "Requisition Type" := ReqHeader."Requisition Type";
                end;

            end;
        }
        field(7; "Unit of Measure"; Code[10])
        {
            TableRelation = "Unit of Measure";
        }
        field(8; "Unit Cost"; Decimal)
        {

            trigger OnValidate()
            begin
                if "No of Days" <> 0 then
                    Amount := Quantity * "Unit Cost" * "No of Days"
                else
                    Amount := Quantity * "Unit Cost";
                Validate(Amount);
            end;
        }
        field(9; Amount; Decimal)
        {

            trigger OnValidate()
            begin
                CalcFields("Approved Budget Amount", "Actual Expense"); //,"Commitment Amount"
                "Available amount" := "Approved Budget Amount" - "Commitment Amount" - "Actual Expense";
                if ReqHeader.Get("Requisition No") then begin
                    if ReqHeader."Currency Code" <> '' then begin
                        ExchangeR := CurrExchRate.ExchangeRate(WorkDate, ReqHeader."Currency Code");
                        "Amount LCY" := CurrExchRate.ExchangeAmtFCYToLCY(WorkDate, ReqHeader."Currency Code", Amount, ExchangeR);
                    end;
                    if ReqHeader."Currency Code" = '' then begin
                        "Amount LCY" := Amount;
                    end;
                    if (ReqHeader."Requisition Type" = ReqHeader."requisition type"::Quote) or (ReqHeader."Requisition Type" = ReqHeader."requisition type"::"Purchase Requisition") then begin
                        if (Amount > "Available amount") then begin
                            Error('This amount is above the available amount and therefore your requisition will be rejected');
                            "Requisition Status" := "requisition status"::Rejected;

                        end;
                    end;
                end;
            end;
        }
        field(10; "Procurement Plan"; Code[10])
        {
            TableRelation = "Procurement Header".No where(Status = const(Approved));
        }
        field(11; "Procurement Plan Item"; Code[10])
        {
            TableRelation = "Procurement Plan 1"."Plan Item No" where("Plan Year" = field("Procurement Plan"));

            trigger OnValidate()
            begin

                ProcurementPlan.Reset;
                ProcurementPlan.SetRange(ProcurementPlan."Plan Item No", "Procurement Plan Item");
                if ProcurementPlan.Find('-') then begin
                    if ProcurementPlan."Procurement Type" = ProcurementPlan."procurement type"::Goods then begin
                        Type := Type::Item;
                        No := ProcurementPlan."No.";
                    end;
                    if ProcurementPlan."Procurement Type" <> ProcurementPlan."procurement type"::Service then begin
                        Type := Type::"Non Stock";
                        No := ProcurementPlan."Source of Funds";
                    end;
                    "Budget Line" := ProcurementPlan."Source of Funds";
                    Description := ProcurementPlan."Item Description";
                    "Unit of Measure" := ProcurementPlan."Unit of Measure";
                    "Unit Cost" := ProcurementPlan."Unit Cost";
                    Budgeted := BudgetLines.Amount;
                    "Approved Budget Amount" := ProcurementPlan."Estimated Cost";

                end;
            end;
        }
        field(12; "Budget Line"; Code[10])
        {
        }
        field(13; "Global Dimension 1 Code"; Code[20])
        {
            CaptionClass = '1,1,1';
            Caption = 'Department';
            TableRelation = "Dimension Value".Code where("Global Dimension No." = const(2));

            trigger OnValidate()
            begin
                DimMngmt.ValidateShortcutDimValues(1, "Global Dimension 1 Code", "Dimension Set ID");

                /*
                PurchaseReqDet.RESET;
                PurchaseReqDet.SETRANGE(PurchaseReqDet."Requistion No.","Requisition No.");
                
                IF PurchaseReqDet.FIND('-') THEN BEGIN
                REPEAT
                PurchaseReqDet."Global Dimension 1 Code":="Global Dimension 1 Code";
                PurchaseReqDet.MODIFY;
                UNTIL PurchaseReqDet.NEXT=0;
                END;
                
                PurchaseReqDet.VALIDATE(PurchaseReqDet."No.");
                */

            end;
        }
        field(14; "Amount LCY"; Decimal)
        {
        }
        field(15; Select; Boolean)
        {
        }
        field(16; "Request Generated"; Boolean)
        {
        }
        field(17; "Global Dimension 2 Code"; Code[20])
        {
            CaptionClass = '1,1,2';
            Caption = 'Global Dimension 1 Code';
            TableRelation = "Dimension Value".Code where("Global Dimension No." = const(2));

            trigger OnValidate()
            begin
                DimMngmt.ValidateShortcutDimValues(2, "Global Dimension 2 Code", "Dimension Set ID");

                /*
                PurchaseReqDet.RESET;
                PurchaseReqDet.SETRANGE(PurchaseReqDet."Requistion No.","Requisition No.");
                
                IF PurchaseReqDet.FIND('-') THEN  BEGIN
                REPEAT
                PurchaseReqDet."Global Dimension 2 Code":="Global Dimension 2 Code";
                PurchaseReqDet.MODIFY;
                UNTIL PurchaseReqDet.NEXT=0;
                 END;
                 */

            end;
        }
        field(22; "Process Type"; Option)
        {
            OptionMembers = " ",Direct,RFQ,RFP,Tender;
        }
        field(23; "Quantity Approved"; Decimal)
        {
            Editable = true;
        }
        field(24; "Quantity in Store"; Decimal)
        {
            Editable = false;
        }
        field(25; "Approved Budget Amount"; Decimal)
        {
            CalcFormula = lookup("Procurement Plan 1"."Estimated Cost" where("Plan Year" = field("Procurement Plan"),
                                                                              "Plan Item No" = field("Procurement Plan Item")));
            Editable = false;
            FieldClass = FlowField;

            trigger OnValidate()
            begin
                "Available amount" := "Approved Budget Amount" - "Actual Expense" - "Commitment Amount";
            end;
        }
        field(26; "Commitment Amount"; Decimal)
        {
            Editable = false;
            FieldClass = Normal;
        }
        field(27; "Actual Expense"; Decimal)
        {
            CalcFormula = sum("G/L Entry".Amount where("G/L Account No." = field(No)));
            Editable = false;
            FieldClass = FlowField;
        }
        field(28; "Available amount"; Decimal)
        {
            Editable = false;
        }
        field(29; "Requisition Status"; Option)
        {
            OptionMembers = " ",Approved,Rejected;
        }
        field(30; "Requisition Date"; Date)
        {
        }
        field(31; "Requisition Type"; Option)
        {
            OptionCaption = 'Quote,Order,Invoice,Credit Memo,Blanket Order,Return Order,None,Purchase Requisition,Store Requisition,Imprest,Claim-Accounting,Appointment,Payment Voucher';
            OptionMembers = Quote,"Order",Invoice,"Credit Memo","Blanket Order","Return Order","None","Purchase Requisition","Store Requisition",Imprest,"Claim-Accounting",Appointment,"Payment Voucher";
        }
        field(32; "Location Code"; Code[20])
        {
            TableRelation = Location;
        }
        field(33; "Issued Quantity"; Decimal)
        {
        }
        field(34; "FN Code"; Code[10])
        {

            trigger OnValidate()
            begin
                DimMngmt.ValidateShortcutDimValues(4, "FN Code", "Dimension Set ID");
            end;
        }
        field(35; "Cost Centre Code"; Code[10])
        {

            trigger OnValidate()
            begin
                Dimen := "Cost Centre Code";
                Dimen := CopyStr(Dimen, 1, 3);
                "Global Dimension 2 Code" := Dimen;
                Dimens := "Cost Centre Code";
                Dimens := CopyStr(Dimens, 1, 1);
                "Global Dimension 1 Code" := Dimens;

                DimMngmt.ValidateShortcutDimValues(1, "Global Dimension 1 Code", "Dimension Set ID");
                DimMngmt.ValidateShortcutDimValues(2, "Global Dimension 2 Code", "Dimension Set ID");
                DimMngmt.ValidateShortcutDimValues(3, "Cost Centre Code", "Dimension Set ID");
            end;
        }
        field(36; "FSC Code"; Code[10])
        {

            trigger OnValidate()
            begin
                DimMngmt.ValidateShortcutDimValues(5, "FSC Code", "Dimension Set ID");
            end;
        }
        field(37; "Dimension Set ID"; Integer)
        {
            Caption = 'Dimension Set ID';
            Editable = false;
            TableRelation = "Dimension Set Entry";

            trigger OnLookup()
            begin
                ShowDimensions;
            end;
        }
        field(50001; "No of Days"; Decimal)
        {
        }
    }

    keys
    {
        key(Key1; "Requisition No", "Line No")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }

    trigger OnDelete()
    begin

        if ReqHeader.Get("Requisition No") then begin
            if ReqHeader.Status <> ReqHeader.Status::Open then
                Error('You cannot delete the requisition lines at this stage');
        end;
    end;

    trigger OnInsert()
    begin

        if ReqHeader.Get("Requisition No") then begin
            "Procurement Plan" := ReqHeader."Procurement Plan";
            "Global Dimension 1 Code" := ReqHeader."Global Dimension 1 Code";
            if ReqHeader.Status <> ReqHeader.Status::Open then
                Error('You cannot add more lines at this stage');

        end;
    end;

    trigger OnModify()
    begin
        /*
        IF ReqHeader.GET("Requisition No") THEN
        BEGIN
         IF ReqHeader.Status<>ReqHeader.Status::Open THEN
          ERROR('You cannot edit the requisition lines at this stage');
        END;
        */

    end;

    var
        ReqHeader: Record "Requisition Header1";
        ProcurementPlan: Record "Procurement Plan 1";
        ItemRec: Record Item;
        RequsitionLines: Record "Requisition Lines1";
        Mail: Codeunit Mail;
        "Employee Name": Text[30];
        CompInfo: Record "Company Information";
        GLAccount: Record "G/L Account";
        Text000: label 'The Purchases & Payables Setup doesnt exist';
        Text001: label 'Generating a Purchase Requisition based on the store requisition';
        Text002: label 'Quantity in store of %1 of Stock Item %2 is less than that requisitioned of %3 do you want to generate a purchase requisition?';
        GLlines: Record "G/L Entry";
        Budget: Record "G/L Budget Name";
        BudgetLines: Record "G/L Budget Entry";
        Inventory: Record "Inventory Posting Setup";
        TotalUsed: Decimal;
        Budgeted: Decimal;
        ExchangeR: Decimal;
        CurrencyExchage: Record "Currency Exchange Rate";
        CurrExchRate: Record "Currency Exchange Rate";
        Dimen: Text;
        Dimens: Text;
        DimMngmt: Codeunit DimensionManagement;


    procedure GeneratePR()
    var
        PRHeader: Record "Requisition Header1";
        PRLines: Record "Requisition Lines1";
        NoSeriesMgt: Codeunit "No. Series";
        PPSetup: Record "Purchases & Payables Setup";
        UsersRec: Record "User Setup";
        Emp: Record Employee;
        window: Dialog;
    begin
        window.Open(Text001);
        if not PPSetup.Get then
            Error(Text000);
        PPSetup.TestField("Purchase Req No");
        PRHeader.Init;
        PRHeader."Requisition Type" := PRHeader."requisition type"::"Purchase Requisition";
        PRHeader."No." := NoSeriesMgt.GetNextNo(PPSetup."Purchase Req No", Today, true);
        if UsersRec.Get(UserId) then begin
            if Emp.Get(UsersRec."Employee No.") then begin
                PRHeader."Employee Code" := Emp."No.";
                PRHeader."Employee Name" := Emp."First Name" + ' ' + Emp."Last Name";
                PRHeader."Global Dimension 1 Code" := Emp."Global Dimension 1 Code";
                PRHeader."Global Dimension 2 Code" := Emp."Global Dimension 2 Code";
            end;
        end;
        PRHeader."Procurement Plan" := PPSetup."Effective Procurement Plan";
        PRHeader."Requisition Date" := Today;
        PRHeader."Raised by" := UserId;

        if not PRHeader.Get(PRHeader."No.") then
            PRHeader.Insert;
        window.Close;
        Page.Run(51511171);
    end;


    procedure ValidateShortcutDimCode(FieldNumber: Integer; var ShortcutDimCode: Code[20])
    begin
        DimMngmt.ValidateShortcutDimValues(FieldNumber, ShortcutDimCode, "Dimension Set ID");
    end;


    procedure LookupShortcutDimCode(FieldNumber: Integer; var ShortcutDimCode: Code[20])
    begin
        DimMngmt.LookupDimValueCode(FieldNumber, ShortcutDimCode);
        DimMngmt.ValidateShortcutDimValues(FieldNumber, ShortcutDimCode, "Dimension Set ID");
    end;


    procedure ShowDimensions()
    begin

        "Dimension Set ID" :=
          DimMngmt.EditDimensionSet(
            "Dimension Set ID", StrSubstNo('%1 %2', "Requisition No", "Line No"),
            "Global Dimension 1 Code", "Global Dimension 2 Code");
    end;


    procedure ShowShortcutDimCode(var ShortcutDimCode: array[8] of Code[20])
    begin
        DimMngmt.GetShortcutDimensions("Dimension Set ID", ShortcutDimCode);
    end;
}
