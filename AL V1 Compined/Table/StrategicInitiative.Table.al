#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Table 80015 "Strategic Initiative"
{
    DrillDownPageID = "Strategic Initiatives";
    LookupPageID = "Strategic Initiatives";

    fields
    {
        field(1; "Strategic Plan ID"; Code[50])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Corporate Strategic Plans".Code;
        }
        field(2; "Theme ID"; Code[50])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Strategic Theme"."Theme ID";
        }
        field(3; "Objective ID"; Code[50])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Strategic Objective".Code;
        }
        field(4; "Strategy ID"; Code[50])
        {
            DataClassification = ToBeClassified;
            TableRelation = Strategy.Code;
        }
        field(5; "Code"; Code[50])
        {
            DataClassification = ToBeClassified;
        }
        field(6; Description; Text[255])
        {
            DataClassification = ToBeClassified;
        }
        field(7; "Framework Perspective"; Code[255])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Strategy Framework Perspective".Code where("Strategy Framework" = field("Strategy Framework"));
        }
        field(8; "Strategy Planned Target"; Decimal)
        {
            CalcFormula = sum("Strategy Sub_Activity Entry".Quantity where("Strategic Plan ID" = field("Strategic Plan ID"),
                                                                            "Entry Type" = const(Planned),
                                                                            "Activity ID" = field(Code)));
            FieldClass = FlowField;
        }
        field(9; "PC Planned Target"; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(10; "Achieved Target"; Decimal)
        {
            CalcFormula = sum("Strategy Sub_Activity Entry".Quantity where("Strategic Plan ID" = field("Strategic Plan ID"),
                                                                            "Entry Type" = const(Actual),
                                                                            "Activity ID" = field(Code)));
            FieldClass = FlowField;
        }
        field(11; "Planned Budget"; Decimal)
        {
            CalcFormula = sum("Strategy Sub_Activity Entry"."Cost Amount" where("Strategic Plan ID" = field("Strategic Plan ID"),
                                                                                 "Entry Type" = const(Planned),
                                                                                 "Activity ID" = field(Code)));
            FieldClass = FlowField;
        }
        field(12; "Usage Budget"; Decimal)
        {
            CalcFormula = sum("Strategy Sub_Activity Entry"."Cost Amount" where("Strategic Plan ID" = field("Strategic Plan ID"),
                                                                                 "Entry Type" = const(Actual),
                                                                                 "Activity ID" = field(Code)));
            FieldClass = FlowField;
        }
        field(13; "Strategy Framework"; Code[10])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Strategy Framework";
        }
    }

    keys
    {
        key(Key1; "Strategic Plan ID", "Theme ID", "Objective ID", "Strategy ID", "Code", "Strategy Framework")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}
