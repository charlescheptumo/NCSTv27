#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Table 69005 EarningsX
{
    DataCaptionFields = "Code", Description;
    DrillDownPageID = "Earnings List";
    LookupPageID = "Earnings List";

    fields
    {
        field(1; "Code"; Code[20])
        {
            NotBlank = true;
        }
        field(2; Description; Text[50])
        {
        }
        field(3; "Pay Type"; Option)
        {
            OptionMembers = Recurring,"Non-recurring";
        }
        field(4; "Start Date"; Date)
        {
        }
        field(5; "End Date"; Date)
        {
        }
        field(6; Taxable; Boolean)
        {
        }
        field(7; "Calculation Method"; Option)
        {
            OptionMembers = "Flat amount","% of Basic pay","% of Gross pay","% of Insurance Amount","% of Taxable income","% of Basic after tax","Based on Hourly Rate","Based on Daily Rate";
        }
        field(8; "Flat Amount"; Decimal)
        {
        }
        field(9; Percentage; Decimal)
        {
            DecimalPlaces = 14 : 14;
            MaxValue = 100;
            MinValue = 0;
        }
        field(10; "G/L Account"; Code[10])
        {
            TableRelation = "G/L Account";
        }
        field(11; "Total Amount"; Decimal)
        {
            CalcFormula = sum("Assignment Matrix-X".Amount where(Type = const(Payment),
                                                                  Code = field(Code),
                                                                  "Posting Group Filter" = field("Posting Group Filter"),
                                                                  "Payroll Period" = field("Pay Period Filter"),
                                                                  "Department Code" = field("Department Filter"),
                                                                  "Payroll Grouping" = field("Payroll Grouping Filter"),
                                                                  Branch = field("Branch Filter"),
                                                                  "Profit Centre" = field("ProfitCtr Filter"),
                                                                  Rank = field("Rank Filter"),
                                                                  "Pay Mode" = field("Pay Mode Filter")));
            Editable = false;
            FieldClass = FlowField;
        }
        field(12; "Date Filter"; Date)
        {
        }
        field(13; "Posting Group Filter"; Code[200])
        {
            FieldClass = FlowFilter;
            TableRelation = "Employee Posting GroupX";
        }
        field(14; "Pay Period Filter"; Date)
        {
            ClosingDates = false;
            FieldClass = FlowFilter;
            TableRelation = "Payroll PeriodX";
        }
        field(15; Quarters; Boolean)
        {
        }
        field(16; "Non-Cash Benefit"; Boolean)
        {
        }
        field(17; "Minimum Limit"; Decimal)
        {
        }
        field(18; "Maximum Limit"; Decimal)
        {
        }
        field(19; "Reduces Tax"; Boolean)
        {
        }
        field(20; "Overtime Factor"; Decimal)
        {
        }
        field(21; "Employee Filter"; Code[20])
        {
            TableRelation = Employee;
        }
        field(22; Counter; Integer)
        {
            CalcFormula = count("Assignment Matrix-X" where("Payroll Period" = field("Pay Period Filter"),
                                                             "Employee No" = field("Employee Filter"),
                                                             Code = field(Code)));
            FieldClass = FlowField;
        }
        field(23; NoOfUnits; Decimal)
        {
            CalcFormula = sum("Assignment Matrix-X"."No. of Units" where(Code = field(Code),
                                                                          "Payroll Period" = field("Pay Period Filter"),
                                                                          "Employee No" = field("Employee Filter")));
            FieldClass = FlowField;
        }
        field(24; "Low Interest Benefit"; Boolean)
        {
        }
        field(25; "Show Balance"; Boolean)
        {
        }
        field(26; CoinageRounding; Boolean)
        {
        }
        field(27; OverDrawn; Boolean)
        {
        }
        field(28; "Opening Balance"; Decimal)
        {
            CalcFormula = sum("Assignment Matrix-X"."Opening Balance" where(Type = const(Payment),
                                                                             Code = field(Code),
                                                                             "Employee No" = field("Employee Filter")));
            FieldClass = FlowField;
        }
        field(29; OverTime; Boolean)
        {
            FieldClass = Normal;
        }
        field(30; "Department Filter"; Code[20])
        {
            FieldClass = FlowFilter;
            TableRelation = "Dimension Value".Code where("Dimension Code" = const('DEPARTMENT'));
        }
        field(31; Months; Decimal)
        {
            Description = 'Used to cater for taxation based on annual bracket eg 1,12 months (the default is 1month) FOR NEPAL';
        }
        field(32; "Show on Report"; Boolean)
        {
        }
        field(33; "Time Sheet"; Boolean)
        {
        }
        field(34; "Total Days"; Decimal)
        {
            FieldClass = Normal;
        }
        field(35; "Total Hrs"; Decimal)
        {
            FieldClass = Normal;
        }
        field(36; Weekend; Boolean)
        {
        }
        field(37; Weekday; Boolean)
        {
        }
        field(38; "Basic Salary Code"; Boolean)
        {
        }
        field(39; "Default Enterprise"; Code[10])
        {
        }
        field(40; "Default Activity"; Code[10])
        {
        }
        field(41; "ProRata Leave"; Boolean)
        {
        }
        field(42; "Earning Type"; Option)
        {
            OptionMembers = "Normal Earning","Owner Occupier","Home Savings","Low Interest","Tax Relief","Insurance Relief",Gratuity;
        }
        field(43; "Applies to All"; Boolean)
        {
        }
        field(44; "Show on Master Roll"; Boolean)
        {
        }
        field(45; "House Allowance Code"; Boolean)
        {
        }
        field(46; "Responsibility Allowance Code"; Boolean)
        {
        }
        field(47; "Commuter Allowance Code"; Boolean)
        {
        }
        field(48; Block; Boolean)
        {
        }
        field(49; "Basic Pay Arrears"; Boolean)
        {
        }
        field(50; "Negative Earning"; Boolean)
        {
        }
        field(51; "Show No.of Days"; Boolean)
        {
        }
        field(52; "Show No.of Hours"; Boolean)
        {
        }
        field(53; "Payroll Grouping Filter"; Option)
        {
            Editable = false;
            FieldClass = FlowFilter;
            OptionCaption = ' ,Guards,Admin,Management';
            OptionMembers = " ",Guards,Admin,Management;
        }
        field(54; "Branch Filter"; Code[20])
        {
            FieldClass = FlowFilter;
            TableRelation = "Dimension Value".Code where("Dimension Code" = const('BRANCH'));
        }
        field(55; "ProfitCtr Filter"; Code[20])
        {
            FieldClass = FlowFilter;
            TableRelation = "Dimension Value".Code where("Dimension Code" = const('PROFITCTR'));
        }
        field(80; "Rank Filter"; Option)
        {
            FieldClass = FlowFilter;
            OptionCaption = 'GUARD,SITE SUPERVISOR,DRIVER,DOG HANDLER,ADMIN,FIELD OFFICER,SENIOR GUARD,PREMIUM GUARD I,PREMIUM GUARD II,RIDER SUPERVISOR,CREW COMMANDER,CREW,BOOK CLERK,DOG MASTER,FIRE CREW,KENNEL ATTENDANT,CONTROLLER';
            OptionMembers = GUARD,"SITE SUPERVISOR",DRIVER,"DOG HANDLER",ADMIN,"FIELD OFFICER","SENIOR GUARD","PREMIUM GUARD I","PREMIUM GUARD II","RIDER SUPERVISOR","CREW COMMANDER",CREW,"BOOK CLERK","DOG MASTER","FIRE CREW","KENNEL ATTENDANT",CONTROLLER;
        }
        field(81; HERE; Code[10])
        {
        }
        field(82; "KRA Classification"; Option)
        {
            OptionCaption = ' ,Basic,HouseAllowance,TransportAllowance,Leave,OT,DirectorsFees,LumpSum,Others,NonCashBenefit,MPR,InsuranceRelief';
            OptionMembers = " ",Basic,HouseAllowance,TransportAllowance,Leave,OT,DirectorsFees,LumpSum,Others,NonCashBenefit,MPR,InsuranceRelief;
        }
        field(83; "Fluctuation Type"; Option)
        {
            OptionMembers = Fluctuating,"Non-Fluctuating";
        }
        field(84; "Employee Code"; Code[20])
        {
            CalcFormula = lookup(EarningsX."Employee Filter");
            FieldClass = FlowField;
        }
        field(85; "No of Entries"; Integer)
        {
            CalcFormula = count("Assignment Matrix-X" where(Type = const(Payment),
                                                             Code = field(Code),
                                                             "Payroll Period" = field("Pay Period Filter"),
                                                             "Pay Mode" = field("Pay Mode Filter")));
            FieldClass = FlowField;
        }
        field(86; "Pay Mode Filter"; Code[20])
        {
            FieldClass = FlowFilter;
            TableRelation = "Payroll Pay Mode";
        }
        field(87; "Account Type"; Option)
        {
            Editable = true;
            OptionCaption = 'G/L Account,Customer,Vendor,Bank Account,Fixed Asset';
            OptionMembers = "G/L Account",Customer,Vendor,"Bank Account","Fixed Asset";
        }
        field(88; "Account No."; Code[20])
        {
            TableRelation = if ("Account Type" = const("G/L Account")) "G/L Account"
            else if ("Account Type" = const("Fixed Asset")) "Fixed Asset"
            else if ("Account Type" = const(Customer)) Customer
            else if ("Account Type" = const("Bank Account")) "Bank Account Ledger Entry"
            else if ("Account Type" = const(Vendor)) Vendor;

            trigger OnValidate()
            begin

                // CASE "Account Type" OF
                //  "Account Type":::
                //    BEGIN
                //     IF Customer.GET("Account No.") THEN
                //       BEGIN
                //         "Account Name":=Customer.Name;
                //         Payee:=Customer.Name;
                //         END;
                //    END;
                // END;
            end;
        }
        field(89; "Percentage Employer"; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(50002; "Deduct From Pension"; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(50003; "Calculate Excess Pension"; Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(50004; "Flat Employer Amount"; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(50005; "Exclude Housing Levy"; Boolean)
        {
            DataClassification = ToBeClassified;

            trigger OnValidate()
            begin

                if Confirm('Would you like to update the Taxable field for all employees with this Code', true) then begin

                    AssignmentMat.Reset;

                    AssignmentMat.SetRange(Type, AssignmentMat.Type::Payment);
                    AssignmentMat.SetRange(Code, Code);
                    AssignmentMat.SetRange(Closed, false);

                    if AssignmentMat.FindSet then begin
                        repeat
                            AssignmentMat."Exclude Housing Levy" := "Exclude Housing Levy";
                            AssignmentMat.Modify;
                        until AssignmentMat.Next = 0;
                    end;
                end else
                    Message(' not updated to all employees')
            end;
        }
    }

    keys
    {
        key(Key1; "Code")
        {
            Clustered = true;
        }
        key(Key2; "Show on Report")
        {
        }
        key(Key3; OverTime)
        {
        }
        key(Key4; "Time Sheet")
        {
        }
        key(Key5; "Earning Type")
        {
        }
        key(Key6; "House Allowance Code")
        {
        }
        key(Key7; "Responsibility Allowance Code")
        {
        }
        key(Key8; "Commuter Allowance Code")
        {
        }
    }

    fieldgroups
    {
    }

    trigger OnDelete()
    begin
        TestField("Total Amount", 0);
        /*
        AssignmentMat.RESET;
        AssignmentMat.SETRANGE(AssignmentMat.Type,AssignmentMat.Type::Payment);
        AssignmentMat.SETRANGE(AssignmentMat.Code,Code);
        IF AssignmentMat.FIND('+') THEN
        ERROR('You cannot delete this earning because it has entries');
        */

    end;

    var
        AssignmentMat: Record "Assignment Matrix-X";
}
