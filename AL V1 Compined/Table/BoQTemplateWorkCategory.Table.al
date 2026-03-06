#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Table 70138 "BoQ Template Work Category"
{

    fields
    {
        field(1; "BoQ Template Code"; Code[50])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Purchase Requisition Template";
        }
        field(2; "Works Category Code"; Code[50])
        {
            DataClassification = ToBeClassified;
        }
        field(3; Description; Text[100])
        {
            DataClassification = ToBeClassified;
        }
    }

    keys
    {
        key(Key1; "BoQ Template Code", "Works Category Code")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}
