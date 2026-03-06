#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Table 80005 "Stakeholder Sub-Group"
{
    DrillDownPageID = "Stakeholder Sub-Groups";
    LookupPageID = "Stakeholder Sub-Groups";

    fields
    {
        field(1; "Code"; Code[50])
        {
            DataClassification = ToBeClassified;
        }
        field(2; "Stakeholder Group"; Code[100])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Stakeholder Group";
        }
        field(3; Description; Text[100])
        {
            DataClassification = ToBeClassified;
        }
        field(4; "No. of Stakeholders"; Integer)
        {
            CalcFormula = count(Contact where("Sub-Group" = field(Code)));
            FieldClass = FlowField;
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
