#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Table 57022 "Imprest Voucher Lines"
{

    fields
    {
        field(1; No; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = Payments;
        }
        field(2; "Line No"; Integer)
        {
            AutoIncrement = true;
            DataClassification = ToBeClassified;
        }
        field(3; "Account Type"; Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = 'G/L Account,Customer,Vendor,Bank Account,Fixed Asset,IC Partner,Employee';
            OptionMembers = "G/L Account",Customer,Vendor,"Bank Account","Fixed Asset","IC Partner",Employee;
        }
        field(4; "Account No."; Code[20])
        {
            DataClassification = ToBeClassified;

            trigger OnValidate()
            begin

                case "Account Type" of
                    "account type"::Vendor:
                        begin
                            Vendor.Get("Account No.");
                            "Account Name" := Vendor.Name;
                        end;
                    "account type"::Customer:
                        begin
                            Customer.Get("Account No.");
                            "Account Name" := Customer.Name;
                        end;
                    "account type"::"G/L Account":
                        begin
                            GLAccount.Get("Account No.");
                            "Account Name" := GLAccount.Name;
                        end;
                    "account type"::"Bank Account":
                        begin
                            Bank.Get("Account No.");
                            "Account Name" := Bank.Name;
                        end;
                    "account type"::"Fixed Asset":
                        begin
                            FixedAsset.Get("Account No.");
                            "Account Name" := FixedAsset.Description;
                        end;
                    "account type"::Employee:
                        begin
                            Employee.Get("Account No.");
                            "Account Name" := Employee."First Name" + ' ' + Employee."Middle Name" + ' ' + Employee."Last Name";
                        end;
                end;
                Validate(Amount);
            end;
        }
        field(5; "Account Name"; Text[100])
        {
            DataClassification = ToBeClassified;
        }
        field(6; Description; Text[200])
        {
            DataClassification = ToBeClassified;
        }
        field(7; Amount; Decimal)
        {
            DataClassification = ToBeClassified;

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
                ImprestHeader: Record Payments;
                TotalCommittedAmount: Decimal;
            begin
                Amount := "Imprest Subsistence" + "Imprest Other Costs" + "Imprest Transport" + "Imprest Fuel" + "Imprest Casuals";
                //MESSAGE('%1',Amount);
            end;
        }
        field(8; "Applies- to Doc. No."; Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(9; "Global Dimension 1 Code"; Code[20])
        {
            CaptionClass = '1,1,1';
            DataClassification = ToBeClassified;
            TableRelation = "Dimension Value".Code where("Global Dimension No." = const(1));
        }
        field(10; "Global Dimension 2 Code"; Code[20])
        {
            CaptionClass = '1,1,2';
            DataClassification = ToBeClassified;
            TableRelation = "Dimension Value".Code where("Global Dimension No." = const(2));
        }
        field(11; "Actual Spent"; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(12; "Remaining Amount"; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(13; Committed; Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(14; "Advance Type"; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Receipts and Payment Types1" where("Appear on Imprest?" = filter(true));
        }
        field(15; "Currency Code"; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = Currency;
        }
        field(16; "Currency Factor"; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(17; "Amount LCY"; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(18; "Expense Type"; Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = 'Accountable Expenses,Non-Accountable Expenses';
            OptionMembers = "Accountable Expenses","Non-Accountable Expenses";
        }
        field(19; "Work Type"; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Work Type";
        }
        field(20; "Resource No."; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = Resource;
        }
        field(21; "Task No."; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Job Task"."Job Task No." where("Job Task Type" = const(Posting),
                                                             "Job No." = field(Project));
        }
        field(22; Project; Code[20])
        {
            CalcFormula = lookup(Payments.Project where("No." = field(No)));
            FieldClass = FlowField;
        }
        field(23; "Due Date"; Date)
        {
            DataClassification = ToBeClassified;
        }
        field(24; "Imprest Holder"; Code[20])
        {
            DataClassification = ToBeClassified;
            Editable = false;
            TableRelation = Customer."No.";
        }
        field(25; "Global Dimension 1 Name"; Code[20])
        {
            CalcFormula = lookup("Dimension Value".Name where(Code = field("Global Dimension 1 Code")));
            CaptionClass = '1,1,1';
            FieldClass = FlowField;
        }
        field(26; "Global Dimension 2 Name"; Code[20])
        {
            CalcFormula = lookup("Dimension Value".Name where(Code = field("Global Dimension 2 Code")));
            CaptionClass = '1,1,2';
            FieldClass = FlowField;
        }
        field(42; "Job No."; Code[20])
        {
            CalcFormula = lookup(Payments.Project where("Imprest Issue Doc. No" = field(No)));
            FieldClass = FlowField;
        }
        field(54; Purpose; Text[250])
        {
            DataClassification = ToBeClassified;
            NotBlank = true;
        }
        field(79; "Budgetary Control A/C"; Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(88; Destination; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = Destinations;
        }
        field(89; "Daily Rate"; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(90; "No. of Days"; Integer)
        {
            DataClassification = ToBeClassified;
        }
        field(91; Subsistence; Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(92; "Cash Receipt Amount"; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(93; "Receipt No."; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Receipts Header1" where("Fully Allocated Imprest" = const(false),
                                                      Posted = const(true),
                                                      "Fully Allocated" = const(false));
        }
        field(94; "Fully Allocated"; Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(1001; "Job Task No."; Code[20])
        {
            Caption = 'Job Task No.';
            DataClassification = ToBeClassified;
            TableRelation = "Job Task"."Job Task No." where("Job No." = field(Project));
        }
        field(1004; "Job Quantity"; Decimal)
        {
            AccessByPermission = TableData Job = R;
            Caption = 'Job Quantity';
            DataClassification = ToBeClassified;
            DecimalPlaces = 0 : 5;
        }
        field(50000; Status; Option)
        {
            CalcFormula = lookup(Payments.Status where("No." = field(No)));
            Editable = true;
            FieldClass = FlowField;
            OptionCaption = 'Open,Pending Approval,Pending Prepayment,Released,Rejected,,Closed';
            OptionMembers = Open,"Pending Approval","Pending Prepayment",Released,Rejected,Closed;
        }
        field(50001; "Job Task Description"; Text[250])
        {
            Caption = 'Job Task Description';
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(50002; "Payment Type"; Option)
        {
            CalcFormula = lookup(Payments."Payment Type" where("No." = field(No)));
            FieldClass = FlowField;
            OptionCaption = 'Payment Voucher,Imprest,Staff Claim,Imprest Surrender,Petty Cash,Bank Transfer,Petty Cash Surrender';
            OptionMembers = "Payment Voucher",Imprest,"Staff Claim","Imprest Surrender","Petty Cash","Bank Transfer","Petty Cash Surrender";
        }
        field(50003; "Imprest Subsistence"; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(50004; "Imprest Transport"; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(50005; "Imprest Other Costs"; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(50006; "Imprest Fuel"; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(50007; "Imprest Casuals"; Decimal)
        {
            DataClassification = ToBeClassified;
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
                                //MESSAGE('Vote Amount %1',VoteAmount);
                            end;



                            actualAmount := 0;
                            cSetup.Get;
                            gEntry.Reset;
                            gEntry.SetRange(gEntry."G/L Account No.", "Vote Item");
                            gEntry.SetFilter(gEntry."Posting Date", '%1..%2', cSetup."Current Budget Start Date", cSetup."Current Budget End Date");
                            if gEntry.FindSet then begin
                                repeat
                                    actualAmount := actualAmount + Abs(gEntry.Amount);
                                until gEntry.Next = 0;
                                //MESSAGE('Actual Amount %1',FORMAT(actualAmount));

                            end;


                        end;
                end;
                //"Vote Amount":=VoteAmount;
                "Actual to Date" := actualAmount;
                Commitments := Commitments + Amount;
                "Available Funds" := "Vote Amount" - Abs("Actual to Date");


                /*VendorLedgerEntry.RESET;
                VendorLedgerEntry.SETRANGE("Document No.","Applies to Doc. No");
                VendorLedgerEntry.SETRANGE("Vendor No.","Account No");
                IF VendorLedgerEntry.FINDSET THEN BEGIN
                  IF VendorLedgerEntry."Document Type" = VendorLedgerEntry."Document Type"::Invoice THEN BEGIN
                  pInvoice.SETRANGE("Document No.","Applies to Doc. No");
                  pInvoice.SETRANGE("Buy-from Vendor No.","Account No");
                  IF pInvoice.FINDSET THEN
                    BEGIN
                    IF pInvoice.Type=pInvoice.Type::"G/L Account" THEN
                      BEGIN
                     // "Vote Item":=pInvoice."No.";
                      bcommitments.SETRANGE("Account No.", "Vote Item");
                      IF bcommitments.FINDSET THEN
                        BEGIN
                        bcommitments.CALCFIELDS("Commited Amount Orders","Commited Amount PRN","Commited Amount Imprest");
                        Commitments:=(bcommitments."Commited Amount Orders"+bcommitments."Commited Amount PRN"+bcommitments."Commited Amount Imprest");
                        //MESSAGE('%1',Commitments)
                        //"Vote Amount":=bcommitments."Budgeted Amount";
                
                        END;
                          IF CSetups.GET() THEN BEGIN
                            GLBudgetEntry.RESET;
                            GLBudgetEntry.SETRANGE("G/L Account No.","Vote Item");
                            GLBudgetEntry.SETRANGE("Budget Name",CSetups."Current Budget");
                            GLBudgetEntry.CALCSUMS(GLBudgetEntry.Amount);
                            "Vote Amount." := GLBudgetEntry.Amount;
                
                            "Vote Amount" := GLBudgetEntry.Amount;
                          END;
                        //2.0 Get Actual Amounts from g/l entries
                            gEntry.RESET;
                            actualAmount:=0;
                            cSetup.GET;
                            gEntry.SETRANGE("G/L Account No.","Vote Item");
                            gEntry.SETFILTER(gEntry."Posting Date",'%1..%2',CashMgt."Current Budget Start Date",CashMgt."Current Budget End Date");
                             IF gEntry.FINDSET THEN
                               BEGIN
                                 REPEAT
                                 actualAmount:=actualAmount+ABS(gEntry.Amount);
                                 UNTIL gEntry.NEXT=0;
                               END;
                               "Actual to Date":=actualAmount;
                               Commitments := Commitments + Amount;
                               //"Available Funds":="Vote Amount"-actualAmount-Commitments;
                               //Testing
                               "Available Funds":="Vote Amount"-"Actual to Date";
                
                      END
                      ELSE
                      IF pInvoice.Type=pInvoice.Type::Item THEN
                        BEGIN
                          IF Item.GET("Vote Item") THEN BEGIN
                            GeneralPostingSetup.RESET;
                            GeneralPostingSetup.SETRANGE("Gen. Prod. Posting Group",Item."Gen. Prod. Posting Group");
                            IF GeneralPostingSetup.FINDFIRST THEN BEGIN
                              //"Vote Item":=GeneralPostingSetup."Purch. Account";
                               IF CSetups.GET() THEN BEGIN
                                  GLBudgetEntry.RESET;
                                  GLBudgetEntry.SETRANGE("G/L Account No.","Vote Item");
                                  GLBudgetEntry.SETRANGE("Budget Name",CSetups."Current Budget");
                                  GLBudgetEntry.CALCSUMS(GLBudgetEntry.Amount);
                                  "Vote Amount." := GLBudgetEntry.Amount;
                                  "Vote Amount" := GLBudgetEntry.Amount;
                                  // MESSAGE('%1',"Vote Amount.")
                                END;
                            END;
                          END;
                          {
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
                          }
                          bcommitments.SETRANGE("Account No.","Vote Item");
                          IF bcommitments.FINDSET THEN
                            BEGIN
                            bcommitments.CALCFIELDS("Commited Amount Orders","Commited Amount PRN","Commited Amount Imprest");
                            Commitments:=(bcommitments."Commited Amount Orders"+bcommitments."Commited Amount PRN"+bcommitments."Commited Amount Imprest");
                
                            END;
                
                            //2.0 Get Actual Amounts from g/l entries
                                gEntry.RESET;
                                actualAmount:=0;
                                cSetup.GET;
                                gEntry.SETRANGE("G/L Account No.","Vote Item");
                                gEntry.SETFILTER(gEntry."Posting Date",'%1..%2',CashMgt."Current Budget Start Date",CashMgt."Current Budget End Date");
                                 IF gEntry.FINDSET THEN
                                   BEGIN
                                     REPEAT
                                     actualAmount:=actualAmount+ABS(gEntry.Amount);
                                     UNTIL gEntry.NEXT=0;
                                   END;
                               "Actual to Date":=actualAmount;
                               Commitments := Commitments + Amount;
                              // "Available Funds":="Vote Amount"-actualAmount-Commitments;
                              "Available Funds":="Vote Amount"-"Actual to Date";
                
                    END
                    ELSE IF pInvoice.Type=pInvoice.Type::"Fixed Asset" THEN
                      BEGIN
                        FixedAsset.GET(pInvoice."No.");
                        FixedAsset.RESET;
                        FixedAsset.SETRANGE("No.","Vote Item");
                        IF FixedAsset.FINDSET THEN BEGIN
                          FixedAsset.CALCFIELDS(FixedAsset."Vote Item");
                        //"Vote Item":=FixedAsset."Vote Item";
                          END;
                
                        bcommitments.SETRANGE("Account No.","Vote Item");
                        IF bcommitments.FINDSET THEN
                        BEGIN
                        bcommitments.CALCFIELDS("Commited Amount Orders","Commited Amount PRN","Commited Amount Imprest");
                        Commitments:=(bcommitments."Commited Amount Orders"+bcommitments."Commited Amount PRN"+bcommitments."Commited Amount Imprest");
                        //MESSAGE('%1',Commitments)
                        END;
                         IF CSetups.GET() THEN BEGIN
                            GLBudgetEntry.RESET;
                            GLBudgetEntry.SETRANGE("G/L Account No.","Vote Item");
                            GLBudgetEntry.SETRANGE("Budget Name",CSetups."Current Budget");
                            GLBudgetEntry.CALCSUMS(GLBudgetEntry.Amount);
                            "Vote Amount." := GLBudgetEntry.Amount;
                            "Vote Amount" := GLBudgetEntry.Amount;
                          END;
                        //2.0 Get Actual Amounts from g/l entries
                        //actualAmount:=0;
                
                            gEntry.RESET;
                            actualAmount:=0;
                            cSetup.GET;
                            gEntry.SETRANGE("G/L Account No.",FixedAsset."Vote Item");
                            gEntry.SETFILTER(gEntry."Posting Date",'%1..%2',cSetup."Leave Posting Period[FROM]",cSetup."Leave Posting Period[TO]");
                             IF gEntry.FINDSET THEN
                               BEGIN
                                 REPEAT
                                 actualAmount:=actualAmount+ABS(gEntry.Amount);
                                   MESSAGE('%1',actualAmount);
                                 UNTIL gEntry.NEXT=0;
                               END;
                             "Actual to Date":=actualAmount;
                               Commitments := Commitments + Amount;
                              // "Available Funds":="Vote Amount"-actualAmount-Commitments;
                               "Available Funds":="Vote Amount"-"Actual to Date";
                        END;
                  END;
                  END ELSE IF VendorLedgerEntry."Document Type" = VendorLedgerEntry."Document Type"::" " THEN BEGIN
                    //Add Budget information -KLM
                    IF Vendor.GET(VendorLedgerEntry."Vendor No.") THEN BEGIN
                      IF VendorPGroup.GET(Vendor."Vendor Posting Group") THEN BEGIN
                
                         bcommitments.SETRANGE("Account No.",VendorPGroup."Payables Account");
                         IF bcommitments.FINDSET THEN BEGIN
                
                            bcommitments.CALCFIELDS("Commited Amount Orders","Commited Amount PRN","Commited Amount Imprest");
                            Commitments:=(bcommitments."Commited Amount Orders"+bcommitments."Commited Amount PRN"+bcommitments."Commited Amount Imprest");
                          //MESSAGE('%1',Commitments)
                         END;
                       IF CSetups.GET() THEN BEGIN
                            GLBudgetEntry.RESET;
                            GLBudgetEntry.SETRANGE("G/L Account No.","Vote Item");
                            GLBudgetEntry.SETRANGE("Budget Name",CSetups."Current Budget");
                            GLBudgetEntry.CALCSUMS(GLBudgetEntry.Amount);
                            "Vote Amount." := GLBudgetEntry.Amount;
                
                          END;
                        //2.0 Get Actual Amounts from g/l entries
                         gEntry.RESET;
                         actualAmount:=0;
                         cSetup.GET;
                         gEntry.SETRANGE("G/L Account No.",VendorPGroup."Payables Account");
                         gEntry.SETFILTER(gEntry."Posting Date",'%1..%2',CashMgt."Current Budget Start Date",CashMgt."Current Budget End Date");
                         IF gEntry.FINDSET THEN
                         BEGIN
                            REPEAT
                              actualAmount:=actualAmount+ABS(gEntry.Amount);
                            UNTIL gEntry.NEXT=0;
                         END;
                         "Actual to Date":=actualAmount;
                          Commitments := Commitments + Amount;
                         // "Available Funds":="Vote Amount"-actualAmount-Commitments;
                          "Available Funds":="Vote Amount"-"Actual to Date";
                      END;
                    END;
                    END;
                    END;
                
                //Get Committed Amount
                //bcommitments.RESET;
                {Commitments:=0;
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
                  MODIFY();}
                  */

            end;
        }
        field(50021; "Vote Amount"; Decimal)
        {
            Editable = false;
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
        Customer: Record Customer;
        Vendor: Record Vendor;
        Employee: Record Employee;
        FixedAsset: Record "Fixed Asset";
        Bank: Record "Bank Account";
        GLAccount: Record "G/L Account";
        CSetups: Record "Cash Management Setup";
        Commitments: Decimal;
        bcommitments: Record "Budget Commitment";
        VoteAmount: Decimal;
        GLBudgetEntry: Record "G/L Budget Entry";
        actualAmount: Decimal;
        cSetup: Record "Cash Management Setup";
        gEntry: Record "G/L Entry";
}
