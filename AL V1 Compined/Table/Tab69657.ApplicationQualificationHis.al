#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Table 69657 "Application Qualification His"
{

    fields
    {
        field(1;"Candidate No.";Code[30])
        {
            DataClassification = ToBeClassified;
        }
        field(2;"Qualification Line No.";Integer)
        {
            DataClassification = ToBeClassified;
        }
        field(3;"Qualification Code";Code[30])
        {
            DataClassification = ToBeClassified;
        }
        field(4;"Line No.";Integer)
        {
            AutoIncrement = true;
            DataClassification = ToBeClassified;
        }
        field(5;"Experience Category";Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = 'Awards/Recognition,Clubs & Societies,Courses/Subjects,Research Project,Leadership,Specific Tasks,Projects';
            OptionMembers = "Awards/Recognition","Clubs & Societies","Courses/Subjects","Research Project",Leadership,"Specific Tasks",Projects;
        }
        field(6;Description;Text[250])
        {
            DataClassification = ToBeClassified;
        }
        field(7;"From Date";Date)
        {
            DataClassification = ToBeClassified;
        }
        field(8;"To Date";Date)
        {
            DataClassification = ToBeClassified;
        }
        field(9;"Application No.";Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Job Applications";
        }
    }

    keys
    {
        key(Key1;"Candidate No.","Line No.")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

