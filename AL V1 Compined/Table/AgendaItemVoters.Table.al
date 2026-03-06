#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Table 55007 "Agenda Item Voters"
{

    fields
    {
        field(1; "Voter ID"; Code[20])
        {
        }
        field(2; "Agenda Vote Item code"; Code[20])
        {
            TableRelation = "Agenda vote items";
        }
        field(3; Name; Text[250])
        {
        }
        field(4; Voted; Boolean)
        {
        }
        field(5; "Vote decision"; Option)
        {
            OptionCaption = 'Yes,No,Abstain';
            OptionMembers = Yes,No,Abstain;
        }
    }

    keys
    {
        key(Key1; "Voter ID")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}
