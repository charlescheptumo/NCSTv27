#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Table 80024 "Situational Analysis Matrix"
{

    fields
    {
        field(1; "Code"; Code[50])
        {
            DataClassification = ToBeClassified;
        }
        field(2; "Strategy Plan ID"; Code[100])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Corporate Strategic Plans";
        }
        field(3; "Situational Analysis Model"; Code[100])
        {
            DataClassification = ToBeClassified;
        }
        field(4; Description; Text[255])
        {
            DataClassification = ToBeClassified;
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
