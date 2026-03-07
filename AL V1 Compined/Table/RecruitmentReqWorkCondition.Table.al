#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Table 69620 "Recruitment Req Work Condition"
{

    fields
    {
        field(1;"Document No";Code[30])
        {
            DataClassification = ToBeClassified;
        }
        field(2;"Document Type";Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = 'Recruitment Requisition,Job Vacancy';
            OptionMembers = "Recruitment Requisition","Job Vacancy";
        }
        field(3;"Line No";Integer)
        {
            AutoIncrement = true;
            DataClassification = ToBeClassified;
        }
        field(4;"Working Condition Category";Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = 'General Work Environment,Travel/Relocation,Special Tools & Equipment,Other Special Conditions,Workplace Rules';
            OptionMembers = "General Work Environment","Travel/Relocation","Special Tools & Equipment","Other Special Conditions","Workplace Rules";
        }
        field(5;Description;Text[300])
        {
            DataClassification = ToBeClassified;
        }
    }

    keys
    {
        key(Key1;"Document No","Document Type","Line No")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

