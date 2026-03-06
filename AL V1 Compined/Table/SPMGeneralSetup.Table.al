#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Table 80021 "SPM General Setup"
{

    fields
    {
        field(1; "Primary key"; Code[10])
        {
            DataClassification = ToBeClassified;
        }
        field(2; "Corp Strategic Plan Nos"; Code[50])
        {
            DataClassification = ToBeClassified;
            TableRelation = "No. Series";
        }
        field(3; "Work Plan Nos"; Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = "No. Series";
        }
    }

    keys
    {
        key(Key1; "Primary key")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}
