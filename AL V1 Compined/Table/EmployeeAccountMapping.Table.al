#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Table 69050 "Employee Account Mapping"
{

    fields
    {
        field(1; "Employee No."; Code[20])
        {
            TableRelation = Employee;
        }
        field(2; "Loan Type"; Code[20])
        {
            TableRelation = "Loan Product Type";
        }
        field(3; "Customer A/c"; Code[20])
        {
            TableRelation = Customer;
        }
    }

    keys
    {
        key(Key1; "Employee No.")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}
