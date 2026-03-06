#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Table 56003 "Petty Cash Lines1"
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

            trigger OnLookup()
            begin

                case "Account Type" of
                    "account type"::"G/L Account":
                        begin
                            if Page.RunModal(18, GLAccount) = Action::LookupOK then begin
                                GLAccount.TestField(GLAccount."Direct Posting", true);
                                "Account No" := GLAccount."No.";
                                "Account Name" := GLAccount.Name;
                            end;
                        end;
                    "account type"::Customer:
                        begin
                            if Page.RunModal(22, Customer) = Action::LookupOK then begin
                                "Account No" := Customer."No.";
                                "Account Name" := Customer.Name;
                            end;
                        end;
                    "account type"::Vendor:
                        begin
                            if Page.RunModal(27, Vendor) = Action::LookupOK then begin
                                "Account No" := Vendor."No.";
                                "Account Name" := Vendor.Name;
                            end;
                        end;
                    "account type"::"Bank Account":
                        begin
                            if Page.RunModal(371, Bank) = Action::LookupOK then begin
                                "Account No" := Bank."No.";
                                "Account Name" := Bank.Name;
                            end;
                        end;
                    "account type"::"Fixed Asset":
                        begin
                            if Page.RunModal(5601, FixedAsset) = Action::LookupOK then begin
                                "Account No" := FixedAsset."No.";
                                "Account Name" := FixedAsset.Description;
                            end;
                        end;
                end;
            end;

            trigger OnValidate()
            begin
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
                Committments: Record "Commitment Entries";
                CommittedAmount: Decimal;
                CommitmentEntries: Record "Commitment Entries";
                PettyCashHeader: Record Payments1;
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
    }

    keys
    {
        key(Key1; No)
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
}
