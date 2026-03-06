#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Table 65015 "GFO Approval Committee Entry"
{

    fields
    {
        field(1; "RAC ID"; Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Research Approval Committee";
        }
        field(2; "Grant Funding Application Id"; Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Grant Funding Application";
        }
        field(3; "Final Approval Verdict"; Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = 'Approved,Rejected,Re-Submission';
            OptionMembers = Approved,Disapproved,"Re-Submission";
        }
        field(4; "Final Approval Date"; Date)
        {
            DataClassification = ToBeClassified;
        }
        field(5; "External Document No"; Code[50])
        {
            Caption = 'Refference No';
            DataClassification = ToBeClassified;
        }
        field(6; Comments; Text[30])
        {
            DataClassification = ToBeClassified;
        }
        field(7; "Entry No"; Integer)
        {
            AutoIncrement = true;
            DataClassification = ToBeClassified;
        }
    }

    keys
    {
        key(Key1; "RAC ID", "Entry No")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}
