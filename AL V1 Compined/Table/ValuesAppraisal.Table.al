#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Table 56207 "Values Appraisal"
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
        field(4; "Demonstrated application"; Text[250])
        {
        }
        field(6; Description; Text[250])
        {
        }
        field(7; "Code"; Code[20])
        {
            TableRelation = "Comptency/Skill".No where(Managerial = filter(false));

            trigger OnValidate()
            begin
                Competency.Reset;
                Competency.SetRange(No, Code);
                if Competency.FindSet then begin
                    "Competency/Skills" := Competency.Name;
                    Description := Competency.Description;
                end;
            end;
        }
        field(8; "Competency/Skills"; Text[250])
        {
        }
        field(9; "Self Rating"; Decimal)
        {
        }
        field(10; "Supervisor Rating"; Decimal)
        {
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
        Competency: Record "Comptency/Skill";
}
