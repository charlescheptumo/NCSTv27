#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Table 59057 "Planning Setups"
{

    fields
    {
        field(1; No; Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(2; "No. Series"; Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(3; "Planning Nos"; Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = "No. Series";
        }
    }

    keys
    {
        key(Key1; No)
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}
