#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Table 69503 "Crm General Setup."
{

    fields
    {
        field(1; "Primary key"; Code[10])
        {
        }
        field(2; "Lead Nos"; Code[10])
        {
            TableRelation = "No. Series";
        }
        field(3; "General Enquiries Nos"; Code[10])
        {
            TableRelation = "No. Series";
        }
        field(4; "Cases nos"; Code[10])
        {
            TableRelation = "No. Series";
        }
        field(5; "Crm logs Nos"; Code[10])
        {
            TableRelation = "No. Series";
        }
        field(6; "Training Nos"; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "No. Series";
        }
        field(7; "Customer App Nos"; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "No. Series";
        }
        field(8; "Customer Feedback Nos"; Code[20])
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
