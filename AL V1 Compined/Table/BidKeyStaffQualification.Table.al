#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Table 70160 "Bid Key Staff Qualification"
{
    Caption = 'Bid Key Staff Qualification';

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
        field(3; "Staff No."; Code[40])
        {
            Caption = 'Staff No.';
            DataClassification = ToBeClassified;
        }
        field(4; "Entry No"; Integer)
        {
            AutoIncrement = true;
            DataClassification = ToBeClassified;
        }
        field(5; "Vendor No."; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = Vendor;
        }
        field(6; "Proposed Project Role ID"; Code[50])
        {
            DataClassification = ToBeClassified;
            Description = 'This is the role of each staff on the Project. The system shall apply a filter on the IFS Key Staff Table, for the relevant IFS No, Staff Category, before the user can select the designation (Mapped to Project Role Field)';
            TableRelation = "Project Role Code"."Project Role Code";
        }
        field(7; "Qualification Category"; Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = ',PhD,Masters,Post-Graduate Diploma,Undergraduate,HND-Diploma,Diploma,A-Level,O-Level,Professional Certification';
            OptionMembers = ,PhD,Masters,"Post-Graduate Diploma",Undergraduate,"HND-Diploma",Diploma,"A-Level","O-Level","Professional Certification";
        }
        field(8; "Qualification Name"; Text[100])
        {
            Caption = 'Minimum Qualification Requirements';
            DataClassification = ToBeClassified;
        }
        field(9; Institution; Text[100])
        {
            DataClassification = ToBeClassified;
        }
        field(10; "Start Year"; Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Calendar Year Code".Code;
        }
        field(11; "End Year"; Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Calendar Year Code".Code;
        }
        field(12; "Outstanding Achievements"; Code[50])
        {
            DataClassification = ToBeClassified;
        }
    }

    keys
    {
        key(Key1; "Document Type", "No.", "Staff No.", "Entry No")
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
