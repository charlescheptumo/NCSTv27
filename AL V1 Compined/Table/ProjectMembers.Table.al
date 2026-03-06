#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Table 57009 "Project Members"
{

    fields
    {
        field(1; "Imprest Memo No."; Code[20])
        {
            TableRelation = "Imprest Memo";
        }
        field(2; "No."; Code[20])
        {
            TableRelation = if (Type = const(Person)) Resource where(Type = const(Person),
                                                                    Blocked = const(false))
            else if (Type = const(Machine)) Resource where(Type = const(Machine));

            trigger OnValidate()
            begin
                if ImprestMemo.Get("Imprest Memo No.") then;
                if "No." = ImprestMemo.Requestor then
                    "Project Lead" := true
                else
                    "Project Lead" := false;

                if ResourceRec.Get("No.") then;
                Name := ResourceRec.Name;
                "Job Group" := ResourceRec."Resource Group No.";
                case Type of
                    Type::Person:
                        begin
                            if EmployeeRec.Get("No.") then begin
                                //Ushindi...Insert Bank Details

                                //***Added 15.01.2020 Hunaina
                                EmpLedgerEntry.Reset;
                                EmpLedgerEntry.SetRange("Employee No.", EmployeeRec."No.");
                                //EmpLedgerEntry.SETFILTER(EmpLedgerEntry."Journal Batch Name",'IMPVOU');
                                EmpLedgerEntry.SetRange(Reversed, false);
                                if EmpLedgerEntry.FindSet then begin
                                    repeat
                                        EmpLedgerEntry.CalcFields("Remaining Amount");
                                        TotalBal += EmpLedgerEntry."Remaining Amount";
                                    until EmpLedgerEntry.Next = 0;
                                end;
                                //MESSAGE('R Amnt %1, Emp', TotalBal, EmpLedgerEntry."Employee No.");
                                if (TotalBal * 1) > 0 then
                                    Error('Please Surrender your outstanding imprest balance of  %1', TotalBal * -1);
                                // END;
                                /*
                                EmployeeRec.CALCFIELDS(EmployeeRec."Bank Name",EmployeeRec."Bank Branch Name",EmployeeRec.Balance);
                                 IF (EmployeeRec.Balance*-1)>0 THEN
                                    ERROR('Please Surrender your outstanding imprest balance of  %1',EmployeeRec.Balance*-1);*/ //Commented 15.01.2020

                                "Bank Account Number" := EmployeeRec."Bank Account Number";
                                "Bank Branch" := EmployeeRec."Bank Branch";
                                "Bank Branch Name" := EmployeeRec."Bank Branch Name";
                                "Bank Name" := EmployeeRec."Bank Name";
                                "Job Title" := EmployeeRec."Job Title";
                                "Directorate Code" := EmployeeRec."Directorate Code";
                                "Department Code" := EmployeeRec."Department Code";
                                Division := EmployeeRec.Division;
                            end;
                            //Ushindi Changes
                            CustRec.Reset;
                            CustRec.SetRange("No.", "No.");
                            if CustRec.Find('-') then begin
                                CustRec.CalcFields("Balance (LCY)", Balance);
                                "Outstanding Amount" := CustRec."Balance (LCY)";
                                if CustRec."Balance (LCY)" > CustRec."Credit Limit (LCY)" then //David accountability of unsurrendered imprests
                                    Error(Text001, "No.", CustRec."Balance (LCY)", CustRec.Balance - CustRec."Credit Limit (LCY)");
                            end;
                        end;
                    Type::Machine:
                        begin
                        end;
                end;
                //Ushindi
                CalcFields(Project);
                //Ushindi
                ProjectMembers.Reset;
                ProjectMembers.SetRange("No.", "No.");
                ProjectMembers.SetRange("Imprest Memo No.", "Imprest Memo No.");
                /*IF ProjectMembers.FINDSET THEN
                BEGIN
                ERROR('Employee Already Exists');
                END;*/

            end;
        }
        field(3; Name; Text[150])
        {
        }
        field(4; "Job Group"; Code[20])
        {
            CalcFormula = lookup(Employee."Salary Scale" where("No." = field("No.")));
            FieldClass = FlowField;
        }
        field(5; "Job Title"; Text[50])
        {
        }
        field(6; Entitlement; Decimal)
        {
            Editable = false;

            trigger OnValidate()
            begin
                //"Direct Unit Cost":=(Entitlement-"Transport Costs")/"Time Period";
            end;
        }
        field(7; "Outstanding Amount"; Decimal)
        {
            Editable = false;
        }
        field(8; "Tasks to Carry Out"; Text[150])
        {
        }
        field(9; "Expected Output"; Text[150])
        {
        }
        field(10; "Unit of Measure"; Code[20])
        {
            TableRelation = "Unit of Measure";
        }
        field(11; Delivery; Decimal)
        {
        }
        field(12; "Work Type"; Code[20])
        {
            TableRelation = "Work Type" where(Category = filter("Project Team" | Machines));

            trigger OnValidate()
            begin
                if WTRec.Get("Work Type") then begin
                    "Unit of Measure" := WTRec."Unit of Measure Code";
                    "G/L Account" := WTRec."G/L Account";
                end;

                ResourceCost.Reset;
                ResourceCost.SetRange("Work Type Code", "Work Type");
                if ResourceCost.Find('-') then begin
                    "Currency Code" := ResourceCost."Currency code";
                    Validate("Currency Code");
                end;
            end;
        }
        field(13; "Time Period"; Decimal)
        {

            trigger OnValidate()
            begin
                if "Work Type" <> '' then begin
                    if ResourceRec.Get("No.") then;
                    if ResourceRec."Resource Group No." <> '' then begin
                        if ResourceCost.Get(ResourceCost.Type::Resource, "No.", "Work Type") then begin
                            case Type of
                                Type::Person:
                                    Entitlement := (ResourceCost."Direct Unit Cost" * "Time Period");

                                Type::Machine:
                                    //change by David
                                    "Expected Maintenance Cost" := (ResourceCost."Direct Unit Cost" * "Time Period" / "Consumption Rate");

                            //Added the field consumption rate in the formula.
                            end;
                        end
                        else
                            if ResourceCost.Get(ResourceCost.Type::"Group(Resource)", ResourceRec."Resource Group No.", "Work Type") then begin
                                case Type of
                                    Type::Person:
                                        Entitlement := (ResourceCost."Direct Unit Cost" * "Time Period");

                                    Type::Machine:
                                        "Expected Maintenance Cost" := (ResourceCost."Direct Unit Cost" * "Time Period" / "Consumption Rate");
                                //Added the field consumption rate in the formula.
                                //"Expected Maintenance Cost":=ResourceCost."Direct Unit Cost"*"Time Period"/ResourceCost."Consumption Rate";
                                // "Expected Maintenance Cost":=ResourceCost."Direct Unit Cost"*"Time Period";
                                end;
                            end;
                    end else begin
                        if ResourceCost.Get(ResourceCost.Type::Resource, "No.", "Work Type") then begin
                            case Type of
                                Type::Person:

                                    Entitlement := (ResourceCost."Direct Unit Cost" * "Time Period") + "Transport Costs";
                                Type::Machine:
                                    "Expected Maintenance Cost" := (ResourceCost."Direct Unit Cost" * "Time Period" / "Consumption Rate");
                            //"Expected Maintenance Cost":=(ResourceCost."Direct Unit Cost"*"Time Period"/ResourceCost."Consumption Rate");
                            //Added the field consumption rate in the formula.
                            //"Expected Maintenance Cost":=ResourceCost."Direct Unit Cost"*"Time Period"/ResourceCost."Consumption Rate";
                            // "Expected Maintenance Cost":=ResourceCost."Direct Unit Cost"*"Time Period";
                            end;
                        end
                        else begin
                            if ResourceCost.Get(ResourceCost.Type::All, '', "Work Type") then begin
                                case Type of
                                    Type::Person:
                                        Entitlement := (ResourceCost."Direct Unit Cost" * "Time Period");

                                    Type::Machine:
                                        "Expected Maintenance Cost" := (ResourceCost."Direct Unit Cost" * "Time Period" / "Consumption Rate");
                                //"Expected Maintenance Cost":=(ResourceCost."Direct Unit Cost"*"Time Period"/ResourceCost."Consumption Rate");
                                //Added the field consumption rate in the formula.
                                //"Expected Maintenance Cost":=ResourceCost."Direct Unit Cost"*"Time Period"/ResourceCost."Consumption Rate";
                                //"Expected Maintenance Cost":=ResourceCost."Direct Unit Cost"*"Time Period";
                                end;
                            end
                            else
                                Error(Text000);
                        end;
                    end;
                end;


                "Direct Unit Cost" := ResourceCost."Direct Unit Cost";
                Validate("Total Entitlement");
                //"Vote Item":="G/L Account";
            end;
        }
        field(14; Type; Option)
        {
            OptionCaption = 'Person,Machine';
            OptionMembers = Person,Machine;
        }
        field(15; "Last Maintenance Cost"; Decimal)
        {
        }
        field(16; "Expected Maintenance Cost"; Decimal)
        {
            Editable = false;
        }
        field(17; "Bank Name"; Text[100])
        {
        }
        field(18; "Bank Branch"; Code[100])
        {
        }
        field(19; "Bank Account Number"; Code[100])
        {
        }
        field(20; "Project Lead"; Boolean)
        {
        }
        field(21; "Project Lead Costs"; Decimal)
        {
            CalcFormula = sum("Project Members".Entitlement where(Type = const(Machine)));
            FieldClass = FlowField;
        }
        field(22; Posted; Boolean)
        {
        }
        field(23; Linked; Boolean)
        {
        }
        field(24; Project; Code[20])
        {
            CalcFormula = lookup("Imprest Memo".Project where("No." = field("Imprest Memo No.")));
            FieldClass = FlowField;
        }
        field(25; "Task No."; Code[20])
        {
            TableRelation = "Job Task"."Job Task No." where("Job Task Type" = const(Posting),
                                                             "Job No." = field(Project));

            trigger OnValidate()
            begin
                CalcFields(Project);
                if TaskRec.Get(Project, "Task No.") then;
                "Tasks to Carry Out" := TaskRec.Description;
                "Job Task Description" := TaskRec.Description;
            end;
        }
        field(26; "Expense Type"; Option)
        {
            OptionCaption = 'Fuel,Maintenance';
            OptionMembers = Fuel,Maintenance;
        }
        field(27; "Bank Branch Name"; Text[100])
        {
        }
        field(28; "Actual Time Period"; Integer)
        {

            trigger OnValidate()
            begin
                if "Work Type" <> '' then begin
                    if ResourceRec.Get("No.") then;
                    if ResourceRec."Resource Group No." <> '' then begin
                        if ResourceCost.Get(ResourceCost.Type::Resource, "No.", "Work Type") then begin
                            case Type of
                                Type::Person:
                                    "Actual Spent" := ResourceCost."Direct Unit Cost" * "Actual Time Period";

                                Type::Machine:
                                    //change by David
                                    "Actual Maintanance Costs" := (ResourceCost."Direct Unit Cost" * "Actual Distance covered" / "Consumption Rate");

                            //Added the field consumption rate in the formula.
                            end;
                        end
                        else
                            if ResourceCost.Get(ResourceCost.Type::"Group(Resource)", ResourceRec."Resource Group No.", "Work Type") then begin
                                case Type of
                                    Type::Person:
                                        "Actual Spent" := ResourceCost."Direct Unit Cost" * "Actual Time Period";

                                    Type::Machine:
                                        "Actual Maintanance Costs" := (ResourceCost."Direct Unit Cost" * "Actual Distance covered" / "Consumption Rate");
                                //Added the field consumption rate in the formula.
                                //"Expected Maintenance Cost":=ResourceCost."Direct Unit Cost"*"Time Period"/ResourceCost."Consumption Rate";
                                // "Expected Maintenance Cost":=ResourceCost."Direct Unit Cost"*"Time Period";
                                end;
                            end;
                    end else begin
                        if ResourceCost.Get(ResourceCost.Type::Resource, "No.", "Work Type") then begin
                            case Type of
                                Type::Person:
                                    "Actual Spent" := ResourceCost."Direct Unit Cost" * "Actual Time Period";

                                Type::Machine:
                                    "Actual Maintanance Costs" := (ResourceCost."Direct Unit Cost" * "Actual Distance covered" / "Consumption Rate");
                            //"Expected Maintenance Cost":=(ResourceCost."Direct Unit Cost"*"Time Period"/ResourceCost."Consumption Rate");
                            //Added the field consumption rate in the formula.
                            //"Expected Maintenance Cost":=ResourceCost."Direct Unit Cost"*"Time Period"/ResourceCost."Consumption Rate";
                            // "Expected Maintenance Cost":=ResourceCost."Direct Unit Cost"*"Time Period";
                            end;
                        end
                        else begin
                            if ResourceCost.Get(ResourceCost.Type::All, '', "Work Type") then begin
                                case Type of
                                    Type::Person:
                                        "Actual Spent" := ResourceCost."Direct Unit Cost" * "Actual Time Period";

                                    Type::Machine:
                                        "Actual Maintanance Costs" := (ResourceCost."Direct Unit Cost" * "Actual Distance covered" / "Consumption Rate");
                                //"Expected Maintenance Cost":=(ResourceCost."Direct Unit Cost"*"Time Period"/ResourceCost."Consumption Rate");
                                //Added the field consumption rate in the formula.
                                //"Expected Maintenance Cost":=ResourceCost."Direct Unit Cost"*"Time Period"/ResourceCost."Consumption Rate";
                                //"Expected Maintenance Cost":=ResourceCost."Direct Unit Cost"*"Time Period";
                                end;
                            end
                            else
                                Error(Text000);
                        end;
                    end;
                end;
            end;
        }
        field(29; "Actual Spent"; Decimal)
        {
            Editable = false;

            trigger OnValidate()
            begin
                if "Work Type" <> '' then begin
                    if ResourceRec.Get("No.") then;
                    if ResourceRec."Resource Group No." <> '' then begin
                        if ResourceCost.Get(ResourceCost.Type::Resource, "No.", "Work Type") then begin
                            case Type of
                                Type::Person:
                                    Entitlement := ResourceCost."Direct Unit Cost" * "Time Period";

                                Type::Machine:
                                    //change by David
                                    "Expected Maintenance Cost" := (ResourceCost."Direct Unit Cost" * "Time Period" / "Consumption Rate");

                            //Added the field consumption rate in the formula.
                            end;
                        end
                        else
                            if ResourceCost.Get(ResourceCost.Type::"Group(Resource)", ResourceRec."Resource Group No.", "Work Type") then begin
                                case Type of
                                    Type::Person:
                                        Entitlement := ResourceCost."Direct Unit Cost" * "Time Period";

                                    Type::Machine:
                                        "Expected Maintenance Cost" := (ResourceCost."Direct Unit Cost" * "Time Period" / "Consumption Rate");
                                //Added the field consumption rate in the formula.
                                //"Expected Maintenance Cost":=ResourceCost."Direct Unit Cost"*"Time Period"/ResourceCost."Consumption Rate";
                                // "Expected Maintenance Cost":=ResourceCost."Direct Unit Cost"*"Time Period";
                                end;
                            end;
                    end else begin
                        if ResourceCost.Get(ResourceCost.Type::Resource, "No.", "Work Type") then begin
                            case Type of
                                Type::Person:
                                    Entitlement := ResourceCost."Direct Unit Cost" * "Time Period";

                                Type::Machine:
                                    "Expected Maintenance Cost" := (ResourceCost."Direct Unit Cost" * "Time Period" / "Consumption Rate");
                            //"Expected Maintenance Cost":=(ResourceCost."Direct Unit Cost"*"Time Period"/ResourceCost."Consumption Rate");
                            //Added the field consumption rate in the formula.
                            //"Expected Maintenance Cost":=ResourceCost."Direct Unit Cost"*"Time Period"/ResourceCost."Consumption Rate";
                            // "Expected Maintenance Cost":=ResourceCost."Direct Unit Cost"*"Time Period";
                            end;
                        end
                        else begin
                            if ResourceCost.Get(ResourceCost.Type::All, '', "Work Type") then begin
                                case Type of
                                    Type::Person:
                                        "Actual Spent" := ResourceCost."Direct Unit Cost" * "Actual Time Period";

                                    Type::Machine:
                                        "Actual Maintanance Costs" := (ResourceCost."Direct Unit Cost" * "Actual Distance covered" / "Consumption Rate");
                                //"Expected Maintenance Cost":=(ResourceCost."Direct Unit Cost"*"Time Period"/ResourceCost."Consumption Rate");
                                //Added the field consumption rate in the formula.
                                //"Expected Maintenance Cost":=ResourceCost."Direct Unit Cost"*"Time Period"/ResourceCost."Consumption Rate";
                                //"Expected Maintenance Cost":=ResourceCost."Direct Unit Cost"*"Time Period";
                                end;
                            end
                            else
                                Error(Text000);
                        end;
                    end;
                end;
            end;
        }
        field(30; "Actual Delivery"; Decimal)
        {
        }
        field(31; Surrendered; Boolean)
        {
        }
        field(32; Status; Option)
        {
            CalcFormula = lookup("Imprest Memo".Status where("No." = field("Imprest Memo No.")));
            Editable = true;
            FieldClass = FlowField;
            OptionCaption = 'Open,Pending Approval,Released,Rejected';
            OptionMembers = Open,"Pending Approval",Released,Rejected;
        }
        field(50020; "Vote Item"; Code[20])
        {
            Editable = true;
            NotBlank = true;
            TableRelation = "G/L Account"."No.";
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
        field(57000; "Job Task Description"; Text[50])
        {
            Caption = 'Job Task Description';
            Editable = false;
        }
        field(57001; "Consumption Rate"; Decimal)
        {
            FieldClass = Normal;
        }
        field(57002; "Direct Unit Cost"; Decimal)
        {
            Editable = false;

            trigger OnValidate()
            begin
                //"Direct Unit Cost":=(Entitlement-"Transport Costs")/"Time Period";
                Validate("Currency Code");
            end;
        }
        field(57003; "Actual Maintanance Costs"; Decimal)
        {
        }
        field(57004; "Actual Distance covered"; Decimal)
        {
        }
        field(57005; "Approved days"; Integer)
        {
        }
        field(57006; "G/L Account"; Code[20])
        {
            CalcFormula = lookup("Receipts and Payment Types1"."G/L Account" where(Code = field("Type of Expense"),
                                                                                    "Appear on Imprest?" = filter(true)));
            Editable = true;
            FieldClass = FlowField;
            TableRelation = "G/L Account";

            trigger OnValidate()
            begin
                //"Vote Item":="G/L Account";
            end;
        }
        field(57007; "Currency Code"; Code[20])
        {
            TableRelation = Currency;
        }
        field(57008; "Type of Expense"; Code[50])
        {
            TableRelation = "Receipts and Payment Types1" where("Appear on Imprest?" = filter(true));

            trigger OnValidate()
            begin
                tExpense.Reset;
                tExpense.SetRange(Code, "Type of Expense");
                if tExpense.FindSet then begin
                    "Vote Item" := tExpense."G/L Account";
                    gEntry.Reset;
                    actualAmount := 0;
                    cSetup.Get;
                    Bcommitments.Reset;
                    gEntry.SetRange("G/L Account No.", tExpense."G/L Account");
                    gEntry.SetFilter(gEntry."Posting Date", '%1..%2', cSetup."Leave Posting Period[FROM]", cSetup."Leave Posting Period[TO]");
                    if gEntry.FindSet then begin
                        repeat
                            actualAmount := actualAmount + Abs(gEntry.Amount);
                        until gEntry.Next = 0;
                    end;

                    "Actual to Date" := actualAmount;

                    Bcommitments.SetRange("Account No.", "Vote Item");
                    if Bcommitments.FindSet then begin
                        "Vote Amount" := Bcommitments."Budgeted Amount";
                        Bcommitments.CalcFields("Commited Amount Imprest", "Commited Amount Orders", "Commited Amount PRN");
                        Commitments := (Bcommitments."Commited Amount Imprest" + Bcommitments."Commited Amount Orders" + Bcommitments."Commited Amount PRN");
                        "Available Funds" := "Vote Amount" - actualAmount - (Bcommitments."Commited Amount Imprest" + Bcommitments."Commited Amount Orders" + Bcommitments."Commited Amount PRN");
                    end;
                end;
            end;
        }
        field(57009; "Transport Costs"; Decimal)
        {

            trigger OnValidate()
            begin
                Validate("Total Entitlement");
            end;
        }
        field(57010; "Total Entitlement"; Decimal)
        {
            Editable = false;

            trigger OnValidate()
            begin
                "Total Entitlement" := Entitlement + "Transport Costs";
            end;
        }
        field(69022; "Currency Factor"; Integer)
        {
        }
        field(70014; "Department Code"; Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Responsibility Center" where("Operating Unit Type" = const(Department),
                                                           "Direct Reports To" = field("Directorate Code"));
        }
        field(70018; "Directorate Code"; Code[50])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Responsibility Center" where("Operating Unit Type" = const(Directorate));
        }
        field(70019; Division; Code[50])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Responsibility Center" where("Operating Unit Type" = const("Division/Section"),
                                                           "Direct Reports To" = field("Department Code"));
        }
    }

    keys
    {
        key(Key1; "Imprest Memo No.", "No.", "Work Type")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }

    var
        ProjectTeam: Record "Project Members";
        ImprestMemo: Record "Imprest Memo";
        ResourceRec: Record Resource;
        EmployeeRec: Record Employee;
        CustRec: Record Customer;
        WTRec: Record "Work Type";
        ResourceCost: Record "Resource Cost";
        Text000: label 'Kindly setup resource costs';
        TaskRec: Record "Job Task";
        Text001: label 'The staff No. %1 you selected has an outstanding imprest Amounting to Kshs.   %2 that is greater than the credit limit set for the staff by Ksh. %3. You can only have a team with balance less than the set Credit limit.';
        Localcurr: BigInteger;
        currency: Record Currency;
        tExpense: Record "Receipts and Payment Types1";
        fAsset: Record "Fixed Asset";
        Bcommitments: Record "Budget Commitment";
        cSetup: Record "Human Resources Setup";
        gEntry: Record "G/L Entry";
        actualAmount: Decimal;
        EmpLedgerEntry: Record "Employee Ledger Entry";
        TotalBal: Decimal;
        ProjectMembers: Record "Project Members";
}
