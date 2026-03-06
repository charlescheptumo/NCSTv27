#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Table 55006 "Agenda vote items"
{

    fields
    {
        field(1; "Item No"; Code[20])
        {
        }
        field(2; "Meeting No"; Code[20])
        {
            TableRelation = "Board Meetings";
        }
        field(3; "Agenda No"; Code[20])
        {
            TableRelation = "Meeting Agenda";
        }
        field(4; Description; Text[250])
        {
        }
        field(5; "Yes Count"; Integer)
        {
        }
        field(6; "No Count"; Integer)
        {
        }
        field(7; "Abstain Count"; Integer)
        {
        }
        field(8; "Total Votes"; Decimal)
        {
        }
        field(9; Status; Option)
        {
            OptionCaption = 'Planned,Active,Completed';
            OptionMembers = Planned,Active,Completed;
        }
        field(10; "Vote start Date"; Date)
        {
        }
        field(11; "Vote start Time"; Time)
        {
        }
        field(12; "Vote Enda date"; Date)
        {
        }
        field(13; "Vote Enda Time"; Time)
        {
        }
    }

    keys
    {
        key(Key1; "Item No")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}
