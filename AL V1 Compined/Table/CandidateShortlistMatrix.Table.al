#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Table 69709 "Candidate Shortlist Matrix"
{

    fields
    {
        field(1; "Document Type"; Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = 'Candidate Shortlisting,Interview Invitation';
            OptionMembers = "Candidate Shortlisting","Interview Invitation";
        }
        field(2; "Document No"; Code[30])
        {
            DataClassification = ToBeClassified;
        }
        field(3; "Vacancy ID"; Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Recruitment Requisition Header" where("Document Type" = filter("Job Vacancy"));
        }
        field(4; "Application No."; Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Job Applications";

            trigger OnValidate()
            begin
                JobApplications.Reset;
                JobApplications.SetRange("Application No.", "Application No.");
                if JobApplications.FindFirst then begin
                    "Candidate No" := JobApplications."Candidate No.";
                    "First Name" := JobApplications."First Name";
                    "Middle Name" := JobApplications."Middle Name";
                    "Last Name" := JobApplications."Last Name";
                    "Vacancy ID" := JobApplications."Vacancy Id";
                    "Employee No." := JobApplications."Employee No.";
                    "Phone No." := JobApplications."Phone No.";
                    "Mobile Phone No." := JobApplications."Mobile Phone No.";
                    Email := JobApplications."E-Mail";
                    "Birth Date" := JobApplications."Birth Date";
                    Gender := JobApplications.Gender;
                    "ID Number" := JobApplications."ID Number";
                    "Passport No." := JobApplications."Passport No.";
                    "Tax Registration No." := JobApplications."PIN Registration";
                    "Marital Status" := JobApplications."Marital Status";
                    "Ethnic Group" := JobApplications."Ethnic Group";
                    Nationality := JobApplications.Nationality;
                    "Highest Academic Qualification" := JobApplications."Highest Academic Qualification";
                    Validate("Highest Academic Qualification");
                    "Work Experience (Years)" := JobApplications."Work Experience (Years)";
                    "Management Experience (Years)" := JobApplications."Management Experience (Years)";
                    Religion := JobApplications.Religion;
                    Disabled := JobApplications.Disabled;
                    "Disability Code" := JobApplications."Disability Code";
                    "Disability Description" := JobApplications."Disability Description";
                    "Disability Certificate No" := JobApplications."Disability Certificate No";
                end
            end;
        }
        field(5; "Candidate No"; Code[30])
        {
            DataClassification = ToBeClassified;
        }
        field(6; "First Name"; Text[50])
        {
            DataClassification = ToBeClassified;
        }
        field(7; "Middle Name"; Text[50])
        {
            DataClassification = ToBeClassified;
        }
        field(8; "Last Name"; Text[50])
        {
            DataClassification = ToBeClassified;
        }
        field(9; "Complete Doc Submitted"; Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(10; "Shortlisting Outcome"; Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = ' ,Non-Responsive,Invite for First Interview';
            OptionMembers = " ","Non-Responsive","Invite for First Interview";
        }
        field(11; "Committee Remarks"; Text[300])
        {
            DataClassification = ToBeClassified;
        }
        field(12; "Unsuccesfull App Reason Code"; Code[30])
        {
            DataClassification = ToBeClassified;
        }
        field(13; "Ability Test Report ID"; Code[30])
        {
            DataClassification = ToBeClassified;
        }
        field(14; "Phone Interview Report ID"; Code[30])
        {
            DataClassification = ToBeClassified;
        }
        field(15; "Ability Test Pass Score %"; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(16; "Phone Interview Outcome"; Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = ' ,Pass,Fail';
            OptionMembers = " ",Pass,Fail;
        }
        field(17; "Employee No."; Code[30])
        {
            DataClassification = ToBeClassified;
        }
        field(18; "Phone No."; Text[30])
        {
            DataClassification = ToBeClassified;
        }
        field(19; "Mobile Phone No."; Text[30])
        {
            DataClassification = ToBeClassified;
        }
        field(20; Email; Text[50])
        {
            DataClassification = ToBeClassified;
        }
        field(21; "Birth Date"; Date)
        {
            DataClassification = ToBeClassified;
        }
        field(22; Gender; Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = ' ,Male,Female,Other';
            OptionMembers = " ",Male,Female,Other;
        }
        field(23; "ID Number"; Integer)
        {
            DataClassification = ToBeClassified;
        }
        field(24; "Passport No."; Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(25; "Tax Registration No."; Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(26; "Marital Status"; Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = ' ,Single,Married,Widowed,Separated,Divorced';
            OptionMembers = " ",Single,Married,Widowed,Separated,Divorced;
        }
        field(27; "Ethnic Group"; Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Ethnic Background";
        }
        field(28; Nationality; Code[30])
        {
            DataClassification = ToBeClassified;
        }
        field(29; "Specialization Area"; Code[30])
        {
            DataClassification = ToBeClassified;
        }
        field(30; "Highest Academic Qualification"; Code[30])
        {
            DataClassification = ToBeClassified;
            //cc//TableRelation = "Application Qualification"."Qualification Code";// where ("Qualification Category"=filter(Academic));
        }
        field(31; "Qualification Name"; Text[50])
        {
            DataClassification = ToBeClassified;
        }
        field(32; "Work Experience (Years)"; Integer)
        {
            DataClassification = ToBeClassified;
        }
        field(33; "Management Experience (Years)"; Integer)
        {
            DataClassification = ToBeClassified;
        }
        field(34; "Disability Code"; Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Disability Code";
        }
        field(35; Disabled; Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(36; "Disability Description"; Text[30])
        {
            DataClassification = ToBeClassified;
        }
        field(37; "Disability Certificate No"; Code[30])
        {
            DataClassification = ToBeClassified;
        }
        field(38; Notified; Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(39; "Notified On"; DateTime)
        {
            DataClassification = ToBeClassified;
        }
        field(40; Religion; Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = ' ,Christian,Islam,Hindu, Others';
            OptionMembers = " ",Christian,Islam,Hindu," Others";
        }
        field(41; "Highest Academic Hierarchy Poi"; Integer)
        {
            DataClassification = ToBeClassified;
        }
    }

    keys
    {
        key(Key1; "Document Type", "Document No", "Vacancy ID", "Application No.")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }

    var
        JobApplications: Record "Job Applications";
}

