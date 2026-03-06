#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Table 70031 "Contract Lines"
{

    fields
    {
        field(1; "Contract No"; Code[20])
        {
        }
        field(2; Cost; Decimal)
        {
        }
        field(3; Quantity; Integer)
        {
        }
        field(4; "Posting Date"; Date)
        {
        }
        field(5; Descriptison; Text[100])
        {
        }
        field(6; "Line no"; Integer)
        {
            AutoIncrement = true;
        }
    }

    keys
    {
        key(Key1; "Contract No", "Line no")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}
