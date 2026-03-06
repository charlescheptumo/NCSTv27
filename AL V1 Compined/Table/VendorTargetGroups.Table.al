#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Table 70009 "Vendor Target Groups"
{
    DrillDownPageID = "Vendor Target Groups";
    LookupPageID = "Vendor Target Groups";

    fields
    {
        field(1; "Code"; Code[20])
        {
        }
        field(2; Description; Text[60])
        {
        }
        field(3; Blocked; Boolean)
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
