#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Table 69161 "Appraisal Performance"
{

    fields
    {
        field(1; No; Integer)
        {
        }
        field(2; Competence; Text[50])
        {
        }
        field(3; "Appraisers Remarks"; Text[250])
        {
        }
        field(4; "Appraisee Remarks"; Text[250])
        {
        }
    }

    keys
    {
        key(Key1; No)
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}
