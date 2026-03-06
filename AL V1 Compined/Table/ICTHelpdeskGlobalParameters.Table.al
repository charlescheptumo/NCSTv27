#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Table 56056 "ICT Helpdesk Global Parameters"
{
    DrillDownPageID = "ICT Helpdesk Setups";
    LookupPageID = "ICT Helpdesk Setups";

    fields
    {
        field(1; "Primary Key"; Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(2; "User Feedback Duration"; DateFormula)
        {
            DataClassification = ToBeClassified;
            Description = '//Gives the user a time for a feedback before the issue is closed completely.';
        }
        field(3; "Assigned Issue Duration"; DateFormula)
        {
            DataClassification = ToBeClassified;
        }
        field(4; "ICT Email"; Text[250])
        {
            DataClassification = ToBeClassified;
        }
        field(5; "ICT Issuance Voucher Nos."; Code[10])
        {
            DataClassification = ToBeClassified;
            TableRelation = "No. Series".Code;
        }
        field(6; "ICT Inventory Nos"; Code[10])
        {
            DataClassification = ToBeClassified;
            TableRelation = "No. Series".Code;
        }
        field(7; "Project Meeting Register Nos"; Code[10])
        {
            DataClassification = ToBeClassified;
            TableRelation = "No. Series".Code;
        }
        field(8; "ICT Project Nos"; Code[10])
        {
            DataClassification = ToBeClassified;
            TableRelation = "No. Series".Code;
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
