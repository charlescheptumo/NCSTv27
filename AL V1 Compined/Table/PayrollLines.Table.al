#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Table 69031 "Payroll Lines"
{

    fields
    {
        field(1; "Line No"; Integer)
        {
            AutoIncrement = true;
        }
        field(2; "Personal No."; Code[20])
        {
        }
        field(3; "Employee Name"; Text[60])
        {
        }
        field(4; "Basic Salary"; Decimal)
        {
        }
        field(5; "Basic Arrears"; Decimal)
        {
        }
        field(6; "Gross Pay"; Decimal)
        {
        }
        field(7; "Total Deduction"; Decimal)
        {
        }
        field(8; Netpay; Decimal)
        {
        }
        field(9; "Payroll Header"; Code[20])
        {
        }
        field(10; "Payroll Period"; Date)
        {
        }
        field(11; "Payroll Group"; Text[30])
        {
        }
    }

    keys
    {
        key(Key1; "Line No", "Payroll Header")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}
