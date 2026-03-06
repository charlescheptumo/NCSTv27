#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Table 55005 "Agenda Supporting Documents"
{

    fields
    {
        field(1; "Code"; Code[20])
        {
        }
        field(2; "Meeting code"; Code[20])
        {
            TableRelation = "Board Meetings";
        }
        field(3; "Agenda No"; Code[20])
        {
            TableRelation = "Meeting Agenda";
        }
        field(4; Type; Option)
        {
            OptionCaption = 'Document,URL';
            OptionMembers = Document,URL;
        }
        field(5; Description; Text[250])
        {
        }
        field(6; "Link/Location"; Text[250])
        {
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
