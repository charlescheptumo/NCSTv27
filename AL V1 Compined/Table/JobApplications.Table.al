#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Table 69646 "Job Applications"
{

    fields
    {
        field(1; "Candidate No."; Code[20])
        {
            Caption = 'Candidate No.';
            TableRelation = Applicant;

            trigger OnValidate()
            begin

                if Applicant.Get("Candidate No.") then begin
                    "First Name" := Applicant."First Name";
                    "Middle Name" := Applicant."Middle Name";
                    "E-Mail" := Applicant."E-Mail";
                    "Last Name" := Applicant."Last Name";
                    Names := Applicant."First Name" + ' ' + Applicant."Middle Name" + ' ' + Applicant."Last Name";
                    Address := Applicant.Address;
                    "Country/Region Code" := Applicant."Country/Region Code";
                    "Birth Date" := Applicant."Birth Date";
                    "ID Number" := Applicant."ID Number";
                    "Passport No." := Applicant."Passport No.";
                    "Post Code" := Applicant."Post Code";
                    City := Applicant.City;
                    "Ethnic Group" := Applicant."Ethnic Group";
                    Gender := Applicant.Gender;
                    "Marital Status" := Applicant."Marital Status";
                    Nationality := Applicant.Nationality;
                    "County of Birth" := Applicant."County of Birth";
                    "Mobile Phone No." := Applicant."Mobile Phone No.";
                    "Phone No." := Applicant."Phone No.";
                    "County of Birth" := Applicant."County of Birth";
                    "Disability Certificate No" := Applicant."Disability Certificate No";
                    "Disability Certificate Expiry" := Applicant."Disability Certificate Expiry";
                    "Disability Code" := Applicant."Disability Code";
                    "Disability Description" := Applicant."Disability Description";
                    Disabled := Applicant.Disabled;
                    Religion := Applicant.Religion;
                    "Highest Academic Qualification" := Applicant."Highest Academic Qualification";
                    "Management Experience (Years)" := Applicant."Management Experience (Years)";
                    "Work Experience (Years)" := Applicant."Work Experience (Years)";
                    "Qualification Name" := Applicant."Qualification Name";
                    "Professional Summary" := Applicant."Skills & Competences";
                end;
            end;
        }
        field(2; "First Name"; Text[30])
        {
            Caption = 'First Name';
        }
        field(3; "Middle Name"; Text[30])
        {
            Caption = 'Middle Name';
        }
        field(4; "Last Name"; Text[30])
        {
            Caption = 'Last Name';
        }
        field(5; "Full Names"; Text[200])
        {
            Caption = 'Initials';
        }
        field(6; "Employee No."; Code[30])
        {
            DataClassification = ToBeClassified;
        }
        field(7; "Professional Summary"; Text[440])
        {
            DataClassification = ToBeClassified;
        }
        field(8; Address; Text[100])
        {
            Caption = 'Address';
        }
        field(9; "Address 2"; Text[50])
        {
            Caption = 'Address 2';
        }
        field(10; City; Text[30])
        {
            Caption = 'City';
            TableRelation = if ("Country/Region Code" = const('')) "Post Code".City
            else
            if ("Country/Region Code" = filter(<> '')) "Post Code".City where("Country/Region Code" = field("Country/Region Code"));
            //This property is currently not supported
            //TestTableRelation = false;
            ValidateTableRelation = false;

            trigger OnLookup()
            begin
                PostCode.LookupPostCode(City, "Post Code", "County of Birth", Nationality);
            end;

            trigger OnValidate()
            begin
                PostCode.ValidateCity(City, "Post Code", "County of Birth", Nationality, (CurrFieldNo <> 0) and GuiAllowed);
            end;
        }
        field(11; "Post Code"; Code[20])
        {
            Caption = 'Post Code';
            TableRelation = if ("Country/Region Code" = const('')) "Post Code"
            else
            if ("Country/Region Code" = filter(<> '')) "Post Code" where("Country/Region Code" = field("Country/Region Code"));
            //This property is currently not supported
            //TestTableRelation = false;
            ValidateTableRelation = false;

            trigger OnLookup()
            begin
                PostCode.LookupPostCode(City, "Post Code", "County of Birth", Nationality);
            end;

            trigger OnValidate()
            begin
                PostCode.ValidatePostCode(City, "Post Code", "County of Birth", Nationality, (CurrFieldNo <> 0) and GuiAllowed);
            end;
        }
        field(12; "County of Birth"; Text[30])
        {
            Caption = 'County';
        }
        field(13; "Phone No."; Text[15])
        {
            Caption = 'Phone No.';
            ExtendedDatatype = PhoneNo;
        }
        field(14; "Mobile Phone No."; Text[15])
        {
            Caption = 'Mobile Phone No.';
            ExtendedDatatype = PhoneNo;
        }
        field(15; "E-Mail"; Text[70])
        {
            Caption = 'Email';
            ExtendedDatatype = EMail;

            trigger OnValidate()
            var
                MailManagement: Codeunit Mail;
            begin
                // MailManagement.ValidateEmailAddressField("E-Mail");
            end;
        }
        field(16; Picture; Media)
        {
            Caption = 'Picture';
            ObsoleteReason = 'Replaced by Image field';
            ObsoleteState = Pending;
        }
        field(17; "Birth Date"; Date)
        {
            Caption = 'Birth Date';
        }
        field(18; Gender; Option)
        {
            Caption = 'Gender';
            OptionCaption = ' ,Male,Female,Both';
            OptionMembers = " ",Male,Female,Both;
        }
        field(19; "Country/Region Code"; Code[10])
        {
            Caption = 'Country/Region Code';
            TableRelation = "Country/Region";

            trigger OnValidate()
            begin
                PostCode.CheckClearPostCodeCityCounty(City, "Post Code", "County of Birth", Nationality, xRec.Nationality);
            end;
        }
        field(20; "ID Number"; Integer)
        {
        }
        field(21; "Passport No."; Code[30])
        {
            ExtendedDatatype = EMail;

            trigger OnValidate()
            var
                MailManagement: Codeunit Mail;
            begin
            end;
        }
        field(22; "Marital Status"; Option)
        {
            OptionCaption = ' ,Single,Married,Widowed,Separated,Divorced';
            OptionMembers = " ",Single,Married,Widowed,Separated,Divorced;
        }
        field(23; Religion; Option)
        {
            OptionCaption = ' ,Christian,Islam,Hindu, Others';
            OptionMembers = " ",Christian,Islam,Hindu," Others";
        }
        field(24; "Ethnic Group"; Code[30])
        {
            TableRelation = "Ethnic Background";
        }
        field(25; Nationality; Code[30])
        {
        }
        field(26; "Specialization Area"; Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Domain Area";
        }
        field(27; "Highest Academic Qualification"; Code[50])
        {
            TableRelation = "Application Qualification"."Qualification Code" where("Qualification Category" = filter(Academic),
                                                                                    "Application No." = field("Application No."));

            trigger OnValidate()
            begin
                Qualification.Reset;
                Qualification.SetRange("Qualification Code", "Highest Academic Qualification");
                if Qualification.FindSet then
                    "Qualification Name" := Qualification.Description;
            end;
        }
        field(28; "Qualification Name"; Text[250])
        {
            DataClassification = ToBeClassified;
        }
        field(29; "Work Experience (Years)"; Integer)
        {
            DataClassification = ToBeClassified;
        }
        field(30; "Management Experience (Years)"; Integer)
        {
            DataClassification = ToBeClassified;
        }
        field(31; "Disability Code"; Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Disability Code";
        }
        field(32; Disabled; Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(33; "Disability Description"; Text[30])
        {
            DataClassification = ToBeClassified;
        }
        field(34; "Disability Certificate No"; Code[30])
        {
            DataClassification = ToBeClassified;
        }
        field(35; "Position Id"; Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Recruitment Planning Line"."Position ID";
        }
        field(36; "Job Title/Designation"; Text[50])
        {
            DataClassification = ToBeClassified;
        }
        field(37; "Duty Station ID"; Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Duty Station";
        }
        field(38; "Work Location Details"; Text[300])
        {
            DataClassification = ToBeClassified;
        }
        field(39; "No. of Openings"; Integer)
        {
            DataClassification = ToBeClassified;
        }
        field(40; "Target Candidate Source"; Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = 'Open,Limited-Internal Staff,Limited-External Staff';
            OptionMembers = Open,"Limited-Internal Staff","Limited-External Staff";
        }
        field(41; Directorate; Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Responsibility Center" where("Operating Unit Type" = filter(Directorate));
        }
        field(42; Department; Code[30])
        {
            DataClassification = ToBeClassified;
            //TableRelation = "Responsibility Center" where("Operating Unit Type" = filter("Department/Center"));
        }
        field(43; "Region ID"; Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Responsibility Center" where("Operating Unit Type" = filter(Region));
        }
        field(44; "Seniority Level"; Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = ',Entry-Level,Mid-Level,Senior-Level,Executive';
            OptionMembers = ,"Entry-Level","Mid-Level","Senior-Level",Executive;
        }
        field(45; "Terms of Service Code"; Code[30])
        {
            DataClassification = ToBeClassified;
        }
        field(46; "Employment Type"; Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = 'Permanent,Contract,Casual,Internship,Attachment';
            OptionMembers = Permanent,Contract,Casual,Internship,Attachment;
        }
        field(47; "Vacancy Id"; Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Recruitment Requisition Header";

            trigger OnValidate()
            begin
                if RecruitmentRequisition.Get("Vacancy Id") then begin
                    "Position Id" := RecruitmentRequisition."Position ID";
                    "Terms of Service Code" := RecruitmentRequisition."Default Terms of Service Code";
                    "Work Location Details" := RecruitmentRequisition."Work Location Details";
                    "Seniority Level" := RecruitmentRequisition."Seniority Level";
                    "Employment Type" := RecruitmentRequisition."Seniority Level";
                    "Region ID" := RecruitmentRequisition.Region;
                    Department := RecruitmentRequisition.Department;
                    Directorate := RecruitmentRequisition.Directorate;
                    "Job Title/Designation" := RecruitmentRequisition."Job Title/Designation";
                    "Target Candidate Source" := RecruitmentRequisition."Target Candidate Source";
                    "No. of Openings" := RecruitmentRequisition."No of Openings";
                end;
            end;
        }
        field(48; "Application No."; Code[30])
        {
            DataClassification = ToBeClassified;
        }
        field(49; "Application Status"; Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = 'Open,System Shortlisting,Oral Interview,Written Interview,Closed,Failed System Shortlisting';
            OptionMembers = Open,"System Shortlisting","Oral Interview","Written Interview",Closed,"Failed System Shortlisting";
        }
        field(50; "No. Series"; Code[30])
        {
            DataClassification = ToBeClassified;
        }
        field(51; "PIN Registration"; Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(52; "Applications Closing Date"; Date)
        {
            DataClassification = ToBeClassified;
        }
        field(53; "Applications Closing Time"; Time)
        {
            DataClassification = ToBeClassified;
        }
        field(54; "Pre-Screening Template ID"; Code[30])
        {
            DataClassification = ToBeClassified;
        }
        field(55; "Current Employment Status"; Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = 'Public Service,Private Sector,Unemployed';
            OptionMembers = "Public Service","Private Sector",Unemployed;
        }
        field(56; "Employer Name"; Text[150])
        {
            DataClassification = ToBeClassified;
        }
        field(57; Station; Text[150])
        {
            DataClassification = ToBeClassified;
        }
        field(58; "Personal No."; Code[50])
        {
            DataClassification = ToBeClassified;
        }
        field(59; "Present Substantive Post"; Text[150])
        {
            DataClassification = ToBeClassified;
        }
        field(60; "Job Grade"; Text[150])
        {
            DataClassification = ToBeClassified;
        }
        field(61; "Secondment Organization"; Text[150])
        {
            DataClassification = ToBeClassified;
        }
        field(62; "Secondment Designation"; Text[150])
        {
            DataClassification = ToBeClassified;
        }
        field(63; "Secondment Job Group"; Text[50])
        {
            DataClassification = ToBeClassified;
        }
        field(64; "Gross Salary"; Integer)
        {
            DataClassification = ToBeClassified;
        }
        field(65; "Background Checks Pass"; Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(66; "Referee Checks Pass"; Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(67; "Medical Checks Pass"; Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(68; "Disability Certificate Expiry"; Date)
        {
            DataClassification = ToBeClassified;
        }
        field(69; "Names"; text[250])
        {
            DataClassification = ToBeClassified;
        }
    }

    keys
    {
        key(Key1; "Application No.")
        {
            Clustered = true;
        }
        key(Key2; "Vacancy Id", "Ethnic Group")
        {
        }
    }

    fieldgroups
    {
    }

    trigger OnInsert()
    begin
        HumanResourcesSetup.Get;
        HumanResourcesSetup.TestField("Job Application Nos");
        if "Application No." = '' then begin
            //muga
            //NoSeriesMgt.InitSeries(HumanResourcesSetup."Job Application Nos", xRec."No. Series", 0D, "Application No.", "No. Series");
        end;
        if jappl.Get("Candidate No.") then
            Names := jappl."First Name" + ' ' + jappl."Middle Name" + ' ' + jappl."Last Name";


    end;

    var
        jappl: Record "Job Applications";
        PostCode: Record "Post Code";
        RecruitmentRequisition: Record "Recruitment Requisition Header";
        Applicant: Record Applicant;
        HumanResourcesSetup: Record "Human Resources Setup";
        NoSeriesMgt: Codeunit "No. Series";
        Qualification: Record "Application Qualification";
        CandidateShortlistMatrix: Record "Candidate Shortlist Matrix";
}

