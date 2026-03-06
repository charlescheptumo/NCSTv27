#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Table 70168 "Bid Equipment Specification"
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
            Caption = 'No';
            DataClassification = ToBeClassified;
            TableRelation = "Purchase Header"."No.";
        }
        field(3; "Equipment Type Code"; Code[60])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Works Equipment Type".Code;
        }
        field(4; "Entry No"; Integer)
        {
            AutoIncrement = true;
            DataClassification = ToBeClassified;
        }
        field(5; "Ownership Type"; Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = ',Owned,Leased,Purchase Proposal';
            OptionMembers = ,Owned,Leased,"Purchase Proposal";
        }
        field(6; "Equipment Serial"; Code[50])
        {
            Caption = 'Equipment Serial/Registration No.';
            DataClassification = ToBeClassified;
            Description = 'Equipment Serial/Registration No.';
        }
        field(7; "Equipment Usability Code"; Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = ',Excellent,Good,Fair,Beyond  Useful Life';
            OptionMembers = ,Excellent,Good,Fair,"Beyond  Useful Life";
        }
        field(8; "Equipment Condition Code"; Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = ',New Eqpm,Reconditioned Eqpm,Serviced Eqpm';
            OptionMembers = ,"New Eqpm","Reconditioned Eqpm","Serviced Eqpm";
        }
        field(9; "Qty of Equipment"; Decimal)
        {
            DataClassification = ToBeClassified;
            Editable = true;
        }
        field(10; Description; Text[100])
        {
            DataClassification = ToBeClassified;
        }
        field(11; Blocked; Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(12; "Years of Previous Use"; Decimal)
        {
            DataClassification = ToBeClassified;
        }
    }

    keys
    {
        key(Key1; "Document Type", "No.", "Equipment Type Code")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}
