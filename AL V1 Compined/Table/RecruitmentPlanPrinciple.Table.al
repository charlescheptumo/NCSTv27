#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Table 69614 "Recruitment Plan Principle"
{

    fields
    {
        field(1;"Recruitment Plan ID";Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Recruitment Plan";
        }
        field(2;"Guiding Principle ID";Integer)
        {
            AutoIncrement = true;
            DataClassification = ToBeClassified;
        }
        field(3;Description;Text[250])
        {
            DataClassification = ToBeClassified;
        }
    }

    keys
    {
        key(Key1;"Recruitment Plan ID","Guiding Principle ID")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

