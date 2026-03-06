#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Table 69023 "Salary Mapping"
{

    fields
    {
        field(1; Rank; Code[20])
        {
            TableRelation = "Employee Rank";
        }
        field(2; "Profit Centre"; Code[20])
        {
            TableRelation = "Dimension Value".Code where("Dimension Code" = const('PROFITCTR'));
        }
        field(3; "Basic Salary"; Decimal)
        {
        }
        field(4; "House Allowance"; Decimal)
        {
        }
        field(5; "Uniform Cleaning Allowance"; Decimal)
        {
        }
        field(6; "Responsibility Allowance"; Decimal)
        {
        }
        field(7; "Meal Allowance"; Decimal)
        {
        }
        field(8; "Night Allowance"; Decimal)
        {
        }
    }

    keys
    {
        key(Key1; Rank, "Profit Centre")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}
