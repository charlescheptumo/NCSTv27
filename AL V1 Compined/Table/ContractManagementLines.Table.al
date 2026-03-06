#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Table 70030 "Contract Management Lines"
{

    fields
    {
        field(1; "Contract Header"; Code[20])
        {
            TableRelation = "Contract Management Header";
        }
        field(2; "Line No"; Integer)
        {
        }
        field(3; Supplier; Code[50])
        {
            TableRelation = Vendor;
        }
        field(4; "Service Provided"; Text[250])
        {
        }
        field(5; "Contract Amount"; Decimal)
        {
        }
    }

    keys
    {
        key(Key1; "Contract Header", Supplier)
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}
