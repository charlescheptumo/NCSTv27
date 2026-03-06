#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Table 69117 "Medical Information"
{
    // DrillDownPageID = UnknownPage69142;
    //LookupPageID = UnknownPage69142;

    fields
    {
        field(1; Description; Code[50])
        {
        }
        field(2; Remarks; Text[200])
        {
        }
    }

    keys
    {
        key(Key1; Description)
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}
