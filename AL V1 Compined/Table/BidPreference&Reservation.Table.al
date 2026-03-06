#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Table 70210 "Bid Preference & Reservation"
{

    fields
    {
        field(1; "Document Type"; Option)
        {
            Caption = 'Document Type';
            DataClassification = ToBeClassified;
            OptionCaption = 'Quote,Order,Invoice,Credit Memo,Blanket Order,Return Order,Store Requisition,Purchase Requisition,,,,,,IEC Materials';
            OptionMembers = Quote,"Order",Invoice,"Credit Memo","Blanket Order","Return Order","Store Requisition","Purchase Requisition",,,,,,"IEC Materials";
        }
        field(2; "Document No."; Code[20])
        {
            Caption = 'Document No';
            DataClassification = ToBeClassified;
            TableRelation = "Purchase Header"."No.";
        }
        field(3; "Vendor No."; Code[20])
        {
            Caption = 'Vendor No.';
            DataClassification = ToBeClassified;
            TableRelation = Vendor;
        }
        field(4; "AGPO Certificate No"; Code[30])
        {
            DataClassification = ToBeClassified;
        }
        field(5; "Registered Special Group"; Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Special Vendor Category".Code;
        }
        field(6; "Products/Service Category"; Text[80])
        {
            DataClassification = ToBeClassified;
        }
        field(7; "Certificate Effective Date"; Date)
        {
            DataClassification = ToBeClassified;
        }
        field(8; "Certificate Expiry Date"; Date)
        {
            DataClassification = ToBeClassified;
        }
        field(9; "Certifying Agency"; Text[50])
        {
            DataClassification = ToBeClassified;
        }
        field(10; Blocked; Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(11; "Entry No"; Integer)
        {
            AutoIncrement = true;
            DataClassification = ToBeClassified;
        }
    }

    keys
    {
        key(Key1; "Document Type", "Entry No", "Vendor No.")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}
