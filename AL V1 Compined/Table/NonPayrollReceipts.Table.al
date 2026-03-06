#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Table 69013 "Non Payroll Receipts"
{

    fields
    {
        field(1; "Loan No"; Code[20])
        {
            TableRelation = "Loan Application"."Loan No";
        }
        field(2; "Receipt Date"; Date)
        {
            NotBlank = true;
        }
        field(3; "Received From"; Text[40])
        {
        }
        field(4; "Cheque No"; Code[20])
        {
        }
        field(5; Amount; Decimal)
        {
        }
        field(6; "Reference No"; Code[20])
        {
        }
    }

    keys
    {
        key(Key1; "Loan No", "Receipt Date")
        {
            Clustered = true;
            SumIndexFields = Amount;
        }
    }

    fieldgroups
    {
    }
}
