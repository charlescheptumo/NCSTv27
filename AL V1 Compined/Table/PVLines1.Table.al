#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Table 56001 "PV Lines1"
{

    fields
    {
        field(1; No; Code[20])
        {
            TableRelation = Payments1;
        }
        field(2; "Line No"; Integer)
        {
            AutoIncrement = true;
        }
        field(3; Date; Date)
        {
        }
        field(4; "Account Type"; Option)
        {
            OptionCaption = 'G/L Account,Customer,Vendor,Bank Account,Fixed Asset';
            OptionMembers = "G/L Account",Customer,Vendor,"Bank Account","Fixed Asset";
        }
        field(5; "Account No"; Code[20])
        {
            Editable = true;

            trigger OnLookup()
            begin

                if "Account Type" = "account type"::"G/L Account" then begin
                    if Page.RunModal(18, GLAccount) = Action::LookupOK then begin
                        GLAccount.TestField("Direct Posting", true);
                        "Account No" := GLAccount."No.";
                        "Account Name" := GLAccount.Name;
                    end;
                end
                else if "Account Type" = "account type"::Customer then begin
                    if Page.RunModal(22, Customer) = Action::LookupOK then begin
                        "Account No" := Customer."No.";
                        "Account Name" := Customer.Name;
                    end;
                end
                else if "Account Type" = "account type"::Vendor then begin
                    if Page.RunModal(27, Vendor) = Action::LookupOK then begin
                        "Account No" := Vendor."No.";
                        "Account Name" := Vendor.Name;
                    end;
                end
                else if "Account Type" = "account type"::"Bank Account" then begin
                    if Page.RunModal(371, Bank) = Action::LookupOK then begin
                        "Account No" := Bank."No.";
                        "Account Name" := Bank.Name;
                    end;
                end
                else if "Account Type" = "account type"::"Fixed Asset" then begin
                    if Page.RunModal(5601, FixedAsset) = Action::LookupOK then begin
                        "Account No" := FixedAsset."No.";
                        "Account Name" := FixedAsset.Description;
                    end;
                end;
            end;

            trigger OnValidate()
            begin
                Validate(Amount);
            end;
        }
        field(6; "Account Name"; Text[100])
        {
        }
        field(7; Description; Text[150])
        {
        }
        field(8; Amount; Decimal)
        {
            Editable = true;

            trigger OnValidate()
            var
                GLAccount: Record "G/L Account";
                GenLedSetup: Record "General Ledger Setup";
                BudgetAmount: Decimal;
                Expenses: Decimal;
                BudgetAvailable: Decimal;
            begin

                VATAmount := 0;
                "W/Tax Amount" := 0;
                WTVATAmount := 0;

                "VAT Amount" := 0;
                "W/Tax Amount" := 0;
                "Retention Amount" := 0;
                "W/T VAT Amount" := 0;


                CSetup.Get;
                CSetup.TestField("Rounding Precision");
                if CSetup."Rounding Type" = CSetup."rounding type"::Up then
                    Direction := '>'
                else if CSetup."Rounding Type" = CSetup."rounding type"::Nearest then
                    Direction := '='
                else if CSetup."Rounding Type" = CSetup."rounding type"::Down then
                    Direction := '<';
                case "Account Type" of
                    "account type"::"G/L Account":
                        begin
                            if "VAT Code" <> '' then begin
                                if GLAccount.Get("Account No") then
                                    if VATSetup.Get(GLAccount."VAT Bus. Posting Group", "VAT Code") then begin
                                        if VATSetup."VAT %" <> 0 then begin
                                            VATAmount := ROUND((Amount / (1 + VATSetup."VAT %" / 100) * VATSetup."VAT %" / 100), CSetup."Rounding Precision", Direction);
                                            NetAmount := Amount - VATAmount;
                                            "VAT Amount" := VATAmount;
                                            if CSetup."Post VAT" then//Check IF VAT is to be posted
                                                "Net Amount" := Amount - VATAmount
                                            else
                                                "Net Amount" := Amount;
                                            if "W/Tax Code" <> '' then begin
                                                if GLAccount.Get("Account No") then
                                                    if VATSetup.Get(GLAccount."Gen. Bus. Posting Group", "W/Tax Code") then begin
                                                        "W/TAmount" := ROUND(NetAmount * VATSetup."VAT %" / 100, CSetup."Rounding Precision", Direction);
                                                        "W/Tax Amount" := "W/TAmount";
                                                        NetAmount := NetAmount - "W/TAmount";
                                                        if CSetup."Post VAT" then//Check IF VAT is to be posted
                                                            "Net Amount" := NetAmount
                                                        else
                                                            "Net Amount" := Amount - "W/TAmount";
                                                    end;
                                            end;

                                            if "W/T VAT Code" <> '' then begin//Compute W/T VAT
                                                if GLAccount.Get("Account No") then;
                                                if VATSetup.Get(GLAccount."Gen. Bus. Posting Group", "W/T VAT Code") then begin
                                                    if VATSetup2.Get(GLAccount."Gen. Bus. Posting Group", "VAT Code") then;
                                                    WTVATAmount := ROUND((VATAmount * VATSetup."VAT %" / 100 / (VATSetup2."VAT %" / 100)),
                                                    CSetup."Rounding Precision", Direction);
                                                    "W/T VAT Amount" := WTVATAmount;
                                                    NetAmount := NetAmount - WTVATAmount;
                                                    "Net Amount" := "Net Amount" - WTVATAmount;
                                                end;
                                            end;

                                        end else begin
                                            "Net Amount" := Amount;
                                            NetAmount := Amount;
                                            if "W/Tax Code" <> '' then begin
                                                if GLAccount.Get("Account No") then
                                                    if VATSetup.Get(GLAccount."Gen. Bus. Posting Group", "W/Tax Code") then begin
                                                        "W/TAmount" := ROUND(NetAmount * VATSetup."VAT %" / 100, CSetup."Rounding Precision", Direction);
                                                        "W/Tax Amount" := "W/TAmount";
                                                        NetAmount := NetAmount - "W/TAmount";
                                                        "Net Amount" := Amount - "W/TAmount";
                                                    end;
                                            end;
                                        end;
                                    end;
                            end
                            else begin
                                "Net Amount" := Amount;
                                NetAmount := Amount;
                                if "W/Tax Code" <> '' then begin
                                    if GLAccount.Get("Account No") then
                                        if VATSetup.Get(GLAccount."Gen. Bus. Posting Group", "W/Tax Code") then begin
                                            "W/TAmount" := ROUND(NetAmount * VATSetup."VAT %" / 100, CSetup."Rounding Precision", Direction);
                                            "W/Tax Amount" := "W/TAmount";
                                            NetAmount := NetAmount - "W/TAmount";
                                            "Net Amount" := Amount - "W/TAmount";
                                        end;
                                end;
                            end;
                        end;
                    "account type"::Customer:
                        begin
                            if "VAT Code" <> '' then begin
                                if Customer.Get("Account No") then
                                    if VATSetup.Get(Customer."VAT Bus. Posting Group", "VAT Code") then begin
                                        VATAmount := ROUND((Amount / (1 + VATSetup."VAT %" / 100) * VATSetup."VAT %" / 100), CSetup."Rounding Precision", Direction);
                                        if VATSetup."VAT %" <> 0 then begin
                                            NetAmount := Amount - VATAmount;
                                            "VAT Amount" := VATAmount;
                                            if CSetup."Post VAT" then//Check IF VAT is to be posted
                                                "Net Amount" := Amount - VATAmount
                                            else
                                                "Net Amount" := Amount;
                                            if "W/Tax Code" <> '' then begin
                                                if Customer.Get("Account No") then
                                                    if VATSetup.Get(Customer."VAT Bus. Posting Group", "W/Tax Code") then begin
                                                        "W/TAmount" := ROUND(NetAmount * VATSetup."VAT %" / 100, CSetup."Rounding Precision", Direction);
                                                        "W/Tax Amount" := "W/TAmount";
                                                        NetAmount := NetAmount - "W/TAmount";
                                                        if CSetup."Post VAT" then//Check IF VAT is to be posted
                                                            "Net Amount" := NetAmount
                                                        else
                                                            "Net Amount" := Amount - "W/TAmount";
                                                    end;
                                            end;
                                            if "W/T VAT Code" <> '' then begin//Compute W/T VAT
                                                if GLAccount.Get("Account No") then;
                                                if VATSetup.Get(GLAccount."Gen. Bus. Posting Group", "W/T VAT Code") then begin
                                                    if VATSetup2.Get(GLAccount."Gen. Bus. Posting Group", "VAT Code") then;
                                                    WTVATAmount := ROUND((VATAmount * VATSetup."VAT %" / 100 / (VATSetup2."VAT %" / 100)),
                                                    CSetup."Rounding Precision", Direction);
                                                    "W/T VAT Amount" := WTVATAmount;
                                                    NetAmount := NetAmount - WTVATAmount;
                                                    "Net Amount" := "Net Amount" - WTVATAmount;

                                                end;
                                            end;
                                        end else begin
                                            "Net Amount" := Amount;
                                            NetAmount := Amount;
                                            if "W/Tax Code" <> '' then begin
                                                if Customer.Get("Account No") then
                                                    if VATSetup.Get(Customer."VAT Bus. Posting Group", "W/Tax Code") then begin
                                                        "W/TAmount" := ROUND(NetAmount * VATSetup."VAT %" / 100, CSetup."Rounding Precision", Direction);
                                                        "W/Tax Amount" := "W/TAmount";
                                                        NetAmount := NetAmount - "W/TAmount";
                                                        "Net Amount" := Amount - "W/TAmount";
                                                    end;
                                            end;
                                        end;
                                    end;
                            end
                            else begin
                                "Net Amount" := Amount;
                                NetAmount := Amount;
                                if "W/Tax Code" <> '' then begin
                                    if Customer.Get("Account No") then
                                        if VATSetup.Get(Customer."VAT Bus. Posting Group", "W/Tax Code") then begin
                                            "W/TAmount" := ROUND(NetAmount * VATSetup."VAT %" / 100, CSetup."Rounding Precision", Direction);
                                            "W/Tax Amount" := "W/TAmount";
                                            NetAmount := NetAmount - "W/TAmount";
                                            "Net Amount" := Amount - "W/TAmount";
                                        end;
                                end;
                            end;
                        end;
                    "account type"::Vendor:
                        begin
                            if "VAT Code" <> '' then begin
                                if Vendor.Get("Account No") then
                                    if VATSetup.Get(Vendor."VAT Bus. Posting Group", "VAT Code") then begin
                                        if VATSetup."VAT %" <> 0 then begin
                                            VATAmount := ROUND((Amount / (1 + VATSetup."VAT %" / 100) * VATSetup."VAT %" / 100), CSetup."Rounding Precision", Direction);
                                            NetAmount := Amount - VATAmount;
                                            "VAT Amount" := VATAmount;
                                            if CSetup."Post VAT" then//Check IF VAT is to be posted
                                                "Net Amount" := Amount - VATAmount
                                            else
                                                "Net Amount" := Amount;
                                            if "W/Tax Code" <> '' then begin
                                                if Vendor.Get("Account No") then
                                                    if VATSetup.Get(Vendor."VAT Bus. Posting Group", "W/Tax Code") then begin
                                                        "W/TAmount" := ROUND(NetAmount * VATSetup."VAT %" / 100, CSetup."Rounding Precision", Direction);
                                                        "W/Tax Amount" := "W/TAmount";
                                                        NetAmount := NetAmount - "W/TAmount";
                                                        if CSetup."Post VAT" then//Check IF VAT is to be posted
                                                            "Net Amount" := NetAmount
                                                        else
                                                            "Net Amount" := Amount - "W/TAmount";
                                                    end;
                                            end;
                                            if "W/T VAT Code" <> '' then begin//Compute W/T VAT
                                                if GLAccount.Get("Account No") then;
                                                if VATSetup.Get(GLAccount."Gen. Bus. Posting Group", "W/T VAT Code") then begin
                                                    if VATSetup2.Get(GLAccount."Gen. Bus. Posting Group", "VAT Code") then;
                                                    WTVATAmount := ROUND((VATAmount * VATSetup."VAT %" / 100 / (VATSetup2."VAT %" / 100)),
                                                    CSetup."Rounding Precision", Direction);
                                                    "W/T VAT Amount" := WTVATAmount;
                                                    NetAmount := NetAmount - WTVATAmount;
                                                    "Net Amount" := "Net Amount" - WTVATAmount;
                                                end;
                                            end;
                                        end else begin
                                            "Net Amount" := Amount;
                                            NetAmount := Amount;
                                            if "W/Tax Code" <> '' then begin
                                                if Vendor.Get("Account No") then
                                                    if VATSetup.Get(Vendor."VAT Bus. Posting Group", "W/Tax Code") then begin
                                                        "W/TAmount" := ROUND(NetAmount * VATSetup."VAT %" / 100, CSetup."Rounding Precision", Direction);
                                                        "W/Tax Amount" := "W/TAmount";
                                                        NetAmount := NetAmount - "W/TAmount";
                                                        "Net Amount" := Amount - "W/TAmount";
                                                    end;
                                            end;
                                        end;
                                    end;
                            end
                            else begin
                                "Net Amount" := Amount;
                                NetAmount := Amount;
                                if "W/Tax Code" <> '' then begin
                                    if Vendor.Get("Account No") then
                                        if VATSetup.Get(Vendor."VAT Bus. Posting Group", "W/Tax Code") then begin
                                            "W/TAmount" := ROUND(NetAmount * VATSetup."VAT %" / 100, CSetup."Rounding Precision", Direction);
                                            "W/Tax Amount" := "W/TAmount";
                                            NetAmount := NetAmount - "W/TAmount";
                                            "Net Amount" := Amount - "W/TAmount";
                                        end;
                                end;
                            end;
                        end;
                    "account type"::"Bank Account":
                        "Net Amount" := Amount;
                end;

                /*///
                       //Confirm the Amount to be issued does not exceed the budget and amount Committed
                        //Get Budget for the G/L
                        GenLedSetup.GET;
                        GLAccount.SETFILTER(GLAccount."Budget Filter",GenLedSetup."Current Budget");
                        GLAccount.SETRANGE(GLAccount."No.","Account No");
                       //Get budget amount avaliable
                       GLAccount.SETRANGE(GLAccount."Date Filter",GenLedSetup."Current Budget Start Date",GenLedSetup."Current Budget End Date");
                        IF GLAccount.FIND('-') THEN BEGIN
                         GLAccount.CALCFIELDS(GLAccount."Budgeted Amount",GLAccount."Net Change");
                         BudgetAmount:=GLAccount."Budgeted Amount";
                         Expenses:=GLAccount."Net Change";
                         BudgetAvailable:=GLAccount."Budgeted Amount"-GLAccount."Net Change";
                        END;
                     //Get committed Amount
                     CommittedAmount:=0;
                     CommitmentEntries.RESET;
                     CommitmentEntries.SETCURRENTKEY(CommitmentEntries.Account);
                     CommitmentEntries.SETRANGE(CommitmentEntries.Account,"Account No");
                
                      PVHeader.RESET;
                      PVHeader.SETRANGE(PVHeader."No.",No);
                      IF PVHeader.FIND('-')THEN BEGIN
                       IF PVHeader.Date=0D THEN
                        ERROR('Please insert the Payment Voucher date');
                        CommitmentEntries.SETRANGE(CommitmentEntries."Commitment Date",GenLedSetup."Current Budget Start Date",
                                                  PVHeader.Date);
                        CommitmentEntries.CALCSUMS(CommitmentEntries."Committed Amount");
                        CommittedAmount:=CommitmentEntries."Committed Amount";
                
                        {IF LineBudget(No,"Account No.","Line No")THEN
                           MESSAGE('Line No %1 has been included in the Budget',"Line No")
                        ELSE}
                
                        IF Rec."Account Type" = "Account Type"::"G/L Account" THEN
                          IF CommittedAmount + Amount>BudgetAvailable THEN
                             ERROR('You have Exceeded Budget for G/L Account No %1 By %2 Budget Available %3 CommittedAmount %4'
                            ,"Account No",
                             ABS(BudgetAvailable - (CommittedAmount+Amount)),BudgetAvailable,CommittedAmount);
                
                      END;
                */

            end;
        }
        field(9; Posted; Boolean)
        {
            Editable = false;
        }
        field(10; "Posted Date"; Date)
        {
        }
        field(11; "Posted Time"; Time)
        {
        }
        field(12; "Global Dimension 1 Code"; Code[20])
        {
            CaptionClass = '1,1,1';
            TableRelation = "Dimension Value".Code where("Global Dimension No." = const(1));
        }
        field(13; "Global Dimension 2 Code"; Code[20])
        {
            CaptionClass = '1,1,2';
            TableRelation = "Dimension Value".Code where("Global Dimension No." = const(2));
        }
        field(14; "Applies to Doc. No"; Code[20])
        {

            trigger OnLookup()
            begin

                "Applies to Doc. No" := '';
                Amt := 0;
                VATAmount := 0;
                "W/TAmount" := 0;

                case "Account Type" of
                    "account type"::Customer:
                        begin
                            CustLedger.Reset;
                            CustLedger.SetCurrentkey(CustLedger."Customer No.", Open, "Document No.");
                            CustLedger.SetRange(CustLedger."Customer No.", "Account No");
                            CustLedger.SetRange(Open, true);
                            CustLedger.CalcFields(CustLedger.Amount);
                            if Page.RunModal(25, CustLedger) = Action::LookupOK then begin

                                if CustLedger."Applies-to ID" <> '' then begin
                                    CustLedger1.Reset;
                                    CustLedger1.SetCurrentkey(CustLedger1."Customer No.", Open, "Applies-to ID");
                                    CustLedger1.SetRange(CustLedger1."Customer No.", "Account No");
                                    CustLedger1.SetRange(Open, true);
                                    CustLedger1.SetRange("Applies-to ID", CustLedger."Applies-to ID");
                                    if CustLedger1.Find('-') then begin
                                        repeat
                                            CustLedger1.CalcFields(CustLedger1.Amount);
                                            Amt := Amt + Abs(CustLedger1.Amount);
                                        until CustLedger1.Next = 0;
                                    end;

                                    if Amt <> Amt then
                                        //ERROR('Amount is not equal to the amount applied on the application PAGE');
                                        if Amount = 0 then
                                            Amount := Amt;
                                    Validate(Amount);
                                    "Applies to Doc. No" := CustLedger."Document No.";
                                end else begin
                                    if Amount <> Abs(CustLedger.Amount) then
                                        CustLedger.CalcFields(CustLedger."Remaining Amount");
                                    if Amount = 0 then
                                        Amount := Abs(CustLedger."Remaining Amount");
                                    Validate(Amount);
                                    "Applies to Doc. No" := CustLedger."Document No.";

                                end;
                            end;
                            Validate(Amount);
                        end;

                    "account type"::Vendor:
                        begin
                            VendLedger.Reset;
                            VendLedger.SetCurrentkey(VendLedger."Vendor No.", Open, "Document No.");
                            VendLedger.SetRange(VendLedger."Vendor No.", "Account No");
                            VendLedger.SetRange(Open, true);
                            VendLedger.CalcFields("Remaining Amount");
                            if Page.RunModal(29, VendLedger) = Action::LookupOK then begin

                                if VendLedger."Applies-to ID" <> '' then begin
                                    VendLedger1.Reset;
                                    VendLedger1.SetCurrentkey(VendLedger1."Vendor No.", Open, "Applies-to ID");
                                    VendLedger1.SetRange(VendLedger1."Vendor No.", "Account No");
                                    VendLedger1.SetRange(Open, true);
                                    VendLedger1.SetRange(VendLedger1."Applies-to ID", VendLedger."Applies-to ID");
                                    if VendLedger1.Find('-') then begin
                                        repeat
                                            VendLedger1.CalcFields(VendLedger1."Remaining Amount");

                                            NetAmount := NetAmount + Abs(VendLedger1."Remaining Amount");

                                        until VendLedger1.Next = 0;
                                    end;

                                    if Amount <> Amount then
                                        //ERROR('Amount is not equal to the amount applied on the application form');
                                        if Amount = 0 then
                                            Amount := Amount;

                                    Validate(Amount);
                                    "Applies to Doc. No" := VendLedger."Document No.";

                                end else begin
                                    if Amount <> Abs(VendLedger."Remaining Amount") then
                                        VendLedger.CalcFields(VendLedger."Remaining Amount");
                                    if Amount = 0 then
                                        Amount := Abs(VendLedger."Remaining Amount");
                                    Validate(Amount);
                                    "Applies to Doc. No" := VendLedger."Document No.";
                                end;
                            end;
                            Amount := Abs(VendLedger."Remaining Amount");
                            Validate(Amount);
                        end;
                end;
            end;
        }
        field(15; "VAT Code"; Code[20])
        {
            TableRelation = "VAT Product Posting Group";

            trigger OnValidate()
            begin
                Validate(Amount);
            end;
        }
        field(16; "W/Tax Code"; Code[20])
        {
            TableRelation = "VAT Product Posting Group";

            trigger OnValidate()
            begin
                Validate(Amount);
            end;
        }
        field(17; "Retention Code"; Code[20])
        {
            TableRelation = "VAT Product Posting Group";
        }
        field(18; "VAT Amount"; Decimal)
        {
        }
        field(19; "W/Tax Amount"; Decimal)
        {
        }
        field(20; "Retention Amount"; Decimal)
        {
        }
        field(21; "Net Amount"; Decimal)
        {
        }
        field(22; "W/T VAT Code"; Code[20])
        {
            TableRelation = "VAT Product Posting Group";

            trigger OnValidate()
            begin
                Validate(Amount);
            end;
        }
        field(23; "W/T VAT Amount"; Decimal)
        {
        }
    }

    keys
    {
        key(Key1; No, "Line No")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }

    var
        GLAccount: Record "G/L Account";
        Customer: Record Customer;
        Vendor: Record Vendor;
        Bank: Record "Bank Account";
        FixedAsset: Record "Fixed Asset";
        TarriffCodes: Record "Petty Cash Lines1";
        VATAmount: Decimal;
        "W/TAmount": Decimal;
        RetAmount: Decimal;
        NetAmount: Decimal;
        VATSetup: Record "VAT Posting Setup";
        CustLedger: Record "Cust. Ledger Entry";
        CustLedger1: Record "Cust. Ledger Entry";
        VendLedger: Record "Vendor Ledger Entry";
        VendLedger1: Record "Vendor Ledger Entry";
        Amt: Decimal;
        CSetup: Record "Cash Management Setup";
        Direction: Text[30];
        WTVATAmount: Decimal;
        VATSetup2: Record "VAT Posting Setup";
}
