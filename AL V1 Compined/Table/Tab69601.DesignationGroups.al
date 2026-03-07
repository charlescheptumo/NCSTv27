#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Table 69601 "Designation Groups"
{
    //DrillDownPageID = "Designation Groups";
    //LookupPageID = "Designation Groups";

    fields
    {
        field(1; "Code"; Code[30])
        {
            DataClassification = ToBeClassified;
        }
        field(2; Description; Text[50])
        {
            DataClassification = ToBeClassified;
        }
        field(3; "No. of Positions"; Integer)
        {
            CalcFormula = count("Company Positions" where("Designation Group" = field(Code)));
            FieldClass = FlowField;
        }
        field(4; Blocked; Boolean)
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

