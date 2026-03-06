#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Table 56053 "Track Other Persons"
{

    fields
    {
        field(1; Copyright; Code[20])
        {
        }
        field(2; "Tracks No"; Integer)
        {
        }
        field(3; Name; Text[200])
        {
        }
        field(4; "Id Number"; Code[20])
        {
        }
        field(5; Role; Code[20])
        {
        }
    }

    keys
    {
        key(Key1; Copyright)
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}
