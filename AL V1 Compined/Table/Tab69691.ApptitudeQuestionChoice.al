#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Table 69691 "Apptitude Question Choice"
{

    fields
    {
        field(1;"Entry No.";Integer)
        {
            AutoIncrement = true;
            DataClassification = ToBeClassified;
        }
        field(2;"Apptitude Question";Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Apptitude Question";
        }
        field(3;"Choice ID";Code[30])
        {
            DataClassification = ToBeClassified;
        }
        field(4;Description;Blob)
        {
            DataClassification = ToBeClassified;
        }
    }

    keys
    {
        key(Key1;"Entry No.")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

