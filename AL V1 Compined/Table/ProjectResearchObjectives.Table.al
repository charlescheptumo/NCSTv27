#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Table 65036 "Project Research Objectives"
{

    fields
    {
        field(1; "Entry No"; Integer)
        {
            AutoIncrement = true;
            DataClassification = ToBeClassified;
        }
        field(2; "Project No"; Code[50])
        {
            DataClassification = ToBeClassified;
            TableRelation = Job."No.";
        }
        field(3; "Research Objective"; Code[100])
        {
            DataClassification = ToBeClassified;
        }
        field(4; "Research Program"; Code[100])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Research Program";
        }
        field(5; "Project Area"; Code[50])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Research Project Area" where("Research Program ID" = field("Research Program"));
        }
    }

    keys
    {
        key(Key1; "Entry No", "Project No")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}
