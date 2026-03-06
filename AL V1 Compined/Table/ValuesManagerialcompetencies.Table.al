#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Table 56208 "Values Managerial competencies"
{

    fields
    {
        field(1; "Appraisal No"; Code[20])
        {
            Editable = false;
        }
        field(2; "Line No."; Integer)
        {
            AutoIncrement = true;
            Editable = false;
        }
        field(4; "Appraisal positive comments"; Text[250])
        {
        }
        field(5; Rating; Decimal)
        {
        }
        field(6; "Appraisal negative comments"; Text[250])
        {
        }
        field(7; Competency; Text[250])
        {
        }
        field(8; "Code"; Code[20])
        {
            TableRelation = "Comptency/Skill".No where(Managerial = filter(true));

            trigger OnValidate()
            begin
                CompetencyRec.Reset;
                CompetencyRec.SetRange(No, Code);
                if CompetencyRec.FindSet then begin
                    Competency := CompetencyRec.Name;
                end;
            end;
        }
    }

    keys
    {
        key(Key1; "Appraisal No", "Line No.")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }

    var
        CompetencyRec: Record "Comptency/Skill";
}
