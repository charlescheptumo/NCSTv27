#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Table 70080 "Vendor Certificate Expiry"
{

    fields
    {
        field(1; "Entry No"; Integer)
        {
            AutoIncrement = true;
            DataClassification = ToBeClassified;
        }
        field(2; "Vendor No"; Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(3; "Certificate Type"; Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Procurement Document Type";
        }
        field(4; Description; Text[100])
        {
            DataClassification = ToBeClassified;
        }
        field(5; "Valid From"; Date)
        {
            DataClassification = ToBeClassified;
        }
        field(6; "Expiry Date"; Date)
        {
            DataClassification = ToBeClassified;
        }
        field(7; Blocked; Boolean)
        {
            DataClassification = ToBeClassified;
        }
    }

    keys
    {
        key(Key1; "Entry No", "Vendor No")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}
