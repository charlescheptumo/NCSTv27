#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Table 70112 "Vendor Special Group Entry"
{

    fields
    {
        field(1; "Certifcate No"; Code[30])
        {
            DataClassification = ToBeClassified;
        }
        field(2; "Vendor No"; Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = Vendor."No.";
        }
        field(3; "Vendor Category"; Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Special Vendor Category".Code;
        }
        field(4; "Certifying Agency"; Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = Contact;
        }
        field(5; "Products/Service Category"; Text[50])
        {
            DataClassification = ToBeClassified;
        }
        field(6; "Certificate Expiry Date"; Date)
        {
            DataClassification = ToBeClassified;
        }
        field(7; "Effective Date"; Date)
        {
            DataClassification = ToBeClassified;
        }
        field(8; "End Date"; Date)
        {
            DataClassification = ToBeClassified;
        }
        field(9; Blocked; Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(10; EntryNo; Integer)
        {
            AutoIncrement = true;
            DataClassification = ToBeClassified;
        }
        field(11; "Registered Special Group"; Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Special Vendor Category".Code;
        }
    }

    keys
    {
        key(Key1; "Certifcate No", "Vendor No")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}
