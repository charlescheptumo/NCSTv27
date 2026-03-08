#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Table 69606 "Duty Station"
{
    fields
    {
        field(1; "Code"; Code[30])
        {
            DataClassification = ToBeClassified;
        }
        field(2; Description; Text[150])
        {
            DataClassification = ToBeClassified;
        }
        field(3; "Region ID"; Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Responsibility Center";
        }
        field(4; "Approved Establishment"; Integer)
        {
            FieldClass = Normal;
        }
        field(5; "No. of Active Employees"; Integer)
        {
            //CalcFormula = count(Employee where("Current Duty Station" = field(Code)));
            FieldClass = FlowField;
        }
        field(6; Blocked; Boolean)
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

