#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Table 70171 "Bid Filed Document"
{

    fields
    {
        field(1; "Entry No"; Integer)
        {
            AutoIncrement = true;
            DataClassification = ToBeClassified;
        }
        field(2; "Document Type"; Option)
        {
            Caption = 'Document Type';
            DataClassification = ToBeClassified;
            OptionCaption = 'Quote,Order,Invoice,Credit Memo,Blanket Order,Return Order,Store Requisition,Purchase Requisition,,,,,,IEC Materials';
            OptionMembers = Quote,"Order",Invoice,"Credit Memo","Blanket Order","Return Order","Store Requisition","Purchase Requisition",,,,,,"IEC Materials";
        }
        field(3; "No."; Code[20])
        {
            Caption = 'No.';
            DataClassification = ToBeClassified;
        }
        field(4; "Date Filed"; Date)
        {
            DataClassification = ToBeClassified;
        }
        field(5; "Vendor No"; Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = Vendor;
        }
        field(6; "Procurement Document Type ID"; Code[30])
        {
            DataClassification = ToBeClassified;
            Description = 'Linked to Procurement Document Type table';
            TableRelation = "Procurement Document Type".Code;
        }
        field(7; Description; Text[250])
        {
            DataClassification = ToBeClassified;
        }
        field(8; "Certificate No."; Code[30])
        {
            Caption = 'External Document/Certificate No.';
            DataClassification = ToBeClassified;
            Description = 'External Document/Certificate No.';
        }
        field(9; "Issue Date"; Date)
        {
            DataClassification = ToBeClassified;
        }
        field(10; "Expiry Date"; Date)
        {
            DataClassification = ToBeClassified;
        }
        field(11; "File Name"; Text[100])
        {
            Caption = 'Specialized Provider Requirement';
            DataClassification = ToBeClassified;
        }
        field(12; "File Type"; Text[30])
        {
            DataClassification = ToBeClassified;
        }
        field(13; "File Extension"; Text[30])
        {
            DataClassification = ToBeClassified;
        }
        field(14; "Procurement Process"; Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = ',Registration,EOI Response,RFQ Response,ITT Response,Negotiations/Contract,Transactional';
            OptionMembers = ,Registration,"EOI Response","RFQ Response","ITT Response","Negotiations/Contract",Transactional;
        }
        field(15; DocumentLink; Text[250])
        {
            DataClassification = ToBeClassified;
            ExtendedDatatype = URL;
        }
        field(16; "Evaluation Type"; Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = ' ,Technical,Financial';
            OptionMembers = " ",Technical,Financial;
        }
    }

    keys
    {
        key(Key1; "Entry No", "Vendor No", "No.")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}
