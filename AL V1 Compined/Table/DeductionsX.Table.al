#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Table 69006 DeductionsX
{
    DataCaptionFields = "Code", Description;
    DrillDownPageID = "Deductins Listing";
    LookupPageID = "Deductins Listing";

    fields
    {
        field(1; "Code"; Code[20])
        {
            NotBlank = true;
        }
        field(2; Description; Text[100])
        {
        }
        field(3; Type; Option)
        {
            OptionMembers = Recurring,"Non-recurring";
        }
        field(6; "Tax deductible"; Boolean)
        {
        }
        field(7; Advance; Boolean)
        {
        }
        field(8; "Start date"; Date)
        {
        }
        field(9; "End Date"; Date)
        {
        }
        field(10; Percentage; Decimal)
        {
            DecimalPlaces = 5 : 5;
        }
        field(11; "Calculation Method"; Option)
        {
            OptionMembers = "Flat Amount","% of Basic Pay","Based on Table","Based on Hourly Rate","Based on Daily Rate ","% of Gross Pay","% of Basic Pay+Hse Allowance";
        }
        field(12; "G/L Account"; Code[10])
        {
            TableRelation = "G/L Account";
        }
        field(13; "Flat Amount"; Decimal)
        {
        }
        field(14; "Total Amount"; Decimal)
        {
            CalcFormula = sum("Assignment Matrix-X".Amount where(Type = const(Deduction),
                                                                  Code = field(Code),
                                                                  "Posting Group Filter" = field("Posting Group Filter"),
                                                                  "Payroll Period" = field("Pay Period Filter"),
                                                                  "Employee No" = field("Employee Filter"),
                                                                  "Department Code" = field("Department Filter"),
                                                                  "Reference No" = field("Reference Filter"),
                                                                  "Payroll Grouping" = field("Payroll Grouping Filter"),
                                                                  Branch = field("Branch Filter"),
                                                                  "Profit Centre" = field("ProfitCtr Filter"),
                                                                  Rank = field("Rank Filter")));
            Editable = false;
            FieldClass = FlowField;
        }
        field(15; "Date Filter"; Date)
        {
        }
        field(16; "Posting Group Filter"; Code[200])
        {
            FieldClass = FlowFilter;
            TableRelation = "Employee Posting GroupX";
        }
        field(17; Loan; Boolean)
        {
        }
        field(18; "Maximum Amount"; Decimal)
        {
        }
        field(19; "Grace period"; DateFormula)
        {
        }
        field(20; "Repayment Period"; DateFormula)
        {
        }
        field(21; "Pay Period Filter"; Date)
        {
            FieldClass = FlowFilter;
            TableRelation = "Payroll PeriodX";
        }
        field(26; "Pension Scheme"; Boolean)
        {
        }
        field(27; "Deduction Table"; Code[10])
        {
            TableRelation = "Bracket Tablesx";
        }
        field(28; "G/L Account Employer"; Code[10])
        {
            TableRelation = "G/L Account";
        }
        field(29; "Percentage Employer"; Decimal)
        {
        }
        field(30; "Minimum Amount"; Decimal)
        {
        }
        field(31; "Flat Amount Employer"; Decimal)
        {
        }
        field(32; "Total Amount Employer"; Decimal)
        {
            CalcFormula = sum("Assignment Matrix-X"."Employer Amount" where(Type = const(Deduction),
                                                                             Code = field(Code),
                                                                             "Payroll Period" = field("Pay Period Filter"),
                                                                             "Posting Group Filter" = field("Posting Group Filter"),
                                                                             "Department Code" = field("Department Filter"),
                                                                             "Employee No" = field("Employee Filter"),
                                                                             Branch = field("Country Filter"),
                                                                             "Pay Point" = field("Projects Filter"),
                                                                             "Staffing Group" = field("Region Filter")));
            FieldClass = FlowField;
        }
        field(33; "Loan Type"; Option)
        {
            OptionMembers = " ","Low Interest Benefit","Fringe Benefit";
        }
        field(34; "Show Balance"; Boolean)
        {
        }
        field(35; CoinageRounding; Boolean)
        {
        }
        field(36; "Employee Filter"; Code[20])
        {
            FieldClass = FlowFilter;
            TableRelation = Employee;
        }
        field(37; "Opening Balance"; Decimal)
        {
            CalcFormula = sum("Assignment Matrix-X"."Opening Balance" where(Type = const(Deduction),
                                                                             Code = field(Code),
                                                                             "Employee No" = field("Employee Filter")));
            FieldClass = FlowField;
        }
        field(38; "Department Filter"; Code[20])
        {
            FieldClass = FlowFilter;
            TableRelation = "Dimension Value".Code where("Dimension Code" = const('DEPARTMENT'));
        }
        field(39; "Balance Mode"; Option)
        {
            FieldClass = FlowFilter;
            OptionMembers = Increasing," Decreasing";
            //cc//  TableRelation = Table0;
        }
        field(40; "Main Loan Code"; Code[20])
        {
            //cc//    TableRelation = Table0;
        }
        field(41; Shares; Boolean)
        {
        }
        field(42; "Show on report"; Boolean)
        {
        }
        field(43; "Non-Interest Loan"; Boolean)
        {
        }
        field(44; "Exclude when on Leave"; Boolean)
        {
        }
        field(45; "Co-operative"; Boolean)
        {
        }
        field(46; "Total Shares"; Decimal)
        {
            CalcFormula = sum("Assignment Matrix-X".Amount where(Type = const(Deduction),
                                                                  Code = field(Code),
                                                                  "Employee No" = field("Employee Filter"),
                                                                  Shares = const(true)));
            FieldClass = FlowField;
        }
        field(47; Rate; Decimal)
        {
        }
        field(48; "PAYE Code"; Boolean)
        {
        }
        field(49; "Total Days"; Decimal)
        {
            FieldClass = Normal;
        }
        field(50; "Housing Earned Limit"; Decimal)
        {
        }
        field(51; "Pension Limit Percentage"; Decimal)
        {
        }
        field(52; "Pension Limit Amount"; Decimal)
        {
        }
        field(53; "Applies to All"; Boolean)
        {
        }
        field(54; "Show on Master Roll"; Boolean)
        {
        }
        field(55; "Pension Scheme Code"; Boolean)
        {
        }
        field(56; "Main Deduction Code"; Code[10])
        {
        }
        field(57; "Insurance Code"; Boolean)
        {
        }
        field(58; Block; Boolean)
        {
        }
        field(59; "Institution Code"; Code[20])
        {
            TableRelation = Institution;
        }
        field(60; "Reference Filter"; Code[20])
        {
            FieldClass = FlowFilter;
        }
        field(61; "Show on Payslip Information"; Boolean)
        {
        }
        field(62; "Voluntary Percentage"; Decimal)
        {
        }
        field(63; "Balance Type"; Option)
        {
            OptionCaption = ' ,Decreasing,Increasing';
            OptionMembers = " ",Decreasing,Increasing;
        }
        field(64; "Company Advance"; Boolean)
        {
        }
        field(65; "Advance Interest"; Decimal)
        {
            MaxValue = 100;
            MinValue = 0;
        }
        field(66; Statutory; Boolean)
        {
        }
        field(67; "Payroll Grouping Filter"; Option)
        {
            Editable = false;
            FieldClass = FlowFilter;
            OptionCaption = ' ,Guards,Admin,Management';
            OptionMembers = " ",Guards,Admin,Management;
        }
        field(68; "Branch Filter"; Code[20])
        {
            FieldClass = FlowFilter;
            TableRelation = "Dimension Value".Code where("Dimension Code" = const('BRANCH'));
        }
        field(69; "ProfitCtr Filter"; Code[20])
        {
            FieldClass = FlowFilter;
            TableRelation = "Dimension Value".Code where("Dimension Code" = const('PROFITCTR'));
        }
        field(70; "Country Filter"; Code[20])
        {
            FieldClass = FlowFilter;
            TableRelation = "Dimension Value".Code where("Dimension Code" = const('COUNTRY'));
        }
        field(71; "Region Filter"; Code[20])
        {
            FieldClass = FlowFilter;
            TableRelation = "Dimension Value".Code where("Dimension Code" = const('REGION'));
        }
        field(72; "Projects Filter"; Code[20])
        {
            FieldClass = FlowFilter;
            TableRelation = "Dimension Value".Code where("Dimension Code" = const('PROJECTS'));
        }
        field(80; "Rank Filter"; Option)
        {
            FieldClass = FlowFilter;
            OptionCaption = 'GUARD,SITE SUPERVISOR,DRIVER,DOG HANDLER,ADMIN,FIELD OFFICER,SENIOR GUARD,PREMIUM GUARD I,PREMIUM GUARD II,RIDER SUPERVISOR,CREW COMMANDER,CREW,BOOK CLERK,DOG MASTER,FIRE CREW,KENNEL ATTENDANT,CONTROLLER';
            OptionMembers = GUARD,"SITE SUPERVISOR",DRIVER,"DOG HANDLER",ADMIN,"FIELD OFFICER","SENIOR GUARD","PREMIUM GUARD I","PREMIUM GUARD II","RIDER SUPERVISOR","CREW COMMANDER",CREW,"BOOK CLERK","DOG MASTER","FIRE CREW","KENNEL ATTENDANT",CONTROLLER;
        }
        field(81; "Both Signs"; Boolean)
        {
        }
        field(82; "Account Type"; Option)
        {
            Caption = 'Account Type';
            OptionCaption = 'G/L Account,Customer,Vendor,Bank Account,Fixed Asset,IC Partner';
            OptionMembers = "G/L Account",Customer,Vendor,"Bank Account","Fixed Asset","IC Partner";
        }
        field(83; "Account No."; Code[20])
        {
            Caption = 'Account No.';
            TableRelation = if ("Account Type" = const("G/L Account")) "G/L Account"
            else if ("Account Type" = const(Customer)) Customer
            else if ("Account Type" = const(Vendor)) Vendor
            else if ("Account Type" = const("Bank Account")) "Bank Account"
            else if ("Account Type" = const("Fixed Asset")) "Fixed Asset"
            else if ("Account Type" = const("IC Partner")) "IC Partner";
        }
        field(84; "Loan?"; Boolean)
        {
        }
        field(85; "No of Entries"; Integer)
        {
            CalcFormula = count("Assignment Matrix-X" where(Type = const(Deduction),
                                                             Code = field(Code),
                                                             "Payroll Period" = field("Pay Period Filter")));
            FieldClass = FlowField;
        }
        field(86; "Total Closing Balance"; Decimal)
        {
            CalcFormula = sum("Assignment Matrix-X"."Closing Balance" where(Type = const(Deduction),
                                                                             Code = field(Code),
                                                                             "Posting Group Filter" = field("Posting Group Filter"),
                                                                             "Payroll Period" = field("Pay Period Filter"),
                                                                             "Employee No" = field("Employee Filter"),
                                                                             "Department Code" = field("Department Filter"),
                                                                             "Reference No" = field("Reference Filter"),
                                                                             "Payroll Grouping" = field("Payroll Grouping Filter"),
                                                                             Branch = field("Branch Filter"),
                                                                             "Profit Centre" = field("ProfitCtr Filter"),
                                                                             Rank = field("Rank Filter")));
            Editable = false;
            FieldClass = FlowField;
        }
        field(87; "Total Closing Balance Employer"; Decimal)
        {
            CalcFormula = sum("Assignment Matrix-X"."Closing Balance Company" where(Type = const(Deduction),
                                                                                     Code = field(Code),
                                                                                     "Payroll Period" = field("Pay Period Filter"),
                                                                                     "Posting Group Filter" = field("Posting Group Filter"),
                                                                                     "Department Code" = field("Department Filter"),
                                                                                     "Employee No" = field("Employee Filter"),
                                                                                     Branch = field("Country Filter"),
                                                                                     "Pay Point" = field("Projects Filter"),
                                                                                     "Staffing Group" = field("Region Filter")));
            FieldClass = FlowField;
        }
        field(89; SACCO; Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(50000; Reference; Code[100])
        {
            Description = '//Added By Brian on 20/04/16- Conso- Payrol Admin Requested as needed by Some Saccos';
        }
        field(50001; "OP Deduction"; Boolean)
        {
        }
        field(50002; "Deduct From Pension"; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(50003; "Calculate Excess Pension"; Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(50004; "Employer Pension"; Boolean)
        {
            DataClassification = ToBeClassified;
        }
    }

    keys
    {
        key(Key1; "Code")
        {
            Clustered = true;
        }
        key(Key2; "Show on report")
        {
        }
        key(Key3; "Exclude when on Leave")
        {
        }
        key(Key4; "Co-operative")
        {
        }
        key(Key5; Rate)
        {
        }
        key(Key6; Shares)
        {
        }
        key(Key7; Loan)
        {
        }
        key(Key8; "Pension Scheme Code")
        {
        }
        key(Key9; "Institution Code")
        {
        }
    }

    fieldgroups
    {
    }

    trigger OnDelete()
    begin
        TestField("Total Amount", 0);
    end;
}
