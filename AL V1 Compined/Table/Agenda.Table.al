#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Table 90003 Agenda
{

    fields
    {
        field(1; "Agenda No"; Code[30])
        {
            DataClassification = ToBeClassified;
        }
        field(2; Description; Text[50])
        {
            DataClassification = ToBeClassified;
        }
        field(3; "Meeting Code"; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Board Meetings1";
        }
        field(4; Comments; Text[30])
        {
            DataClassification = ToBeClassified;
        }
    }

    keys
    {
        key(Key1; "Agenda No")
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
