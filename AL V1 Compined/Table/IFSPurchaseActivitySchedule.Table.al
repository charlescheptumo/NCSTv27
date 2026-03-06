#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Table 70149 "IFS Purchase Activity Schedule"
{

    fields
    {
        field(1; "Procurement Plan ID"; Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Procurement Plan".Code;
        }
        field(2; "PP Entry"; Integer)
        {
            DataClassification = ToBeClassified;
            TableRelation = "PP Purchase Activity Schedule"."PP Entry";
        }
        field(3; "Planning Category"; Code[50])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Procurement Category".Code;
        }
        field(4; "Procurement Method"; Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = ',Open Tender,RFQ,RFP,Two-Stage Tender,Design Competition Tender,Restricted Tender,Direct Procurement,Low Value Procurement,Force Account,Framework Agreement,Reverse Auction';
            OptionMembers = ,"Open Tender",RFQ,RFP,"Two-Stage Tender","Design Competition Tender","Restricted Tender","Direct Procurement","Low Value Procurement","Force Account","Framework Agreement","Reverse Auction";
        }
        field(5; "Activity Code"; Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Procurement Activity Code"."Activity Code";

            trigger OnValidate()
            begin
                Activity.Reset;
                Activity.SetRange("Activity Code", "Activity Code");
                if Activity.FindSet then
                    "Activity Description" := Activity.Description
            end;
        }
        field(6; "Default Planned Duration(Days)"; Decimal)
        {
            DataClassification = ToBeClassified;
            Description = 'Default Planned Duration (Days)';
        }
        field(7; "Actual Duration (Days)"; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(8; "Planned Dates"; Date)
        {
            DataClassification = ToBeClassified;
        }
        field(9; "Actual Dates"; Date)
        {
            DataClassification = ToBeClassified;
        }
        field(10; "Line no"; Integer)
        {
            AutoIncrement = true;
            DataClassification = ToBeClassified;
        }
        field(11; "Solicitation Type"; Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Solicitation Type".Code;
        }
        field(12; "Activity Description"; Text[50])
        {
            DataClassification = ToBeClassified;
        }
        field(13; "Document No"; Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Standard Purchase Code";
        }
    }

    keys
    {
        key(Key1; "Document No", "Procurement Plan ID", "PP Entry", "Planning Category", "Line no")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }

    var
        Activity: Record "Procurement Activity Code";
}
