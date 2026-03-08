#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Table 69699 "Ability Test"
{

    fields
    {
        field(1; "Test ID"; Code[30])
        {
            DataClassification = ToBeClassified;
        }
        field(2; Description; Text[250])
        {
            DataClassification = ToBeClassified;
        }
        field(3; "Maximum Duration(Min)"; Integer)
        {
            DataClassification = ToBeClassified;
        }
        field(4; "No. of Questions"; Integer)
        {
            CalcFormula = count("Ability Test Question" where("Test ID" = field("Test ID")));
            FieldClass = FlowField;
        }
        field(5; "Created By"; Code[30])
        {
            DataClassification = ToBeClassified;
        }
        field(6; "Created On"; DateTime)
        {
            DataClassification = ToBeClassified;
        }
    }

    keys
    {
        key(Key1; "Test ID")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

