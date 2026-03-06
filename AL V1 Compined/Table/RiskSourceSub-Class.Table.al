#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Table 80028 "Risk Source Sub-Class"
{

    fields
    {
        field(1; "Source Class ID"; Code[50])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Risk Categories";
        }
        field(2; "Code"; Integer)
        {
            AutoIncrement = true;
            DataClassification = ToBeClassified;
        }
        field(3; Description; Text[255])
        {
            DataClassification = ToBeClassified;
        }
    }

    keys
    {
        key(Key1; "Source Class ID")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}
