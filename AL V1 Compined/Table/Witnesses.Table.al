#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Table 56043 Witnesses
{

    fields
    {
        field(1; "Case No"; Code[50])
        {
        }
        field(2; "Line No"; Integer)
        {
            AutoIncrement = true;
        }
        field(3; "Witnessness Name"; Text[250])
        {
        }
        field(4; "Witnessness Address"; Text[250])
        {
        }
        field(5; "Witnessness Phone"; Text[100])
        {
        }
    }

    keys
    {
        key(Key1; "Case No", "Line No")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}
