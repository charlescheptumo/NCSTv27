#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Table 70086 "RFI Restricted Vendor Category"
{
    DrillDownPageID = "Supplier Category";
    LookupPageID = "Supplier Category";

    fields
    {
        field(1; "Document No"; Code[30])
        {
            Description = 'Linked to RFI Table (Invitation For Prequalification)';
            NotBlank = true;
        }
        field(2; "Prequalification Category ID"; Code[30])
        {
            DataClassification = ToBeClassified;
            Description = 'Linked to Prequalification Category Table';
            TableRelation = "Procurement Category".Code;
        }
        field(3; "Restricted Vendor Category ID"; Code[30])
        {
            DataClassification = ToBeClassified;
            Description = 'Linked to Vendor Category Table';
            TableRelation = "Special Vendor Category".Code;
        }
        field(4; Description; Text[250])
        {
        }
        field(5; "Document Type"; Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = ',Invitation For Prequalification,EOI Invitation';
            OptionMembers = ,"Invitation For Prequalification","EOI Invitation";
        }
    }

    keys
    {
        key(Key1; "Document Type", "Document No", "Prequalification Category ID", "Restricted Vendor Category ID")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}
