#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Table 70202 "PRN Equipment Specification"
{

    fields
    {
        field(1; "Document Type"; Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = 'Quote,Order,Invoice,Credit Memo,Blanket Order,Return Order,Store Requisition,Purchase Requisition,,,,,,IEC Materials';
            OptionMembers = Quote,"Order",Invoice,"Credit Memo","Blanket Order","Return Order","Store Requisition","Purchase Requisition",,,,,,"IEC Materials";
        }
        field(2; "Document No."; Code[50])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Purchase Header"."No.";
        }
        field(3; "Equipment Type"; Code[60])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Works Equipment Type".Code;
        }
        field(4; Category; Code[50])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Works Equipment Category".Code;
        }
        field(5; Description; Text[100])
        {
            DataClassification = ToBeClassified;
        }
        field(6; "Minimum Required Qty"; Decimal)
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
        key(Key1; "Document Type", "Document No.", "Equipment Type")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}
