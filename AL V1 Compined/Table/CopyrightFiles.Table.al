#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Table 56090 "Copyright Files"
{

    fields
    {
        field(1; fileId; Integer)
        {
            AutoIncrement = true;
        }
        field(2; CopyrightNo; Code[10])
        {
            TableRelation = "Copyright Registration Table"."No.";
        }
        field(3; fileName; Text[50])
        {
        }
        field(4; dateUploaded; Date)
        {
        }
    }

    keys
    {
        key(Key1; fileId)
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}
