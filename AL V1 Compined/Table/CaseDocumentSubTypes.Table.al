#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Table 56031 "Case Document Sub Types"
{

    fields
    {
        field(1; "Code"; Code[10])
        {
        }
        field(2; Description; Text[50])
        {
        }
        field(3; "Case Document Type"; Code[20])
        {
            TableRelation = "Case Document Types";
        }
    }

    keys
    {
        key(Key1; "Code", "Case Document Type")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}
