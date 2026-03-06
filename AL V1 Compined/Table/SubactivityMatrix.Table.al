#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Table 59061 "Subactivity Matrix"
{

    fields
    {
        field(1; "Activity Code"; Code[100])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Strategic Activities";
        }
        field(2; Subactivity; Text[250])
        {
            DataClassification = ToBeClassified;
        }
    }

    keys
    {
        key(Key1; "Activity Code")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}
