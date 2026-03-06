#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Table 70148 "IFS Required Equipment"
{

    fields
    {
        field(1; "Document No"; Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Standard Purchase Code";
        }
        field(2; "Equipment Type Code"; Code[60])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Works Equipment Type".Code;
        }
        field(3; Description; Text[100])
        {
            DataClassification = ToBeClassified;
        }
        field(4; Category; Code[50])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Works Equipment Category".Code;
        }
        field(5; "Minimum Required Qty"; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(6; Blocked; Boolean)
        {
            DataClassification = ToBeClassified;
        }
    }

    keys
    {
        key(Key1; "Document No", "Equipment Type Code")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}
