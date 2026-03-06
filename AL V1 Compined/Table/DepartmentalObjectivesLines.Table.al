#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Table 56210 "Departmental Objectives Lines"
{

    fields
    {
        field(1; "Code"; Code[20])
        {
        }
        field(2; "Line No"; Integer)
        {
            AutoIncrement = true;
        }
        field(3; Objective; Text[250])
        {
        }
        field(4; Description; Text[250])
        {
        }
        field(5; Rating; Text[250])
        {
        }
        field(6; "Rating %"; Code[100])
        {
        }
    }

    keys
    {
        key(Key1; "Code", "Line No")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}
