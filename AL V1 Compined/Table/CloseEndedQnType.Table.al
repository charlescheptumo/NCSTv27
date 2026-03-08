#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Table 69678 "Close Ended Qn Type"
{

    fields
    {
        field(1;"Type ID";Code[30])
        {
            DataClassification = ToBeClassified;
        }
        field(2;Description;Text[100])
        {
            DataClassification = ToBeClassified;
        }
        field(3;"No. of Default Responses";Integer)
        {
            CalcFormula = count("Closed Qn Response Option" where ("Type ID"=field("Type ID")));
            FieldClass = FlowField;
        }
        field(4;Blocked;Boolean)
        {
            DataClassification = ToBeClassified;
        }
    }

    keys
    {
        key(Key1;"Type ID")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

