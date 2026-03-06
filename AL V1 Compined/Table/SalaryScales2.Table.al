#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Table 69158 "Salary Scales2"
{
    DrillDownPageID = "Salary pointers";
    LookupPageID = "Salary pointers";

    fields
    {
        field(1; Scale; Code[10])
        {
        }
        field(2; "Minimum Pointer"; Code[10])
        {
            TableRelation = "Salary Pointers2";
        }
        field(3; "Maximum Pointer"; Code[10])
        {
            TableRelation = "Salary Pointers2";
        }
        field(4; "Responsibility Allowance"; Decimal)
        {
        }
        field(5; "Commuter Allowance"; Decimal)
        {
        }
    }

    keys
    {
        key(Key1; Scale)
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}
