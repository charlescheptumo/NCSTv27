#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Table 69707 "Candidate Selection Panel"
{

    fields
    {
        field(1;"Document Type";Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = 'Candidate Shortlisting,Interview Invitation';
            OptionMembers = "Candidate Shortlisting","Interview Invitation";
        }
        field(2;"Document No";Code[30])
        {
            DataClassification = ToBeClassified;
        }
        field(3;"Panel ID";Code[30])
        {
            DataClassification = ToBeClassified;
        }
        field(4;Description;Text[250])
        {
            DataClassification = ToBeClassified;
        }
        field(5;Venue;Text[150])
        {
            DataClassification = ToBeClassified;
        }
        field(6;"Room No.";Text[100])
        {
            DataClassification = ToBeClassified;
        }
        field(7;"No of Committee Members";Integer)
        {
            CalcFormula = count("Candidate Selection Panelist" where ("Panel ID"=field("Panel ID")));
            Editable = false;
            FieldClass = FlowField;
        }
    }

    keys
    {
        key(Key1;"Document Type","Document No","Panel ID")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

