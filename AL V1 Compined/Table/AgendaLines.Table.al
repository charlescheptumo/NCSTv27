#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Table 90002 "Agenda Lines"
{

    fields
    {
        field(1; "Agenda No"; Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = Agenda."Agenda No";

            trigger OnValidate()
            begin
                Agenda.Reset;
                Agenda.SetRange("Agenda No", "Agenda No");
                if Agenda.FindSet then begin
                    "Agenda Item" := Agenda.Description;
                end;
            end;
        }
        field(2; "Agenda Item"; Text[50])
        {
            DataClassification = ToBeClassified;
        }
        field(3; Responsibility; Text[30])
        {
            DataClassification = ToBeClassified;
        }
        field(4; "Action taken"; Text[50])
        {
            DataClassification = ToBeClassified;
        }
        field(5; Comments; Text[50])
        {
            DataClassification = ToBeClassified;
        }
        field(6; "Board Meeting No"; Code[50])
        {
            DataClassification = ToBeClassified;
        }
    }

    keys
    {
        key(Key1; "Board Meeting No", "Agenda No")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }

    var
        Agenda: Record Agenda;
        AgendaLines: Record "Agenda Lines";
}
