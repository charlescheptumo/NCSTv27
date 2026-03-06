#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Table 69053 "Director Deductions"
{
    DataCaptionFields = "Code", Description;
    DrillDownPageID = "Director Deduction";
    LookupPageID = "Director Deduction";

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
            OptionCaption = 'Recurring,Non-recurring';
            OptionMembers = Recurring,"Non-recurring";
        }
        field(6; "Tax deductible"; Boolean)
        {
        }
        field(7; "Start date"; Date)
        {
        }
        field(8; "End Date"; Date)
        {
        }
        field(9; Percentage; Decimal)
        {
        }
        field(10; "Calculation Method"; Option)
        {
            OptionCaption = 'Flat Amount,% of Basic Pay,Based on Table,Based on Hourly Rate,Based on Daily Rate ,% of Gross Pay,% of Basic Pay+Hse Allowance';
            OptionMembers = "Flat Amount","% of Basic Pay","Based on Table","Based on Hourly Rate","Based on Daily Rate ","% of Gross Pay","% of Basic Pay+Hse Allowance";
        }
        field(11; "G/L Account"; Code[10])
        {
            TableRelation = "G/L Account";
        }
        field(12; "Flat Amount"; Decimal)
        {
        }
        field(13; "Total Amount"; Decimal)
        {
            CalcFormula = sum("Director Ledger Entry".Amount where(Type = const(Deduction),
                                                                    Code = field(Code),
                                                                    "Posting Group Filter" = field("Posting Group Filter"),
                                                                    "Payroll Period" = field("Pay Period Filter"),
                                                                    "Director No" = field("Director Filter"),
                                                                    "Department Code" = field("Department Filter")));
            Editable = false;
            FieldClass = FlowField;
        }
        field(14; "Date Filter"; Date)
        {
        }
        field(15; "Posting Group Filter"; Code[200])
        {
            FieldClass = FlowFilter;
            TableRelation = "Vendor Posting Group";
        }
        field(16; Loan; Boolean)
        {
        }
        field(17; "Maximum Amount"; Decimal)
        {
        }
        field(18; "Pay Period Filter"; Date)
        {
            FieldClass = FlowFilter;
            TableRelation = "Payroll PeriodX";
        }
        field(19; "Pension Scheme"; Boolean)
        {
        }
        field(20; "Deduction Table"; Code[10])
        {
            TableRelation = "Bracket Tablesx";
        }
        field(21; "G/L Account Employer"; Code[10])
        {
            TableRelation = "G/L Account";
        }
        field(22; "Percentage Employer"; Decimal)
        {
        }
        field(23; "Minimum Amount"; Decimal)
        {
        }
        field(24; "Flat Amount Employer"; Decimal)
        {
        }
        field(26; "Show Balance"; Boolean)
        {
        }
        field(27; CoinageRounding; Boolean)
        {
        }
        field(28; "Director Filter"; Code[20])
        {
            FieldClass = FlowFilter;
            TableRelation = Vendor;
        }
        field(29; "Opening Balance"; Decimal)
        {
            CalcFormula = sum("Director Ledger Entry"."Opening Balance" where(Type = const(Deduction),
                                                                               Code = field(Code),
                                                                               "Director No" = field("Director Filter")));
            FieldClass = FlowField;
        }
        field(30; "Department Filter"; Code[20])
        {
            FieldClass = FlowFilter;
            TableRelation = "Dimension Value".Code where("Dimension Code" = const('DEPARTMENT'));
        }
        field(31; "Show on report"; Boolean)
        {
        }
        field(32; "PAYE Code"; Boolean)
        {
        }
        field(33; "Applies to All"; Boolean)
        {
        }
        field(34; "Show on Master Roll"; Boolean)
        {
        }
        field(35; "Insurance Code"; Boolean)
        {
        }
        field(36; Block; Boolean)
        {
        }
        field(37; "Institution Code"; Code[20])
        {
            TableRelation = Institution;
        }
        field(38; "Show on Payslip Information"; Boolean)
        {
        }
        field(39; Statutory; Boolean)
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
        field(85; "No of Entries"; Integer)
        {
            CalcFormula = count("Assignment Matrix-X" where(Type = const(Deduction),
                                                             Code = field(Code),
                                                             "Payroll Period" = field("Pay Period Filter")));
            FieldClass = FlowField;
        }
    }

    keys
    {
        key(Key1; "Code")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}
