#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Table 55004 "Meeting Agenda"
{

    fields
    {
        field(1; "Agenda code"; Code[20])
        {
        }
        field(2; "Meeting Code"; Code[10])
        {
            TableRelation = "Board Meetings";
        }
        field(3; Description; Text[250])
        {
        }
        field(4; "Person responsiblee"; Code[20])
        {
        }
        field(5; "Scheduled time"; Time)
        {
        }
    }

    keys
    {
        key(Key1; "Agenda code")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}
