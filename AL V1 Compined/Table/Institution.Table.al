#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Table 69022 Institution
{
    // DrillDownPageID = UnknownPage69018;
    //LookupPageID = UnknownPage69018;

    fields
    {
        field(1; "Code"; Code[20])
        {
            NotBlank = true;
        }
        field(2; Name; Text[30])
        {
        }
        field(3; Address; Text[30])
        {
        }
        field(4; City; Text[30])
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
