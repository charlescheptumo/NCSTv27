#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Table 56042 "File Movement logs"
{

    fields
    {
        field(1; "No."; Code[20])
        {
        }
        field(2; "Case File"; Code[20])
        {
        }
        field(3; "Requested By"; Code[60])
        {
        }
        field(4; "Source No."; Code[60])
        {
        }
        field(5; "Destination No."; Code[60])
        {
        }
        field(6; "Date Issued"; Date)
        {
        }
        field(7; "Date Return"; Date)
        {
        }
        field(8; "Time issued"; Time)
        {
        }
        field(9; "Time returned"; Time)
        {
        }
        field(10; "Current Location"; Code[60])
        {
        }
    }

    keys
    {
        key(Key1; "No.")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}
