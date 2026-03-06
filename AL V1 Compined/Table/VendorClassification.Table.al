#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Table 70072 "Vendor Classification"
{

    fields
    {
        field(1; "Vendor No"; Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(2; "Vendor Category"; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Special Vendor Category".Code;
        }
        field(3; "Certifying Agency"; Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(4; "Certifcate No"; Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(5; "Certificate Expiry Date"; Date)
        {
            DataClassification = ToBeClassified;
        }
        field(6; "Effective Date"; Date)
        {
            DataClassification = ToBeClassified;
        }
        field(7; "End Date"; Date)
        {
            DataClassification = ToBeClassified;
        }
        field(8; Blocked; Boolean)
        {
            DataClassification = ToBeClassified;
        }
    }

    keys
    {
        key(Key1; "Vendor No", "Vendor Category")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}
