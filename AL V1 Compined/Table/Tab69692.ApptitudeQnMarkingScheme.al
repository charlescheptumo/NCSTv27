#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Table 69692 "Apptitude Qn Marking Scheme"
{

    fields
    {
        field(1;"Question ID";Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Apptitude Question";
        }
        field(2;"Correct Choice ID";Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Apptitude Question Choice";
        }
        field(3;Explanation;Blob)
        {
            DataClassification = ToBeClassified;
        }
    }

    keys
    {
        key(Key1;"Question ID")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

