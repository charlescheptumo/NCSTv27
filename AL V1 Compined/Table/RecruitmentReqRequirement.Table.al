#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Table 69621 "Recruitment Req Requirement"
{

    fields
    {
        field(1;"Document No.";Code[30])
        {
            DataClassification = ToBeClassified;
            Description = 'Recruitment Header/Vacancy';
        }
        field(2;"Document Type";Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = 'Recruitment Requisition,Job Vacancy';
            OptionMembers = "Recruitment Requisition","Job Vacancy";
        }
        field(3;"Requirement ID";Integer)
        {
            DataClassification = ToBeClassified;
        }
        field(4;"Qualification Category";Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = ',Academic,Professional,Skills & Competencies,Experience,Ethics & Integrity,Physical Attributes';
            OptionMembers = ,Academic,Professional,"Skills & Competencies",Experience,"Ethics & Integrity","Physical Attributes";
        }
        field(5;Description;Text[300])
        {
            DataClassification = ToBeClassified;
        }
        field(6;"Requirement Type";Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = 'Mandatory,Added Advantage,Affirmative Action,Special';
            OptionMembers = Mandatory,"Added Advantage","Affirmative Action",Special;
        }
        field(7;"Substitute Qualification Exist";Boolean)
        {
        }
        field(8;"Line No.";Integer)
        {
            AutoIncrement = true;
            DataClassification = ToBeClassified;
        }
        field(9;"Qualification Code";Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = Qualification;
        }
    }

    keys
    {
        key(Key1;"Document No.","Line No.")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

