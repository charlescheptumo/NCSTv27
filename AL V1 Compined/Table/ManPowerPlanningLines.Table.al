#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Table 69105 "ManPower Planning Lines"
{
    //DrillDownPageID = "Manpower Planning Lines";
   // LookupPageID = "Manpower Planning Lines";

    fields
    {
        field(1; "Entry No"; Integer)
        {
            AutoIncrement = true;
            DataClassification = ToBeClassified;
        }
        field(2; "Task No"; Code[30])
        {
            DataClassification = ToBeClassified;
        }
        field(3; "Manpower Plan Code"; Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Manpower Plan Header";
        }
        field(4; "Job Id"; Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = Positions;
        }
        field(5; "Job Title"; Text[250])
        {
            CalcFormula = lookup(Positions."Job Title" where("Position ID" = field("Job Id")));
            FieldClass = FlowField;
        }
        field(6; "Responsibility Center Code"; Code[10])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Responsibility Center";
        }
        field(7; "Responsibility Center Name"; Text[100])
        {
            CalcFormula = lookup("Responsibility Center".Name where(Code = field("Responsibility Center Code")));
            FieldClass = FlowField;
        }
        field(8; "Quarter 1 Target"; Integer)
        {
            DataClassification = ToBeClassified;
        }
        field(9; "Quarter 2 Target"; Integer)
        {
            DataClassification = ToBeClassified;
        }
        field(10; "Quarter 3 Target"; Integer)
        {
            DataClassification = ToBeClassified;
        }
        field(11; "Quarter 4 Target"; Integer)
        {
            DataClassification = ToBeClassified;
        }
        field(12; "Quarter 1 Actual"; Integer)
        {
            DataClassification = ToBeClassified;
        }
        field(13; "Quarter 2 Actual"; Integer)
        {
            DataClassification = ToBeClassified;
        }
        field(14; "Quarter 3 Actual"; Integer)
        {
            DataClassification = ToBeClassified;
        }
        field(15; "Quarter 4 Actual"; Integer)
        {
            DataClassification = ToBeClassified;
        }
        field(16; "Target No."; Integer)
        {

            trigger OnValidate()
            begin
                "Target No." := "Quarter 1 Target" + "Quarter 2 Target" + "Quarter 3 Target" + "Quarter 4 Target";
            end;
        }
        field(17; "Estimated Costs"; Integer)
        {
            DataClassification = ToBeClassified;
        }
    }

    keys
    {
        key(Key1; "Entry No", "Task No", "Manpower Plan Code", "Job Id")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
        fieldgroup(DropDown; "Job Id", "Job Title", "Target No.")
        {
        }
    }
}

