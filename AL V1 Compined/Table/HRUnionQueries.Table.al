#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Table 69119 "HR Union Queries"
{

    fields
    {
        field(1; "Employee No."; Code[20])
        {
        }
        field(2; "Query Date"; Date)
        {
        }
        field(3; "Query"; Text[150])
        {
        }
    }

    keys
    {
        key(Key1; "Employee No.", "Query Date")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}
