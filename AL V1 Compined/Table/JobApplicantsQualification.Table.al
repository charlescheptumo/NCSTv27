#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Table 69647 "Job Applicants Qualification"
{

    fields
    {
        field(1; "Candidate No."; Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = Applicant;
        }
        field(2; "Line No."; Integer)
        {
            AutoIncrement = true;
            DataClassification = ToBeClassified;
        }
        field(3; "Qualification Category"; Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = ',Academic,Professional,Skills & Competencies,Experience,Ethics & Integrity,Physical Attributes,Professional Bodies,Training';
            OptionMembers = ,Academic,Professional,"Skills & Competencies",Experience,"Ethics & Integrity","Physical Attributes","Professional Bodies",Training;
        }
        field(4; "Qualification Code"; Code[100])
        {
            DataClassification = ToBeClassified;
            //TableRelation = Qualification where("Qualification Category" = field("Qualification Category"));
        }
        field(5; "Specialized Domain Area"; Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Domain Area";
        }
        field(6; "From Date"; Date)
        {
            DataClassification = ToBeClassified;
        }
        field(7; "To Date"; Date)
        {
            DataClassification = ToBeClassified;
        }
        field(8; Type; Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = 'Internal,External';
            OptionMembers = Internal,External;
        }
        field(9; Description; Text[100])
        {
            DataClassification = ToBeClassified;
        }
        field(10; "Institution/Company"; Text[100])
        {
            DataClassification = ToBeClassified;
        }
        field(11; Cost; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(12; "Course Grade"; Code[30])
        {
            DataClassification = ToBeClassified;
        }
        field(13; "Job Applicant Status"; Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = 'Active,Inactive';
            OptionMembers = Active,Inactive;
        }
        field(14; Comment; Text[50])
        {
            DataClassification = ToBeClassified;
        }
        field(15; "Expiration Date"; Date)
        {
            DataClassification = ToBeClassified;
        }
        field(16; "Education Level"; Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = ' ,Post Doctorate,PHD,Masters,Degree,Post Graduate Diploma,Diploma,Certificate,A-LEVEL,O-LEVEL,KCSE';
            OptionMembers = " ","Post Doctorate",PHD,Masters,Degree,"Post Graduate Diploma",Diploma,Certificate,"A-LEVEL","O-LEVEL",KCSE;
        }
        field(17; Country; Text[50])
        {
            DataClassification = ToBeClassified;
        }
        field(18; "Attained Score"; Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = ' ,First Class Hons,Second Class Upper,Second Class Lower,Destinction,Pass,Credit,Others';
            OptionMembers = " ","First Class Hons","Second Class Upper","Second Class Lower",Destinction,Pass,Credit,Others;
        }
        field(19; "Graduation Year"; Text[50])
        {
            DataClassification = ToBeClassified;
        }
        field(20; "Membership Registration No"; Text[50])
        {
            DataClassification = ToBeClassified;
        }
        field(21; "Membership Type"; Text[50])
        {
            DataClassification = ToBeClassified;
        }
        field(22; "Member Renewal Date"; Date)
        {
            DataClassification = ToBeClassified;
        }
        field(23; "Licensing Number"; Text[50])
        {
            DataClassification = ToBeClassified;
        }
        field(24; "Licensing Renewal Date"; Date)
        {
            DataClassification = ToBeClassified;
        }
        field(25; "Job Description/Designation"; Text[50])
        {
            DataClassification = ToBeClassified;
        }
        field(26; "Terms of Service"; Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = ' ,Permanent and Pensionable,Contract,Casual,Internship';
            OptionMembers = " ","Permanent and Pensionable",Contract,Casual,Internship;
        }
        field(27; "Experience Years"; Text[30])
        {
            DataClassification = ToBeClassified;
        }
        field(28; "Duties and Resposibilities"; Text[250])
        {
            DataClassification = ToBeClassified;
        }
        field(29; "Duration(Days)"; Integer)
        {
            DataClassification = ToBeClassified;
        }
        field(30; "Converted Full Years"; Integer)
        {
            DataClassification = ToBeClassified;
        }
        field(31; "Converted Full Months"; Integer)
        {
            DataClassification = ToBeClassified;
        }
        field(32; "Converted Full Days"; Integer)
        {
            DataClassification = ToBeClassified;
        }
        field(33; "Proffessional Qualifications"; Text[100])
        {
            DataClassification = ToBeClassified;
        }
        field(34; "Submission Date"; DateTime)
        {
            DataClassification = ToBeClassified;
        }
        field(35; "Other Academic Qualifications"; Text[250])
        {
            DataClassification = ToBeClassified;
            Description = '//For Other Academic Qualification besides the provided options';
        }
        field(36; "Employment Type"; Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = ' ,Government,Private';
            OptionMembers = " ",Government,Private;
        }
        field(37; "Reasons for leaving"; Text[250])
        {
            DataClassification = ToBeClassified;
        }
        field(38; "Previous Salary"; Integer)
        {
            DataClassification = ToBeClassified;
        }
        field(39; "Membership Status"; Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = 'Active,Inactive';
            OptionMembers = Active,Inactive;
        }
    }

    keys
    {
        key(Key1; "Candidate No.", "Line No.")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

