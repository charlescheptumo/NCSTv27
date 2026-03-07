#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Table 69150 "Ethnic Background"
{

    fields
    {
        field(1;"Code";Code[10])
        {
            DataClassification = ToBeClassified;
        }
        field(2;"Ethnic group";Text[50])
        {
            DataClassification = ToBeClassified;
        }
    }

    keys
    {
        key(Key1;"Code","Ethnic group")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

