#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Table 69622 "Vacancy"
{

    fields
    {
        field(1;"Vacancy No";Code[30])
        {
            DataClassification = ToBeClassified;
        }
        field(2;"Requisition Line";Integer)
        {
            AutoIncrement = true;
            DataClassification = ToBeClassified;
        }
        field(3;"Recruitment Plan ID";Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Recruitment Plan";
        }
        field(4;"Position ID";Code[30])
        {
            DataClassification = ToBeClassified;
        }
        field(5;"Duty Station";Code[30])
        {
            DataClassification = ToBeClassified;
        }
        field(6;"Recruitment Requisition Code";Code[30])
        {
            DataClassification = ToBeClassified;
        }
        field(8;"No of Openings";Integer)
        {
            DataClassification = ToBeClassified;
        }
        field(9;"Primary Recruitment Reason";Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Recruitment Reason Code";
        }
        field(10;"Recruitment Justification";Text[100])
        {
            DataClassification = ToBeClassified;
        }
        field(11;"Target Candidate Source";Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = 'Open,Limited-Internal Staff,Limited-External Staff';
            OptionMembers = Open,"Limited-Internal Staff","Limited-External Staff";
        }
        field(12;"Sourcing Method";Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = 'Recruitment Agency,Direct Hire';
            OptionMembers = "Recruitment Agency","Direct Hire";
        }
        field(13;"Recruitment Cycle Type";Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = 'Standard,Expedited';
            OptionMembers = Standard,Expedited;
        }
        field(14;"Recruitment Lead Time";DateFormula)
        {
            DataClassification = ToBeClassified;
        }
        field(15;"Planned Recruitment Start Date";Date)
        {
            DataClassification = ToBeClassified;
        }
        field(16;"Planned Recruitment End Date";Date)
        {
            DataClassification = ToBeClassified;
        }
        field(17;"Planned Employment Start Date";Date)
        {
            DataClassification = ToBeClassified;
        }
        field(18;"Planned Employment End Date";Date)
        {
            DataClassification = ToBeClassified;
        }
        field(19;"Job No.";Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = Job;
        }
        field(20;"Job Task No.";Code[30])
        {
            DataClassification = ToBeClassified;
        }
        field(21;"Funding Source ID";Code[30])
        {
            DataClassification = ToBeClassified;
        }
        field(22;"Recruitment Line Budget Cost";Decimal)
        {
            Caption = 'Recruitment Line Budget Cost(LCY)';
            DataClassification = ToBeClassified;
        }
        field(23;"Average Cost/Hire";Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(24;"Estimate Annual Salary";Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(25;"Hierarchically Reports To";Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Company Positions";
        }
        field(26;"Functionally  Reports To";Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Company Positions";
        }
        field(27;"Job Grade ID";Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Salary Scales";
        }
        field(28;"Overall Appointment Authority";Code[30])
        {
            DataClassification = ToBeClassified;
        }
        field(29;"Seniority Level";Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = ',Entry-Level,Mid-Level,Senior-Level,Executive';
            OptionMembers = ,"Entry-Level","Mid-Level","Senior-Level",Executive;
        }
        field(30;"Default Terms of Service Code";Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Terms of Service";
        }
        field(31;"Employment Type";Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = 'Permanent,Contract,Casual,Internship,Attachment';
            OptionMembers = Permanent,Contract,Casual,Internship,Attachment;
        }
        field(32;Directorate;Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Responsibility Center" where ("Operating Unit Type"=filter(Directorate));
        }
        field(33;Department;Code[30])
        {
            DataClassification = ToBeClassified;
            //muga
            //TableRelation = "Responsibility Center" where ("Operating Unit Type"=filter("Department/Center"));
        }
        field(34;"Dimension Set ID";Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Responsibility Center" where ("Operating Unit Type"=filter(Region));
        }
        field(35;"Vacancy Status";Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = 'Draft,Published,Evalution,Closed,Cancelled';
            OptionMembers = Draft,Published,Evalution,Closed,Cancelled;
        }
        field(36;"Job Announcement ID";Code[30])
        {
            DataClassification = ToBeClassified;
        }
        field(37;"Date Published";Date)
        {
            DataClassification = ToBeClassified;
        }
        field(38;"No of Applicants";Integer)
        {
            DataClassification = ToBeClassified;
        }
        field(39;"No of Filled Posts";Integer)
        {
            DataClassification = ToBeClassified;
        }
    }

    keys
    {
        key(Key1;"Vacancy No")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

