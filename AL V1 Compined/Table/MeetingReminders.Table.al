#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Table 55003 "Meeting Reminders"
{

    fields
    {
        field(1; "Reminder code"; Code[20])
        {
        }
        field(2; "Meeting Code"; Code[10])
        {
            TableRelation = "Board Meetings";
        }
        field(3; "Reminder date"; Date)
        {
        }
        field(4; Status; Option)
        {
            OptionCaption = 'Sent,Failed';
            OptionMembers = Sent,Failed;
        }
    }

    keys
    {
        key(Key1; "Reminder code")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}
