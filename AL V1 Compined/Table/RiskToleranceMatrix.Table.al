#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Table 80034 "Risk Tolerance Matrix"
{

    fields
    {
        field(1; "Impact Level Code"; Code[30])
        {
            DataClassification = ToBeClassified;
        }
        field(2; "Entry No"; Integer)
        {
            AutoIncrement = true;
            DataClassification = ToBeClassified;
        }
        field(3; "Risk Impact Code"; Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Risk Consequence Codes";
        }
        field(4; KPI; Text[225])
        {
            DataClassification = ToBeClassified;
        }
        field(5; "Unit of Measure"; Code[100])
        {
            DataClassification = ToBeClassified;
        }
        field(6; Description; Text[255])
        {
            DataClassification = ToBeClassified;
        }
        field(7; "Tolerated Min Limit"; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(8; "Tolerated Max Limit"; Decimal)
        {
            DataClassification = ToBeClassified;
        }
    }

    keys
    {
        key(Key1; "Impact Level Code", "Entry No")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}
