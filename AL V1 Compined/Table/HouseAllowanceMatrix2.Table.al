#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Table 69160 "House Allowance Matrix2"
{

    fields
    {
        field(1; "Salary Scale"; Code[30])
        {
            TableRelation = "Salary Scales2".Scale;
        }
        field(2; Station; Code[30])
        {
            TableRelation = "Dimension Value".Code;
        }
        field(3; "House Allowance"; Decimal)
        {
        }
    }

    keys
    {
        key(Key1; "Salary Scale", Station)
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}
