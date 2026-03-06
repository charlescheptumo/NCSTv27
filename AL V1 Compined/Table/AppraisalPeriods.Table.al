#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Table 69145 "Appraisal Periods"
{
    //// DrillDownPageID = UnknownPage69185;
    //  //LookupPageID = UnknownPage69185;

    fields
    {
        field(1; Period; Code[30])
        {
            NotBlank = true;
        }
        field(2; Comments; Text[250])
        {
        }
    }

    keys
    {
        key(Key1; Period)
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}
