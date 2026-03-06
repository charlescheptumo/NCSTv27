#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Table 57006 "PV Lines"
{

    fields
    {
        field(1; No; Code[20])
        {
            TableRelation = Payments;
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
            OptionCaption = 'G/L Account,Customer,Vendor,Bank Account,Fixed Asset,IC Partner,Employee';
            OptionMembers = "G/L Account",Customer,Vendor,"Bank Account","Fixed Asset","IC Partner",Employee;
        }
        field(5; "Account No"; Code[20])
        {
            Editable = true;
            TableRelation = if ("Account Type" = const("G/L Account")) "G/L Account"
            else if ("Account Type" = const("Fixed Asset")) "Fixed Asset"
            else if ("Account Type" = const(Customer)) Customer
            else if ("Account Type" = const("Bank Account")) "Bank Account"
            else if ("Account Type" = const(Vendor)) Vendor
            else if ("Account Type" = const(Employee)) Employee;

            trigger OnValidate()
            begin

                case "Account Type" of
                    "account type"::"G/L Account":
                        begin
                            GLAccount.Get("Account No");
                            GLAccount.TestField("Direct Posting", true);
                            "Account Name" := GLAccount.Name;
                        end;
                    "account type"::Vendor:
                        begin
                            if Vendor.Get("Account No") then;
                            "Account Name" := Vendor.Name;
                        end;
                    "account type"::Customer:
                        begin
                            if Customer.Get("Account No") then;
                            "Account Name" := Customer.Name;
                        end;
                    "account type"::"Bank Account":
                        begin
                            Bank.Get("Account No");
                            "Account Name" := Bank.Name;
                        end;
                    "account type"::"Fixed Asset":
                        begin
                            FixedAsset.Get("Account No");
                            "Account Name" := FixedAsset.Description;
                        end;

                    "account type"::Employee:
                        begin
                            Employee.Get("Account No");
                            "Account Name" := Employee."First Name" + ' ' + Employee."Middle Name" + ' ' + Employee."Last Name";
                        end;
                end;
                Validate(Amount);

                //added on 23/05/17
                //add the payee and on behalf of to be the account name
                PVHeader.Reset;
                PVHeader.SetRange(PVHeader."No.", No);
                if PVHeader.Find('-') then begin
                    PVHeader.Payee := "Account Name";
                    PVHeader."On behalf of" := "Account Name";
                    PVHeader.Modify;
                end;
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
                Committments: Record "Committment Entries";
                CommittedAmount: Decimal;
                CommitmentEntries: Record "Committment Entries";
                PVHeader: Record Payments;
                TotalCommittedAmount: Decimal;
                EmployeePGroups: Record "Employee PGroups";
            begin
                GetPaymentHeader;

                PVHeader.Reset;
                PVHeader.SetRange(PVHeader."No.", No);
                if PVHeader.FindSet then begin

                    if PVHeader."Currency Code" <> '' then begin
                        PVHeader.TestField("Currency Factor");
                        GenLedSetup.Get;
                        CashMgt.Get;
                        "Amount (LCY)" :=
                          ROUND(
                            CurrExchRate.ExchangeAmtFCYToLCY(
                              GetDate, PVHeader."Currency Code",
                              Amount, PVHeader."Currency Factor"),
                            GenLedSetup."Inv. Rounding Precision (LCY)");
                    end else
                        "Amount (LCY)" := PaymentRounding(Amount);
                end;
                CalculateTax();

                //get the committments
                if "Applies to Doc. No" = '' then begin
                    "Net Amount" := 0;
                    //Amount:=0;
                    //   "Vote Item" := '';
                    "Available Funds" := 0;
                    Commitments := 0;
                    "Actual to Date" := 0;
                    "Vote Amount." := 0;
                end;
                VendorLedgerEntry.Reset;
                VendorLedgerEntry.SetRange("Document No.", "Applies to Doc. No");
                VendorLedgerEntry.SetRange("Vendor No.", "Account No");
                if VendorLedgerEntry.FindSet then begin
                    if VendorLedgerEntry."Document Type" = VendorLedgerEntry."document type"::" " then begin

                        //get committments

                        bcommitments.SetRange("Account No.", "Vote Item");
                        bcommitments.SetRange("Budget Name", CashMgt."Current Budget");
                        if bcommitments.FindSet then begin
                            bcommitments.CalcFields("Commited Amount Orders", "Commited Amount PRN", "Commited Amount Imprest");
                            Commitments := (bcommitments."Committment Amount" + bcommitments."Commited Amount Orders" + bcommitments."Commited Amount PRN" + bcommitments."Commited Amount Imprest");
                        end;
                        //get the budget
                        if CSetups.Get then begin
                            GLBudgetEntry.Reset;
                            GLBudgetEntry.SetRange("G/L Account No.", "Vote Item");
                            GLBudgetEntry.SetRange("Budget Name", CSetups."Current Budget");
                            GLBudgetEntry.CalcSums(GLBudgetEntry.Amount);
                            "Vote Amount." := GLBudgetEntry.Amount;
                            "Vote Amount" := GLBudgetEntry.Amount;
                        end;
                        //get the actual
                        CSetups.Get;
                        gEntry.SetRange("G/L Account No.", "Vote Item");
                        gEntry.SetFilter(gEntry."Posting Date", '%1..%2', CSetups."Current Budget Start Date", CSetups."Current Budget End Date");
                        if gEntry.FindSet then begin
                            repeat
                                actualAmount := actualAmount + Abs(gEntry.Amount);
                            until gEntry.Next = 0;
                        end;
                        "Actual to Date" := actualAmount;
                        Commitments := Amount;
                        "Available Funds" := "Vote Amount." - "Actual to Date";

                    end;
                    //when document type is defined
                    if VendorLedgerEntry."Document Type" = VendorLedgerEntry."document type"::Invoice then begin
                        pInvoice.SetRange("Document No.", "Applies to Doc. No");
                        pInvoice.SetRange("Buy-from Vendor No.", "Account No");
                        if pInvoice.FindSet then begin
                            if pInvoice.Type = pInvoice.Type::"G/L Account" then begin
                                "Vote Item" := pInvoice."No.";
                            end;
                            if pInvoice.Type = pInvoice.Type::"Fixed Asset" then begin
                                FixedAsset.Get(pInvoice."No.");
                                FixedAsset.Reset;
                                FixedAsset.SetRange("No.", pInvoice."No.");
                                if FixedAsset.FindSet then begin
                                    FixedAsset.CalcFields(FixedAsset."Vote Item");
                                    "Vote Item" := FixedAsset."Vote Item";
                                end;
                            end;
                            if pInvoice.Type = pInvoice.Type::Item then begin
                                if Item.Get(pInvoice."No.") then begin
                                    GeneralPostingSetup.Reset;
                                    GeneralPostingSetup.SetRange("Gen. Prod. Posting Group", Item."Gen. Prod. Posting Group");
                                    if GeneralPostingSetup.FindFirst then begin
                                        "Vote Item" := GeneralPostingSetup."Purch. Account";
                                    end;
                                end;

                            end;
                        end;
                        //get committments

                        bcommitments.SetRange("Account No.", "Vote Item");
                        bcommitments.SetRange("Budget Name", CashMgt."Current Budget");
                        if bcommitments.FindSet then begin
                            bcommitments.CalcFields("Commited Amount Orders", "Commited Amount PRN", "Commited Amount Imprest");
                            CommitAmnt := (bcommitments."Committment Amount" + bcommitments."Commited Amount Orders" + bcommitments."Commited Amount PRN" + bcommitments."Commited Amount Imprest");
                        end;
                        //get the budget
                        if CSetups.Get then begin
                            GLBudgetEntry.Reset;
                            GLBudgetEntry.SetRange("G/L Account No.", "Vote Item");
                            GLBudgetEntry.SetRange("Budget Name", CSetups."Current Budget");
                            GLBudgetEntry.CalcSums(GLBudgetEntry.Amount);
                            "Vote Amount." := GLBudgetEntry.Amount;
                        end;
                        //get the actual
                        CSetups.Get;
                        gEntry.SetRange("G/L Account No.", "Vote Item");
                        gEntry.SetFilter(gEntry."Posting Date", '%1..%2', CSetups."Current Budget Start Date", CSetups."Current Budget End Date");
                        if gEntry.FindSet then begin
                            repeat
                                actualAmount := actualAmount + Abs(gEntry.Amount);
                            until gEntry.Next = 0;
                        end;
                        "Actual to Date" := actualAmount;
                        Commitments := Amount;
                        "Available Funds" := "Vote Amount." - "Actual to Date";

                    end;
                end;

                /*CASE "Account Type" OF
                 "Account Type"::Employee:
                   BEGIN
                 Commitments:=0;
               bcommitments.RESET;
               bcommitments.SETRANGE("Account No.","Vote Item");
               IF bcommitments.FINDSET THEN
               BEGIN
               bcommitments.CALCFIELDS("Commited Amount Orders","Commited Amount PRN","Commited Amount Imprest");
               Commitments:=(bcommitments."Commited Amount Orders"+bcommitments."Commited Amount PRN"+bcommitments."Commited Amount Imprest"+bcommitments."Committment Amount"+Amount);

               END;
               MESSAGE('Commitements %1',FORMAT(Commitments));

               //Get The Vote Amount

                 CSetups.GET();
                 VoteAmount:=0;
                 GLBudgetEntry.RESET;
                 GLBudgetEntry.SETCURRENTKEY("G/L Account No.","Budget Name");
                 GLBudgetEntry.SETRANGE(GLBudgetEntry."G/L Account No.","Vote Item");
                 GLBudgetEntry.SETRANGE(GLBudgetEntry."Budget Name",CSetups."Current Budget");
                 IF GLBudgetEntry.FINDSET THEN BEGIN
                 REPEAT
                   VoteAmount := VoteAmount+GLBudgetEntry.Amount;
                 UNTIL GLBudgetEntry.NEXT=0;

                 MESSAGE('Vote Amount %1',FORMAT(VoteAmount));
                 END;
                 "Vote Amount":=VoteAmount;



                 actualAmount:=0;
                 cSetup.GET;
                 gEntry.RESET;
                 gEntry.SETRANGE(gEntry."G/L Account No.","Vote Item");
                 gEntry.SETFILTER(gEntry."Posting Date",'%1..%2',CashMgt."Current Budget Start Date",CashMgt."Current Budget End Date");
                 IF gEntry.FINDSET THEN
                 BEGIN
                   REPEAT
                     actualAmount:=actualAmount+ABS(gEntry.Amount);
                   UNTIL gEntry.NEXT=0;
                  END;
                 MESSAGE('Actual Amount %1',FORMAT(actualAmount));
                 "Actual to Date":=actualAmount;
                 Commitments := Commitments + Amount;
                 // "Available Funds":="Vote Amount"-actualAmount-Commitments;
                 "Available Funds":="Vote Amount"-ABS("Actual to Date");

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
        field(12; "Shortcut Dimension 1 Code"; Code[20])
        {
            CaptionClass = '1,1,1';
            TableRelation = "Dimension Value".Code where("Global Dimension No." = const(1));

            trigger OnValidate()
            begin

                ValidateShortcutDimCode(1, "Shortcut Dimension 1 Code");
            end;
        }
        field(13; "Shortcut Dimension 2 Code"; Code[20])
        {
            CaptionClass = '1,1,2';
            TableRelation = "Dimension Value".Code where("Global Dimension No." = const(2));

            trigger OnValidate()
            begin
                ValidateShortcutDimCode(2, "Shortcut Dimension 2 Code");
            end;
        }
        field(14; "Applies to Doc. No"; Code[20])
        {

            trigger OnLookup()
            var
                Vendor: Record Vendor;
                EmployeePGroups: Record "Employee PGroups";
            begin
                //Machira
                "Applies to Doc. No" := '';
                // VATAmount:=0;
                //"W/TAmount":=0;
                Amnt := 0;
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
                                            Amnt := Amnt + Abs(CustLedger1.Amount);
                                        until CustLedger1.Next = 0;
                                    end;

                                    if Amnt <> Amnt then
                                        //ERROR('Amount is not equal to the amount applied on the application PAGE');
                                        if Amount = 0 then
                                            Amount := Amnt;
                                    Validate(Amount);
                                    "Applies to Doc. No" := CustLedger."Document No.";
                                    //Insert VAT where applicable
                                    //VATEntry.RESET;
                                    //VATEntry.SETRANGE("Transaction No.",VendLedger."Transaction No.");
                                    //IF VATEntry.FIND('-') THEN
                                    //"VAT Code":=VATEntry."VAT Prod. Posting Group";
                                    //

                                end else begin
                                    if Amount <> Abs(CustLedger.Amount) then
                                        CustLedger.CalcFields(CustLedger."Remaining Amount");
                                    if Amount = 0 then
                                        Amount := Abs(CustLedger."Remaining Amount");
                                    Validate(Amount);
                                    "Applies to Doc. No" := CustLedger."Document No.";
                                    //"External Document No.":=CustLedger."External Document No.";
                                    //Insert VAT where applicable
                                    /*
                                    VATEntry.RESET;
                                    VATEntry.SETRANGE("Transaction No.",VendLedger."Transaction No.");
                                     IF VATEntry.FIND('-') THEN
                                       "VAT Code":=VATEntry."VAT Prod. Posting Group";
                                    */

                                end;
                            end;
                            Validate(Amount);
                        end;

                    "account type"::Vendor:
                        begin
                            //CHECK IF VENDOR PAYROLL
                            CSetups.Get;
                            Vendor.Reset;
                            Vendor.SetRange("No.", "Account No");
                            if Vendor.FindFirst then begin
                                if Vendor."Vendor Type" = Vendor."vendor type"::Payroll then begin
                                    EmployeePGroups.Reset;
                                    EmployeePGroups.SetRange("G/L Account", Vendor."No.");
                                    if EmployeePGroups.FindFirst then begin

                                        "Vote Item" := EmployeePGroups."Vote Item";
                                        Validate("Vote Item");
                                    end;
                                end;
                            end;
                            VendLedger.Reset;
                            VendLedger.SetCurrentkey(VendLedger."Vendor No.", Open, "Document No.");
                            VendLedger.SetRange(VendLedger."Vendor No.", "Account No");
                            VendLedger.SetRange(Open, true);
                            VendLedger.CalcFields("Remaining Amount");
                            VendLedger.CalcFields("Remaining Amt. (LCY)");
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
                                            VendLedger1.CalcFields("Remaining Amt. (LCY)");
                                        //NetAmount:=NetAmount+ABS(VendLedger1."Remaining Amount");

                                        until VendLedger1.Next = 0;
                                    end;



                                    if Amount <> Amount then
                                        //ERROR('Amount is not equal to the amount applied on the application form');
                                        if Amount = 0 then
                                            "Amount (LCY)" := "Amount (LCY)";

                                    Validate(Amount);
                                    "Applies to Doc. No" := VendLedger."Document No.";
                                    //"External Document No.":=VendLedger."External Document No.";

                                    //Insert VAT where applicable
                                    /*
                                   VATEntry.RESET;
                                   VATEntry.SETRANGE("Transaction No.",VendLedger."Transaction No.");
                                    IF VATEntry.FIND('-') THEN
                                      "VAT Code":=VATEntry."VAT Prod. Posting Group";
                                   //
                                   */
                                end else begin
                                    if Amount <> Abs(VendLedger."Remaining Amount") then
                                        VendLedger.CalcFields(VendLedger."Remaining Amount");
                                    VendLedger.CalcFields(VendLedger."Remaining Amt. (LCY)");
                                    if Amount = 0 then begin
                                        if "Currency Code" = '' then begin
                                            Amount := Abs(VendLedger."Remaining Amt. (LCY)");
                                        end else begin
                                            Amount := Abs(VendLedger."Remaining Amount");
                                        end;
                                    end;

                                    Validate(Amount);
                                    "Applies to Doc. No" := VendLedger."Document No.";
                                    //"External Document No.":=VendLedger."External Document No.";
                                    "Dimension Set ID" := VendLedger."Dimension Set ID";//added 13/02/2017
                                    Validate("Dimension Set ID");
                                    //MESSAGE('%1',"Dimension Set ID");

                                    //Insert VAT where applicable
                                    /*
                                   VATEntry.RESET;
                                   VATEntry.SETRANGE("Transaction No.",VendLedger."Transaction No.");
                                    IF VATEntry.FIND('-') THEN
                                      "VAT Code":=VATEntry."VAT Prod. Posting Group";
                                   //
                                   */
                                end;
                            end;
                            //"Total Amount":=ABS(VendLedger."Remaining Amount");
                            if "Currency Code" = '' then begin
                                Amount := Abs(VendLedger."Remaining Amt. (LCY)");
                            end else begin
                                Amount := Abs(VendLedger."Remaining Amount");
                            end;
                            //Insert VAT where applicable
                            /*
                           VATEntry.RESET;
                           VATEntry.SETRANGE("Transaction No.",VendLedger."Transaction No.");
                            IF VATEntry.FIND('-') THEN
                              "VAT Code":=VATEntry."VAT Prod. Posting Group";
                           //
                           */
                            Validate(Amount);
                        end;
                end;
                //end Machira

                case "Account Type" of
                    "account type"::Employee:
                        begin
                            CSetups.Get;
                            Employee.Reset;
                            Employee.SetRange(Employee."No.", "Account No");
                            if Employee.FindFirst then begin
                                EmployeePGroups.Reset;
                                EmployeePGroups.SetRange(EmployeePGroups."Posting Group", Employee."Employee Posting Group");
                                if EmployeePGroups.FindFirst then begin
                                    "Vote Item" := EmployeePGroups."Vote Item";
                                    Validate("Vote Item");
                                end;
                            end;
                        end;
                end;

            end;

            trigger OnValidate()
            begin
                Validate(Amount);
            end;
        }
        field(15; "VAT Code"; Code[20])
        {
            TableRelation = "Tariff Codes1".Code where(Type = const(VAT));

            trigger OnValidate()
            begin
                //VALIDATE(Amount);
                CalculateTax();
            end;
        }
        field(16; "W/Tax Code"; Code[20])
        {
            TableRelation = if ("Account Type" = const(Vendor)) "Tariff Codes1".Code where(Type = const("W/Tax"));

            trigger OnValidate()
            begin
                //VALIDATE(Amount);


                CalculateTax();
            end;
        }
        field(17; "Retention Code1"; Code[20])
        {
            TableRelation = "VAT Product Posting Group";

            trigger OnValidate()
            begin

                CalculateTax();
            end;
        }
        field(18; "VAT Amount"; Decimal)
        {
        }
        field(19; "W/Tax Amount"; Decimal)
        {
            DecimalPlaces = 0 : 2;
        }
        field(20; "Retention Amount1"; Decimal)
        {

            trigger OnValidate()
            begin
                //VALIDATE(Amount)

                // VALIDATE("Net Amount");
            end;
        }
        field(21; "Net Amount"; Decimal)
        {
            DecimalPlaces = 5 : 5;

            trigger OnValidate()
            begin
                "Net Amount" := ROUND(Amount - "W/Tax Amount" - "VAT Withheld Amount" - "Retention  Amount" - "Advance Recovery", 0.1, '=');
                //"Net Amount":=(Amount-"W/Tax Amount"-"VAT Withheld Amount"-"Retention  Amount"-"Advance Recovery");
                "Remaining Amount" := "Net Amount";
                "Amount Paid" := 0.0;
            end;
        }
        field(22; "W/T VAT Code"; Code[20])
        {
            TableRelation = if ("Account Type" = const(Vendor)) "Tariff Codes1".Code where(Type = const("W/Tax"));

            trigger OnValidate()
            begin
                //VALIDATE(Amount);
            end;
        }
        field(23; "W/T VAT Amount"; Decimal)
        {
        }
        field(24; Type; Code[20])
        {
            NotBlank = true;
            TableRelation = "Receipts and Payment Types1".Code where(Type = filter(Payment));

            trigger OnValidate()
            var
                TarrifCode: Record "Tariff Codes1";
            begin
                "Account No" := '';
                "Account Name" := '';
                //Remarks:='';
                RecPayTypes.Reset;
                RecPayTypes.SetRange(RecPayTypes.Code, Type);
                RecPayTypes.SetRange(RecPayTypes.Type, RecPayTypes.Type::Payment);

                if RecPayTypes.Find('-') then begin
                    Grouping := RecPayTypes."Default Grouping";
                    //    "Require Surrender":=RecPayTypes."Pending Voucher";
                    //    "Payment Reference":=RecPayTypes."Payment Reference";
                    "Budgetary Control A/C" := RecPayTypes."Direct Expense";

                    if RecPayTypes."VAT Chargeable" = RecPayTypes."vat chargeable"::Yes then begin
                        "VAT Code" := RecPayTypes."VAT Code";
                        if TarrifCode.Get("VAT Code") then
                            "VAT Rate" := TarrifCode.Percentage;
                    end;
                    if RecPayTypes."Withholding Tax Chargeable" = RecPayTypes."withholding tax chargeable"::Yes then begin
                        "W/Tax Code" := RecPayTypes."Withholding Tax Code";
                        if TarrifCode.Get("W/Tax Code") then
                            "W/Tax Rate" := TarrifCode.Percentage;

                    end;

                    ////
                    if RecPayTypes."VAT Chargeable" = RecPayTypes."vat chargeable"::Yes then begin
                        "VAT Withheld Code" := RecPayTypes."VAT Withheld Code";
                        if TarrifCode.Get("VAT Withheld Code") then
                            "VAT Six % Rate" := TarrifCode.Percentage;
                    end;

                    ////


                    if RecPayTypes."Calculate Retention" = RecPayTypes."calculate retention"::Yes then begin
                        "Retention Code" := RecPayTypes."Retention Code";
                        if TarrifCode.Get("Retention Code") then
                            "Retention Rate" := TarrifCode.Percentage;

                    end;

                end;

                if RecPayTypes.Find('-') then begin
                    "Account Type" := RecPayTypes."Account Type";
                    Validate("Account Type");
                    "Transaction Name" := RecPayTypes.Description;
                    "Budgetary Control A/C" := RecPayTypes."Direct Expense";
                    if RecPayTypes."Account Type" = RecPayTypes."account type"::"G/L Account" then begin
                        RecPayTypes.TestField(RecPayTypes."G/L Account");
                        "Account No" := RecPayTypes."G/L Account";
                        Validate("Account No");
                    end;

                    //Banks
                    if RecPayTypes."Account Type" = RecPayTypes."account type"::"Bank Account" then begin
                        //"Account No":=RecPayTypes."Bank Account";
                        Validate("Account No");
                    end;

                    if RecPayTypes."Account Type" = RecPayTypes."account type"::Customer then begin
                        "Account No" := RecPayTypes."Account no";
                        Validate("Account No");
                    end;
                end;
                PHead.Reset;
                PHead.SetRange(PHead."No.", No);
                if PHead.FindFirst then begin
                    Date := PHead.Date;
                    //  PHead.TESTFIELD("Responsibility Center");
                    /*
                    "Shortcut Dimension 1 Code":=PHead."Shortcut Dimension 1 Code";
                     VALIDATE("Shortcut Dimension 1 Code");
                    "Shortcut Dimension 2 Code":=PHead."Shortcut Dimension 2 Code";
                    VALIDATE("Shortcut Dimension 2 Code");
                    */
                    "Dimension Set ID" := PHead."Dimension Set ID";
                    //currency "Currency Code":=PHead."Currency Code";
                    //"Currency Factor":=PHead."Currency Factor";
                    "Payment Type" := PHead."Payment Type";
                end;


                if TransType.Get(Type) then begin
                    "Account Type" := TransType."Account Type";
                    "Account No" := TransType."G/L Account";
                    Validate("Account No");
                    "Account Name" := TransType."Transation Remarks";
                end;
                Validate(Amount);

            end;
        }
        field(25; "Transaction Name"; Text[100])
        {
        }
        field(37; Grouping; Code[20])
        {
            TableRelation = "Vendor Posting Group".Code;
        }
        field(38; "Payment Type"; Option)
        {
            CalcFormula = lookup(Payments."Payment Type" where("No." = field(No)));
            FieldClass = FlowField;
            OptionCaption = 'Payment Voucher,Imprest,Staff Claim,Imprest Surrender,Petty Cash,Bank Transfer,Petty Cash Surrender,Surrender';
            OptionMembers = "Payment Voucher",Imprest,"Staff Claim","Imprest Surrender","Petty Cash","Bank Transfer","Petty Cash Surrender",Surrender;
        }
        field(39; "Bank Type"; Option)
        {
            OptionMembers = Normal,"Petty Cash";
        }
        field(40; "PV Type"; Option)
        {
            OptionMembers = Normal,Other;
        }
        field(73; "VAT Rate"; Decimal)
        {

            trigger OnValidate()
            begin
                /*"VAT Amount":=(Amount * 100);
                "VAT Amount":=Amount-("VAT Amount"/(100 + "VAT Rate"));*/

            end;
        }
        field(74; "Amount With VAT"; Decimal)
        {
        }
        field(79; "Budgetary Control A/C"; Boolean)
        {
        }
        field(83; Committed; Boolean)
        {
        }
        field(85; "NetAmount LCY"; Decimal)
        {
        }
        field(86; "Applies-to Doc. Type"; Option)
        {
            Caption = 'Applies-to Doc. Type';
            OptionCaption = ' ,Payment,Invoice,Credit Memo,Finance Charge Memo,Reminder,Refund';
            OptionMembers = " ",Payment,Invoice,"Credit Memo","Finance Charge Memo",Reminder,Refund;
        }
        field(87; "Applies-to Doc. No."; Code[20])
        {
            Caption = 'Applies-to Doc. No.';

            trigger OnLookup()
            var
                VendLedgEntry: Record "Vendor Ledger Entry";
                ApplyVendEntries: Page "Apply Vendor Entries";
                PayToVendorNo: Code[20];
                OK: Boolean;
                Text000: label 'You must specify %1 or %2.';
            begin
                //CODEUNIT.RUN(CODEUNIT::"Payment Voucher Apply",Rec);
                /*
                IF (Rec."Account Type"<>Rec."Account Type"::Customer) AND (Rec."Account Type"<>Rec."Account Type"::Vendor) THEN
                    ERROR('You cannot apply to %1',"Account Type");
                
                WITH Rec DO BEGIN
                  Amount:=0;
                  VALIDATE(Amount);
                  PayToVendorNo := "Account No." ;
                  VendLedgEntry.SETCURRENTKEY("Vendor No.",Open);
                  VendLedgEntry.SETRANGE("Vendor No.",PayToVendorNo);
                  VendLedgEntry.SETRANGE(Open,TRUE);
                  IF "Applies-to ID" = '' THEN
                    "Applies-to ID" := No;
                  IF "Applies-to ID" = '' THEN
                    ERROR(
                      Text000,
                      FIELDCAPTION(No),FIELDCAPTION("Applies-to ID"));
                  //ApplyVendEntries."SetPVLine-Delete"(PVLine,PVLine.FIELDNO("Applies-to ID"));
                  ApplyVendEntries.SetPVLine(Rec,VendLedgEntry,Rec.FIELDNO("Applies-to ID"));
                  ApplyVendEntries.SETRECORD(VendLedgEntry);
                  ApplyVendEntries.SETTABLEVIEW(VendLedgEntry);
                  ApplyVendEntries.LOOKUPMODE(TRUE);
                  OK := ApplyVendEntries.RUNMODAL = ACTION::LookupOK;
                  CLEAR(ApplyVendEntries);
                  IF NOT OK THEN
                    EXIT;
                  VendLedgEntry.RESET;
                  VendLedgEntry.SETCURRENTKEY("Vendor No.",Open);
                  VendLedgEntry.SETRANGE("Vendor No.",PayToVendorNo);
                  VendLedgEntry.SETRANGE(Open,TRUE);
                  VendLedgEntry.SETRANGE("Applies-to ID","Applies-to ID");
                  IF VendLedgEntry.FIND('-') THEN BEGIN
                    "Applies-to Doc. Type" := 0;
                    "Applies-to Doc. No." := '';
                  END ELSE
                    "Applies-to ID" := '';
                END;
                
                //Calculate  Total To Apply
                  VendLedgEntry.RESET;
                  VendLedgEntry.SETCURRENTKEY("Vendor No.",Open,"Applies-to ID");
                  VendLedgEntry.SETRANGE("Vendor No.",PayToVendorNo);
                  VendLedgEntry.SETRANGE(Open,TRUE);
                  VendLedgEntry.SETRANGE("Applies-to ID","Applies-to ID");
                  IF VendLedgEntry.FIND('-') THEN BEGIN
                        VendLedgEntry.CALCSUMS("Amount to Apply");
                        Amount:=ABS(VendLedgEntry."Amount to Apply");
                        VALIDATE(Amount);
                  END;
                
                */

            end;

            trigger OnValidate()
            begin
                Validate(Amount);
            end;
        }
        field(88; "Applies-to ID"; Code[20])
        {
            Caption = 'Applies-to ID';

            trigger OnValidate()
            var
                TempVendLedgEntry: Record "Vendor Ledger Entry";
            begin
                /*
                //IF "Applies-to ID" <> '' THEN
                //  TESTFIELD("Bal. Account No.",'');
                IF ("Applies-to ID" <> xRec."Applies-to ID") AND (xRec."Applies-to ID" <> '') THEN BEGIN
                  VendLedgEntry.SETCURRENTKEY("Vendor No.",Open);
                  VendLedgEntry.SETRANGE("Vendor No.","Account No.");
                  VendLedgEntry.SETRANGE(Open,TRUE);
                  VendLedgEntry.SETRANGE("Applies-to ID",xRec."Applies-to ID");
                  IF VendLedgEntry.FINDFIRST THEN
                    VendEntrySetApplID.SetApplId(VendLedgEntry,TempVendLedgEntry,0,0,'');
                  VendLedgEntry.RESET;
                END;
                */

            end;
        }
        field(90; "Retention Code"; Code[20])
        {
            TableRelation = "Tariff Codes1".Code where(Type = const(Retention));

            trigger OnValidate()
            begin
                //CalculateTax();
            end;
        }
        field(91; "Retention  Amount"; Decimal)
        {

            trigger OnValidate()
            begin
                "Net Amount" := Amount - "W/Tax Amount" - "VAT Withheld Amount" - "Retention  Amount" - "Advance Recovery";
            end;
        }
        field(92; "Retention Rate"; Decimal)
        {
        }
        field(93; "W/Tax Rate"; Decimal)
        {
        }
        field(95; "Currency Code"; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = Currency.Code;

            trigger OnValidate()
            begin
                //IF NOT (CurrFieldNo IN [0,FIELDNO("Posting Date")]) OR ("Currency Code" <> xRec."Currency Code") THEN
                //TestStatusOpen;
                /*IF (CurrFieldNo <> FIELDNO("Currency Code")) AND ("Currency Code" = xRec."Currency Code") THEN
                  UpdateCurrencyFactor
                ELSE
                  IF "Currency Code" <> xRec."Currency Code" THEN
                    UpdateCurrencyFactor
                  ELSE
                    IF "Currency Code" <> '' THEN BEGIN
                      UpdateCurrencyFactor;
                      IF "Currency Factor" <> xRec."Currency Factor" THEN
                        ConfirmUpdateCurrencyFactor;
                    END;*/

            end;
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
        }
        field(50000; "Gl Balance"; Decimal)
        {
            FieldClass = Normal;
        }
        field(50003; "VAT Withheld Amount"; Decimal)
        {

            trigger OnValidate()
            begin
                //"VAT Withheld Amount":="VAT Amount"*0.06;
            end;
        }
        field(50004; "VAT Withheld Code"; Code[20])
        {
            TableRelation = "Tariff Codes1".Code where(Type = const(VAT));
        }
        field(50005; "VAT Six % Rate"; Decimal)
        {
        }
        field(50006; "Advance Recovery"; Decimal)
        {

            trigger OnValidate()
            begin
                "Net Amount" := Amount - "W/Tax Amount" - "VAT Withheld Amount" - "Retention  Amount" - "Advance Recovery";
            end;
        }
        field(50007; "Total Net Pay"; Decimal)
        {
        }
        field(50008; "Job Task No."; Code[20])
        {
            TableRelation = "Job Task"."Job Task No." where("Job No." = field("Shortcut Dimension 2 Code"));
        }
        field(50009; "Project Description"; Text[250])
        {
            CalcFormula = lookup(Job.Description where("No." = field("Shortcut Dimension 2 Code")));
            FieldClass = FlowField;
        }
        field(50010; "Claim Doc No."; Code[20])
        {
            TableRelation = Payments."No." where("Payment Type" = filter("Staff Claim"),
                                                  "Account No." = field("Account No"),
                                                  Status = const(Released),
                                                  Posted = const(TRUE));

            trigger OnValidate()
            begin
                sclaims.Reset;
                sclaims.SetRange(sclaims."No.", "Claim Doc No.");
                if sclaims.FindFirst then
                    sclaims.CalcFields(sclaims."Total Amount");
                Amount := sclaims."Total Amount";
                Validate(Amount);
                sclaims."Used Claim" := true;
                sclaims.Modify;
            end;
        }
        field(50011; "Amount Paid"; Decimal)
        {
            Description = 'Fields Added By David To cater for part payment of the Payment Vouchers';

            trigger OnValidate()
            begin
                TestField(Status, Status::Released);
                if "Amount Paid" > "Net Amount" then
                    Error(Text001, No);
                if "Remaining Amount" = 0 then begin
                    "Remaining Amount" := "Net Amount" - "Amount Paid";
                end
                else begin
                    "Remaining Amount" := "Remaining Amount" - "Amount Paid";
                    if "Remaining Amount" < 0 then
                        Error(Text002, No);
                end;
            end;
        }
        field(50012; "Remaining Amount"; Decimal)
        {
        }
        field(50013; "Part Payment"; Boolean)
        {
        }
        field(50014; Status; Option)
        {
            CalcFormula = lookup(Payments.Status where("No." = field(No)));
            FieldClass = FlowField;
            OptionCaption = 'Open,Pending Approval,Pending Prepayment,Released,Rejected,,Closed';
            OptionMembers = Open,"Pending Approval","Pending Prepayment",Released,Rejected,,Closed;
        }
        field(50015; "Date Paid"; Date)
        {
            Description = 'End of Field Added';
        }
        field(50016; "No. Posted"; Integer)
        {
        }
        field(50017; "Paying Bank Account"; Code[20])
        {
            TableRelation = "Bank Account";
        }
        field(50018; "Bank Name"; Code[20])
        {
            CalcFormula = lookup("Bank Account".Name where("No." = field("Paying Bank Account")));
            Editable = false;
            FieldClass = FlowField;
        }
        field(50019; "Document Type"; Option)
        {
            CalcFormula = lookup(Payments."Document Type" where("No." = field(No)));
            FieldClass = FlowField;
            OptionCaption = 'Payment Voucher,Petty Cash,Imprest,Imprest Surrender,Bank Transfer,Surrender';
            OptionMembers = "Payment Voucher","Petty Cash",Imprest,"Imprest Surrender","Bank Transfer",Surrender;
        }
        field(50020; "Vote Item"; Code[20])
        {
            TableRelation = "G/L Account"."No.";

            trigger OnValidate()
            begin
                //Get Committed Amount
                CSetups.Get();
                case "Account Type" of
                    "account type"::Employee:
                        begin
                            Commitments := 0;
                            bcommitments.Reset;
                            bcommitments.SetRange("Account No.", "Vote Item");
                            bcommitments.SetRange("Budget Name", CSetups."Current Budget");
                            bcommitments.SetRange("Budget Start Date", CSetups."Current Budget Start Date");
                            if bcommitments.FindSet then begin
                                bcommitments.CalcFields("Commited Amount Orders", "Commited Amount PRN", "Commited Amount Imprest");
                                Commitments := (bcommitments."Commited Amount Orders" + bcommitments."Commited Amount PRN" + bcommitments."Commited Amount Imprest" + bcommitments."Committment Amount" + Amount);

                            end;
                            //MESSAGE('Commitements %1',FORMAT(Commitments));

                            //Get The Vote Amount

                            CSetups.Get();
                            VoteAmount := 0;
                            GLBudgetEntry.Reset;
                            GLBudgetEntry.SetRange(GLBudgetEntry."G/L Account No.", "Vote Item");
                            GLBudgetEntry.SetRange(GLBudgetEntry."Budget Name", CSetups."Current Budget");
                            GLBudgetEntry.SetFilter(GLBudgetEntry."Date Filter", '%1..%2', CSetups."Current Budget Start Date", CSetups."Current Budget End Date");
                            if GLBudgetEntry.FindSet then begin
                                repeat
                                    VoteAmount += Abs(GLBudgetEntry.Amount);
                                until GLBudgetEntry.Next = 0;
                                "Vote Amount" := VoteAmount;
                                "Vote Amount." := VoteAmount;
                                // MESSAGE('Vote Amount %1',VoteAmount);
                            end;



                            actualAmount := 0;
                            cSetup.Get;
                            gEntry.Reset;
                            gEntry.SetRange(gEntry."G/L Account No.", "Vote Item");
                            gEntry.SetFilter(gEntry."Posting Date", '%1..%2', CashMgt."Current Budget Start Date", CashMgt."Current Budget End Date");
                            if gEntry.FindSet then begin
                                repeat
                                    actualAmount := actualAmount + Abs(gEntry.Amount);
                                until gEntry.Next = 0;
                                //MESSAGE('Actual Amount %1',FORMAT(actualAmount));

                            end;


                        end;
                end;
                //"Vote Amount":=VoteAmount;
                //"Vote Amount.":=VoteAmount;
                "Actual to Date" := actualAmount;
                Commitments := Commitments + Amount;
                "Available Funds" := "Vote Amount" - Abs("Actual to Date");


                VendorLedgerEntry.Reset;
                VendorLedgerEntry.SetRange("Document No.", "Applies to Doc. No");
                VendorLedgerEntry.SetRange("Vendor No.", "Account No");
                if VendorLedgerEntry.FindSet then begin
                    if VendorLedgerEntry."Document Type" = VendorLedgerEntry."document type"::Invoice then begin
                        pInvoice.SetRange("Document No.", "Applies to Doc. No");
                        pInvoice.SetRange("Buy-from Vendor No.", "Account No");
                        if pInvoice.FindSet then begin
                            if pInvoice.Type = pInvoice.Type::"G/L Account" then begin
                                // "Vote Item":=pInvoice."No.";
                                bcommitments.SetRange("Account No.", "Vote Item");
                                if bcommitments.FindSet then begin
                                    bcommitments.CalcFields("Commited Amount Orders", "Commited Amount PRN", "Commited Amount Imprest");
                                    Commitments := (bcommitments."Commited Amount Orders" + bcommitments."Commited Amount PRN" + bcommitments."Commited Amount Imprest");
                                    //MESSAGE('%1',Commitments)
                                    //"Vote Amount":=bcommitments."Budgeted Amount";

                                end;
                                if CSetups.Get() then begin
                                    GLBudgetEntry.Reset;
                                    GLBudgetEntry.SetRange("G/L Account No.", "Vote Item");
                                    GLBudgetEntry.SetRange("Budget Name", CSetups."Current Budget");
                                    GLBudgetEntry.CalcSums(GLBudgetEntry.Amount);
                                    "Vote Amount." := GLBudgetEntry.Amount;

                                    "Vote Amount" := GLBudgetEntry.Amount;
                                end;
                                //2.0 Get Actual Amounts from g/l entries
                                gEntry.Reset;
                                actualAmount := 0;
                                cSetup.Get;
                                gEntry.SetRange("G/L Account No.", "Vote Item");
                                gEntry.SetFilter(gEntry."Posting Date", '%1..%2', CashMgt."Current Budget Start Date", CashMgt."Current Budget End Date");
                                if gEntry.FindSet then begin
                                    repeat
                                        actualAmount := actualAmount + Abs(gEntry.Amount);
                                    until gEntry.Next = 0;
                                end;
                                "Actual to Date" := actualAmount;
                                Commitments := Commitments + Amount;
                                //"Available Funds":="Vote Amount"-actualAmount-Commitments;
                                //Testing
                                "Available Funds" := "Vote Amount" - "Actual to Date";

                            end
                            else
                                if pInvoice.Type = pInvoice.Type::Item then begin
                                    if Item.Get("Vote Item") then begin
                                        GeneralPostingSetup.Reset;
                                        GeneralPostingSetup.SetRange("Gen. Prod. Posting Group", Item."Gen. Prod. Posting Group");
                                        if GeneralPostingSetup.FindFirst then begin
                                            //"Vote Item":=GeneralPostingSetup."Purch. Account";
                                            if CSetups.Get() then begin
                                                GLBudgetEntry.Reset;
                                                GLBudgetEntry.SetRange("G/L Account No.", "Vote Item");
                                                GLBudgetEntry.SetRange("Budget Name", CSetups."Current Budget");
                                                GLBudgetEntry.CalcSums(GLBudgetEntry.Amount);
                                                "Vote Amount." := GLBudgetEntry.Amount;
                                                "Vote Amount" := GLBudgetEntry.Amount;
                                                // MESSAGE('%1',"Vote Amount.")
                                            end;
                                        end;
                                    end;
                                    /*
                                    IF Vendor.GET(VendorLedgerEntry."Vendor No.") THEN BEGIN
                                      IF VendorPGroup.GET(Vendor."Vendor Posting Group") THEN BEGIN
                                        // "Vote Item" := VendorPGroup."Payables Account";
                                            IF CSetups.GET() THEN BEGIN
                                              GLBudgetEntry.RESET;
                                              GLBudgetEntry.SETRANGE("G/L Account No.","Vote Item");
                                              GLBudgetEntry.SETRANGE("Budget Name",CSetups."Current Budget");
                                              GLBudgetEntry.CALCSUMS(GLBudgetEntry.Amount);
                                              "Vote Amount." := GLBudgetEntry.Amount;
                                              "Vote Amount" := GLBudgetEntry.Amount;
                                              MESSAGE('%1',"Vote Amount.")
                                            END;
                                      END;
                                    END;
                                    */
                                    bcommitments.SetRange("Account No.", "Vote Item");
                                    if bcommitments.FindSet then begin
                                        bcommitments.CalcFields("Commited Amount Orders", "Commited Amount PRN", "Commited Amount Imprest");
                                        Commitments := (bcommitments."Commited Amount Orders" + bcommitments."Commited Amount PRN" + bcommitments."Commited Amount Imprest");

                                    end;

                                    //2.0 Get Actual Amounts from g/l entries
                                    gEntry.Reset;
                                    actualAmount := 0;
                                    cSetup.Get;
                                    gEntry.SetRange("G/L Account No.", "Vote Item");
                                    gEntry.SetFilter(gEntry."Posting Date", '%1..%2', CashMgt."Current Budget Start Date", CashMgt."Current Budget End Date");
                                    if gEntry.FindSet then begin
                                        repeat
                                            actualAmount := actualAmount + Abs(gEntry.Amount);
                                        until gEntry.Next = 0;
                                    end;
                                    "Actual to Date" := actualAmount;
                                    Commitments := Commitments + Amount;
                                    // "Available Funds":="Vote Amount"-actualAmount-Commitments;
                                    "Available Funds" := "Vote Amount" - "Actual to Date";

                                end
                                else if pInvoice.Type = pInvoice.Type::"Fixed Asset" then begin
                                    FixedAsset.Get(pInvoice."No.");
                                    FixedAsset.Reset;
                                    FixedAsset.SetRange("No.", "Vote Item");
                                    if FixedAsset.FindSet then begin
                                        FixedAsset.CalcFields(FixedAsset."Vote Item");
                                        //"Vote Item":=FixedAsset."Vote Item";
                                    end;

                                    bcommitments.SetRange("Account No.", "Vote Item");
                                    if bcommitments.FindSet then begin
                                        bcommitments.CalcFields("Commited Amount Orders", "Commited Amount PRN", "Commited Amount Imprest");
                                        Commitments := (bcommitments."Commited Amount Orders" + bcommitments."Commited Amount PRN" + bcommitments."Commited Amount Imprest");
                                        //MESSAGE('%1',Commitments)
                                    end;
                                    if CSetups.Get() then begin
                                        GLBudgetEntry.Reset;
                                        GLBudgetEntry.SetRange("G/L Account No.", "Vote Item");
                                        GLBudgetEntry.SetRange("Budget Name", CSetups."Current Budget");
                                        GLBudgetEntry.CalcSums(GLBudgetEntry.Amount);
                                        "Vote Amount." := GLBudgetEntry.Amount;
                                        "Vote Amount" := GLBudgetEntry.Amount;
                                    end;
                                    //2.0 Get Actual Amounts from g/l entries
                                    //actualAmount:=0;

                                    gEntry.Reset;
                                    actualAmount := 0;
                                    cSetup.Get;
                                    gEntry.SetRange("G/L Account No.", FixedAsset."Vote Item");
                                    gEntry.SetFilter(gEntry."Posting Date", '%1..%2', cSetup."Leave Posting Period[FROM]", cSetup."Leave Posting Period[TO]");
                                    if gEntry.FindSet then begin
                                        repeat
                                            actualAmount := actualAmount + Abs(gEntry.Amount);
                                            Message('%1', actualAmount);
                                        until gEntry.Next = 0;
                                    end;
                                    "Actual to Date" := actualAmount;
                                    Commitments := Commitments + Amount;
                                    // "Available Funds":="Vote Amount"-actualAmount-Commitments;
                                    "Available Funds" := "Vote Amount" - "Actual to Date";
                                end;
                        end;
                    end else if VendorLedgerEntry."Document Type" = VendorLedgerEntry."document type"::" " then begin
                        //Add Budget information -KLM
                        if Vendor.Get(VendorLedgerEntry."Vendor No.") then begin
                            if VendorPGroup.Get(Vendor."Vendor Posting Group") then begin

                                bcommitments.SetRange("Account No.", VendorPGroup."Payables Account");
                                if bcommitments.FindSet then begin

                                    bcommitments.CalcFields("Commited Amount Orders", "Commited Amount PRN", "Commited Amount Imprest");
                                    Commitments := (bcommitments."Commited Amount Orders" + bcommitments."Commited Amount PRN" + bcommitments."Commited Amount Imprest");
                                    //MESSAGE('%1',Commitments)
                                end;
                                if CSetups.Get() then begin
                                    GLBudgetEntry.Reset;
                                    GLBudgetEntry.SetRange("G/L Account No.", "Vote Item");
                                    GLBudgetEntry.SetRange("Budget Name", CSetups."Current Budget");
                                    GLBudgetEntry.CalcSums(GLBudgetEntry.Amount);
                                    "Vote Amount." := GLBudgetEntry.Amount;

                                end;
                                //2.0 Get Actual Amounts from g/l entries
                                gEntry.Reset;
                                actualAmount := 0;
                                cSetup.Get;
                                gEntry.SetRange("G/L Account No.", VendorPGroup."Payables Account");
                                gEntry.SetFilter(gEntry."Posting Date", '%1..%2', CashMgt."Current Budget Start Date", CashMgt."Current Budget End Date");
                                if gEntry.FindSet then begin
                                    repeat
                                        actualAmount := actualAmount + Abs(gEntry.Amount);
                                    until gEntry.Next = 0;
                                end;
                                "Actual to Date" := actualAmount;
                                Commitments := Commitments + Amount;
                                // "Available Funds":="Vote Amount"-actualAmount-Commitments;
                                "Available Funds" := "Vote Amount" - "Actual to Date";
                            end;
                        end;
                    end;
                end;

                //Get Committed Amount
                //bcommitments.RESET;
                /*Commitments:=0;
                bcommitments.SETRANGE("Account No.","Vote Item");
                IF bcommitments.FINDSET THEN
                BEGIN
                bcommitments.CALCFIELDS("Commited Amount Orders","Commited Amount PRN","Commited Amount Imprest");
                Commitments:=(bcommitments."Commited Amount Orders"+bcommitments."Commited Amount PRN"+bcommitments."Commited Amount Imprest"+bcommitments."Committment Amount"+Amount);
                END;
                MESSAGE('Commitements %1',FORMAT(Commitments));
                
                //Get The Vote Amount
                
                  CSetups.GET();
                 "Vote Amount":=0;
                  GLBudgetEntry.RESET;
                  GLBudgetEntry.SETCURRENTKEY("G/L Account No.","Budget Name");
                  GLBudgetEntry.SETRANGE("G/L Account No.","Vote Item");
                  GLBudgetEntry.SETRANGE("Budget Name",CSetups."Current Budget");
                  GLBudgetEntry.CALCSUMS(GLBudgetEntry.Amount);
                  "Vote Amount." := GLBudgetEntry.Amount;
                  MODIFY();
                  MESSAGE('Vote Amount %1',FORMAT("Vote Amount"));
                
                
                
                  actualAmount:=0;
                  cSetup.GET;
                  gEntry.RESET;
                  gEntry.SETRANGE("G/L Account No.","Vote Item");
                  gEntry.SETFILTER(gEntry."Posting Date",'%1..%2',CashMgt."Current Budget Start Date",CashMgt."Current Budget End Date");
                  IF gEntry.FINDSET THEN
                  BEGIN
                    REPEAT
                      actualAmount:=actualAmount+ABS(gEntry.Amount);
                    UNTIL gEntry.NEXT=0;
                    MESSAGE('Actual Amount %1',FORMAT(actualAmount));
                  END;
                  MESSAGE('Actual Amount %1',FORMAT(actualAmount));
                  "Actual to Date":=actualAmount;
                  Commitments := Commitments + Amount;
                  // "Available Funds":="Vote Amount"-actualAmount-Commitments;
                  "Available Funds":="Vote Amount"-ABS("Actual to Date");
                  MODIFY();*/

            end;
        }
        field(50021; "Vote Amount"; Decimal)
        {
            Editable = false;
            FieldClass = Normal;
        }
        field(50022; "Actual to Date"; Decimal)
        {
            Editable = false;
        }
        field(50023; Commitments; Decimal)
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(50024; "Vote Item Desc."; Text[200])
        {
            CalcFormula = lookup("G/L Account".Name where("No." = field("Vote Item")));
            Editable = false;
            FieldClass = FlowField;
        }
        field(50025; "Available Funds"; Decimal)
        {
            Editable = false;
        }
        field(50026; "Type of Expense"; Code[50])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Receipts and Payment Types1" where("Appear on Imprest?" = filter(true));

            trigger OnValidate()
            begin
                tExpense.Reset;
                tExpense.SetRange(Code, "Type of Expense");
                if tExpense.FindSet then begin
                    "Account Type" := "account type"::"G/L Account";
                    "Vote Item" := tExpense."G/L Account";
                    "Account No" := tExpense."G/L Account";
                    Validate("Account No");

                    gEntry.Reset;
                    actualAmount := 0;
                    cSetup.Get;
                    bcommitments.Reset;
                    gEntry.SetRange("G/L Account No.", tExpense."G/L Account");
                    gEntry.SetFilter(gEntry."Posting Date", '%1..%2', cSetup."Leave Posting Period[FROM]", cSetup."Leave Posting Period[TO]");
                    if gEntry.FindSet then begin
                        repeat
                            actualAmount := actualAmount + Abs(gEntry.Amount);
                        until gEntry.Next = 0;
                    end;

                    "Actual to Date" := actualAmount;

                    bcommitments.SetRange("Account No.", "Vote Item");
                    if bcommitments.FindSet then begin
                        "Vote Amount" := bcommitments."Budgeted Amount";
                        //"Vote Amount.":=bcommitments."Budgeted Amount";
                        bcommitments.CalcFields("Commited Amount Imprest", "Commited Amount Orders", "Commited Amount PRN");
                        Commitments := (bcommitments."Commited Amount Imprest" + bcommitments."Commited Amount Orders" + bcommitments."Commited Amount PRN");
                        "Available Funds" := "Vote Amount" - actualAmount - (bcommitments."Commited Amount Imprest" + bcommitments."Commited Amount Orders" + bcommitments."Commited Amount PRN");
                    end;
                end;
            end;
        }
        field(50027; "Reference No"; Code[50])
        {
            DataClassification = ToBeClassified;
        }
        field(50028; "Vote Amount."; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(50029; "Amount (LCY)"; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(50030; Amount1; Decimal)
        {
            CalcFormula = sum("PV Lines"."Amount (LCY)" where(No = field(No)));
            FieldClass = FlowField;
        }
        field(70036; "Proc. Levy 0.03% Amount"; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(70037; "Proc. Levy 0.03%  Code"; Code[10])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Tariff Codes1".Code;
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

    trigger OnInsert()
    begin
        /*PVHeader.RESET;
        PVHeader.SETRANGE(PVHeader."Payment Type","Standing Imprest Type");
          "Account Type":="Account Type"::"Bank Account";*/
        //IF PVHeader:=PVHeader."Payment Type":}


    end;

    var
        GLAccount: Record "G/L Account";
        Customer: Record Customer;
        Vendor: Record Vendor;
        Bank: Record "Bank Account";
        FixedAsset: Record "Fixed Asset";
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
        CSetups: Record "Cash Management Setup";
        Direction: Text[30];
        WTVATAmount: Decimal;
        VATSetup2: Record "VAT Posting Setup";
        VATEntry: Record "VAT Entry";
        DimMgt: Codeunit DimensionManagement;
        DimValue: Record "Dimension Value";
        RecPayTypes: Record "Receipts and Payment Types1";
        PHead: Record Payments;
        TransType: Record "Receipts and Payment Types1";
        sclaims: Record Payments;
        CashMgt: Record "Cash Management Setup";
        Text001: label 'Amount Paid For document No. %1 Cannot be more than The Net Amount. Kindly Check.';
        Text002: label 'Remaining Amount in document No. %1 Cannot be less than 0. Please verify that you have correctly specified the Amount paid.';
        PVHeader: Record Payments;
        pInvoice: Record "Purch. Inv. Line";
        bcommitments: Record "Budget Commitment";
        Item: Record Item;
        cSetup: Record "Human Resources Setup";
        gEntry: Record "G/L Entry";
        actualAmount: Decimal;
        tExpense: Record "Receipts and Payment Types1";
        fAsset: Record "Fixed Asset";
        PVLines: Record "PV Lines";
        VendorPGroup: Record "Vendor Posting Group";
        VendorLedgerEntry: Record "Vendor Ledger Entry";
        GLBudgetEntry: Record "G/L Budget Entry";
        GeneralPostingSetup: Record "General Posting Setup";
        Currency: Record Currency;
        CurrExchRate: Record "Currency Exchange Rate";
        EmployeePGroups: Record "Employee PGroups";
        Amnt: Decimal;
        CommitAmnt: Decimal;
        Employee: Record Employee;
        EmployeePostingGroupX: Record "Employee Posting GroupX";
        VoteAmount: Decimal;
        ProcLevyAmount: Decimal;

    procedure ValidateShortcutDimCode(FieldNumber: Integer; var ShortcutDimCode: Code[20])
    var
        OldDimSetID: Integer;
    begin


        OldDimSetID := "Dimension Set ID";
        DimMgt.ValidateShortcutDimValues(FieldNumber, ShortcutDimCode, "Dimension Set ID");
        if No <> '' then
            Modify;

        if OldDimSetID <> "Dimension Set ID" then begin
            Modify;
            //IF SalesLinesExist THEN
            //UpdateAllLineDim("Dimension Set ID",OldDimSetID);
        end;
    end;


    procedure GetCurrency()
    begin
    end;


    procedure ShowDimensions()
    begin
        /*
        "Dimension Set ID" :=
          DimMgt.EditDimensionSet("Dimension Set ID",STRSUBSTNO('%1 %2 %3',"Payment Type","No.","Line No."));
        //VerifyItemLineDim;
        DimMgt.UpdateGlobalDimFromDimSetID("Dimension Set ID","Shortcut Dimension 1 Code","Shortcut Dimension 2 Code");
        */

    end;


    procedure CalculateTax()
    var
        CalculationType: Option VAT,"W/Tax",Retention;
        TotalTax: Decimal;
        TaxCalc: Codeunit "Tax Calculation";
    begin
        "VAT Amount" := 0;
        "W/Tax Amount" := 0;
        "Retention  Amount" := 0;
        TotalTax := 0;
        "Net Amount" := 0;
        ProcLevyAmount := 0;
        if Amount <> 0 then begin
            if "VAT Rate" <> 0 then begin
                "VAT Amount" := ROUND(TaxCalc.CalculateTax(Rec, Calculationtype::VAT), 0.1, '=');
                //"VAT Amount":=(TaxCalc.CalculateTax(Rec,CalculationType::VAT));
                //TotalTax:=(TotalTax+"VAT Amount");//...commented to allow rounding-Fred
                TotalTax := ROUND(TotalTax + "VAT Amount", 0.1, '=');
            end;

            if "W/Tax Rate" <> 0 then begin
                "W/Tax Amount" := TaxCalc.CalculateTax(Rec, Calculationtype::"W/Tax");
                TotalTax := TotalTax + "W/Tax Amount"
            end;


            if "Retention Rate" <> 0 then begin
                "Retention  Amount" := TaxCalc.CalculateTax(Rec, Calculationtype::Retention);
                TotalTax := TotalTax + "Retention  Amount"
            end;
        end;


        "VAT Withheld Amount" := 0;
        if "VAT Six % Rate" <> 0 then begin
            //"VAT Withheld Amount":=(Amount-"VAT Amount")*("VAT Six % Rate")/100;
            "VAT Withheld Amount" := ROUND((Amount - "VAT Amount") * ("VAT Six % Rate") / 100, 0.1, '=');

            /// "VAT Withheld Amount":=0;

            /*IF Amount <>0 THEN BEGIN
            IF "VAT Rate"<>0 THEN BEGIN
             "VAT Withheld Amount":=(Amount-"VAT Amount")*0.06;
            END;
            END;*/
        end;

        // "Net Amount":= Amount-"W/Tax Amount"-"VAT Withheld Amount"-"Retention  Amount"-"Advance Recovery";
        // VALIDATE("Net Amount");
        "Net Amount" := ROUND(Amount - "W/Tax Amount" - "VAT Withheld Amount" - "Retention  Amount" - "Advance Recovery", 0.1, '=');
        Validate("Net Amount");

    end;

    local procedure GetPaymentHeader()
    begin
        TestField(No);
        PVHeader.Get(No);
        if PVHeader."Currency Code" = '' then
            Currency.InitRoundingPrecision
        else begin
            PVHeader.TestField("Currency Factor");
            Currency.Get(PVHeader."Currency Code");
            Currency.TestField("Amount Rounding Precision");
        end;


        OnAfterGetPaymentsHeader(Rec, PVHeader);
    end;

    local procedure OnAfterGetPaymentsHeader(PVLines: Record "PV Lines"; PaymentHeader: Record Payments)
    begin
    end;

    local procedure GetDate(): Date
    begin
        GetPaymentHeader;

        if PVHeader.Date <> 0D then
            exit(PVHeader.Date);
        exit(WorkDate);
    end;

    local procedure PaymentRounding(var Amount: Decimal) AmountRounding: Decimal
    var
        GeneralLedgerSetup: Record "General Ledger Setup";
    begin
        GeneralLedgerSetup.Get;
        if GeneralLedgerSetup."Amount Rounding Precision" = 0 then
            Error('You must specify the rounding precision under HR setup');

        if GeneralLedgerSetup."Inv. Rounding Type (LCY)" = GeneralLedgerSetup."inv. rounding type (lcy)"::Nearest then
            AmountRounding := ROUND(Amount, GeneralLedgerSetup."Amount Rounding Precision", '=');

        if GeneralLedgerSetup."Inv. Rounding Type (LCY)" = GeneralLedgerSetup."inv. rounding type (lcy)"::Up then
            AmountRounding := ROUND(Amount, GeneralLedgerSetup."Amount Rounding Precision", '>');

        if GeneralLedgerSetup."Inv. Rounding Type (LCY)" = GeneralLedgerSetup."inv. rounding type (lcy)"::Down then
            AmountRounding := ROUND(Amount, GeneralLedgerSetup."Amount Rounding Precision", '<');
        /*AmountRounding:=ROUND(Amount,1,'=');*/

    end;


    procedure FnGetVoteItem(): Code[20]
    var
        RPTypes: Record "Receipts and Payment Types1";
    begin
        RPTypes.Reset;
        RPTypes.SetRange(RPTypes.Code, "Type of Expense");
        if RPTypes.FindFirst then
            exit(RPTypes."G/L Account");
    end;
}
