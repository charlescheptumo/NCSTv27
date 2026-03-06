#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Table 70095 "Solictation Procurement Type"
{

    fields
    {
        field(1; "Solicitation Type"; Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Solicitation Type".Code;
        }
        field(2; "Procument Type"; Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Procurement Types".Code;
        }
        field(3; "Strict Purchase Limits"; Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(4; "Min Purchase Value (LCY)"; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(5; "Max Purchase Value (LCY)"; Decimal)
        {
            DataClassification = ToBeClassified;
        }
    }

    keys
    {
        key(Key1; "Solicitation Type", "Procument Type")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}
