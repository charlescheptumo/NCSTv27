#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Table 70097 "Proc Regulation Version"
{

    fields
    {
        field(1; "Version Code"; Code[10])
        {
            DataClassification = ToBeClassified;
        }
        field(2; "Primary Document No"; Code[10])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Procurement Law & Regulation".Code;
        }
        field(3; "External Document No"; Code[10])
        {
            DataClassification = ToBeClassified;
        }
        field(4; Description; Text[30])
        {
            DataClassification = ToBeClassified;
        }
        field(5; "Effective Date"; Date)
        {
            DataClassification = ToBeClassified;
        }
    }

    keys
    {
        key(Key1; "Version Code")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}
