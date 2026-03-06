#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Table 69026 "Regional Rates"
{
    DrillDownPageID = "Regional Rates List";
    LookupPageID = "Regional Rates List";

    fields
    {
        field(1; "Code"; Code[20])
        {
        }
        field(2; Description; Text[100])
        {
        }
        field(3; "Night Allowance Rate"; Decimal)
        {
        }
        field(4; "Guards Wages Daily Rate"; Decimal)
        {
        }
        field(5; "Drivers Wages Daily Rate"; Decimal)
        {
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
