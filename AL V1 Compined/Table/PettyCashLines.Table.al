#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Table 57002 "Petty Cash Lines"
{

    fields
    {
        field(1; No; Code[20])
        {
        }
        field(2; "Line No"; Integer)
        {
            AutoIncrement = true;
        }
        field(3; "Account Type"; Option)
        {
            OptionCaption = 'G/L Account,Customer,Vendor,Bank Account,Fixed Asset';
            OptionMembers = "G/L Account",Customer,Vendor,"Bank Account","Fixed Asset";
        }
        field(4; "Account No"; Code[20])
        {
            TableRelation = if ("Account Type" = const("G/L Account")) "G/L Account"
            else if ("Account Type" = const("Fixed Asset")) "Fixed Asset"
            else if ("Account Type" = const(Customer)) Customer
            else if ("Account Type" = const("Bank Account")) "Bank Account Ledger Entry"
            else if ("Account Type" = const(Vendor)) Vendor;

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
                            Vendor.Get("Account No");
                            "Account Name" := Vendor.Name;
                        end;
                    "account type"::Customer:
                        begin
                            Customer.Get("Account No");
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
                end;
                Validate(Amount);
            end;
        }
        field(5; "Account Name"; Text[70])
        {
        }
        field(6; Description; Text[150])
        {
        }
        field(7; Amount; Decimal)
        {

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
                PettyCashHeader: Record Payments;
                TotalCommittedAmount: Decimal;
            begin
                /*
                            //Confirm the Amount to be issued does not exceed the budget and amount Committed
                        //Get Budget for the G/L
                   IF GLAccount.GET("Account No") THEN
                    IF GLAccount."Check Budget" THEN BEGIN
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
                
                      PettyCashHeader.RESET;
                      PettyCashHeader.SETRANGE(PettyCashHeader."No.",No);
                      IF PettyCashHeader.FIND('-')THEN BEGIN
                       IF PettyCashHeader.Date=0D THEN
                        ERROR('Please insert the Petty Cash date');
                        CommitmentEntries.SETRANGE(CommitmentEntries."Commitment Date",GenLedSetup."Current Budget Start Date",
                                                  PettyCashHeader.Date);
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
                   END;
                */

            end;
        }
        field(8; "Global Dimension 1 Code"; Code[20])
        {
            CaptionClass = '1,1,1';
            TableRelation = "Dimension Value".Code where("Global Dimension No." = const(1));
        }
        field(9; "Global Dimension 2 Code"; Code[20])
        {
            CaptionClass = '1,1,2';
            TableRelation = "Dimension Value".Code where("Global Dimension No." = const(2));
        }
        field(10; Committed; Boolean)
        {
        }
        field(11; "Actual Spent"; Decimal)
        {

            trigger OnValidate()
            begin
                "Remaining Amount" := Amount - "Actual Spent" - "Cash Receipt Amount";
            end;
        }
        field(12; "Cash Receipt Amount"; Decimal)
        {

            trigger OnValidate()
            begin
                //VALIDATE("Actual Spent");
            end;
        }
        field(13; "Remaining Amount"; Decimal)
        {
        }
        field(14; "Receipt No."; Code[20])
        {
            TableRelation = "Receipts Header1" where("Fully Allocated" = const(false),
                                                      "Fully Allocated Imprest" = const(false),
                                                      Posted = const(true));

            trigger OnValidate()
            begin
                ReceiptRec.Reset;
                ReceiptRec.SetRange("No.", "Receipt No.");
                if ReceiptRec.FindFirst then
                    ReceiptRec.CalcFields(Amount);
                "Cash Receipt Amount" := ReceiptRec.Amount;
                "Fully Allocated" := true;
                //VALIDATE("Cash Receipt Amount");
            end;
        }
        field(15; "Fully Allocated"; Boolean)
        {
        }
        field(16; "Job Task No."; Code[20])
        {
        }
        field(17; "Job No."; Code[20])
        {
        }
        field(18; "Job Quantity"; Decimal)
        {
        }
        field(19; "Entry No"; Integer)
        {
            DataClassification = ToBeClassified;
        }
    }

    keys
    {
        key(Key1; No, "Line No", "Entry No")
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
        CustLedger: Record "Cust. Ledger Entry";
        CustLedger1: Record "Cust. Ledger Entry";
        ReceiptRec: Record "Receipts Header1";
}
