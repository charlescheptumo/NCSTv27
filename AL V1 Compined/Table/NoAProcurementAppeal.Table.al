#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Table 70188 "NoA Procurement Appeal"
{

    fields
    {
        field(1; "Request for Review ID"; Code[30])
        {
            DataClassification = ToBeClassified;
        }
        field(2; "External Document No."; Code[30])
        {
            DataClassification = ToBeClassified;
        }
        field(3; "Review Type"; Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = 'Review Board,Judicial Review';
            OptionMembers = "Review Board","Judicial Review";
        }
        field(4; "Notice of Award No."; Code[20])
        {
            DataClassification = ToBeClassified;
            Description = 'Linked to Bid Tabulation Header (Filter Document Type: Notice of Award). When the NoA is selected, the systems shall validate and fill the Bid No., IFS Code, Professional Opinion No.,Tender Name, Awarded Bidder No. & Name, Award Date and Awarded Tender Sum';
            TableRelation = "Bid Tabulation Header".Code;
        }
        field(5; "IFS Code"; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Standard Purchase Code";
        }
        field(6; "Tender Name"; Text[250])
        {
            DataClassification = ToBeClassified;
        }
        field(7; "Professional Opinion ID"; Code[30])
        {
            DataClassification = ToBeClassified;
        }
        field(8; "Review Notice Date"; Date)
        {
            DataClassification = ToBeClassified;
            Description = 'Date when the Secretary of the Review Board notifies the Procurign Entity on the filed RFR';
        }
        field(9; Description; Text[100])
        {
            DataClassification = ToBeClassified;
        }
        field(10; "Dispute Matter"; Text[100])
        {
            DataClassification = ToBeClassified;
        }
        field(11; "Review Board Contact No."; Code[20])
        {
            DataClassification = ToBeClassified;
            Description = 'Default Review Board Name to be setup under the Contacts Table (To track any interactions). The default Contact ID for the Review Board shall be setup under the E-Procurement Setup';
        }
        field(12; "Review Board Name"; Text[100])
        {
            DataClassification = ToBeClassified;
            Description = 'Default Review Board Name to be setup under the Contacts Table (To track any interactions)';
        }
        field(13; "Court Name"; Text[100])
        {
            DataClassification = ToBeClassified;
        }
        field(14; "RFR Requester/Claimant Name"; Text[80])
        {
            DataClassification = ToBeClassified;
            Description = 'Name of 1st Party or Primary Claimant in the dispute. They can be a bidder or an Interested Party (Candidate)';
        }
        field(15; "Awarded Bidder No."; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = Vendor;
        }
        field(16; "Awarded Bidder Name"; Text[80])
        {
            DataClassification = ToBeClassified;
        }
        field(17; "Procuring Entity (PE) Name"; Text[80])
        {
            DataClassification = ToBeClassified;
        }
        field(18; "PE Representative"; Text[80])
        {
            DataClassification = ToBeClassified;
        }
        field(19; "Other Dispute Parties"; Text[80])
        {
            DataClassification = ToBeClassified;
        }
        field(20; "Review Status"; Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = 'Ongoing,Completed';
            OptionMembers = Ongoing,Completed;
        }
        field(21; "Completion Date"; Date)
        {
            DataClassification = ToBeClassified;
        }
        field(22; "Final Verdict"; Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = ',Appeal Dismissal,Procurement Termination,Annul NoA,Issue General Direction';
            OptionMembers = ,"Appeal Dismissal","Procurement Termination","Annul NoA","Issue General Direction";
        }
        field(23; "Summary of Final Decision"; Text[80])
        {
            DataClassification = ToBeClassified;
        }
        field(24; "Final Decision Date"; Date)
        {
            DataClassification = ToBeClassified;
        }
        field(25; "No. Series"; Code[10])
        {
            DataClassification = ToBeClassified;
        }
        field(26; "Created By"; Code[50])
        {
            DataClassification = ToBeClassified;
        }
        field(27; "Created Date"; Date)
        {
            DataClassification = ToBeClassified;
        }
        field(28; "Created Time"; Time)
        {
            DataClassification = ToBeClassified;
        }
        field(29; "Claimant Bidder No."; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = Vendor;
        }
        field(30; "Claimant Representative"; Text[80])
        {
            DataClassification = ToBeClassified;
        }
    }

    keys
    {
        key(Key1; "Request for Review ID")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}
