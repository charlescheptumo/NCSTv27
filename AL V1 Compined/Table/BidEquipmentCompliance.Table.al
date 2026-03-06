#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Table 70167 "Bid Equipment Compliance"
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
        field(2; "No."; Code[20])
        {
            Caption = 'Entry No.';
            DataClassification = ToBeClassified;
            TableRelation = "Purchase Header"."No.";
        }
        field(3; "Equipment Type Code"; Code[60])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Works Equipment Type".Code;
        }
        field(4; Description; Text[100])
        {
            DataClassification = ToBeClassified;
        }
        field(5; "Total No. of Equipment"; Decimal)
        {
            DataClassification = ToBeClassified;
            Description = 'Un-editable field that sums up the number of equipment defined on the Bid Equipment Ownership Table';
            Editable = false;
        }
        field(6; Blocked; Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(7; "Requirement Type"; Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = 'Mandatory,Optional';
            OptionMembers = Mandatory,Optional;
        }
        field(8; "Minimum Required Quantity"; Integer)
        {
            DataClassification = ToBeClassified;
        }
        field(9; "Actual Owned Quantity"; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(10; "Actual Leased Equipment"; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(11; "Total Owned/Leased Quantity"; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(12; "Compliance Check"; Text[50])
        {
            DataClassification = ToBeClassified;
        }
        field(13; "Equipment Counter"; Integer)
        {
            AutoIncrement = true;
            DataClassification = ToBeClassified;
        }
    }

    keys
    {
        key(Key1; "Document Type", "No.", "Equipment Type Code", "Equipment Counter")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}
