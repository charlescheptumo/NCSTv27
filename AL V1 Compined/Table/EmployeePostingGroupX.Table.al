#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Table 69007 "Employee Posting GroupX"
{
    DataCaptionFields = "Code", Description;
    LookupPageID = "Employee Posting Group List";

    fields
    {
        field(1; "Code"; Code[20])
        {
            NotBlank = true;
        }
        field(2; Description; Text[50])
        {
        }
        field(3; "Salary Account"; Code[10])
        {
            TableRelation = "G/L Account";
        }
        field(4; "Income Tax Account"; Code[10])
        {
            TableRelation = "G/L Account";
        }
        field(5; "SSF Employer Account"; Code[10])
        {
            TableRelation = "G/L Account";
        }
        field(6; "SSF Employee Account"; Code[10])
        {
            TableRelation = "G/L Account";
        }
        field(7; "Net Salary Payable"; Code[10])
        {
            TableRelation = "G/L Account";
        }
        field(8; "Operating Overtime"; Code[10])
        {
            TableRelation = "G/L Account";
        }
        field(9; "Tax Relief"; Code[10])
        {
            TableRelation = "G/L Account";
        }
        field(10; "Employee Provident Fund Acc."; Code[10])
        {
            TableRelation = "G/L Account";
        }
        field(11; "Pay Period Filter"; Date)
        {
            FieldClass = FlowFilter;
            TableRelation = "Payroll PeriodX";
        }
        field(12; "Pension Employer Acc"; Code[10])
        {
            TableRelation = "G/L Account";
        }
        field(13; "Pension Employee Acc"; Code[10])
        {
        }
        field(14; "Earnings and deductions"; Code[10])
        {
        }
        field(15; "Daily Salary"; Decimal)
        {
            FieldClass = Normal;
        }
        field(16; "Normal Overtime"; Decimal)
        {
            FieldClass = Normal;
        }
        field(17; "Weekend Overtime"; Decimal)
        {
            FieldClass = Normal;
        }
        field(18; "Enterprise Filter"; Code[20])
        {
            FieldClass = FlowFilter;
            TableRelation = "Dimension Value".Code where("Global Dimension No." = const(1));
        }
        field(19; "Activity Filter"; Code[20])
        {
            FieldClass = FlowFilter;
            TableRelation = "Dimension Value".Code where("Global Dimension No." = const(2));
        }
        field(20; "Date Filter"; Date)
        {
            FieldClass = FlowFilter;
        }
        field(21; Seasonals; Boolean)
        {
        }
        field(22; "Overtime Base Hrs"; Decimal)
        {
        }
        field(23; "Guards Wages Daily Rate"; Decimal)
        {
        }
        field(24; "Drivers Wages Daily Rate"; Decimal)
        {
        }
        field(25; "Monthly Working Days"; Decimal)
        {
        }
        field(26; "Interest on advance rate"; Decimal)
        {
        }
        field(27; "Payroll Group"; Option)
        {
            OptionCaption = ' ,Guards,Admin,Management';
            OptionMembers = " ",Guards,Admin,Management;
        }
        field(28; "Payslip Message"; Text[250])
        {
        }
        field(29; "Annual Leave Days"; Decimal)
        {
        }
        field(30; "Account Type"; Option)
        {
            Caption = 'Account Type';
            OptionCaption = 'G/L Account,Customer,Vendor,Bank Account,Fixed Asset,IC Partner';
            OptionMembers = "G/L Account",Customer,Vendor,"Bank Account","Fixed Asset","IC Partner";
        }
        field(31; "Account No."; Code[20])
        {
            Caption = 'Account No.';
            TableRelation = if ("Account Type" = const("G/L Account")) "G/L Account"
            else if ("Account Type" = const(Customer)) Customer
            else if ("Account Type" = const(Vendor)) Vendor
            else if ("Account Type" = const("Bank Account")) "Bank Account"
            else if ("Account Type" = const("Fixed Asset")) "Fixed Asset"
            else if ("Account Type" = const("IC Partner")) "IC Partner";
        }
        field(32; "Gratuity Code"; Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = EarningsX.Code;
        }
    }

    keys
    {
        key(Key1; "Code")
        {
            Clustered = true;
        }
        key(Key2; "Earnings and deductions")
        {
        }
    }

    fieldgroups
    {
    }
}
