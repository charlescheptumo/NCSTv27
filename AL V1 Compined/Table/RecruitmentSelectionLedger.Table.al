#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Table 69685 "Recruitment Selection Ledger"
{
    Caption = 'Pre-Employment Checks  Report ID';

    fields
    {
        field(1;"Vacancy No.";Code[30])
        {
            DataClassification = ToBeClassified;

            trigger OnValidate()
            begin
                VacancyAnnouncementLine.Reset;
                VacancyAnnouncementLine.SetRange("Vacancy ID","Vacancy No.");
                if VacancyAnnouncementLine.FindSet then begin
                  repeat
                    VacancyAnnouncement.Reset;
                    VacancyAnnouncement.SetRange("Announcement No.",VacancyAnnouncementLine."Announcement No.");
                    if VacancyAnnouncement.FindFirst then begin
                      if VacancyAnnouncement."Posting Type"=VacancyAnnouncement."posting type"::"Career Fair" then
                        begin
                          "Career Fair ID":=VacancyAnnouncement."Announcement No.";
                        end;
                          if VacancyAnnouncement."Posting Type"=VacancyAnnouncement."posting type"::"Recruitment Agency Posting" then
                        begin
                          "Recruitment Agency Posting ID":=VacancyAnnouncement."Announcement No.";
                        end;
                          if VacancyAnnouncement."Posting Type"=VacancyAnnouncement."posting type"::"Direct Hire Announcement" then
                        begin
                          "Direct Hire Announcement ID":=VacancyAnnouncement."Announcement No.";
                        end;
                    end
                  until VacancyAnnouncementLine.Next=0;
                  end
            end;
        }
        field(2;"Application No.";Code[30])
        {
            DataClassification = ToBeClassified;

            trigger OnValidate()
            begin
                JobApplications.Reset;
                JobApplications.SetRange("Application No.","Application No.");
                if JobApplications.FindFirst then begin
                  "Candidate No.":=JobApplications."Candidate No.";
                  "First Name":=JobApplications."First Name";
                  "Middle Name":=JobApplications."Middle Name";
                  "Last Name":=JobApplications."Last Name";
                  "Employee No.":=JobApplications."Employee No.";
                  "Vacancy No.":=JobApplications."Vacancy Id";
                  Validate("Vacancy No.");

                end
            end;
        }
        field(3;"Candidate No.";Code[30])
        {
            DataClassification = ToBeClassified;
        }
        field(4;"Employee No.";Code[30])
        {
            DataClassification = ToBeClassified;
        }
        field(5;"First Name";Text[50])
        {
            DataClassification = ToBeClassified;
        }
        field(6;"Middle Name";Text[50])
        {
            DataClassification = ToBeClassified;
        }
        field(7;"Last Name";Text[50])
        {
            DataClassification = ToBeClassified;
        }
        field(8;"Direct Hire Announcement ID";Code[30])
        {
            DataClassification = ToBeClassified;
        }
        field(9;"Recruitment Agency Posting ID";Code[30])
        {
            DataClassification = ToBeClassified;
        }
        field(10;"Career Fair ID";Code[30])
        {
            DataClassification = ToBeClassified;
        }
        field(11;"Candidate Shortlisting No.";Code[30])
        {
            DataClassification = ToBeClassified;
        }
        field(12;"Shortlisting Date";Date)
        {
            DataClassification = ToBeClassified;
        }
        field(13;"Shortlisting Outcome";Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = ' ,Non-Responsive,Invite for First Interview';
            OptionMembers = " ","Non-Responsive","Invite for First Interview";
        }
        field(14;"Shortlisting Committee Remarks";Text[150])
        {
            DataClassification = ToBeClassified;
        }
        field(15;"First Interview Invitation No.";Code[30])
        {
            DataClassification = ToBeClassified;
        }
        field(16;"First Interview Report ID";Code[30])
        {
            DataClassification = ToBeClassified;
        }
        field(17;"First Interview Date";Date)
        {
            DataClassification = ToBeClassified;
        }
        field(18;"Minimum Weigh 1st Score %";Decimal)
        {
            Caption = 'Minimum Weighted 1st Interview Pass Score %';
            DataClassification = ToBeClassified;
        }
        field(19;"Weighted 1st Interview  Scor";Decimal)
        {
            Caption = 'Weighted 1st Interview  Score %';
            DataClassification = ToBeClassified;
        }
        field(20;"First Interview Outcome";Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = ' ,Non-Responsive,Invite for Final Interview';
            OptionMembers = " ","Non-Responsive","Invite for Final Interview";
        }
        field(21;"Panel Remarks (Fist Interview)";Text[100])
        {
            DataClassification = ToBeClassified;
        }
        field(22;"Final Interview Invitation No.";Code[30])
        {
            DataClassification = ToBeClassified;
        }
        field(23;"Final Interview Report ID";Code[30])
        {
            DataClassification = ToBeClassified;
        }
        field(24;"Final Interview Date";Date)
        {
            DataClassification = ToBeClassified;
        }
        field(25;"Min Weighted Final  Score";Decimal)
        {
            Caption = 'Minimum Weighted Final Interview Pass Score %';
            DataClassification = ToBeClassified;
        }
        field(26;"Weighted Final Score %";Decimal)
        {
            Caption = 'Weighted Final Interview  Score %';
            DataClassification = ToBeClassified;
        }
        field(27;"Final Interview Outcome";Text[100])
        {
            DataClassification = ToBeClassified;
        }
        field(28;"Final Panel Remarks";Text[350])
        {
            Caption = 'Panel Remarks (Final Interview)';
            DataClassification = ToBeClassified;
        }
        field(29;"Pre-Employment Checks  Report";Code[30])
        {
            Caption = 'Pre-Employment Checks  Report ID';
            DataClassification = ToBeClassified;
        }
        field(30;"Pre-Employment Check Date";Date)
        {
            DataClassification = ToBeClassified;
        }
        field(31;"Pre-Employment Check Outcome";Text[350])
        {
            DataClassification = ToBeClassified;
        }
        field(32;"Appointment Offer No.";Code[30])
        {
            DataClassification = ToBeClassified;
        }
        field(33;"Employment Contract No.";Code[30])
        {
            DataClassification = ToBeClassified;
        }
        field(34;"Induction Plan No.";Code[30])
        {
            DataClassification = ToBeClassified;
        }
        field(35;"Entry No.";Integer)
        {
            AutoIncrement = true;
            DataClassification = ToBeClassified;
        }
    }

    keys
    {
        key(Key1;"Vacancy No.","Application No.","Entry No.")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }

    var
        JobApplications: Record "Job Applications";
        VacancyAnnouncement: Record "Vacancy Announcement";
        VacancyAnnouncementLine: Record "Vacancy Announcement Line";
}

