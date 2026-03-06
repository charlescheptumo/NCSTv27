#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Table 70170 "Bid Insurance"
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
        field(3; "Insurance Type"; Code[20])
        {
            Caption = 'Insurance Type';
            DataClassification = ToBeClassified;
            Description = 'Submitted Bid Security Form/Type';
            TableRelation = "Insurance Type".Code;
        }
        field(4; "Policy Cover Type"; Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = 'Third Party,Comprehensive';
            OptionMembers = "Third Party",Comprehensive;
        }
        field(5; Description; Text[100])
        {
            DataClassification = ToBeClassified;
        }
        field(6; "Policy Start Date"; Date)
        {
            DataClassification = ToBeClassified;
        }
        field(7; "Policy Expiry Date"; Date)
        {
            DataClassification = ToBeClassified;
        }
        field(8; "Issuer Insurance Name"; Text[50])
        {
            DataClassification = ToBeClassified;
        }
        field(9; "Insurance Address"; Text[50])
        {
            DataClassification = ToBeClassified;
        }
        field(10; "Policy No."; Code[10])
        {
            DataClassification = ToBeClassified;
        }
        field(11; "Policy Coverage (LCY)"; Decimal)
        {
            Caption = 'Bid Security Validity Expiry Date';
            DataClassification = ToBeClassified;
            Description = 'Bid Security Validity Expiry Date';
        }
    }

    keys
    {
        key(Key1; "Document Type", "No.", "Insurance Type")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}
