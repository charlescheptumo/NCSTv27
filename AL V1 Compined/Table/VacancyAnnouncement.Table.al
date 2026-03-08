#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Table 69630 "Vacancy Announcement"
{

    fields
    {
        field(1; "Announcement No."; Code[30])
        {
            DataClassification = ToBeClassified;
        }
        field(2; "Posting Type"; Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = 'Recruitment Agency Posting,Direct Hire Announcement,Career Fair';
            OptionMembers = "Recruitment Agency Posting","Direct Hire Announcement","Career Fair";
        }
        field(3; "Recruitment Agency No."; Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Recruitment Agency";

            trigger OnValidate()
            begin
                if RecruitmentAgency.Get("Recruitment Agency No.") then
                    "Agency Name" := RecruitmentAgency.Name;
            end;
        }
        field(4; "Agency Name"; Text[50])
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(5; "Actual Recruiter Fees"; Decimal)
        {
            CalcFormula = sum("Vacancy Announcement Line"."Actual Recruiter Fees" where("Announcement No." = field("Announcement No.")));
            Editable = false;
            FieldClass = FlowField;
        }
        field(6; "Career Fair Venue"; Text[50])
        {
            DataClassification = ToBeClassified;
        }
        field(7; "Career Fair Date"; Date)
        {
            DataClassification = ToBeClassified;
        }
        field(8; "Career Fair Start Time"; Date)
        {
            DataClassification = ToBeClassified;
        }
        field(9; "Career Fair End Time"; Time)
        {
            DataClassification = ToBeClassified;
        }
        field(10; "No. of Participants"; Integer)
        {
            CalcFormula = count("Career Fair Attendance" where("Career Fair ID" = field("Announcement No.")));
            Editable = false;
            FieldClass = FlowField;
        }
        field(11; "Document Date"; Date)
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(12; "HR Officer User ID"; Code[30])
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(13; "HR Officer Staff No."; Code[30])
        {
            DataClassification = ToBeClassified;
            Editable = false;
            TableRelation = Employee;
        }
        field(14; "Staff Name"; Text[50])
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(15; Directorate; Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Responsibility Center" where("Operating Unit Type" = const(Directorate));
        }
        field(16; Department; Code[30])
        {
            DataClassification = ToBeClassified;
            //muga
            //TableRelation = "Responsibility Center" where("Operating Unit Type" = const("Department/Center"));
        }
        field(17; Region; Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Responsibility Center" where("Operating Unit Type" = const(Region));
        }
        field(18; "Financial Year Code"; Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Financial Year Code";
        }
        field(19; "Date Published"; Date)
        {
            DataClassification = ToBeClassified;
        }
        field(20; "Application Closing Date"; Date)
        {
            DataClassification = ToBeClassified;
        }
        field(21; "Application Closing  Time"; Time)
        {
            DataClassification = ToBeClassified;
        }
        field(22; "No. of Job Vacancies"; Integer)
        {
            CalcFormula = count("Vacancy Announcement Line" where("Announcement No." = field("Announcement No.")));
            Editable = false;
            FieldClass = FlowField;
        }
        field(23; "Advertisement Cost"; Decimal)
        {
            CalcFormula = sum("Vacancy Announcement Line"."Advertisement Line Cost" where("Announcement No." = field("Announcement No.")));
            Caption = 'Total Actual Advertisement Cost (LCY)';
            Editable = false;
            FieldClass = FlowField;
        }
        field(24; "Approval Status"; Enum "App Status")
        {
            DataClassification = ToBeClassified;
        }
        field(25; "Created On"; Date)
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(26; "Created Time"; Time)
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(27; "Organization Name"; Text[50])
        {
            DataClassification = ToBeClassified;
            Description = '//get from 79';
        }
        field(28; "Organization Overview"; Text[300])
        {
            DataClassification = ToBeClassified;
        }
        field(29; Address; Text[250])
        {
            DataClassification = ToBeClassified;
        }
        field(30; "Address 2"; Text[250])
        {
            DataClassification = ToBeClassified;
        }
        field(31; City; Code[50])
        {
            DataClassification = ToBeClassified;
        }
        field(32; "Post Code"; Code[50])
        {
            DataClassification = ToBeClassified;
        }
        field(33; "Country/Region Code"; Code[50])
        {
            DataClassification = ToBeClassified;
        }
        field(34; "Phone No."; Text[50])
        {
            DataClassification = ToBeClassified;
            ExtendedDatatype = PhoneNo;
        }
        field(35; Contact; Code[50])
        {
            DataClassification = ToBeClassified;
        }
        field(36; Email; Text[50])
        {
            DataClassification = ToBeClassified;
            ExtendedDatatype = EMail;
        }
        field(37; "Home Page"; Text[50])
        {
            DataClassification = ToBeClassified;
            ExtendedDatatype = URL;
        }
        field(38; "No. Series"; Code[10])
        {
            DataClassification = ToBeClassified;
        }
        field(39; "Created By"; Code[30])
        {
            DataClassification = ToBeClassified;
        }
        field(40; Description; Text[250])
        {
            DataClassification = ToBeClassified;
        }
        field(41; Posted; Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(42; "Posted By"; Code[30])
        {
            DataClassification = ToBeClassified;
        }
        field(43; "Posted On"; DateTime)
        {
            DataClassification = ToBeClassified;
        }
        field(44; Ammended; Boolean)
        {
            DataClassification = ToBeClassified;

            trigger OnValidate()
            begin
                UserSetup.Reset();
                UserSetup.SetRange("User ID", UserId);
                UserSetup.FindFirst;
                //IF UserSetup.= FALSE THEN ERROR('You have not been authorised to ammend vacancy adverts in User Setup');
            end;
        }
        field(45; "Ammended By"; Text[50])
        {
            DataClassification = ToBeClassified;
        }
        field(46; "DateTime Ammended"; DateTime)
        {
            DataClassification = ToBeClassified;
        }
        field(47; "Reason for Ammendment"; Text[40])
        {
            DataClassification = ToBeClassified;
        }
        field(48; "Vacancy Status"; Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = 'Draft,Published,Evaluation,Closed,Cancelled';
            OptionMembers = Draft,Published,Evaluation,Closed,Cancelled;
            Editable = false;
        }
        field(49; "Target Candidate Source"; Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = 'Open,Limited-Internal Staff,Limited-External Staff';
            OptionMembers = Open,"Limited-Internal Staff","Limited-External Staff";
        }
    }

    keys
    {
        key(Key1; "Announcement No.", "Posting Type")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }

    trigger OnInsert()
    begin
        //muga
        // HumanResourcesSetup.Get;
        // if "Posting Type" = "posting type"::"Recruitment Agency Posting" then begin
        //     HumanResourcesSetup.TestField("Direct Hire Nos.");
        //     if "Announcement No." = '' then
        //         NoSeriesMgt.InitSeries(HumanResourcesSetup."Direct Hire Nos.", xRec."No. Series", 0D, "Announcement No.", "No. Series");
        // end;
        // if "Posting Type" = "posting type"::"Direct Hire Announcement" then begin
        //     HumanResourcesSetup.TestField("Direct Hire Nos.");
        //     if "Announcement No." = '' then
        //         NoSeriesMgt.InitSeries(HumanResourcesSetup."Direct Hire Nos.", xRec."No. Series", 0D, "Announcement No.", "No. Series");
        // end;
        // if "Posting Type" = "posting type"::"Career Fair" then begin
        //     HumanResourcesSetup.TestField("Direct Hire Nos.");
        //     if "Announcement No." = '' then
        //         NoSeriesMgt.InitSeries(HumanResourcesSetup."Direct Hire Nos.", xRec."No. Series", 0D, "Announcement No.", "No. Series");
        // end;

        "HR Officer User ID" := UserId;
        "Created On" := Today;
        "Created Time" := Time;
        UserSetup.Reset;
        if UserSetup.Get(UserId) then begin
            UserSetup.TestField("Employee No.");
            Employee.Reset;
            Employee.SetRange("No.", UserSetup."Employee No.");
            if Employee.FindFirst then begin
                "Staff Name" := Employee."First Name" + ' ' + Employee."Middle Name" + ' ' + Employee."Last Name";
                "HR Officer Staff No." := Employee."No.";
                Department := Employee."Department Code";
                Directorate := Employee."Directorate Code";
                //Region := UserSetup."Region Code";
                "Created By" := UserId;
            end;

            /*"HR Officer User ID":=USERID;
            "Created On":=TODAY;
            "Created Time":=TIME;
            UserSetup.RESET;
            UserSetup.SETRANGE("User ID",USERID);
            IF UserSetup.FINDFIRST THEN BEGIN
              "HR Officer Staff No.":=UserSetup."Employee No.";
              "Staff Name":=UserSetup."Employee Name";
              Department:=UserSetup."Responsibility Center";
              Region:=UserSetup."Region Code";
              "Created By":=USERID;
             END;*/

            CompanyInformation.Get;
            "Organization Name" := CompanyInformation.Name;
            "Organization Overview" := CompanyInformation.Vision + ' ' + CompanyInformation.Mission + ' ' + CompanyInformation.Motto;
            Address := CompanyInformation.Address;
            "Address 2" := CompanyInformation."Address 2";
            City := CompanyInformation.City;
            "Post Code" := CompanyInformation."Post Code";
            "Phone No." := CompanyInformation."Phone No.";
            Contact := CompanyInformation."Contact Person";
            Email := CompanyInformation."E-Mail";
            "Home Page" := CompanyInformation."Home Page";


            // FinancialYearCode.Reset();
            // FinancialYearCode.FindLast;
            // "Financial Year Code" := FinancialYearCode.Code;
        end;

    end;

    var
        CompanyInformation: Record "Company Information";
        UserSetup: Record "User Setup";
        RecruitmentAgency: Record "Recruitment Agency";
        HumanResourcesSetup: Record "Human Resources Setup";
        NoSeriesMgt: Codeunit "No. Series";
        FinancialYearCode: Record "Financial Year Code";
        Employee: Record Employee;
}

