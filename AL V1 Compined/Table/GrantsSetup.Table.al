#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Table 65010 "Grants Setup"
{

    fields
    {
        field(1; "Primary Key"; Code[30])
        {
            DataClassification = ToBeClassified;
        }
        field(2; "Research Iinfrastructure Nos"; Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = "No. Series";
        }
        field(3; "Research Output Nos"; Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = "No. Series";
        }
        field(4; "Researcher Nos"; Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = "No. Series";
        }
        field(5; "Grantor Nos"; Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = "No. Series";
        }
        field(6; "Funding Opportunity Nos"; Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = "No. Series";
        }
        field(7; "Primary Role"; Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Research Team Roles";
        }
        field(8; "Grant Proposal Nos"; Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = "No. Series";
        }
        field(9; "Grant Admin Nos"; Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = "No. Series";
        }
        field(10; "Project Admin Nos"; Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = "No. Series";
        }
        field(11; "Research Project Nos"; Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = "No. Series";
        }
        field(12; "Project Contract Nos"; Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = "No. Series";
        }
        field(13; "Email Notification Path"; Code[100])
        {
            DataClassification = ToBeClassified;
        }
    }

    keys
    {
        key(Key1; "Primary Key")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}
