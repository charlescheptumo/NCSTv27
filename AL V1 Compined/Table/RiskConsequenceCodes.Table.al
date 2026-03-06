#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Table 80033 "Risk Consequence Codes"
{

    fields
    {
        field(1; "Code"; Code[30])
        {
            DataClassification = ToBeClassified;
        }
        field(2; Description; Text[255])
        {
            DataClassification = ToBeClassified;
        }
        field(3; KPI; Code[150])
        {
            DataClassification = ToBeClassified;
        }
        field(4; "Unit of Measure"; Code[15])
        {
            DataClassification = ToBeClassified;
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
