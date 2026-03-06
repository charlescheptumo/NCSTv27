#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Table 80023 "Situational Analysis Aspects"
{

    fields
    {
        field(1; "Analysis Model ID"; Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Situational Analysis Model";
        }
        field(2; Perspective; Code[100])
        {
            DataClassification = ToBeClassified;
        }
        field(3; Description; Text[255])
        {
            DataClassification = ToBeClassified;
        }
    }

    keys
    {
        key(Key1; "Analysis Model ID", Perspective)
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}
