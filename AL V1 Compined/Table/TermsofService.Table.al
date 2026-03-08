#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Table 69617 "Terms of Service"
{
    //DrillDownPageID = "Terms of Service";
    //LookupPageID = "Terms of Service";

    fields
    {
        field(1; "Code"; Code[30])
        {
            DataClassification = ToBeClassified;
        }
        field(2; "Employment Type"; Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = 'Permanent,Contract,Casual,Secondment,Internship,Attachment,Volunteer';
            OptionMembers = Permanent,Contract,Casual,Secondment,Internship,Attachment,Volunteer;
        }
        field(3; Description; Text[250])
        {
            DataClassification = ToBeClassified;
        }
        field(4; "Contract Term Period"; DateFormula)
        {
            DataClassification = ToBeClassified;
        }
        field(5; "Maximum No. of Terms"; Integer)
        {
            DataClassification = ToBeClassified;
        }
        field(6; "Maximum Employment Age (Years)"; Integer)
        {
            DataClassification = ToBeClassified;
        }
        field(7; "Linked to Projects"; Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(8; "Pension Benefit"; Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(9; "Service Gratuity Benefit"; Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(10; "No. of Positions"; Integer)
        {
            CalcFormula = count("Company Positions" where("Default Terms of Service" = field(Code)));
            Editable = false;
            FieldClass = FlowField;
        }
        field(11; "No. of Active Employees"; Integer)
        {
            //CalcFormula = count(Employee where ("Current Terms of Service"=field(Code)));
            Editable = false;
            FieldClass = FlowField;
        }
        field(12; "Minumum Employment Age (Years)"; Integer)
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

