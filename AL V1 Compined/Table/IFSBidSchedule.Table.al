#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Table 70150 "IFS Bid Schedule"
{
    Caption = 'IFS Bid Schedule';

    fields
    {
        field(1; "Entry No"; Integer)
        {
            DataClassification = ToBeClassified;
        }
        field(2; "Document No"; Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Request For Information".Code;
        }
        field(3; "Activity Category"; Option)
        {
            DataClassification = ToBeClassified;
            Description = 'Used to categorize key activities that are scheduled for a given IFP such as submission deadlines. NB: Internal activities are those that have to be undertaken by the Procuring entity and shall not appear on the E-Procurement Portal. External activities relate to the suppliers and shall appear on the Portal';
            OptionCaption = 'Internal/Procuring Entity,External/Vendor';
            OptionMembers = "Internal/Procuring Entity","External/Vendor";
        }
        field(4; Description; Text[250])
        {
            DataClassification = ToBeClassified;
        }
        field(5; "Start Date"; Date)
        {
            DataClassification = ToBeClassified;
        }
        field(6; "Start Time"; Time)
        {
            DataClassification = ToBeClassified;
        }
        field(7; "End Date"; Date)
        {
            DataClassification = ToBeClassified;
        }
        field(8; "End Time"; Time)
        {
            DataClassification = ToBeClassified;
        }
        field(9; "Activity Status"; Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = ',Planned,Ongoing,Completed';
            OptionMembers = ,Planned,Ongoing,Completed;
        }
        field(10; "Document Type"; Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = ',Invitation For Prequalification,EOI Invitation';
            OptionMembers = ,"Invitation For Prequalification","EOI Invitation";
        }
    }

    keys
    {
        key(Key1; "Document Type", "Entry No", "Document No")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}
