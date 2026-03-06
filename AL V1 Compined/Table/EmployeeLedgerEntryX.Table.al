#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Table 69001 "Employee Ledger EntryX"
{
    // DrillDownPageID = UnknownPage69010;
    //LookupPageID = UnknownPage69010;

    fields
    {
        field(1; Loan; Code[10])
        {
            TableRelation = DeductionsX;
        }
        field(2; Employee; Code[20])
        {
            NotBlank = true;
            TableRelation = DeductionsX;
        }
        field(3; "Repayment Date"; Date)
        {
        }
        field(4; Amount; Decimal)
        {
        }
        field(5; "Principal Amount"; Decimal)
        {
        }
        field(6; "Outstanding Amount"; Decimal)
        {
        }
        field(7; Type; Date)
        {
        }
        field(8; Description; Text[80])
        {
        }
        field(9; "Basic Pay"; Decimal)
        {
        }
        field(10; "Income Tax"; Decimal)
        {
        }
        field(11; "Payroll Period"; Date)
        {
            NotBlank = true;
        }
        field(12; "Net Pay"; Decimal)
        {
        }
        field(13; Quarters; Decimal)
        {
        }
        field(14; BfMpr; Decimal)
        {
        }
        field(15; "Posting Group"; Code[10])
        {
            TableRelation = DeductionsX;
        }
        field(16; "Department Code"; Code[10])
        {
            TableRelation = "Dimension Value".Code where("Global Dimension No." = const(1));
        }
    }

    keys
    {
        key(Key1; Employee, "Payroll Period", "Net Pay")
        {
            Clustered = true;
            SumIndexFields = "Basic Pay", "Income Tax", "Net Pay", Quarters, BfMpr;
        }
        key(Key2; "Posting Group")
        {
            SumIndexFields = "Basic Pay", "Income Tax", "Net Pay", Quarters, BfMpr;
        }
        key(Key3; "Department Code")
        {
            SumIndexFields = "Basic Pay", "Income Tax", "Net Pay", Quarters, BfMpr;
        }

    }

    fieldgroups
    {
    }

    trigger OnDelete()
    begin
        //ERROR('Cannot delete entries for previous periods');
    end;

    trigger OnModify()
    begin
        Error('Cannot modify entries for previous periods');
    end;
}

