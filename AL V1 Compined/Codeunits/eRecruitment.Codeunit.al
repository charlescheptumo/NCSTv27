#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Codeunit 50101 eRecruitment
{

    trigger OnRun()
    begin
        Message(FnSubmitProfileApplication('CN018'));
    end;

    var
        DynasoftPortalUser: Record "Dynasoft Portal User";
        ApplicationEntryNumber: Integer;
        ApplicationQualification1: Record "Application Qualification";
        SMTPMailSetup: Record "Email Account";
        Email2: Text;
        Body: Text;
        FileDirectory: Text;
        FileName: Text;
        SMTP: Codeunit "Mail";
        RecordIDNumber: RecordID;

    procedure FnRegistration(idnumber: Text; firstname: Text; lastname: Text; middlename: Text; email: Text; phoneNumber: Text) status: Text
    var
        ApplicantProfile: Record Contact;
        Contact: Record Contact;
        NoSeriesManagement: Codeunit "No. Series";
        MarketingSetup: Record "Marketing Setup";
    begin
        Contact.Reset;
        Contact.SetRange("E-Mail", email);
        if Contact.FindSet then begin
            status := 'found*Another Applicant with the given email address exists!';
        end else begin
            MarketingSetup.Get;
            Contact.Init;
            Contact."No." := NoSeriesManagement.GetNextNo(MarketingSetup."Contact Nos.", Today, true);
            Contact.Name := firstname + ' ' + lastname + ' ' + middlename;
            Contact.Type := Contact.Type::Person;
            Contact."Phone No." := phoneNumber;
            Contact."E-Mail" := email;
            if Contact.Insert(true) then begin
                FnCreateApplicantAccountRequest(email);
                FnSendEmaiNotificationOnApplicantRegRequestAcknowledge(Contact);
                FnSendEmaiNotificationOnApplicantAccountActivation(Contact);
                status := 'success*Your Aplicant account was successfully created. Please log in to complete your profile!';
            end else begin
                status := 'danger*Your Aplicant account was not created successfully.Kindly Contact System Administrator';
            end;
        end;
        exit(status);
    end;

    procedure FnResetPassword(emailaddress: Text) passChangestatus: Text
    var
        DynasoftPortalUser: Record "Dynasoft Portal User";
        RandomDigit: Text;
        Body: Text;
    begin
        DynasoftPortalUser.Reset;
        DynasoftPortalUser.SetRange("Authentication Email", emailaddress);
        if DynasoftPortalUser.FindSet then begin
            RandomDigit := CreateGuid;
            RandomDigit := DelChr(RandomDigit, '=', '{}-01');
            RandomDigit := CopyStr(RandomDigit, 1, 8);
            DynasoftPortalUser."Password Value" := RandomDigit;
            DynasoftPortalUser."Last Modified Date" := Today;
            DynasoftPortalUser."Change Password" := false;
            DynasoftPortalUser."Record Type" := DynasoftPortalUser."record type"::"Job Applicant";
            if DynasoftPortalUser.Modify(true) then begin
                passChangestatus := 'success*Password Reset Successfully';
                ResetSendEmail(emailaddress);
            end else begin
                passChangestatus := 'danger*The Password was Not Modified';
            end;
        end else begin
            passChangestatus := 'emailnotfound*Email Address is Missing';
        end;
    end;

    procedure ResetSendEmail(emailaddress: Text)
    var
        DynasoftPortalUser: Record "Dynasoft Portal User";
        SMTPMailSetup: Record "Email Account";
        Email2: Text;
        Body: Text;
        SMTP: Codeunit "Mail";
    begin
        DynasoftPortalUser.Reset;
        DynasoftPortalUser.SetRange("Authentication Email", emailaddress);
        if DynasoftPortalUser.FindSet then begin
            //     SMTPMailSetup.Get;
            //     Email2 := SMTPMailSetup."Email Sender Address";
            //     Body := 'CANDIDATE PASSWORD RESET';
            //     SMTP.CreateMessage('CANDIDATE PASSWORD RESET', Email2, emailaddress,
            //    'CANDIDATE PASSWORD RESET',
            //    'Dear ' + DynasoftPortalUser."Full Name" + ',<BR><BR>' +
            //    'Your Password for the account <b>' + ' ' + Format(DynasoftPortalUser."Authentication Email") + ' ' + '</b> has been Reset Successfully.Kindly Change your Password on Login<BR>' +
            //    'Use the following link to acess the E-Recruitment Portl.' + ' ' + '<b><a href="#">E-Recruitment Portal</a></b><BR>Your New Credentials are:'
            //    + '<BR>'
            //    + 'Username:' + ' <b>' + DynasoftPortalUser."Authentication Email" + '</b><BR>Password:' + ' <b>' + DynasoftPortalUser."Password Value" + '</b>'
            //  , true);
            //     SMTP.AddBCC(Email2);
            //     SMTP.AppendBody('<BR><BR>Kind Regards,' + '<BR><BR>Human Resource <BR><BR>[THIS IS AN AUTOMATED MESSAGE - PLEASE DO NOT REPLY DIRECTLY TO THIS EMAIL]<BR>');
            //     SMTP.Send();
        end;
    end;

    procedure FnApplicantProfileRegistration(prefix: Integer; applicantNumber: Text; surname: Text; firstname: Text; othernames: Text; gender: Integer; idnumber: Integer; passportnumber: Text; nationality: Text; religion: Option; countyofresidence: Text; countyoforigin: Text; ethnicity: Text; nhif: Text; nssf: Text; mobilephonenumber: Text; krapin: Text; maritalstatus: Integer; address: Code[50]; disabilitycertificate: Code[50]; disabilitysummary: Text[50]; phonenumber2: Text; isdisable: Boolean; postalcodes: Code[50]) status: Text
    var
        ApplicantProfile: Record Contact;
        Contact: Record Contact;
        NoSeriesManagement: Codeunit "No. Series";
        MarketingSetup: Record "Marketing Setup";
        Applicant: Record Applicant;
    begin
        Applicant.Reset;
        Applicant.SetRange("Candidate No.", applicantNumber);
        if Applicant.FindSet then begin
            Applicant.Tittles := prefix;
            Applicant."First Name" := firstname;
            Applicant."Middle Name" := othernames;
            Applicant."Last Name" := surname;
            Applicant."Full Names" := firstname + ' ' + othernames + ' ' + surname;
            Applicant.Gender := gender;
            Applicant."ID Number" := idnumber;
            Applicant."Passport No." := passportnumber;
            Applicant.Nationality := nationality;
            Applicant.Religion := religion;
            //Applicant."Birth Date" := dateofbirth;
            //Applicant."Birth Date" := dt2date(dateofbirth);
            Applicant."County of Birth" := countyoforigin;
            Applicant."Ethnic Group" := ethnicity;
            Applicant.Nationality := nationality;
            Applicant."Mobile Phone No." := mobilephonenumber;
            Applicant."NHIF No" := nhif;
            Applicant."NSSF No" := nssf;
            Applicant."KRA Pin" := krapin;
            Applicant."Country/Region Code" := nationality;
            Applicant."County of Birth" := countyoforigin;
            Applicant.Address := address;
            Applicant."Phone No." := phonenumber2;
            Applicant."Marital Status" := maritalstatus;
            if (isdisable = true) then begin
                Applicant.Disabled := true;
            end;
            Applicant."Phone No." := phonenumber2;
            Applicant."Post Code" := postalcodes;
            Applicant."Disability Certificate No" := disabilitycertificate;
            Applicant."Disability Description" := disabilitysummary;
            Applicant."Last Date Modified" := Today;
            Applicant."Last Modified Date Time" := CurrentDatetime;
            if Applicant.Modify(true) then begin
                status := 'success*Your Aplicant account was successfully created. Please proceed to complete your profile!';
            end else begin
                status := 'danger*Your Aplicant account was not created successfully.Kindly Contact System Administrator';
            end;
        end else begin
            Applicant.Init;
            Applicant.Tittles := prefix;
            Applicant."First Name" := firstname;
            Applicant."Middle Name" := othernames;
            Applicant."Last Name" := surname;
            Applicant.Gender := gender;
            Applicant."ID Number" := idnumber;
            Applicant."Passport No." := passportnumber;
            Applicant.Nationality := nationality;
            Applicant.Religion := religion;
            //Applicant."Birth Date" := dt2date(dateofbirth);
            Applicant."County of Birth" := countyoforigin;
            Applicant."Ethnic Group" := ethnicity;
            Applicant.Nationality := nationality;
            Applicant."Mobile Phone No." := mobilephonenumber;
            Applicant."Country/Region Code" := nationality;
            Applicant."County of Birth" := countyoforigin;
            Applicant.Address := address;
            Applicant."Marital Status" := maritalstatus;
            Applicant."KRA Pin" := krapin;
            Applicant."Phone No." := phonenumber2;
            Applicant."Post Code" := postalcodes;
            if (isdisable = true) then begin
                Applicant.Disabled := true;
            end;
            Applicant."Disability Certificate No" := disabilitycertificate;
            Applicant."Disability Description" := disabilitysummary;
            Applicant."Last Date Modified" := Today;
            Applicant."Last Modified Date Time" := CurrentDatetime;
            if Applicant.Insert(true) then begin
                status := 'success*Your Aplicant account was successfully created. Please proceed to complete your profile!';
            end else begin
                status := 'danger*Your Aplicant account was not created successfully.Kindly Contact System Administrator';
            end;
        end;
        exit(status);
    end;

    procedure FnAcademicQualifications(applicantNumber: Text; educationlevel: Integer; institutionname: Text; country: Text; qualificationtitle: Text; specializationarea: Text; attainedscore: Integer; graduationyear: Text) status: Text
    var
        ApplicantProfile: Record Contact;
        Contact: Record Contact;
        NoSeriesManagement: Codeunit "No. Series";
        MarketingSetup: Record "Marketing Setup";
        JobApplicantsQualification: Record "Job Applicants Qualification";
    begin

        JobApplicantsQualification.Init;
        JobApplicantsQualification."Candidate No." := applicantNumber;
        JobApplicantsQualification."Education Level" := educationlevel;
        JobApplicantsQualification.Country := country;
        //muga
        //JobApplicantsQualification."Qualification Category" := JobApplicantsQualification."qualification category"::"1";
        JobApplicantsQualification."Qualification Code" := qualificationtitle;
        JobApplicantsQualification."Specialized Domain Area" := specializationarea;
        JobApplicantsQualification."Attained Score" := attainedscore;
        JobApplicantsQualification."Graduation Year" := graduationyear;
        JobApplicantsQualification."Institution/Company" := institutionname;
        //muga
        //JobApplicantsQualification.Type := JobApplicantsQualification.Type::"1";
        //JobApplicantsQualification."From Date" := startdate;
        //JobApplicantsQualification."From Date" := dt2date(startdate);
        //JobApplicantsQualification."To Date" := DT2Date(enddate);
        JobApplicantsQualification.Description := qualificationtitle;
        if JobApplicantsQualification.Insert(true) then begin
            status := 'success*Details were successfully submitted';
        end else begin
            status := 'danger*Details Could not be Submitted';

        end;
        exit(status);
    end;

    procedure FnUpdateAcademicQualifications(applicantNumber: Text; EntryNumber: Integer; educationlevel: Integer; institutionname: Text; country: Text; qualificationtitle: Text; specializationarea: Text; attainedscore: Integer; graduationyear: Text) status: Text
    var
        ApplicantProfile: Record Contact;
        Contact: Record Contact;
        NoSeriesManagement: Codeunit "No. Series";
        MarketingSetup: Record "Marketing Setup";
        JobApplicantsQualification: Record "Job Applicants Qualification";
    begin
        JobApplicantsQualification.Reset;
        JobApplicantsQualification.SetRange("Line No.", EntryNumber);
        if JobApplicantsQualification.FindSet then begin
            JobApplicantsQualification."Candidate No." := applicantNumber;
            JobApplicantsQualification."Education Level" := educationlevel;
            JobApplicantsQualification.Country := country;
            //muga
            //JobApplicantsQualification."Qualification Category" := JobApplicantsQualification."qualification category"::"1";
            JobApplicantsQualification."Qualification Code" := qualificationtitle;
            JobApplicantsQualification."Specialized Domain Area" := specializationarea;
            JobApplicantsQualification."Attained Score" := attainedscore;
            JobApplicantsQualification."Graduation Year" := graduationyear;
            JobApplicantsQualification."Institution/Company" := institutionname;
            //muga
            //JobApplicantsQualification.Type := JobApplicantsQualification.Type::"1";
            //JobApplicantsQualification."From Date" := DT2Date(startdate);
            //JobApplicantsQualification."To Date" := DT2Date(enddate);
            JobApplicantsQualification.Description := qualificationtitle;
            if JobApplicantsQualification.Modify(true) then begin
                status := 'success*The Academic Details were successfully Saved';
            end else begin
                status := 'danger*The Academic Details Could not be Saved';
            end;
        end else begin
            status := 'success*The Academic Details could not be found';
        end;
        exit(status);
    end;

    procedure FnApplicationAcademicQualifications(applicantNumber: Text; jobApplicationNo: Text; educationlevel: Integer; institutionname: Text; country: Text; qualificationtitle: Text; specializationarea: Text; attainedscore: Integer; graduationyear: Text) status: Text
    var
        ApplicantProfile: Record Contact;
        Contact: Record Contact;
        NoSeriesManagement: Codeunit "No. Series";
        MarketingSetup: Record "Marketing Setup";
        JobApplicantsQualification: Record "Job Applicants Qualification";
        ApplicationQualification: Record "Application Qualification";
    begin

        ApplicationQualification.Init;
        ApplicationQualification."Candidate No." := applicantNumber;
        ApplicationQualification."Application No." := jobApplicationNo;
        ;
        ApplicationQualification."Education Level" := educationlevel;
        ApplicationQualification.Country := country;
        //muga
        //ApplicationQualification."Qualification Category" := ApplicationQualification."qualification category"::"1";
        ApplicationQualification."Qualification Code" := qualificationtitle;
        ApplicationQualification."Specialized Domain Area" := specializationarea;
        ApplicationQualification."Attained Score" := attainedscore;
        ApplicationQualification."Graduation Year" := graduationyear;
        ApplicationQualification."Institution/Company" := institutionname;
        //ApplicationQualification."From Date" := DT2Date(startdate);
        //ApplicationQualification."To Date" := DT2Date(enddate);
        ApplicationQualification.Description := qualificationtitle;
        if ApplicationQualification.Insert(true) then begin
            status := 'success*Details were successfully submitted';
        end else begin
            status := 'danger*Details Could not be Submitted';

        end;
        exit(status);
    end;

    procedure FnUpdateApplicationAcademicQualifications(applicantNumber: Text; EntryNumber: Integer; jobApplicationNo: Text; educationlevel: Integer; institutionname: Text; country: Text; qualificationtitle: Text; specializationarea: Text; attainedscore: Integer; graduationyear: Text; startdate: Datetime; enddate: Datetime) status: Text
    var
        ApplicantProfile: Record Contact;
        Contact: Record Contact;
        NoSeriesManagement: Codeunit "No. Series";
        MarketingSetup: Record "Marketing Setup";
        JobApplicantsQualification: Record "Job Applicants Qualification";
        ApplicationQualification: Record "Application Qualification";
    begin
        ApplicationQualification.Reset;
        ApplicationQualification.SetRange("Line No.", EntryNumber);
        if ApplicationQualification.FindSet then begin
            ApplicationQualification."Candidate No." := applicantNumber;
            ApplicationQualification."Application No." := jobApplicationNo;
            ;
            ApplicationQualification."Education Level" := educationlevel;
            ApplicationQualification.Country := country;
            //muga
            //ApplicationQualification."Qualification Category" := ApplicationQualification."qualification category"::"1";
            ApplicationQualification."Qualification Code" := qualificationtitle;
            ApplicationQualification."Specialized Domain Area" := specializationarea;
            ApplicationQualification."Attained Score" := attainedscore;
            ApplicationQualification."Graduation Year" := graduationyear;
            ApplicationQualification."Institution/Company" := institutionname;
            ApplicationQualification."From Date" := DT2Date(startdate);
            ApplicationQualification."To Date" := DT2Date(enddate);
            ApplicationQualification.Description := qualificationtitle;
            if ApplicationQualification.Modify(true) then begin
                status := 'success*The Academic Details were successfully saved';
            end else begin
                status := 'danger*The Academic Details could not be saved';
            end;
        end else begin
            status := 'danger*The Academic Details could not be saved';
        end;
        exit(status);
    end;

    procedure FnProffessionalQualifications(applicantNumber: Text; educationlevel: Text; institutionname: Text; country: Text; qualificationtitle: Text; specializationarea: Text; attainedscore: Integer; graduationyear: Text) status: Text
    var
        ApplicantProfile: Record Contact;
        Contact: Record Contact;
        NoSeriesManagement: Codeunit "No. Series";
        MarketingSetup: Record "Marketing Setup";
        JobApplicantsQualification: Record "Job Applicants Qualification";
    begin
        JobApplicantsQualification.Init;
        JobApplicantsQualification."Candidate No." := applicantNumber;
        JobApplicantsQualification."Proffessional Qualifications" := educationlevel;
        JobApplicantsQualification.Country := country;
        //muga
        //JobApplicantsQualification."Qualification Category" := JobApplicantsQualification."qualification category"::"2";
        JobApplicantsQualification."Qualification Code" := qualificationtitle;
        JobApplicantsQualification."Specialized Domain Area" := specializationarea;
        JobApplicantsQualification."Attained Score" := attainedscore;
        JobApplicantsQualification."Graduation Year" := graduationyear;
        //muga
        //JobApplicantsQualification.Type := JobApplicantsQualification.Type::"1";
        JobApplicantsQualification."Institution/Company" := institutionname;
        //JobApplicantsQualification."From Date" := DT2Date(startdate);
        //JobApplicantsQualification."To Date" := DT2Date(enddate);
        JobApplicantsQualification.Description := qualificationtitle;
        if JobApplicantsQualification.Insert(true) then begin
            status := 'success*Details were successfully submitted';
        end else begin
            status := 'danger*Details Could not be Submitted';

        end;
        exit(status);
    end;

    procedure FnUpdateProffessionalQualifications(EntryNo: Integer; applicantNumber: Text; educationlevel: Text; institutionname: Text; country: Text; qualificationtitle: Text; specializationarea: Text; attainedscore: Integer; graduationyear: Text) status: Text
    var
        ApplicantProfile: Record Contact;
        Contact: Record Contact;
        NoSeriesManagement: Codeunit "No. Series";
        MarketingSetup: Record "Marketing Setup";
        JobApplicantsQualification: Record "Job Applicants Qualification";
    begin
        JobApplicantsQualification.Reset;
        JobApplicantsQualification.SetRange("Line No.", EntryNo);
        if JobApplicantsQualification.FindSet then begin
            JobApplicantsQualification."Candidate No." := applicantNumber;
            JobApplicantsQualification."Proffessional Qualifications" := educationlevel;
            JobApplicantsQualification.Country := country;
            //muga
            //JobApplicantsQualification."Qualification Category" := JobApplicantsQualification."qualification category"::"2";
            JobApplicantsQualification."Qualification Code" := qualificationtitle;
            JobApplicantsQualification."Specialized Domain Area" := specializationarea;
            JobApplicantsQualification."Attained Score" := attainedscore;
            JobApplicantsQualification."Graduation Year" := graduationyear;
            //muga
            //JobApplicantsQualification.Type := JobApplicantsQualification.Type::"1";
            JobApplicantsQualification."Institution/Company" := institutionname;
            //JobApplicantsQualification."From Date" := startdate;
            //JobApplicantsQualification."To Date" := enddate;
            JobApplicantsQualification.Description := qualificationtitle;
            if JobApplicantsQualification.Modify(true) then begin
                status := 'success*Details were successfully submitted';
            end else begin
                status := 'danger*Details Could not be Submitted';
            end;
        end;
        exit(status);
    end;

    procedure FnApplicationProffessionalQualifications(applicantNumber: Text; JobApplicationNo: Text; proffesionalQualification: Text; institutionname: Text; country: Text; qualificationtitle: Text; specializationarea: Text; attainedscore: Integer; graduationyear: Text) status: Text
    var
        ApplicantProfile: Record Contact;
        Contact: Record Contact;
        NoSeriesManagement: Codeunit "No. Series";
        MarketingSetup: Record "Marketing Setup";
        JobApplicantsQualification: Record "Job Applicants Qualification";
        ApplicationQualification: Record "Application Qualification";
    begin

        ApplicationQualification.Init;
        ApplicationQualification."Candidate No." := applicantNumber;
        ApplicationQualification."Application No." := JobApplicationNo;
        ApplicationQualification."Proffessional Qualification" := proffesionalQualification;
        ApplicationQualification.Country := country;
        //muga
        //ApplicationQualification."Qualification Category" := ApplicationQualification."qualification category"::"2";
        ApplicationQualification."Qualification Code" := qualificationtitle;
        ApplicationQualification."Specialized Domain Area" := specializationarea;
        ApplicationQualification."Attained Score" := attainedscore;
        ApplicationQualification."Graduation Year" := graduationyear;
        ApplicationQualification."Institution/Company" := institutionname;
        //ApplicationQualification."From Date" := DT2Date(startdate);
        //ApplicationQualification."To Date" := DT2Date(enddate);
        ApplicationQualification.Description := qualificationtitle;
        if ApplicationQualification.Insert(true) then begin
            status := 'success*Details were successfully submitted';
        end else begin
            status := 'danger*Details Could not be Submitted';
        end;
        exit(status);
    end;

    procedure FnProffessionaBodies(applicantNumber: Text; professionalbody: Text; registrationNumber: Text; MembershipType: Text; licensingNumber: Text) status: Text
    var
        ApplicantProfile: Record Contact;
        Contact: Record Contact;
        NoSeriesManagement: Codeunit "No. Series";
        MarketingSetup: Record "Marketing Setup";
        JobApplicantsQualification: Record "Job Applicants Qualification";
    begin
        JobApplicantsQualification.Init;
        JobApplicantsQualification."Candidate No." := applicantNumber;
        JobApplicantsQualification."Institution/Company" := professionalbody;
        //muga
        //JobApplicantsQualification."Qualification Category" := JobApplicantsQualification."qualification category"::"7";
        //JobApplicantsQualification."Member Renewal Date" := DT2Date(RenewalDate);
        JobApplicantsQualification."Membership Registration No" := registrationNumber;
        ;
        JobApplicantsQualification."Membership Type" := MembershipType;
        JobApplicantsQualification."Licensing Number" := licensingNumber;
        //JobApplicantsQualification."Licensing Renewal Date" := DT2Date(LicenseRenewalDate);
        if JobApplicantsQualification.Insert(true) then begin
            status := 'success*Details were successfully submitted';
        end else begin
            status := 'danger*Details Could not be Submitted';

        end;
        exit(status);

    end;

    procedure FnUpdateProffessionaBodies(EntryNumber: Integer; applicantNumber: Text; professionalbody: Text; registrationNumber: Text; MembershipType: Text; licensingNumber: Text) status: Text
    var
        ApplicantProfile: Record Contact;
        Contact: Record Contact;
        NoSeriesManagement: Codeunit "No. Series";
        MarketingSetup: Record "Marketing Setup";
        JobApplicantsQualification: Record "Job Applicants Qualification";
    begin
        JobApplicantsQualification.Reset;
        JobApplicantsQualification.SetRange("Line No.", EntryNumber);
        if JobApplicantsQualification.FindSet then begin
            JobApplicantsQualification."Candidate No." := applicantNumber;
            JobApplicantsQualification."Institution/Company" := professionalbody;
            //muga
            //JobApplicantsQualification."Qualification Category" := JobApplicantsQualification."qualification category"::"7";
            //JobApplicantsQualification."Member Renewal Date" := DT2Date(RenewalDate);
            JobApplicantsQualification."Membership Registration No" := registrationNumber;
            ;
            JobApplicantsQualification."Membership Type" := MembershipType;
            JobApplicantsQualification."Licensing Number" := licensingNumber;
            //JobApplicantsQualification."Licensing Renewal Date" := DT2Date(LicenseRenewalDate);
            if JobApplicantsQualification.Modify(true) then begin
                status := 'success*Details were successfully submitted';
            end else begin
                status := 'danger*Details Could not be Submitted';
            end;
        end;
        exit(status);

    end;

    procedure FnApplicationProffessionaBodies(applicantNumber: Text; JobApplicationNo: Text; professionalbody: Text; registrationNumber: Text; MembershipType: Text; licensingNumber: Text) status: Text
    var
        ApplicantProfile: Record Contact;
        Contact: Record Contact;
        NoSeriesManagement: Codeunit "No. Series";
        MarketingSetup: Record "Marketing Setup";
        JobApplicantsQualification: Record "Job Applicants Qualification";
        ApplicationQualification: Record "Application Qualification";
    begin

        ApplicationQualification.Init;
        ApplicationQualification."Candidate No." := applicantNumber;
        ApplicationQualification."Application No." := JobApplicationNo;
        ApplicationQualification."Institution/Company" := professionalbody;
        //muga
        //ApplicationQualification."Qualification Category" := ApplicationQualification."qualification category"::"7";
        //ApplicationQualification."Member Renewal Date" := DT2Date(RenewalDate);
        ApplicationQualification."Membership Registration No" := registrationNumber;
        ;
        ApplicationQualification."Membership Type" := MembershipType;
        ApplicationQualification."Licensing Number" := licensingNumber;
        //ApplicationQualification."Licensing Renewal Date" := DT2Date(LicenseRenewalDate);
        if ApplicationQualification.Insert(true) then begin
            status := 'success*Details were successfully submitted';
        end else begin
            status := 'danger*Details Could not be Submitted';
        end;
        exit(status);

    end;

    procedure FnWorkExperience(applicantNumber: Text; employerName: Text; jobdesignation: Text; termsofservice: Integer; experienceyears: Text; dutiesresponsibilities: Text) status: Text
    var
        ApplicantProfile: Record Contact;
        Contact: Record Contact;
        NoSeriesManagement: Codeunit "No. Series";
        MarketingSetup: Record "Marketing Setup";
        JobApplicantsQualification: Record "Job Applicants Qualification";
    begin
        JobApplicantsQualification.Init;
        JobApplicantsQualification."Candidate No." := applicantNumber;
        JobApplicantsQualification."Job Description/Designation" := jobdesignation;
        JobApplicantsQualification."Institution/Company" := employerName;
        //muga
        //JobApplicantsQualification."Qualification Category" := JobApplicantsQualification."qualification category"::"4";
        //JobApplicantsQualification."From Date" := DT2Date(employmentstartdate);
        //JobApplicantsQualification."To Date" := DT2Date(employmentenddate);
        ;
        JobApplicantsQualification."Terms of Service" := termsofservice;
        JobApplicantsQualification."Experience Years" := experienceyears;
        JobApplicantsQualification."Duties and Resposibilities" := dutiesresponsibilities;
        if JobApplicantsQualification.Insert(true) then begin
            status := 'success*Details were successfully submitted';
        end else begin
            status := 'danger*Details Could not be Submitted';
        end;
        exit(status);

    end;

    procedure FnUpdateWorkExperience(EntryNumber: Integer; applicantNumber: Text; employerName: Text; jobdesignation: Text; termsofservice: Integer; experienceyears: Text; dutiesresponsibilities: Text) status: Text
    var
        ApplicantProfile: Record Contact;
        Contact: Record Contact;
        NoSeriesManagement: Codeunit "No. Series";
        MarketingSetup: Record "Marketing Setup";
        JobApplicantsQualification: Record "Job Applicants Qualification";
    begin
        JobApplicantsQualification.Reset;
        JobApplicantsQualification.SetRange("Line No.", EntryNumber);
        if JobApplicantsQualification.FindSet then begin
            JobApplicantsQualification."Candidate No." := applicantNumber;
            JobApplicantsQualification."Job Description/Designation" := jobdesignation;
            JobApplicantsQualification."Institution/Company" := employerName;
            //muga
            //JobApplicantsQualification."Qualification Category" := JobApplicantsQualification."qualification category"::"4";
            //JobApplicantsQualification."From Date" := DT2Date(employmentstartdate);
            //JobApplicantsQualification."To Date" := DT2Date(employmentenddate);
            ;
            JobApplicantsQualification."Terms of Service" := termsofservice;
            JobApplicantsQualification."Experience Years" := experienceyears;
            JobApplicantsQualification."Duties and Resposibilities" := dutiesresponsibilities;
            if JobApplicantsQualification.Modify(true) then begin
                status := 'success*Details were successfully submitted';
            end else begin
                status := 'danger*Details Could not be Submitted';
            end;
        end;
        exit(status);

    end;

    procedure FnApplicationWorkExperience(applicantNumber: Text; JobApplicationNo: Text; employerName: Text; jobdesignation: Text; termsofservice: Integer; experienceyears: Text; dutiesresponsibilities: Text) status: Text
    var
        ApplicantProfile: Record Contact;
        Contact: Record Contact;
        NoSeriesManagement: Codeunit "No. Series";
        MarketingSetup: Record "Marketing Setup";
        JobApplicantsQualification: Record "Job Applicants Qualification";
        ApplicationQualification: Record "Application Qualification";
    begin

        ApplicationQualification.Init;
        ApplicationQualification."Candidate No." := applicantNumber;
        ApplicationQualification."Application No." := JobApplicationNo;
        ApplicationQualification."Job Description/Designation" := jobdesignation;
        ApplicationQualification."Institution/Company" := employerName;
        //muga
        //ApplicationQualification."Qualification Category" := ApplicationQualification."qualification category"::"4";
        //ApplicationQualification."From Date" := DT2Date(employmentstartdate);
        //ApplicationQualification."To Date" := DT2Date(employmentenddate);
        ;
        ApplicationQualification."Terms of Service" := termsofservice;
        ApplicationQualification."Experience Years" := experienceyears;
        ApplicationQualification."Duties and Resposibilities" := dutiesresponsibilities;
        if ApplicationQualification.Insert(true) then begin
            status := 'success*Details were successfully submitted';
        end else begin
            status := 'danger*Details Could not be Submitted';
        end;
        exit(status);

    end;

    procedure FnCandidateReferees(appplicantNumber: Text; refereetype: Integer; title: Text; surname: Text; firtsname: Text; otherNames: Text; contactdesignations: Text; emailaddress: Text; phonenumber: Text; relationship: Text; country: Text; periodknown: Integer; institution: Text) status: Text
    var
        ApplicantProfile: Record Contact;
        Contact: Record Contact;
        NoSeriesManagement: Codeunit "No. Series";
        MarketingSetup: Record "Marketing Setup";
        JobApplicantsQualification: Record "Job Applicants Qualification";
        Employee_ApplicantReferees: Record "Employee_Applicant Referees";
    begin

        Employee_ApplicantReferees.Init;
        Employee_ApplicantReferees."No." := appplicantNumber;
        //muga
        //Employee_ApplicantReferees."Document Type" := Employee_ApplicantReferees."document type"::1;
        Employee_ApplicantReferees."Rererence Type" := refereetype;
        Employee_ApplicantReferees.Name := surname + ' ' + firtsname + ' ' + otherNames;
        Employee_ApplicantReferees."Designation/Title" := contactdesignations;
        Employee_ApplicantReferees.Institution := institution;
        ;
        Employee_ApplicantReferees."Phone No." := phonenumber;
        Employee_ApplicantReferees."Country/Region Code" := country;
        Employee_ApplicantReferees."E-Mail" := emailaddress;
        Employee_ApplicantReferees.Relationship := relationship;
        Employee_ApplicantReferees."Years Known" := periodknown;
        if Employee_ApplicantReferees.Insert(true) then begin
            status := 'success*Details were successfully submitted';
        end else begin
            status := 'danger*Details Could not be Submitted';
        end;
        exit(status);
    end;

    procedure FnApplicationCandidateReferees(appplicantNumber: Text; JobApplicationNo: Text; refereetype: Integer; title: Text; surname: Text; firtsname: Text; otherNames: Text; contactdesignations: Text; emailaddress: Text; phonenumber: Text; relationship: Text; country: Text; periodknown: Text; institution: Text) status: Text
    var
        ApplicantProfile: Record Contact;
        Contact: Record Contact;
        NoSeriesManagement: Codeunit "No. Series";
        MarketingSetup: Record "Marketing Setup";
        JobApplicantsQualification: Record "Job Applicants Qualification";
        Employee_ApplicantReferees: Record "Employee_Applicant Referees";
        ApplicationReferees: Record "Application Referees";
    begin
        ApplicationReferees.Init;
        ApplicationReferees."Candidate No." := appplicantNumber;
        ApplicationReferees."Application No." := JobApplicationNo;
        ApplicationReferees."Rererence Type" := refereetype;
        ApplicationReferees."E-Mail" := emailaddress;
        ApplicationReferees.Relationship := relationship;
        ApplicationReferees.Name := surname + ' ' + firtsname + ' ' + otherNames;
        ApplicationReferees."Designation/Title" := contactdesignations;
        ApplicationReferees.Institution := institution;
        ;
        ApplicationReferees."Phone No." := phonenumber;
        ApplicationReferees."Country/Region Code" := country;
        if ApplicationReferees.Insert(true) then begin
            status := 'success*Details were successfully submitted';
        end else begin
            status := 'danger*Details Could not be Submitted';
        end;
        exit(status);
    end;

    procedure FnJobApplication(ApplicantNumber: Text; VacancyId: Text) status: Text
    var
        ApplicantProfile: Record Contact;
        Contact: Record Contact;
        NoSeriesManagement: Codeunit "No. Series";
        MarketingSetup: Record "Marketing Setup";
        JobApplicantsQualification: Record "Job Applicants Qualification";
        JobApplications: Record "Job Applications";
        JobApplicationRequirements: Record "Job Application Requirements";
        Applicant: Record Applicant;
    begin
        Applicant.Reset;
        Applicant.SetRange("Candidate No.", ApplicantNumber);

        Applicant.SetRange("Profile Completed", true);

        if Applicant.FindSet then begin
            JobApplications.Reset;
            JobApplications.SetRange("Vacancy Id", VacancyId);
            JobApplications.SetRange("Candidate No.", ApplicantNumber);
            if JobApplications.FindSet then begin
                JobApplications."Candidate No." := ApplicantNumber;
                JobApplications.Validate("Candidate No.");
                JobApplications."Vacancy Id" := VacancyId;
                JobApplications.Validate("Vacancy Id");
                if JobApplications.Modify(true) then begin
                    FnPrepopulateApplicantProfile(ApplicantNumber, JobApplications."Application No.", VacancyId);
                    status := 'success*Job Application Process was Successfully Submitted*' + JobApplications."Application No."
                end else begin
                    status := 'danger*Job Application Process was not successfully';
                end;
            end else begin
                JobApplications.Init;
                JobApplications."Application No." := '';
                JobApplications."Candidate No." := ApplicantNumber;
                JobApplications.Validate("Candidate No.");
                JobApplications."Vacancy Id" := VacancyId;
                JobApplications.Validate("Vacancy Id");
                if JobApplications.Insert(true) then begin
                    FnPrepopulateApplicantProfile(ApplicantNumber, JobApplications."Application No.", VacancyId);
                    status := 'success*Job Application Process was Successfully Submitted*' + JobApplications."Application No.";
                end else begin
                    status := 'danger*Job Application Process was not successfully';
                end;
            end;
        end else begin
            status := 'profileincomplete*Candidate profile was not successfully completed';
        end;
    end;

    procedure FnPrepopulateApplicantProfile(CandindateNo: Code[50]; ApplicationNo: Code[50]; VacancyId: Code[50]) status: Text
    var
        Applicant: Record Applicant;
        JobApplicantsQualification: Record "Job Applicants Qualification";
        Employee_ApplicantReferees: Record "Employee_Applicant Referees";
        ApplicationQualification: Record "Application Qualification";
        JobApplicationRequirements: Record "Job Application Requirements";
        Applicant_EmployeeHobby: Record "Applicant_Employee Hobby";
        ApplicationReferees: Record "Application Referees";
        ApplicationReferees1: Record "Application Referees";
        RecruitmentReqRequirement: Record "Recruitment Req Requirement";
        JobApplicationRequirements1: Record "Job Application Requirements";
        VacancyDeclaration: Record "Vacancy Declaration";
        ApplicationDeclaration: Record "Application Declaration";
        ApplicationDeclaration1: Record "Application Declaration";
    begin
        JobApplicantsQualification.Reset;
        JobApplicantsQualification.SetRange("Candidate No.", CandindateNo);
        if JobApplicantsQualification.FindSet then begin
            ApplicationQualification1.Reset;
            ApplicationQualification1.SetRange("Application No.", ApplicationNo);
            ApplicationQualification1.SetRange("Candidate No.", CandindateNo);
            if not ApplicationQualification1.FindSet then begin
                repeat
                    ApplicationQualification.Init;
                    ApplicationQualification."Line No." := JobApplicantsQualification."Line No.";
                    ApplicationQualification."Application No." := ApplicationNo;
                    ApplicationQualification."Candidate No." := CandindateNo;
                    ApplicationQualification."Qualification Code" := JobApplicantsQualification."Qualification Code";
                    ApplicationQualification."Qualification Category" := JobApplicantsQualification."Qualification Category";
                    ApplicationQualification."From Date" := JobApplicantsQualification."From Date";
                    ApplicationQualification."To Date" := JobApplicantsQualification."To Date";
                    ApplicationQualification.Type := JobApplicantsQualification.Type;
                    ApplicationQualification."Job Description/Designation" := JobApplicantsQualification."Job Description/Designation";
                    ApplicationQualification.Description := JobApplicantsQualification.Description;
                    ApplicationQualification."Institution/Company" := JobApplicantsQualification."Institution/Company";
                    ApplicationQualification."Course Grade" := JobApplicantsQualification."Course Grade";
                    ApplicationQualification."Applicant Status" := JobApplicantsQualification."Job Applicant Status";
                    ApplicationQualification."Expiration Date" := JobApplicantsQualification."Expiration Date";
                    ApplicationQualification.Specialization := JobApplicantsQualification."Specialized Domain Area";
                    ApplicationQualification."Specialized Domain Area" := JobApplicantsQualification."Specialized Domain Area";
                    ApplicationQualification."Education Level" := JobApplicantsQualification."Education Level";
                    ApplicationQualification.Country := JobApplicantsQualification.Country;
                    ApplicationQualification."Attained Score" := JobApplicantsQualification."Attained Score";
                    ApplicationQualification."Graduation Year" := JobApplicantsQualification."Graduation Year";
                    ApplicationQualification."Membership Registration No" := JobApplicantsQualification."Membership Registration No";
                    ApplicationQualification."Membership Type" := JobApplicantsQualification."Membership Type";
                    ApplicationQualification."Member Renewal Date" := JobApplicantsQualification."Member Renewal Date";
                    ApplicationQualification."Licensing Number" := JobApplicantsQualification."Licensing Number";
                    ApplicationQualification."Licensing Renewal Date" := JobApplicantsQualification."Licensing Renewal Date";
                    ApplicationQualification."Terms of Service" := JobApplicantsQualification."Terms of Service";
                    ApplicationQualification."Experience Years" := JobApplicantsQualification."Experience Years";
                    ApplicationQualification."Duties and Resposibilities" := JobApplicantsQualification."Duties and Resposibilities";
                    if ApplicationQualification.Insert(true) then begin
                        status := 'success*The Applicant Details was succesffully Populated';
                    end else begin
                        status := 'danger*The Applicant Details wcould not be Populated';
                    end;
                until JobApplicantsQualification.Next = 0;
            end else begin
                ApplicationQualification1.Reset;
                ApplicationQualification1.SetRange("Candidate No.", CandindateNo);
                ApplicationQualification1.SetRange("Application No.", ApplicationNo);
                if ApplicationQualification1.FindSet then begin
                    repeat
                        ApplicationQualification."Line No." := JobApplicantsQualification."Line No.";
                        ApplicationQualification."Application No." := ApplicationNo;
                        ApplicationQualification."Candidate No." := CandindateNo;
                        ApplicationQualification."Qualification Code" := JobApplicantsQualification."Qualification Code";
                        ApplicationQualification."Qualification Category" := JobApplicantsQualification."Qualification Category";
                        ApplicationQualification."From Date" := JobApplicantsQualification."From Date";
                        ApplicationQualification."To Date" := JobApplicantsQualification."To Date";
                        ApplicationQualification.Type := JobApplicantsQualification.Type;
                        ApplicationQualification.Description := JobApplicantsQualification.Description;
                        ApplicationQualification."Institution/Company" := JobApplicantsQualification."Institution/Company";
                        ApplicationQualification."Course Grade" := JobApplicantsQualification."Course Grade";
                        ApplicationQualification."Applicant Status" := JobApplicantsQualification."Job Applicant Status";
                        ApplicationQualification."Expiration Date" := JobApplicantsQualification."Expiration Date";
                        ApplicationQualification.Specialization := JobApplicantsQualification."Specialized Domain Area";
                        ApplicationQualification."Specialized Domain Area" := JobApplicantsQualification."Specialized Domain Area";
                        ApplicationQualification."Education Level" := JobApplicantsQualification."Education Level";
                        ApplicationQualification.Country := JobApplicantsQualification.Country;
                        ApplicationQualification."Attained Score" := JobApplicantsQualification."Attained Score";
                        ApplicationQualification."Graduation Year" := JobApplicantsQualification."Graduation Year";
                        ApplicationQualification."Member Renewal Date" := JobApplicantsQualification."Member Renewal Date";
                        ApplicationQualification."Licensing Number" := JobApplicantsQualification."Licensing Number";
                        ApplicationQualification."Licensing Renewal Date" := JobApplicantsQualification."Licensing Renewal Date";
                        ApplicationQualification."Terms of Service" := JobApplicantsQualification."Terms of Service";
                        ApplicationQualification."Experience Years" := JobApplicantsQualification."Experience Years";
                        ApplicationQualification."Duties and Resposibilities" := JobApplicantsQualification."Duties and Resposibilities";
                        if ApplicationQualification.Modify(true) then begin
                            status := 'success*The Applicant Details was succesffully Populated';
                        end else begin
                            status := 'danger*The Applicant Details wcould not be Populated';
                        end;
                    until JobApplicantsQualification.Next = 0;
                end;
            end;
            begin
                RecruitmentReqRequirement.Reset;
                RecruitmentReqRequirement.SetRange("Document No.", VacancyId);
                if RecruitmentReqRequirement.FindSet then begin
                    JobApplicationRequirements.Reset;
                    JobApplicationRequirements.SetRange("Application No.", ApplicationNo);
                    JobApplicationRequirements.SetRange("Vacancy No.", VacancyId);
                    if not JobApplicationRequirements.FindSet then begin
                        repeat
                            JobApplicationRequirements1.Init;
                            JobApplicationRequirements1."Application No." := ApplicationNo;
                            JobApplicationRequirements1."Vacancy No." := VacancyId;
                            JobApplicationRequirements1."Requirement ID" := RecruitmentReqRequirement."Requirement ID";
                            JobApplicationRequirements1."Line No." := RecruitmentReqRequirement."Line No.";
                            JobApplicationRequirements1."Requirement ID" := RecruitmentReqRequirement."Requirement ID";
                            JobApplicationRequirements1."Qualification Category" := RecruitmentReqRequirement."Qualification Category";
                            JobApplicationRequirements1."Qualification Code" := RecruitmentReqRequirement."Qualification Code";
                            JobApplicationRequirements1.Description := RecruitmentReqRequirement.Description;
                            JobApplicationRequirements1."Requirement Type" := RecruitmentReqRequirement."Requirement Type";
                            if JobApplicationRequirements1.Insert(true) then begin
                                status := 'success*The Applicant Details was succesffully Populated';
                            end else begin
                                status := 'danger*The Applicant Details wcould not be Populated';
                            end;
                        until JobApplicationRequirements.Next = 0;
                    end;
                end;
            end;
            begin
                VacancyDeclaration.Reset;
                VacancyDeclaration.SetRange("Vacancy No.", VacancyId);
                if VacancyDeclaration.FindSet then begin
                    ApplicationDeclaration.Reset;
                    ApplicationDeclaration.SetRange("Application No.", ApplicationNo);
                    if not ApplicationDeclaration.FindSet then begin
                        repeat
                            ApplicationDeclaration1.Init;
                            ApplicationDeclaration1."Application No." := ApplicationNo;
                            ApplicationDeclaration1."Line No." := ApplicationDeclaration."Line No.";
                            ApplicationDeclaration1."Declaration Statement" := ApplicationDeclaration."Declaration Statement";
                            if ApplicationDeclaration1.Insert(true) then begin
                                status := 'success*The Applicant Declaration Details was succesffully Populated';
                            end else begin
                                status := 'danger*The Applicant Declaration Details wcould not be Populated';
                            end;
                        until ApplicationDeclaration.Next = 0;
                    end;
                end;
            end;
            begin
                Employee_ApplicantReferees.Reset;
                Employee_ApplicantReferees.SetRange("No.", CandindateNo);
                if Employee_ApplicantReferees.FindSet then begin
                    ApplicationReferees.Reset;
                    ApplicationReferees.SetRange("Application No.", ApplicationNo);
                    ApplicationReferees.SetRange("Candidate No.", ApplicationNo);
                    if not ApplicationReferees.FindSet then begin
                        repeat
                            ApplicationReferees1.Init;
                            ApplicationReferees1."Application No." := ApplicationNo;
                            ApplicationReferees1."Candidate No." := CandindateNo;
                            ApplicationReferees1.Relationship := Employee_ApplicantReferees.Relationship;
                            ApplicationReferees1."Line No." := Employee_ApplicantReferees."Line No.";
                            ApplicationReferees1."Rererence Type" := Employee_ApplicantReferees."Rererence Type";
                            ApplicationReferees1.Name := Employee_ApplicantReferees.Name;
                            ApplicationReferees1."Designation/Title" := Employee_ApplicantReferees."Designation/Title";
                            ApplicationReferees1.Institution := Employee_ApplicantReferees."Designation/Title";
                            ApplicationReferees1.Address := Employee_ApplicantReferees.Address;
                            ApplicationReferees1."Address 2" := Employee_ApplicantReferees."Address 2";
                            ApplicationReferees1.City := Employee_ApplicantReferees.City;
                            ApplicationReferees1."Post Code" := Employee_ApplicantReferees."Post Code";
                            ApplicationReferees1."Country/Region Code" := Employee_ApplicantReferees."Country/Region Code";
                            ApplicationReferees1."Phone No." := Employee_ApplicantReferees."Phone No.";
                            ApplicationReferees1."E-Mail" := Employee_ApplicantReferees."E-Mail";
                            ApplicationReferees1."Years Known" := Employee_ApplicantReferees."Years Known";
                            if ApplicationReferees1.Insert(true) then begin
                                status := 'success*The Applicant Details was succesffully Populated';
                            end else begin
                                status := 'danger*The Applicant Details wcould not be Populated';
                            end;
                        until Employee_ApplicantReferees.Next = 0;
                    end else begin
                        ApplicationReferees.Reset;
                        ApplicationReferees.SetRange("Application No.", ApplicationNo);
                        ApplicationReferees.SetRange("Candidate No.", ApplicationNo);
                        if ApplicationReferees.FindSet then begin
                            repeat
                                ApplicationReferees1.Init;
                                ApplicationReferees1."Application No." := ApplicationNo;
                                ApplicationReferees1."Candidate No." := CandindateNo;
                                ApplicationReferees1."Line No." := Employee_ApplicantReferees."Line No.";
                                ApplicationReferees1."Rererence Type" := Employee_ApplicantReferees."Rererence Type";
                                ApplicationReferees1.Name := Employee_ApplicantReferees.Name;
                                ApplicationReferees1."Designation/Title" := Employee_ApplicantReferees."Designation/Title";
                                ApplicationReferees1.Institution := Employee_ApplicantReferees."Designation/Title";
                                ApplicationReferees1.Address := Employee_ApplicantReferees.Address;
                                ApplicationReferees1."Address 2" := Employee_ApplicantReferees."Address 2";
                                ApplicationReferees1.City := Employee_ApplicantReferees.City;
                                ApplicationReferees1."Post Code" := Employee_ApplicantReferees."Post Code";
                                ApplicationReferees1."Country/Region Code" := Employee_ApplicantReferees."Country/Region Code";
                                ApplicationReferees1."Phone No." := Employee_ApplicantReferees."Phone No.";
                                ApplicationReferees1."E-Mail" := Employee_ApplicantReferees."E-Mail";
                                ApplicationReferees1."Years Known" := Employee_ApplicantReferees."Years Known";
                                if ApplicationReferees1.Modify(true) then begin
                                    status := 'success*The Applicant Details was succesffully Populated';
                                end else begin
                                    status := 'danger*The Applicant Details wcould not be Populated';
                                end;
                            until Employee_ApplicantReferees.Next = 0;
                        end;
                    end;
                end;
            end;
        end;
    end;

    procedure FnSubmitApplication(ApplicantNumber: Code[100]; JobAppplicationNumber: Code[100]) status: Text
    var
        ApplicantProfile: Record Contact;
        Contact: Record Contact;
        NoSeriesManagement: Codeunit "No. Series";
        MarketingSetup: Record "Marketing Setup";
        JobApplicantsQualification: Record "Job Applicants Qualification";
        JobApplications: Record "Job Applications";
    begin
        JobApplications.Reset;
        JobApplications.SetRange("Application No.", JobAppplicationNumber);
        JobApplications.SetRange("Candidate No.", ApplicantNumber);
        if JobApplications.FindSet then begin
            FileDirectory := 'C:\DOCS\';
            FileName := 'JobApplication_' + JobAppplicationNumber + '.pdf';
            //Report.SaveAsPdf(69608, FileDirectory + FileName, JobApplications);
            SMTPMailSetup.Get;
            //muga
            //     Email2 := SMTPMailSetup."Email Sender Address";
            //     Body := 'JOB VACANCY APPLICATION';
            //     SMTP.CreateMessage('JOB VACANCY APPLICATION', Email2, JobApplications."E-Mail",
            //    'JOB VACANCY APPLICATION',
            //    'Dear ' + JobApplications."First Name" + ',<BR><BR>' +
            //    'We are pleased to inform you that your application for the post' + ' ' + JobApplications."Job Title/Designation" + ' has been Received Successfully <b>' + '</b><BR>' +
            //    'You will be contacted shortly and an email sent to you as regards when you will be invited for your interview<BR>' +
            //    'Use the following link to acess the E-Recruitment Portl.' + ' ' + '<b><a href="http://careers.kemri.org">E-Recruitment Portal</a></b><BR>'
            //    + '<BR>'
            //    , true);
            //     SMTP.AddAttachment(FileDirectory + FileName, FileName);
            //     SMTP.AppendBody('<BR><BR>Kind Regards,' + '<BR><BR>Human Resource <BR><BR>[THIS IS AN AUTOMATED MESSAGE - PLEASE DO NOT REPLY DIRECTLY TO THIS EMAIL]<BR>');
            //     SMTP.Send();
            status := 'success*The Job Application has been Received Successfully';
        end else begin
            status := 'danger*The Job Application was not sent Successfully';
        end;

    end;

    procedure FnSubmitProfileApplication(ApplicantNumber: Code[100]) status: Text
    var
        ApplicantProfile: Record Contact;
        Contact: Record Contact;
        NoSeriesManagement: Codeunit "No. Series";
        MarketingSetup: Record "Marketing Setup";
        JobApplicantsQualification: Record "Job Applicants Qualification";
        JobApplications: Record "Job Applications";
        Applicant: Record Applicant;
    begin
        Applicant.Reset;
        Applicant.SetRange("Candidate No.", ApplicantNumber);
        if Applicant.FindSet then begin
            //     Applicant."Profile Completed" := true;
            //     Applicant.Modify(true);
            //     FileDirectory := 'C:\DOCS\';
            //     FileName := 'CandidateCV' + ApplicantNumber + '.pdf';
            //     //Report.SaveAsPdf(69604, FileDirectory + FileName, Applicant);
            //     SMTPMailSetup.Get;
            //     Email2 := SMTPMailSetup."Email Sender Address";
            //     Body := 'CANDIDATE RESUME';
            //     SMTP.CreateMessage('CANDIDATE RESUME', Email2, Applicant."E-Mail",
            //    'CANDIDATE RESUME',
            //    'Dear ' + Applicant."First Name" + ',<BR><BR>' +
            //    'We are pleased to inform you that your profile has been received Successfully <b>' + '</b><BR>' +
            //    'Use the following link to acess the E-Recruitment Portl.' + ' ' + '<b><a href="http://careers.kemri.org">E-Recruitment Portal</a></b><BR>'
            //    + '<BR>'
            //    , true);
            //     SMTP.AddAttachment(FileDirectory + FileName, FileName);
            //     SMTP.AppendBody('<BR><BR>Kind Regards,' + '<BR><BR>Human Resource <BR><BR>[THIS IS AN AUTOMATED MESSAGE - PLEASE DO NOT REPLY DIRECTLY TO THIS EMAIL]<BR>');
            //     SMTP.Send();
            status := 'success*The Candidate Profile has been Received Successfully';
        end else begin
            status := 'danger*The Candidate Profile has been Received Successfully';
        end;

    end;

    procedure FnChangeCandidatePassword(emailaddress: Text; currentPassword: Text; newPassword: Text; confirmNewPassword: Text) status: Text
    var
        DynasoftPortalUser: Record "Dynasoft Portal User";
    begin

        DynasoftPortalUser.Reset;
        DynasoftPortalUser.SetRange("Authentication Email", emailaddress);
        if DynasoftPortalUser.FindSet then begin
            if DynasoftPortalUser."Password Value" = currentPassword then begin
                if newPassword = confirmNewPassword then begin
                    DynasoftPortalUser."Password Value" := newPassword;
                    DynasoftPortalUser."Change Password" := true;
                    DynasoftPortalUser."Last Modified Date" := Today;
                    if DynasoftPortalUser.Modify(true) then begin
                        status := 'success*Your password was successfully changed';
                    end else begin
                        status := 'danger*Your password could not be reset';
                    end;
                end else begin
                    status := 'passwordmismatch*New password and Confirmed new password do not match';
                end;
            end else begin
                status := 'worngcurrentpassword*Wrong current password.Kindly Ensure that the Current Password is Correct';
            end;
        end else begin
            status := 'novendorfound*The specified Email Address does not exist';
        end;
    end;

    procedure SendAccountActivationLink(emailaddress: Text) status: Text
    var
        DynasoftPortalUser: Record "Dynasoft Portal User";
        SMTPMailSetup: Record "Email Account";
        Email2: Text;
        Body: Text;
        SMTP: Codeunit "Mail";
        Contact: Record Contact;
    begin
        Contact.Reset;
        Contact.SetRange("E-Mail", emailaddress);
        if Contact.FindSet then begin
            SMTPMailSetup.Get;
            //muga
            //     Email2 := SMTPMailSetup."Email Sender Address";
            //     Body := 'CANDIDATE ACCOUNT ACTIVATION';
            //     SMTP.CreateMessage('CANDIDATE ACCOUNT ACTIVATION', Email2, emailaddress,
            //    'CANDIDATE ACCOUNT ACTIVATION',
            //    'Dear ' + Contact.Name + ',<BR><BR>' +
            //    'Your Account Creation Request has been successfully Received with Email Address<b>' + ' ' + Format(Contact."E-Mail") + ' ' + '</b> .Kindly Click on the Link Below to activate your Account<BR>' +
            //    'Click on the Link to Activate your Account' + ' ' + '<b><a href="http://192.168.1.181:8090/Home/Register">Click here to activate your Account</a></b><BR>'
            //    + '<BR>'
            //    + 'On Activation of the Account, You will Receive Login Credentials' + ' <b>'
            //  , true);
            //     SMTP.AddBCC(Email2);
            //     SMTP.AppendBody('<BR><BR>Kind Regards,' + '<BR><BR>Human Resource <BR><BR>[THIS IS AN AUTOMATED MESSAGE - PLEASE DO NOT REPLY DIRECTLY TO THIS EMAIL]<BR>');
            //     SMTP.Send();
            Message('Notification successfully sent to %1', Contact."E-Mail");
        end;
    end;


    procedure FnCreateApplicantAccountRequest(emailaddress: Text) status: Text
    var
        PortalUSer: Record "Dynasoft Portal User";
        RandomDigit: Text[50];
        entryno: Integer;
        ApplicantProfile: Record Applicant;
        HumanResourcesSetup: Record "Human Resources Setup";
        Contact: Record Contact;
        NoSeriesMgt: Codeunit "No. Series";
    begin
        Contact.Reset;
        Contact.SetRange("E-Mail", emailaddress);
        if Contact.FindSet then begin
            HumanResourcesSetup.Get;
            ApplicantProfile.Reset;
            ApplicantProfile.SetRange("E-Mail", emailaddress);
            if not ApplicantProfile.FindSet then begin
                ApplicantProfile.Init;
                //muga
                //ApplicantProfile."Candidate No." := NoSeriesMgt.GetNextNo(HumanResourcesSetup."Candidate No.", Today, true);
                ApplicantProfile."Candidate No." := NoSeriesMgt.GetNextNo(HumanResourcesSetup."Employee Nos.", Today, true);
                ApplicantProfile."Full Names" := Contact.Name;
                ApplicantProfile."E-Mail" := Contact."E-Mail";
                ApplicantProfile."Phone No." := Contact."Phone No.";
                if ApplicantProfile.Insert(true) then begin
                    // Update Dynasoft Portal user;
                    PortalUSer.Reset;
                    PortalUSer.SetRange("Authentication Email", emailaddress);
                    if not PortalUSer.FindSet then begin
                        PortalUSer.Init;
                        PortalUSer."User Name" := Contact.Name;
                        PortalUSer."Full Name" := Contact.Name;
                        PortalUSer."Authentication Email" := Contact."E-Mail";
                        PortalUSer."Mobile Phone No." := Contact."Phone No.";
                        PortalUSer.State := PortalUSer.State::Enabled;
                        PortalUSer."Record Type" := PortalUSer."record type"::"Job Applicant";
                        PortalUSer."Record ID" := ApplicantProfile."Candidate No.";
                        RandomDigit := CreateGuid;
                        RandomDigit := DelChr(RandomDigit, '=', '{}-01');
                        RandomDigit := CopyStr(RandomDigit, 1, 8);
                        PortalUSer."Password Value" := RandomDigit;
                        PortalUSer."Last Modified Date" := Today;
                        if PortalUSer.Insert(true) then begin
                            ;
                        end;
                    end;
                end;
            end;
        end;
    end;


    procedure FnSendEmaiNotificationOnApplicantRegRequest(ApplicantRequest: Record Contact)
    var
        SupplierReq: Record Contact;
        LastFieldNo: Integer;
        FooterPrinted: Boolean;
        FileDirectory: Text[100];
        FileName: Text[100];
        ReportID: Integer;
        //"Object": Record "Object";
        Window: Dialog;
        RunOnceFile: Text[1000];
        TimeOut: Integer;
        Customer2: Record Customer;
        Cust: Record Customer;
        cr: Integer;
        lf: Integer;
        EmailBody: array[2] of Text[30];
        BodyText: Text[250];
        mymail: Codeunit Mail;
        DefaultPrinter: Text[200];
        WindowisOpen: Boolean;
        FileDialog: Codeunit "Email Account";
        SendingDate: Date;
        SendingTime: Time;
        Counter: Integer;
        cu400: Codeunit "Mail";
        DocLog: Record "Document E-mail Log";
        BranchName: Code[80];
        DimValue: Record "Dimension Value";
        SenderAddress: Text[100];
        CustEmail: Text[100];
        UserSetup: Record "User Setup";
        HRSetup: Record "Company Information";
        Emp: Record Vendor;
        PayrollMonth: Date;
        PayrollMonthText: Text[30];
        PayPeriodtext: Text;
        PayPeriod: Record "Payroll PeriodX";
        CompInfo: Record "Company Information";
        DateFilter: Text;
        FromDate: Date;
        ToDate: Date;
        FromDateS: Text;
        ToDateS: Text;
        vend: Record Vendor;
        StartDate: Date;
        EndDAte: Date;
        EmailVerifier: Codeunit Payroll3;
        IsEmailValid: Boolean;
        RequesterName: Text[100];
        RequesterEmail: Text[100];
        emailhdr: Text[100];
        CompanyDetails: Text[250];
        SupplierDetails: Text[250];
        SenderMessage: Text[250];
        HRSetupNew: Record "Human Resources Setup";
    begin

        //muga
        // CompInfo.Get;
        // HRSetup.Get;
        // HRSetupNew.Get;
        // RequesterEmail := ApplicantRequest."E-Mail";
        // RequesterName := ApplicantRequest.Name;
        // Counter := Counter + 1;
        // if HRSetup."E-Mail" = '' then
        //     Error('Please Contact the IT Admin to specify the E-mail address under Company Information Setup page!!');
        // SenderAddress := HRSetup."E-Mail";

        // if HRSetupNew."HR E-mail Address" = '' then
        //     Error('Please Contact the IT Admin to specify the HR Manager E-mail address under Human Resource Setup page!!');
        // CustEmail := HRSetupNew."HR E-mail Address";
        // CompanyDetails := 'HR Officer,' + '<BR></BR>' + CompInfo.Name + '<BR></BR>' + CompInfo.Address + '<BR></BR>' + CompInfo."Address 2" + '<BR></BR>' + CompInfo.City;
        // SenderMessage := '<BR>This is to notify you that there has been a request for Registration via e-Recruitment for your action</BR>';
        // SupplierDetails := 'Request Reference No:' + ApplicantRequest."No." + '<BR></BR>' + 'Company Name:' + ApplicantRequest.Name + '<BR></BR>' +
        // 'Tax Registration (PIN) No:' + ApplicantRequest."VAT Registration No." + '<BR></BR>' + 'Primary Email:' + ApplicantRequest."E-Mail" + '<BR></BR>' +
        // 'Mobile Phone No:' + ApplicantRequest."Phone No." + '<BR></BR>';
        // if CustEmail = '' then
        //     exit;

        // //MESSAGE:='This is to notify you that there has been a request for Registration ' +  SupplierRequest."No." + ' From Supplier'+ SupplierRequest.Name;
        // emailhdr := 'Applicant e-Registration Request Reference No:' + ApplicantRequest."No.";

        // cu400.CreateMessage(CompInfo.Name, SenderAddress, CustEmail, emailhdr,
        // 'HR Officer,' + '<BR></BR>' + SenderMessage + SupplierDetails, true);

        // cu400.AddCC(RequesterEmail);

        // cu400.AppendBody(CompanyDetails);


        // cu400.Send;
        // SendingDate := Today;
        // SendingTime := Time;

        // Sleep(1000);
        // Window.Close;
    end;


    procedure FnSendEmaiNotificationOnApplicantRegRequestAcknowledge(ApplicantRequest: Record Contact)
    var
        SupplierReq: Record Contact;
        LastFieldNo: Integer;
        FooterPrinted: Boolean;
        FileDirectory: Text[100];
        FileName: Text[100];
        ReportID: Integer;
        //"Object": Record "Object";
        Window: Dialog;
        RunOnceFile: Text[1000];
        TimeOut: Integer;
        Customer2: Record Customer;
        Cust: Record Customer;
        cr: Integer;
        lf: Integer;
        EmailBody: array[2] of Text[30];
        BodyText: Text[250];
        mymail: Codeunit Mail;
        DefaultPrinter: Text[200];
        WindowisOpen: Boolean;
        FileDialog: Codeunit "Email Account";
        SendingDate: Date;
        SendingTime: Time;
        Counter: Integer;
        cu400: Codeunit "Mail";
        DocLog: Record "Document E-mail Log";
        BranchName: Code[80];
        DimValue: Record "Dimension Value";
        SenderAddress: Text[100];
        CustEmail: Text[100];
        UserSetup: Record "User Setup";
        HRSetup: Record "Company Information";
        Emp: Record Vendor;
        PayrollMonth: Date;
        PayrollMonthText: Text[30];
        PayPeriodtext: Text;
        PayPeriod: Record "Payroll PeriodX";
        CompInfo: Record "Company Information";
        DateFilter: Text;
        FromDate: Date;
        ToDate: Date;
        FromDateS: Text;
        ToDateS: Text;
        vend: Record Vendor;
        StartDate: Date;
        EndDAte: Date;
        EmailVerifier: Codeunit Payroll3;
        IsEmailValid: Boolean;
        RequesterName: Text[100];
        RequesterEmail: Text[100];
        emailhdr: Text[100];
        CompanyDetails: Text[250];
        SupplierDetails: Text[250];
        SenderMessage: Text[1000];
        ProcNote: Text[1000];
        LoginDetails: Text[250];
        PortalUser: Record "Dynasoft Portal User";
        Password: Text[50];
        ActivationDetails: Text[1000];
        HRSetupNew: Record "Human Resources Setup";
    begin
        //muga
        // CompInfo.Get;
        // HRSetup.Get;
        // HRSetupNew.Get;
        // RequesterEmail := ApplicantRequest."E-Mail";
        // RequesterName := ApplicantRequest.Name;
        // Counter := Counter + 1;
        // if HRSetup."E-Mail" = '' then
        //     Error('Please Contact the IT Admin to specify the E-mail address under Company Information Setup page!!');
        // SenderAddress := HRSetup."E-Mail";
        // if HRSetupNew."HR E-mail Address" = '' then
        //     Error('Please Contact the IT Admin to specify the HR Manager E-mail address under Human Resource Setup page!!');
        // CustEmail := HRSetupNew."HR E-mail Address";
        // CompanyDetails := 'Dear,' + ApplicantRequest.Name + '<BR>';
        // SenderMessage := '<BR>Thank you for using our e-Recruitment Portal which has been established to provide you with easy access to our online HR services such as E-Recruitment.' +
        // 'This email is to acknowledge that your Request for registration as an Applicant, done on: ' + Format(ApplicantRequest."Last Date Modified") +
        // 'has been received, summarized as follows:' + '<BR></BR>';
        // SupplierDetails := 'Request Reference No:' + ApplicantRequest."No." + '<BR></BR>' + '<b>Full Names:</b>' + ApplicantRequest.Name + '<BR></BR>' +
        // '<b>KRA Registration (PIN) No:</b>' + ApplicantRequest."VAT Registration No." + '<BR></BR>' + '<b>Primary Email Address<b>:' + ApplicantRequest."E-Mail" + '<BR></BR>' +
        // '<b>Mobile Phone No:<b>' + ApplicantRequest."Phone No." + '<BR></BR>';
        // if CustEmail = '' then
        //     exit;
        // emailhdr := 'e-Recruitment Acknowledgment (Reference No:' + ApplicantRequest."No." + ')';
        // cu400.CreateMessage(CompInfo.Name, SenderAddress, CustEmail, emailhdr,
        // CompanyDetails + '<BR></BR>' + SenderMessage + SupplierDetails + LoginDetails + ActivationDetails, true);
        // cu400.AddCC(RequesterEmail);
        // cu400.AppendBody(ProcNote);
        // cu400.Send;
        // SendingDate := Today;
        // SendingTime := Time;
        // Sleep(1000);
        // Window.Close;
    end;


    procedure FnSendEmaiNotificationOnApplicantAccountActivation(ApplicantRequest: Record Contact)
    var
        SupplierReq: Record Contact;
        LastFieldNo: Integer;
        FooterPrinted: Boolean;
        FileDirectory: Text[100];
        FileName: Text[100];
        ReportID: Integer;
        //"Object": Record "Object";
        Window: Dialog;
        RunOnceFile: Text[1000];
        TimeOut: Integer;
        Customer2: Record Customer;
        Cust: Record Customer;
        cr: Integer;
        lf: Integer;
        EmailBody: array[2] of Text[30];
        BodyText: Text[250];
        mymail: Codeunit Mail;
        DefaultPrinter: Text[200];
        WindowisOpen: Boolean;
        FileDialog: Codeunit "Email Account";
        SendingDate: Date;
        SendingTime: Time;
        Counter: Integer;
        cu400: Codeunit "Mail";
        DocLog: Record "Document E-mail Log";
        BranchName: Code[80];
        DimValue: Record "Dimension Value";
        SenderAddress: Text[100];
        CustEmail: Text[100];
        UserSetup: Record "User Setup";
        HRSetupNew: Record "Human Resources Setup";
        HRSetup: Record "Company Information";
        Emp: Record Vendor;
        PayrollMonth: Date;
        PayrollMonthText: Text[30];
        PayPeriodtext: Text;
        PayPeriod: Record "Payroll PeriodX";
        CompInfo: Record "Company Information";
        DateFilter: Text;
        FromDate: Date;
        ToDate: Date;
        FromDateS: Text;
        ToDateS: Text;
        vend: Record Vendor;
        StartDate: Date;
        EndDAte: Date;
        EmailVerifier: Codeunit Payroll3;
        IsEmailValid: Boolean;
        RequesterName: Text[100];
        RequesterEmail: Text[100];
        emailhdr: Text[100];
        CompanyDetails: Text[250];
        SupplierDetails: Text[1000];
        SenderMessage: Text[1000];
        ProcNote: Text[1000];
        LoginDetails: Text[1000];
        PortalUser: Record "Dynasoft Portal User";
        Password: Text[50];
        ActivationDetails: Text[1000];
    begin
        //muga
        // CompInfo.Get;
        // HRSetup.Get;
        // HRSetupNew.Get;
        // RequesterEmail := ApplicantRequest."E-Mail";
        // RequesterName := ApplicantRequest.Name;
        // Counter := Counter + 1;
        // PortalUser.Reset;
        // PortalUser.SetRange("Authentication Email", ApplicantRequest."E-Mail");
        // if PortalUser.FindSet then
        //     Password := PortalUser."Password Value";
        // if HRSetup."E-Mail" = '' then
        //     Error('Please Contact the IT Admin to specify the E-mail address under Company Information Setup page!!');
        // SenderAddress := HRSetup."E-Mail";
        // if HRSetupNew."HR E-mail Address" = '' then
        //     Error('Please Contact the IT Admin to specify the HR Manager E-mail address under Human Resource Setup page!!');
        // CustEmail := HRSetupNew."HR E-mail Address";
        // CompanyDetails := 'Dear,' + ApplicantRequest.Name + '<BR>';
        // SenderMessage := '<BR>Please note that your Applicant account has been created on our System, with the following key registration details:</BR>' + '<BR></BR>';
        // SupplierDetails := '<BR><b>Registration Request Reference No:</>' + ApplicantRequest."No." + '</BR>' + '<BR><b> Name:</>' + ApplicantRequest.Name + '</BR>' +
        // '<BR><b>Mobile Phone No:<b>' + ApplicantRequest."Phone No." + '</BR>';
        // LoginDetails := 'We have also created your portal access account with the following login credentials:' + '<BR></BR>' +
        // '<b>User Name:<b>' + ApplicantRequest."E-Mail" + '<BR></BR>' + '<b>Password:<b>' + Password + '<BR>To access our portal and complete your registration click on the link below to access the E-Recruitment Portal and Complete your Profile';
        // ActivationDetails := '<BR>Once you access our portal, you shall be able to complete the Confidential Applicant section of the registration that shall require you to provide the following information:</BR>' +
        // '<BR> ┼Personal Information' +
        // '<BR> ┼Communication/contact details' +
        // '<BR> ┼Academic Qualifications' +
        // '<BR> ┼Proffesional Qualifications' +
        // '<BR> ┼Hobbies' +
        // '<BR> ┼Employment History' +
        // '<BR> ┼Refferees' +
        // '<BR> ┼And Attachments' +
        // '<BR> <b><a href="#">E-Recruitment Portal Link</a></b></BR>';
        // if CustEmail = '' then
        //     exit;
        // emailhdr := 'e-Recruitment Account Activation (Applicant Account No:' + ApplicantRequest."No." + ')';
        // cu400.CreateMessage(CompInfo.Name, SenderAddress, CustEmail, emailhdr,
        // CompanyDetails + '<BR></BR>' + SenderMessage + SupplierDetails + LoginDetails + ActivationDetails, true);
        // cu400.AddCC(RequesterEmail);
        // cu400.AppendBody(ProcNote);
        // cu400.Send;
        // SendingDate := Today;
        // SendingTime := Time;
        // Sleep(1000);
        // Window.Close;
    end;

    procedure FnDeleteAacademicDetails(EntryNumber: Integer; CandidateNumber: Code[100]) status: Text
    var
        ApplicantProfile: Record Contact;
        Contact: Record Contact;
        NoSeriesManagement: Codeunit "No. Series";
        MarketingSetup: Record "Marketing Setup";
        JobApplicantsQualification: Record "Job Applicants Qualification";
    begin

        JobApplicantsQualification.Reset;
        JobApplicantsQualification.SetRange("Candidate No.", CandidateNumber);
        JobApplicantsQualification.SetRange("Line No.", EntryNumber);
        if JobApplicantsQualification.FindSet then begin
            if JobApplicantsQualification.Delete(true) then begin
                status := 'success*Your Academic Details was successfully Deleted';
            end else begin
                status := 'danger*Your Academic Details was not successfully Deleted';
            end;
        end;

    end;

    procedure FnDeleteJobAcademicDetails(EntryNumber: Integer; CandidateNumber: Code[100]) status: Text
    var
        ApplicantProfile: Record Contact;
        Contact: Record Contact;
        NoSeriesManagement: Codeunit "No. Series";
        MarketingSetup: Record "Marketing Setup";
        JobApplicantsQualification: Record "Job Applicants Qualification";
        ApplicationQualification: Record "Application Qualification";
    begin
        ApplicationQualification.Reset;
        ApplicationQualification.SetRange("Candidate No.", CandidateNumber);
        ApplicationQualification.SetRange("Line No.", EntryNumber);
        if ApplicationQualification.FindSet then begin
            if ApplicationQualification.Delete(true) then begin
                status := 'success*Your Academic Details was successfully Deleted';
            end else begin
                status := 'danger*Your Academic Details was not successfully Deleted';
            end;
        end;

    end;

    procedure FnDeleteProffessionalQualificationDetails(EntryNumber: Integer; CandidateNumber: Code[100]) status: Text
    var
        ApplicantProfile: Record Contact;
        Contact: Record Contact;
        NoSeriesManagement: Codeunit "No. Series";
        MarketingSetup: Record "Marketing Setup";
        JobApplicantsQualification: Record "Job Applicants Qualification";
    begin

        JobApplicantsQualification.Reset;
        JobApplicantsQualification.SetRange("Candidate No.", CandidateNumber);
        JobApplicantsQualification.SetRange("Line No.", EntryNumber);
        if JobApplicantsQualification.FindSet then begin
            if JobApplicantsQualification.Delete(true) then begin
                status := 'success*Your Proffesional Details was successfully Deleted';
            end else begin
                status := 'danger*Your Proffesional Details was not successfully Deleted';
            end;
        end;

    end;

    procedure FnDeleteProffessionalQualificationBodiesDetails(EntryNumber: Integer; CandidateNumber: Code[100]) status: Text
    var
        ApplicantProfile: Record Contact;
        Contact: Record Contact;
        NoSeriesManagement: Codeunit "No. Series";
        MarketingSetup: Record "Marketing Setup";
        JobApplicantsQualification: Record "Job Applicants Qualification";
    begin

        JobApplicantsQualification.Reset;
        JobApplicantsQualification.SetRange("Candidate No.", CandidateNumber);
        JobApplicantsQualification.SetRange("Line No.", EntryNumber);
        if JobApplicantsQualification.FindSet then begin
            if JobApplicantsQualification.Delete(true) then begin
                status := 'success*Your Proffesional Bodies Details was successfully Deleted';
            end else begin
                status := 'danger*Your Proffesional Bodies Details was not successfully Deleted';
            end;
        end;

    end;

    procedure FnDeleteWorkExperienceDetails(EntryNumber: Integer; CandidateNumber: Code[100]) status: Text
    var
        ApplicantProfile: Record Contact;
        Contact: Record Contact;
        NoSeriesManagement: Codeunit "No. Series";
        MarketingSetup: Record "Marketing Setup";
        JobApplicantsQualification: Record "Job Applicants Qualification";
    begin

        JobApplicantsQualification.Reset;
        JobApplicantsQualification.SetRange("Candidate No.", CandidateNumber);
        JobApplicantsQualification.SetRange("Line No.", EntryNumber);
        if JobApplicantsQualification.FindSet then begin
            if JobApplicantsQualification.Delete(true) then begin
                status := 'success*Your Academic Details was successfully Deleted';
            end else begin
                status := 'danger*Your Academic Details was not successfully Deleted';
            end;
        end;

    end;

    procedure FnDeleteRefereeDetails(EntryNumber: Integer; CandidateNumber: Code[100]) status: Text
    var
        ApplicantProfile: Record Contact;
        Contact: Record Contact;
        NoSeriesManagement: Codeunit "No. Series";
        MarketingSetup: Record "Marketing Setup";
        JobApplicantsQualification: Record "Job Applicants Qualification";
        EmployeeApplicantReferees: Record "Employee_Applicant Referees";
    begin

        EmployeeApplicantReferees.Reset;
        EmployeeApplicantReferees.SetRange("No.", CandidateNumber);
        EmployeeApplicantReferees.SetRange("Line No.", EntryNumber);
        if EmployeeApplicantReferees.FindSet then begin
            if EmployeeApplicantReferees.Delete(true) then begin
                status := 'success*Your Referree Details was successfully Deleted';
            end else begin
                status := 'danger*Your Referree Details was not successfully Deleted';
            end;
        end;

    end;

    procedure FnDeleteJobProffesionalQualificationDetails(EntryNumber: Integer; CandidateNumber: Code[100]) status: Text
    var
        ApplicantProfile: Record Contact;
        Contact: Record Contact;
        NoSeriesManagement: Codeunit "No. Series";
        MarketingSetup: Record "Marketing Setup";
        JobApplicantsQualification: Record "Job Applicants Qualification";
        ApplicationQualification: Record "Application Qualification";
    begin
        ApplicationQualification.Reset;
        ApplicationQualification.SetRange("Candidate No.", CandidateNumber);
        ApplicationQualification.SetRange("Line No.", EntryNumber);
        if ApplicationQualification.FindSet then begin
            if ApplicationQualification.Delete(true) then begin
                status := 'success*Your Proffesional Qualifications Details was successfully Deleted';
            end else begin
                status := 'danger*Your Proffesional Qualifications Details was not successfully Deleted';
            end;
        end;

    end;

    procedure FnDeleteJobProffesionalBodiesDetails(EntryNumber: Integer; CandidateNumber: Code[100]) status: Text
    var
        ApplicantProfile: Record Contact;
        Contact: Record Contact;
        NoSeriesManagement: Codeunit "No. Series";
        MarketingSetup: Record "Marketing Setup";
        JobApplicantsQualification: Record "Job Applicants Qualification";
        ApplicationQualification: Record "Application Qualification";
    begin
        ApplicationQualification.Reset;
        ApplicationQualification.SetRange("Candidate No.", CandidateNumber);
        ApplicationQualification.SetRange("Line No.", EntryNumber);
        if ApplicationQualification.FindSet then begin
            if ApplicationQualification.Delete(true) then begin
                status := 'success*Your Proffesional Qualifications Details was successfully Deleted';
            end else begin
                status := 'danger*Your Proffesional Qualifications Details was not successfully Deleted';
            end;
        end;

    end;

    procedure FnDeleteJobApplicationRefereeDetails(EntryNumber: Integer; CandidateNumber: Code[100]) status: Text
    var
        ApplicantProfile: Record Contact;
        Contact: Record Contact;
        NoSeriesManagement: Codeunit "No. Series";
        MarketingSetup: Record "Marketing Setup";
        JobApplicantsQualification: Record "Job Applicants Qualification";
        EmployeeApplicantReferees: Record "Employee_Applicant Referees";
        ApplicationReferees: Record "Application Referees";
    begin

        ApplicationReferees.Reset;
        ApplicationReferees.SetRange("Candidate No.", CandidateNumber);
        ApplicationReferees.SetRange("Line No.", EntryNumber);
        //ApplicationReferees.SETRANGE("Application No.",JobApplicationNumber);
        if ApplicationReferees.FindSet then begin
            if ApplicationReferees.Delete(true) then begin
                status := 'success*Your Referree Details was successfully Deleted';
            end else begin
                status := 'danger*Your Referree Details was not successfully Deleted';
            end;
        end;

    end;

    procedure FnCreateCandidateDocumentsLink(applicantNo: Code[50]; ApplicationNo: Code[50]; FileName: Text; FileLink: Text) status: Text
    var
        JobApplications: Record "Job Applications";
        DocumentAttachment: Record "Document Attachment";
        RecordLink: Record "Record Link";
    begin
        // Record Links Attachment on the Applications -Obadiah Korir
        if RecordLink."Link ID" = 0 then begin
            RecordLink.URL1 := FileLink;
            RecordLink.Description := FileName;
            RecordLink.Type := RecordLink.Type::Link;
            RecordLink.Company := COMPANYNAME;
            RecordLink."User ID" := UserId;
            RecordLink.Created := CreateDatetime(Today, Time);
            JobApplications.Reset;
            JobApplications."Application No." := ApplicationNo;
            JobApplications."Candidate No." := applicantNo;
            if JobApplications.Find('=') then
                RecordIDNumber := JobApplications.RecordId;
            RecordLink."Record ID" := RecordIDNumber;
            if RecordLink.Insert(true) then begin
                status := 'success*Link successfully created';
            end else begin
                status := 'error*An error occured during the process of creating link';
            end
        end;
    end;
}
