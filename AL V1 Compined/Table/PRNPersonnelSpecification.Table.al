#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Table 70199 "PRN Personnel Specification"
{
    Caption = 'PRN Personnel Specification';

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
        field(4; "Title/Designation Description"; Text[100])
        {
            DataClassification = ToBeClassified;
        }
        field(5; "Staff Category"; Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = ',Management/Executive Staff,Technical Staff,Consultant,Project Mgt Staff,Site/Delivery Staff,Support Staff,Other';
            OptionMembers = ,"Management/Executive Staff","Technical Staff",Consultant,"Project Mgt Staff","Site/Delivery Staff","Support Staff",Other;
        }
        field(6; "Min No. of Recomm Staff"; Integer)
        {
            DataClassification = ToBeClassified;
            Description = 'Minimum No. of Recommended Staff';
        }
        field(7; "Entry No"; Integer)
        {
            AutoIncrement = true;
            DataClassification = ToBeClassified;
        }
    }

    keys
    {
        key(Key1; "Document Type", "Document No.", "Staff Role Code", "Entry No")
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
