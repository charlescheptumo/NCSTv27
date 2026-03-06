#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Table 69012 "Repayment Schedule"
{

    fields
    {
        field(1; "Loan No"; Code[20])
        {
        }
        field(2; "Employee No"; Code[20])
        {
        }
        field(3; "Repayment Date"; Date)
        {
        }
        field(4; "Loan Amount"; Decimal)
        {
        }
        field(5; "Interest Rate"; Decimal)
        {
        }
        field(6; "Loan Category"; Code[20])
        {
        }
        field(7; "Monthly Repayment"; Decimal)
        {
        }
        field(8; "Employee Name"; Text[100])
        {
        }
        field(9; "Monthly Interest"; Decimal)
        {
        }
        field(10; "Principal Repayment"; Decimal)
        {
        }
        field(11; "Instalment No"; Integer)
        {
        }
        field(12; "Remaining Debt"; Decimal)
        {
        }
        field(13; "Payroll Group"; Code[20])
        {
        }
        field(14; Paid; Boolean)
        {
        }
    }

    keys
    {
        key(Key1; "Loan No", "Employee No", "Repayment Date")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}
