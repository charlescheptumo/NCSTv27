#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Table 65013 "Research Output Activities"
{
    DrillDownPageID = "Research Activities List";
    LookupPageID = "Research Activities List";

    fields
    {
        field(1; "Research Output ID"; Code[30])
        {
            DataClassification = ToBeClassified;
        }
        field(2; "Activity ID"; Code[30])
        {
            DataClassification = ToBeClassified;
        }
        field(3; Description; Text[100])
        {
            DataClassification = ToBeClassified;
        }
        field(4; "Start Date"; Date)
        {
            DataClassification = ToBeClassified;
        }
        field(5; "End Date"; Date)
        {
            DataClassification = ToBeClassified;
        }
        field(6; Status; Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = 'Planned,Cancelled,Complete';
            OptionMembers = Planned,Cancelled,Complete;
        }
        field(7; Priority; Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = 'Low,Normal,High';
            OptionMembers = Low,Normal,High;
        }
    }

    keys
    {
        key(Key1; "Research Output ID", "Activity ID")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}
