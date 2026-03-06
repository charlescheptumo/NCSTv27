#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Table 70094 "Solicitation Type"
{

    fields
    {
        field(1; "Code"; Code[30])
        {
            DataClassification = ToBeClassified;
        }
        field(2; "Default Procurement Method"; Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = ',Open Tender,RFQ,RFP,Two-Stage Tender,Design Competition Tender,Restricted Tender,Direct Procurement,Low Value Procurement,Force Account,Framework Agreement,Reverse Auction';
            OptionMembers = ,"Open Tender",RFQ,RFP,"Two-Stage Tender","Design Competition Tender","Restricted Tender","Direct Procurement","Low Value Procurement","Force Account","Framework Agreement","Reverse Auction";
        }
        field(3; Description; Text[50])
        {
            DataClassification = ToBeClassified;
        }
        field(4; "Supplier Set"; Option)
        {
            DataClassification = ToBeClassified;
            Description = 'Used to determine whether the Solicitation type is open to any supplier, whether registered or not, or whethe rit is only applicable to invited suppliers (restricted list of suppliers)';
            OptionCaption = ',Open,Invited Suppliers';
            OptionMembers = ,Open,"Invited Suppliers";
        }
        field(5; "Preliminary RFI"; Boolean)
        {
            DataClassification = ToBeClassified;
            Description = 'Used to determine Solicitation Types that have a preliminary evaluation based on an RFI such as EOI, before the Tender invitation. The RFI is used to get general information that can be used to define final specifications';
        }
        field(6; "No. of Invitations"; Integer)
        {
            DataClassification = ToBeClassified;
        }
        field(7; "No. of Responses"; Integer)
        {
            DataClassification = ToBeClassified;
        }
        field(8; Blocked; Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(9; "Default Bid Selection Method"; Code[30])
        {
            DataClassification = ToBeClassified;
            Description = 'Linked to Bid Selection Method Table';
            TableRelation = "Bid Selection Method".Code;
        }
        field(10; "Bid Evaluation Template"; Code[30])
        {
            Caption = 'Default Bid Evaluation Template';
            DataClassification = ToBeClassified;
            Description = 'Linked to Bid Scoring Template Table (Filter Templates only); used to indicate the default bid evaluation method applicable for a given solicitation type';
            TableRelation = "Bid Scoring Template".Code;
        }
    }

    keys
    {
        key(Key1; "Code")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}
