#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Table 55010 "Board Meeting Comments"
{
    DrillDownPageID = "Board Meeting Comments";
    LookupPageID = "Board Meeting Comments";

    fields
    {
        field(1; EntryNo; Integer)
        {
            AutoIncrement = true;
        }
        field(2; "Meeting Code"; Code[20])
        {
            TableRelation = "Board Meetings";
        }
        field(3; "Member No"; Code[20])
        {
            TableRelation = "Committee Board Members".Code;
        }
        field(4; Comment; Text[250])
        {
            Editable = false;
        }
        field(5; "Date Created"; Date)
        {
            Editable = false;
        }
        field(6; "Time Created"; Time)
        {
        }
        field(7; "Comment Reply"; Text[250])
        {
            DataClassification = ToBeClassified;
        }
    }

    keys
    {
        key(Key1; EntryNo)
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }

    var
        Memb: Record "Committee Board Members";
        Meeting: Record "Board Meetings";
        Committe: Record "Board Committees";
}
