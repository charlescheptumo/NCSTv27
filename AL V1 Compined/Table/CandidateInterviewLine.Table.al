#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Table 69715 "Candidate Interview Line"
{

    fields
    {
        field(1;"Document Type";Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = 'Candidate Shortlisting,Interview Invitation,Consolidated Interview Report';
            OptionMembers = "Candidate Shortlisting","Interview Invitation","Consolidated Interview Report";
        }
        field(2;"Document No.";Code[30])
        {
            DataClassification = ToBeClassified;
        }
        field(3;"Source Type";Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = ' ,Previous Interview,Final Shortlisting';
            OptionMembers = " ","Previous Interview","Final Shortlisting";
        }
        field(4;"Source Document No.";Code[30])
        {
            DataClassification = ToBeClassified;
        }
        field(5;"Application No.";Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Job Applications";

            trigger OnValidate()
            begin
                JobApplications.Reset;
                JobApplications.SetRange("Application No.","Application No.");
                if JobApplications.FindFirst then begin
                  "Candidate No.":=JobApplications."Candidate No.";
                  "First Name":=JobApplications."First Name";
                  "Middle Name":=JobApplications."Middle Name";
                  "Last Name":=JobApplications."Last Name";
                  "Phone No.":=JobApplications."Phone No.";
                  Email:=JobApplications."E-Mail";
                  "Mobile Phone No.":=JobApplications."Mobile Phone No.";
                  "Birth Date":=JobApplications."Birth Date";
                  "ID Number":=JobApplications."ID Number";
                  "Passport No.":=JobApplications."Passport No.";
                  "Ethnic Group":=JobApplications."Ethnic Group";
                  Nationality:=JobApplications.Nationality;
                  "Specialization Area":=JobApplications."Specialization Area";
                  "Highest Academic Qualification":=JobApplications."Highest Academic Qualification";
                  "General Work Experience Yrs":=JobApplications."Work Experience (Years)";
                  "Management Experience Yrs":=JobApplications."Management Experience (Years)";
                  Disabled:=JobApplications.Disabled;
                  "Disability Description":=JobApplications."Disability Description";
                  "Disability Cert No.":=JobApplications."Disability Certificate No";
                  "Disability Code":=JobApplications."Disability Code";
                  //"Highest Academic Pointer":=JobApplications.p
                end
            end;
        }
        field(6;"Candidate No.";Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = Applicant;
        }
        field(7;"First Name";Text[50])
        {
            DataClassification = ToBeClassified;
        }
        field(8;"Middle Name";Text[50])
        {
            DataClassification = ToBeClassified;
        }
        field(9;"Last Name";Text[50])
        {
            DataClassification = ToBeClassified;
        }
        field(10;"Interview Date";Date)
        {
            DataClassification = ToBeClassified;
        }
        field(11;"Interview Start Time";Time)
        {
            DataClassification = ToBeClassified;
        }
        field(12;"Interview End Time";Time)
        {
            DataClassification = ToBeClassified;
        }
        field(13;"Assigned Panel ID";Code[30])
        {
            DataClassification = ToBeClassified;
        }
        field(14;"Interview Venue";Text[300])
        {
            DataClassification = ToBeClassified;
        }
        field(15;"Room No.";Code[30])
        {
            DataClassification = ToBeClassified;
        }
        field(16;"Candidate Attendance Status";Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = 'Pending Confirmation,Confirmed,Confirmed with Reschedule Request,Cancelled';
            OptionMembers = "Pending Confirmation",Confirmed,"Confirmed with Reschedule Request",Cancelled;
        }
        field(17;"Vacancy ID";Code[30])
        {
            DataClassification = ToBeClassified;
        }
        field(18;"Candidate Shortlist Voucher";Code[30])
        {
            DataClassification = ToBeClassified;
        }
        field(19;"Interview Panel Outcome";Option)
        {
            Caption = 'Final Interview Panel Outcome';
            DataClassification = ToBeClassified;
            OptionCaption = ' ,Unsuccesful,Succesful';
            OptionMembers = " ",Unsuccesful,Succesful;
        }
        field(20;"Interview Panel Score %";Decimal)
        {
            Caption = 'Final Interview Panel Score %';
            DataClassification = ToBeClassified;
        }
        field(21;"Interview Panel Remarks";Text[350])
        {
            DataClassification = ToBeClassified;
        }
        field(22;"Unsuccesful Application Reason";Code[30])
        {
            DataClassification = ToBeClassified;
        }
        field(23;"Phone No.";Text[30])
        {
            DataClassification = ToBeClassified;
        }
        field(24;"Mobile Phone No.";Text[30])
        {
            DataClassification = ToBeClassified;
        }
        field(25;Email;Text[30])
        {
            DataClassification = ToBeClassified;
        }
        field(26;"Birth Date";Date)
        {
            DataClassification = ToBeClassified;
        }
        field(27;Gender;Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = 'Female,Male,Other';
            OptionMembers = Female,Male,Other;
        }
        field(28;"ID Number";Integer)
        {
            DataClassification = ToBeClassified;
        }
        field(29;"Passport No.";Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(30;"Tax Registration(PIN)";Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(31;"Marital Status";Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = ' ,Single,Married,Widowed,Separated,Divorced';
            OptionMembers = " ",Single,Married,Widowed,Separated,Divorced;
        }
        field(32;Religion;Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = ' ,Christian,Islam,Hindu, Others';
            OptionMembers = " ",Christian,Islam,Hindu," Others";
        }
        field(33;"Ethnic Group";Code[30])
        {
            DataClassification = ToBeClassified;
        }
        field(34;Nationality;Code[30])
        {
            DataClassification = ToBeClassified;
        }
        field(35;"Specialization Area";Code[30])
        {
            DataClassification = ToBeClassified;
        }
        field(36;"Highest Academic Qualification";Code[30])
        {
            DataClassification = ToBeClassified;
        }
        field(37;"Academic Qualification Name";Text[50])
        {
            DataClassification = ToBeClassified;
        }
        field(38;"Highest Academic Pointer";Integer)
        {
            DataClassification = ToBeClassified;
        }
        field(39;"General Work Experience Yrs";Integer)
        {
            DataClassification = ToBeClassified;
        }
        field(40;"Management Experience Yrs";Integer)
        {
            DataClassification = ToBeClassified;
        }
        field(41;"Disability Code";Code[30])
        {
            DataClassification = ToBeClassified;
        }
        field(42;Disabled;Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(43;"Disability Description";Text[100])
        {
            DataClassification = ToBeClassified;
        }
        field(44;"Disability Cert No.";Code[30])
        {
            DataClassification = ToBeClassified;
        }
        field(45;Notified;Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(46;"Notified On";DateTime)
        {
            DataClassification = ToBeClassified;
        }
        field(47; "Expected Salary"; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(48; "Availability Date"; Date)
        {
            DataClassification = ToBeClassified;
        }
    }

    keys
    {
        key(Key1;"Document Type","Document No.","Application No.","Source Document No.")
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

