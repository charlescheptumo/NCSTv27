#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Table 69666 "Job Application Requirements"
{

    fields
    {
        field(1;"Application No.";Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Job Applications";
        }
        field(2;"Vacancy No.";Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Recruitment Requisition Header";
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
        field(5;"Qualification Code";Code[30])
        {
            DataClassification = ToBeClassified;
        }
        field(6;Description;Text[250])
        {
            DataClassification = ToBeClassified;
        }
        field(7;"Requirement Type";Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = 'Mandatory,Added Advantage';
            OptionMembers = Mandatory,"Added Advantage";
        }
        field(8;"Candidates Response";Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = 'Does Not Meet Criterion,Meets Criterion';
            OptionMembers = "Does Not Meet Criterion","Meets Criterion";
        }
        field(9;"No. of AutoMatched";Integer)
        {
            Caption = 'No. of AutoMatched Qualification';
            DataClassification = ToBeClassified;
        }
        field(10;"Line No.";Integer)
        {
            AutoIncrement = true;
            DataClassification = ToBeClassified;
        }
        field(11;"Min. No. Required";Integer)
        {
            DataClassification = ToBeClassified;
        }
        field(12;"Candidate No. Provided";Integer)
        {
            DataClassification = ToBeClassified;
        }
    }

    keys
    {
        key(Key1;"Application No.","Line No.")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

