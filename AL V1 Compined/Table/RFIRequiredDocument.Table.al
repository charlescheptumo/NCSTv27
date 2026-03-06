#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Table 70088 "RFI Required Document"
{

    fields
    {
        field(1; "Document Type"; Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = ',Invitation For Prequalification,EOI Invitation';
            OptionMembers = ,"Invitation For Prequalification","EOI Invitation";
        }
        field(2; "Document No"; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Request For Information".Code;
        }
        field(3; "Procurement Document Type ID"; Code[30])
        {
            DataClassification = ToBeClassified;
            Description = 'Linked to Procurement Document Type table';
            TableRelation = "Procurement Document Type".Code;
        }
        field(4; Description; Text[250])
        {
            DataClassification = ToBeClassified;
        }
        field(5; "Track Certificate Expiry"; Boolean)
        {
            CalcFormula = lookup("Procurement Document Type"."Track Certificate Expiry" where(Code = field("Procurement Document Type ID")));
            Description = 'Used to mark documents where expiry dates are important hence have to be tracked for each vendor as a compliance requirement during vendor prequalification/registratiand EOI processes. The field shall be updated on validation of the Procurement Document Type ID (System picks value from Procurement Document Type Table)';
            Editable = false;
            FieldClass = FlowField;
        }
        field(6; "Requirement Type"; Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = ',Mandatory,Optional';
            OptionMembers = ,Mandatory,Optional;
        }
        field(7; "Special Group Requirement"; Boolean)
        {
            DataClassification = ToBeClassified;
            Description = 'All special group documents shall automatically update the Requirement Type field to OPTIONAL';
        }
        field(8; "Specialized Provider Req"; Boolean)
        {
            Caption = 'Specialized Provider Requirement';
            DataClassification = ToBeClassified;
            Description = 'All Contractor group documents shall automatically update the Requirement Type field to OPTIONAL';
        }
    }

    keys
    {
        key(Key1; "Document Type", "Document No", "Procurement Document Type ID")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}
