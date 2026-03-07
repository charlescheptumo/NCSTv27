#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Table 69679 "Closed Qn Response Option"
{

    fields
    {
        field(1;"Type ID";Code[30])
        {
            DataClassification = ToBeClassified;
        }
        field(2;"Option Code";Code[30])
        {
            DataClassification = ToBeClassified;
        }
        field(3;Description;Text[150])
        {
            DataClassification = ToBeClassified;
        }
        field(4;"Default Points";Decimal)
        {
            DataClassification = ToBeClassified;
        }
    }

    keys
    {
        key(Key1;"Type ID","Option Code")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

