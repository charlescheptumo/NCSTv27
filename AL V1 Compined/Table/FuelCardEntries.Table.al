#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Table 59015 "Fuel Card Entries"
{

    fields
    {
        field(1; No; Code[20])
        {
        }
        field(2; RegNo; Code[20])
        {
        }
        field(3; Make; Text[30])
        {
        }
        field(4; "Reciept No"; Text[30])
        {
        }
        field(5; Amount; Decimal)
        {
        }
        field(6; "Date of Filling"; Date)
        {
        }
        field(7; "Date of posting"; Date)
        {
        }
        field(8; Driver; Code[20])
        {
        }
        field(9; "Driver Names"; Text[30])
        {
        }
        field(10; Posted; Boolean)
        {
        }
        field(11; Line; Integer)
        {
        }
    }

    keys
    {
        key(Key1; "Reciept No")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}
