#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Table 69702 "PreScreening Line"
{

    fields
    {
        field(1;"Document Type";Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = 'Ability Test Invitation,Phone Interview Report';
            OptionMembers = "Ability Test Invitation","Phone Interview Report";
        }
        field(2;"Document No.";Code[30])
        {
            DataClassification = ToBeClassified;
        }
        field(3;"Vacancy ID";Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Recruitment Requisition Header" where ("Document Type"=filter("Job Vacancy"));
        }
        field(4;"Application No.";Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Job Applications" where ("Vacancy Id"=field("Vacancy ID"));

            trigger OnValidate()
            begin
                JobApplication.Reset;
                JobApplication.SetRange("Application No.","Application No.");
                if JobApplication.FindFirst then begin
                  "Candidate No.":=JobApplication."Candidate No.";
                  "First Name":=JobApplication."First Name";
                  "Middle Name":=JobApplication."Middle Name";
                  "Last Name":=JobApplication."Last Name";
                  "Employee No.":=JobApplication."Employee No.";
                  "Phone No.":=JobApplication."Phone No.";
                  "Mobile Phone No.":=JobApplication."Mobile Phone No.";
                  Email:=JobApplication."E-Mail";

                end
            end;
        }
        field(5;"Candidate No.";Code[30])
        {
            DataClassification = ToBeClassified;
        }
        field(6;"First Name";Text[50])
        {
            DataClassification = ToBeClassified;
        }
        field(7;"Middle Name";Text[50])
        {
            DataClassification = ToBeClassified;
        }
        field(8;"Last Name";Text[50])
        {
            DataClassification = ToBeClassified;
        }
        field(9;"Employee No.";Code[30])
        {
            DataClassification = ToBeClassified;
        }
        field(10;"Phone No.";Text[30])
        {
            DataClassification = ToBeClassified;
        }
        field(11;"Mobile Phone No.";Text[30])
        {
            DataClassification = ToBeClassified;
        }
        field(12;Email;Text[30])
        {
            DataClassification = ToBeClassified;
        }
        field(13;"Planned Start Date";Date)
        {
            DataClassification = ToBeClassified;
        }
        field(14;"Test Start Time";Time)
        {
            DataClassification = ToBeClassified;
        }
        field(15;"Test End Time";Time)
        {
            DataClassification = ToBeClassified;
        }
        field(16;"Ability Test Response ID";Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Ability Test Response";
        }
        field(17;"Ability Test Pass Score %";Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(18;"Phone Interview Outcome";Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = ' ,Pass,Fail';
            OptionMembers = " ",Pass,Fail;
        }
        field(19;Notified;Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(20;"DateTime Notified";DateTime)
        {
            DataClassification = ToBeClassified;
        }
        field(21;"No. of Questions";Integer)
        {
            CalcFormula = count("PreScreening Phone Log" where ("Vacancy ID"=field("Vacancy ID"),
                                                                "Application No."=field("Application No.")));
            FieldClass = FlowField;
        }
    }

    keys
    {
        key(Key1;"Document Type","Document No.","Vacancy ID","Application No.")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }

    var
        JobApplication: Record "Job Applications";
}

