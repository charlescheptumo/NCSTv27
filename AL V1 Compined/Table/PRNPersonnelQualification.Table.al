#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Table 70200 "PRN Personnel Qualification"
{
    Caption = 'IFS Staff Min Qualification';

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
        field(5; "Qualification Category"; Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = ',PhD,Masters,Post-Graduate Diploma,Undergraduate,HND-Diploma,Diploma,A-Level,O-Level,Professional Certification';
            OptionMembers = ,PhD,Masters,"Post-Graduate Diploma",Undergraduate,"HND-Diploma",Diploma,"A-Level","O-Level","Professional Certification";
        }
        field(6; "Minimum Qualification Req"; Text[100])
        {
            Caption = 'Minimum Qualification Requirements';
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
