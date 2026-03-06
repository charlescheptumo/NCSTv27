#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Table 80012 "Strategic Theme"
{
    DrillDownPageID = "Strategic Theme";
    LookupPageID = "Strategic Theme";

    fields
    {
        field(1; "Strategic Plan ID"; Code[100])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Corporate Strategic Plans".Code;
        }
        field(2; "Theme ID"; Code[100])
        {
            DataClassification = ToBeClassified;
        }
        field(3; Description; Text[255])
        {
            DataClassification = ToBeClassified;
        }
        field(4; "Primary Strategic Issue"; Text[255])
        {
            DataClassification = ToBeClassified;
        }
        field(5; "No. of Strategic Objectives"; Integer)
        {
            CalcFormula = count("Strategic Objective" where("Theme ID" = field("Theme ID")));
            FieldClass = FlowField;
        }
        field(6; "No. of Strategies"; Integer)
        {
            CalcFormula = count(Strategy where("Theme ID" = field("Theme ID")));
            FieldClass = FlowField;
        }
        field(7; "No. of Strategic Initiatives"; Integer)
        {
            CalcFormula = count("Strategic Initiative" where("Theme ID" = field("Theme ID")));
            FieldClass = FlowField;
        }
    }

    keys
    {
        key(Key1; "Strategic Plan ID", "Theme ID")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}
