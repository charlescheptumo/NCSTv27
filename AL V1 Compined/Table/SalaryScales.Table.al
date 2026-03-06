#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Table 69015 "Salary Scales"
{
    DrillDownPageID = "Salary Scale List";
    LookupPageID = "Salary Scale List";

    fields
    {
        field(1; Scale; Code[10])
        {
        }
        field(2; "Minimum Pointer"; Code[10])
        {
            TableRelation = "Salary Pointers"."Salary Pointer" where("Salary Scale" = field(Scale));
        }
        field(3; "Maximum Pointer"; Code[10])
        {
            TableRelation = "Salary Pointers"."Salary Pointer" where("Salary Scale" = field(Scale));
        }
        field(4; "Responsibility Allowance"; Decimal)
        {
        }
        field(5; "Commuter Allowance"; Decimal)
        {
        }
        field(6; "In Patient Limit"; Decimal)
        {
        }
        field(7; "Out Patient Limit"; Decimal)
        {
        }
        field(8; Description; Text[50])
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
