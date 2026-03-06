#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Table 70109 "Company Size Code"
{

    fields
    {
        field(1; "Code"; Code[30])
        {
            DataClassification = ToBeClassified;
        }
        field(2; Description; Text[60])
        {
            DataClassification = ToBeClassified;
        }
        field(3; "Min No. Of Employees"; Decimal)
        {
            DataClassification = ToBeClassified;
            //DecimalPlaces = 0 : 0;
        }
        field(4; "Max No. Of Employees"; Decimal)
        {
            DataClassification = ToBeClassified;
            //DecimalPlaces = 0 : 0;
        }
        field(5; "No. of Vendors"; Integer)
        {
            CalcFormula = count(Vendor where("Company Size" = field(Code)));
            FieldClass = FlowField;
        }
    }

    keys
    {
        key(Key1; "Code")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}
