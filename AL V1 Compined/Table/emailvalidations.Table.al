#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Table 56901 emailvalidations
{

    fields
    {
        field(1; id; Integer)
        {
            AutoIncrement = true;
        }
        field(2; user; Code[100])
        {
        }
        field(3; "key"; Text[50])
        {
        }
        field(4; generatedAt; DateTime)
        {
        }
        field(5; used; Boolean)
        {
        }
        field(6; Email; Text[250])
        {
            DataClassification = ToBeClassified;
        }
    }

    keys
    {
        key(Key1; id)
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}
