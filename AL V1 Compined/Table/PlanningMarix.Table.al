#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Table 59059 "Planning Marix"
{
    DrillDownPageID = "Planning Matrix List";
    LookupPageID = "Planning Matrix List";

    fields
    {
        field(1; No; Code[100])
        {
            DataClassification = ToBeClassified;
        }
        field(2; "Strategic Themes"; Text[200])
        {
            DataClassification = ToBeClassified;
            TableRelation = Themes;
        }
        field(3; "Strategic Objectives"; Text[250])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Strategies Objective" where("Theme Code" = field("Strategic Themes"));
        }
        field(4; Strategies; Text[250])
        {
            DataClassification = ToBeClassified;
            TableRelation = Strategic where("Objective Code" = field("Strategic Objectives"));
        }
        field(5; Activities; Text[250])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Strategic Activities" where("Strategies Code" = field(Strategies));
        }
        field(6; KPI; Text[250])
        {
            DataClassification = ToBeClassified;
            Description = 'Key Performance Indicators';
            TableRelation = "Strategic KPI" where("Activities Code" = field(Activities));
        }
        field(7; Target; Integer)
        {
            DataClassification = ToBeClassified;
        }
        field(8; "Start Date"; Date)
        {
            DataClassification = ToBeClassified;
        }
        field(9; "End Date"; Date)
        {
            DataClassification = ToBeClassified;
        }
        field(10; EntryNo; Integer)
        {
            AutoIncrement = true;
            DataClassification = ToBeClassified;
        }
        field(11; "Sub Activites"; Blob)
        {
            DataClassification = ToBeClassified;
        }
        field(12; "Fund Code"; Code[50])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Dimension Value".Code where("Global Dimension No." = const(2));
        }
        field(13; "Achieved Targets"; Integer)
        {
            DataClassification = ToBeClassified;
        }
        field(14; Achieved; Integer)
        {
            DataClassification = ToBeClassified;
        }
    }

    keys
    {
        key(Key1; No, "Strategic Themes", EntryNo)
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}
