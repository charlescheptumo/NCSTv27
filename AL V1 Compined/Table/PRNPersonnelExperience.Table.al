#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Table 70201 "PRN Personnel Experience"
{
    Caption = 'IFS Staff Min Experience';

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
        field(3; "Staff Role Code"; Code[50])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Project Role Code"."Project Role Code";
        }
        field(4; "Entry No"; Integer)
        {
            AutoIncrement = true;
            DataClassification = ToBeClassified;
        }
        field(5; "Experience Category"; Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = ',General Experience,Specialized Experience,Training Experience,No. of Handled Projects,Other Experience';
            OptionMembers = ,"General Experience","Specialized Experience","Training Experience","No. of Handled Projects","Other Experience";
        }
        field(6; "Minimum Years of Experience"; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(7; "Minimum Experience Req"; Text[100])
        {
            Caption = 'Minimum Experience Requirements';
            DataClassification = ToBeClassified;
        }
    }

    keys
    {
        key(Key1; "Document Type", "Document No.", "Staff Role Code", "Experience Category")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }

    var
        ProcurementSetup: Record "Procurement Setup";
        NoMgt: Codeunit "No. Series";
}
