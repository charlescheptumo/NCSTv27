#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Table 65008 "Research Output Subcategories"
{

    fields
    {
        field(1; "Code"; Code[30])
        {
            DataClassification = ToBeClassified;
        }
        field(2; Category; Code[50])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Research Output Categories";
        }
        field(3; Descriptions; Text[100])
        {
            DataClassification = ToBeClassified;
        }
        field(4; Blocked; Boolean)
        {
            DataClassification = ToBeClassified;
        }
    }

    keys
    {
        key(Key1; "Code", Category)
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}
