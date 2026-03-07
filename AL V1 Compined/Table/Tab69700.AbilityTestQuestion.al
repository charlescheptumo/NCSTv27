#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Table 69700 "Ability Test Question"
{

    fields
    {
        field(1;"Test ID";Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Ability Test";
        }
        field(2;"Question ID";Code[30])
        {
            DataClassification = ToBeClassified;
        }
        field(3;Question;Text[2000])
        {
            DataClassification = ToBeClassified;
        }
    }

    keys
    {
        key(Key1;"Test ID","Question ID")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

