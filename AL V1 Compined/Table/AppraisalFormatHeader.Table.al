#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Table 69162 "Appraisal Format Header"
{
    DrillDownPageID = "HR Lookup Values Factbox";
    LookupPageID = "HR Lookup Values Factbox";

    fields
    {
        field(1; Header; Text[50])
        {
        }
        field(2; Priority; Integer)
        {
        }
    }

    keys
    {
        key(Key1; Header)
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}
