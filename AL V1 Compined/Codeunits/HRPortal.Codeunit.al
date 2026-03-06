#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Codeunit 50012 HRPortal
{

    trigger OnRun()
    begin
        //generatePayslip('NCIA00001',20180106D);
        //generateP9('20082',CURRENTDATETIME,CURRENTDATETIME);
        //imprestGeneralDetails('DBSL' ,'','subject' ,'objective','estinationNarration',TODAY,10,'','');
    end;

    var
        Employee: Record Employee;
        objMail: Codeunit "Mail";
        HRPortalUsers: Record HRPortalUsers;
        leaveApplications: Record "HR Leave Application";
        HrJobsApplicants: Record "Hr Jobs Applicants";
        JobApplicantHobbies: Record "Job Applicant Hobbies";
        JobApplicantReferees: Record "Job Applicant Referees";
        JobApplicantsQualifications: Record "Job Applicants Qualifications";
        CompanyJobs: Record "Company Jobs";
        JobPositionApplications: Record "Job Position Applications";
        FILESPATH: label '\\navtestserver\hrportal\Downloads\';
        ImprestMemo: Record "Imprest Memo";
        LegInstr: InStream;
        LegOutStr: OutStream;
        LegText: Text;
        Leg: BigText;
        obj: BigText;
        ApprovalsMgmt: Codeunit "Approvals Mgmt.";
        Payments: Record Payments;
        Payments1: Record Payments;
        Payments2: Record Payments;
        PurchaseHeader: Record "Purchase Header";

    procedure resetPassword("employeeNumber-idNumber": Code[20]) status: Text
    begin
        status := 'danger*Account not found';
        Employee.Reset;
        Employee.SetRange(Employee."No.", "employeeNumber-idNumber");
        if Employee.FindSet then begin
            status := myResetPass(Employee);
        end else begin
            Employee.Reset;
            Employee.SetRange(Employee."ID Number", "employeeNumber-idNumber");
            if Employee.FindSet then begin
                status := myResetPass(Employee);
            end else begin
                if HrJobsApplicants.Get("employeeNumber-idNumber") then begin
                    //reset password for external
                    status := myResetPassExternal(HrJobsApplicants);
                end else begin
                    status := 'danger*Account with the given credentials does not exist';
                end;
            end;
        end;
        /*objMail.CreateMessage('CIC Pension','life.pensionws@cic.co.ke', recipient, subject, content, TRUE);
        objMail.Send();*/

    end;

    local procedure myResetPass(Employee: Record Employee) status: Text
    var
        employeeEmail: Text;
        password: Integer;
        passwordOk: Boolean;
        SMTPMailSetup: Record "Email Account";
    begin
        employeeEmail := Employee."Company E-Mail";
        if employeeEmail = '' then begin
            status := 'danger*You have not added company email to the selected employee. Kindly update and try again';
        end else begin
            passwordOk := false;
            repeat
                password := Random(9999);
                if password > 1000 then
                    passwordOk := true;
            until passwordOk = true;
            HRPortalUsers.Reset;
            HRPortalUsers.SetRange(HRPortalUsers.employeeNo, Employee."No.");
            if HRPortalUsers.FindSet then begin
                HRPortalUsers.password := Format(password);
                HRPortalUsers.changedPassword := false;
                HRPortalUsers.Modify(true);
            end else begin
                HRPortalUsers.Init;
                HRPortalUsers.employeeNo := Employee."No.";
                HRPortalUsers.IdNo := Employee."ID Number";
                HRPortalUsers.password := Format(password);
                HRPortalUsers.changedPassword := false;
                HRPortalUsers.Insert(true);
            end;
            SMTPMailSetup.Get();
            objMail.CreateMessage(employeeEmail, '', '', 'Employee Password Reset', 'Your one time password is <strong>' + Format(password) + '</strong>', true, true);
            //objMail.CreateMessage(SMTPMailSetup."Email Sender Name", SMTPMailSetup."Email Sender Address", employeeEmail, 'Password Reset', 'Your one time password is <strong>' + Format(password) + '</strong>', true);
            //objMail.Send();
            status := 'success*We have sent a one time password to your email (' + employeeEmail + '). Use it to log in to your account';
        end;
    end;

    local procedure myResetPassExternal(HrJobsApplicants: Record "Hr Jobs Applicants") status: Text
    var
        employeeEmail: Text;
        password: Integer;
        passwordOk: Boolean;
    begin
        employeeEmail := HrJobsApplicants."E-Mail";
        if employeeEmail = '' then begin
            status := 'danger*You have not added an email to you account. ';
        end else begin
            passwordOk := false;
            repeat
                password := Random(9999);
                if password > 1000 then
                    passwordOk := true;
            until passwordOk = true;
            HRPortalUsers.Reset;
            HRPortalUsers.SetRange(HRPortalUsers.IdNo, HrJobsApplicants."ID Number");
            if HRPortalUsers.FindSet then begin
                HRPortalUsers.password := Format(password);
                HRPortalUsers.changedPassword := false;
                HRPortalUsers.Modify(true);
            end else begin
                HRPortalUsers.Init;
                HRPortalUsers.employeeNo := Employee."No.";
                HRPortalUsers.IdNo := Employee."ID Number";
                HRPortalUsers.password := Format(password);
                HRPortalUsers.changedPassword := false;
                HRPortalUsers.Insert(true);
            end;
            objMail.CreateMessage(employeeEmail, '', '', 'Employee Password Reset', 'Your one time password is <strong>' + Format(password) + '</strong>', true, true);
            //objMail.CreateMessage('KEMRI', 'arndegwa@kemri.org', employeeEmail, 'Password Reset', 'Your one time password is <strong>' + Format(password) + '</strong>', true);
            //objMail.Send();
            status := 'success*We have sent a on time password to your email (' + employeeEmail + '). Use it to log in to your account';
        end;
    end;

    procedure leaveApplication(leaveNo: Code[50]; employeeNumber: Code[20]; leaveType: Code[20]; daysApplied: Integer; lStartDate: DateTime; phoneNumber: Code[20]; emailAddress: Text; examdetails: Text; dateOfExam: DateTime; previousAttempts: Integer) status: Text
    var
        HRLeaveApplication1: Record "HR Leave Application";
    begin
        status := 'danger*Your leave application failed';
        Employee.Reset;
        Employee.SetRange("No.", employeeNumber);
        if Employee.FindSet then begin
            if leaveNo = '' then begin //a new leave
                leaveApplications.Init;
                leaveApplications."Employee No" := employeeNumber;
                leaveApplications.Validate("Employee No");
                leaveApplications."Leave Type" := leaveType;
                leaveApplications.Validate("Leave Type");
                leaveApplications."Days Applied" := daysApplied;
                leaveApplications."Start Date" := Dt2Date(lStartDate);
                leaveApplications."Cell Phone Number" := phoneNumber;
                leaveApplications."E-mail Address" := emailAddress;
                leaveApplications."Details of Examination" := examdetails;
                leaveApplications."Date of Exam" := Dt2Date(dateOfExam);
                leaveApplications."Number of Previous Attempts" := Format(previousAttempts);
                leaveApplications.Validate("Days Applied");
                leaveApplications.Validate("Date of Exam");
                if leaveApplications.Insert(true) then begin
                    leaveApplications."Employee No" := employeeNumber;
                    leaveApplications.Validate("Employee No");
                    leaveApplications.Validate("Start Date");
                    leaveApplications.Modify(true);
                    status := 'success*Your leave application was successfully placed *' + leaveApplications."Application Code";

                end;
            end else begin //existing leave application
                leaveApplications.Reset;
                leaveApplications.SetRange("Employee No", employeeNumber);
                leaveApplications.SetRange("Application Code", leaveNo);
                leaveApplications.SetRange(Status, leaveApplications.Status::Open);
                if leaveApplications.FindSet then begin
                    leaveApplications."Employee No" := employeeNumber;
                    leaveApplications.Validate("Employee No");
                    leaveApplications."Leave Type" := leaveType;
                    leaveApplications.Validate("Leave Type");
                    leaveApplications."Days Applied" := daysApplied;
                    leaveApplications."Start Date" := Dt2Date(lStartDate);
                    leaveApplications."Cell Phone Number" := phoneNumber;
                    leaveApplications."E-mail Address" := emailAddress;
                    leaveApplications."Details of Examination" := examdetails;
                    leaveApplications."Date of Exam" := Dt2Date(dateOfExam);
                    leaveApplications."Number of Previous Attempts" := Format(previousAttempts);
                    leaveApplications.Validate("Days Applied");
                    leaveApplications.Validate("Date of Exam");
                    if leaveApplications.Modify(true) then begin
                        leaveApplications."Employee No" := employeeNumber;
                        leaveApplications.Validate("Employee No");
                        leaveApplications.Validate("Start Date");
                        leaveApplications.Modify(true);
                        status := 'success*Your leave application was successfully updated *' + leaveApplications."Application Code";

                    end;
                end else begin
                    status := 'danger*A leave application with the given code does not exist, you are not the owner or is no longer open';
                end;
            end;
        end else begin
            status := 'danger*The selected employee does not exist';
        end;
    end;

    procedure generatePayslip(employeeNumber: Code[20]; payPeriod: DateTime) status: Text
    begin
        /*status:='danger*could not generate your statement';
        Employee.RESET;
        Employee.SETRANGE(Employee."No.", employeeNumber);
        IF Employee.FINDSET THEN BEGIN
          Employee.RESET;
          Employee.SETRANGE(Employee."No.", employeeNumber);
          Employee.SETRANGE("Pay Period Filter", DT2DATE(payPeriod));
          IF Employee.FINDSET THEN BEGIN
            REPORT.SAVEASPDF(89028, FILESPATH+employeeNumber+'.pdf',Employee);
            IF FILE.EXISTS(FILESPATH+employeeNumber+'.pdf') THEN
              status:='success*Generated*Downloads\'+employeeNumber+'.pdf';
            END;
          END ELSE BEGIN
            status:='danger*Employee not found';
            END;
        */

    end;

    procedure generateP9(employeeNumber: Code[20]; startDate: DateTime; endDate: DateTime) status: Text
    begin
        status := 'danger*could not generate your statement';
        Employee.Reset;
        Employee.SetRange(Employee."No.", employeeNumber);
        if Employee.FindSet then begin
            Employee.Reset;
            Employee.SetRange(Employee."No.", employeeNumber);

            //MUGa
            // if Employee.FindSet then begin
            //     Employee.SetFilter("Date Filter", Format(Format(startDate) + '..' + Format(endDate)));
            //     Report.SaveAsPdf(69019, FILESPATH + employeeNumber + '.pdf', Employee);
            //     if FILE.Exists(FILESPATH + employeeNumber + '.pdf') then
            //         status := 'success*Generated*Downloads\' + employeeNumber + '.pdf';
            // end;
        end else begin
            status := 'danger*Employee not found';
        end;
    end;

    procedure register("First Name": Text; "Middle Name": Text; "Last name": Text; "Email Address": Text; "Phone Number": Code[20]; "idNumber/Passport": Code[20]; citizenship: Code[20]; gender: Text) status: Text
    var
        password: Integer;
        passwordOk: Boolean;
    begin
        //check that the user does not exist by id
        //check that the user does not exist by email
        status := 'danger*Your account could not be created';
        HrJobsApplicants.Reset;
        HrJobsApplicants.SetRange("ID Number", "idNumber/Passport");
        if HrJobsApplicants.FindSet then begin
            status := 'danger*Another user with the given id number already exists. ';
        end else begin
            HrJobsApplicants.Reset;
            HrJobsApplicants.SetRange("E-Mail", "Email Address");
            if HrJobsApplicants.FindSet then begin
                status := 'danger*Another user with the given email address already exists. ';
            end else begin
                //check employee
                Employee.Reset;
                Employee.SetRange(Employee."ID Number", "idNumber/Passport");
                if Employee.FindSet then begin
                    status := 'danger*Your account could not be created since you have been registered as an employee. ';
                end else begin
                    //create account
                    HrJobsApplicants.Init;
                    HrJobsApplicants."ID Number" := "idNumber/Passport";
                    HrJobsApplicants."First Name" := "First Name";
                    HrJobsApplicants."Middle Name" := "Middle Name";
                    HrJobsApplicants."Last Name" := "Last name";
                    HrJobsApplicants."E-Mail" := "Email Address";
                    HrJobsApplicants."Cell Phone Number" := "Phone Number";
                    HrJobsApplicants.Citizenship := citizenship;
                    HrJobsApplicants.Gender := HrJobsApplicants.Gender::Female;
                    if gender = 'male' then
                        HrJobsApplicants.Gender := HrJobsApplicants.Gender::Male;
                    if HrJobsApplicants.Insert(true) then begin
                        passwordOk := false;
                        repeat
                            password := Random(9999);
                            if password > 1000 then
                                passwordOk := true;
                        until passwordOk = true;
                        //create account
                        HRPortalUsers.Init;
                        HRPortalUsers.IdNo := "idNumber/Passport";
                        HRPortalUsers.password := Format(password);
                        if HRPortalUsers.Insert(true) then begin
                            objMail.CreateMessage("Email Address", '', '', 'One Time Password', 'Your one time password is <strong>' + Format(password) + '</strong>', TRUE, true);
                            //objMail.CreateMessage('KEMRI', 'arndegwa@kemri.org', "Email Address", 'One Time Password', 'Your one time password is <strong>' + Format(password) + '</strong>', true);
                            //objMail.Send();
                            status := 'success*Your account was successfully created. Please refer to the next instructions sent via email ';
                        end else begin
                            HrJobsApplicants.Delete;
                            status := 'danger*Your account could not be created. Please try again later ';
                        end;
                    end else begin
                        status := 'danger*Your account could not be created. Please try again later ';
                    end;
                end;
            end;
        end;
    end;

    procedure addHobby(idNumber: Code[20]; hobby: Text) status: Text
    begin
        status := 'danger*The hobby could not be added';
        if HrJobsApplicants.Get(idNumber) then begin
            JobApplicantHobbies.Init;
            JobApplicantHobbies."Id No" := idNumber;
            JobApplicantHobbies.Hobby := hobby;
            if JobApplicantHobbies.Insert(true) then begin
                status := 'success*The hobby was successfully added';
            end else begin
                status := 'danger*The hobby could not be added';
            end;
        end else begin
            status := 'danger*The selected employee does not exist';
        end;
        exit(status);
    end;

    procedure updateGeneralDetails(idNumber: Code[20]; firstName: Text; middleName: Text; lastName: Text; initials: Text; firstLanguage: Code[20]; firstLanguageRead: Boolean; firstLanguageWrite: Boolean; firstLanguageSpeak: Boolean; secondLanguage: Code[20]; secondLanguageRead: Boolean; secondLanguageWrite: Boolean; secondLanguageSpeak: Boolean; additionalLanguage: Code[20]; gender: Text; citizenship: Code[20]) status: Text
    begin
        if HrJobsApplicants.Get(idNumber) then begin
            HrJobsApplicants."First Name" := firstName;
            HrJobsApplicants."Middle Name" := middleName;
            HrJobsApplicants."Last Name" := lastName;
            HrJobsApplicants.Initials := initials;
            HrJobsApplicants."First Language (R/W/S)" := firstLanguage;
            HrJobsApplicants."First Language Read" := firstLanguageRead;
            HrJobsApplicants."First Language Write" := firstLanguageWrite;
            HrJobsApplicants."First Language Speak" := firstLanguageSpeak;
            HrJobsApplicants."Second Language (R/W/S)" := secondLanguage;
            HrJobsApplicants."Second Language Read" := secondLanguageRead;
            HrJobsApplicants."Second Language Write" := secondLanguageWrite;
            HrJobsApplicants."Second Language Speak" := secondLanguageSpeak;
            HrJobsApplicants."Additional Language" := additionalLanguage;
            if gender = 'Female' then
                HrJobsApplicants.Gender := HrJobsApplicants.Gender::Female;
            if gender = 'Male' then
                HrJobsApplicants.Gender := HrJobsApplicants.Gender::Male;
            HrJobsApplicants.Citizenship := citizenship;
            if HrJobsApplicants.Modify(true) then begin
                status := 'success*Your profile was successfully updated';
            end else begin
                status := 'danger*Your profile could not be updated. Please try again later';
            end;

        end else begin
            status := 'danger*A user with the given ID Number does not exist';
        end;
    end;

    procedure updatePersonalDetails(idNumber: Code[20]; maritalStatus: Text; ethnicOrigin: Text; disabled: Text; healthAssessment: Boolean; healthAssessmentDate: Date; dateOfBirth: Date) status: Text
    begin
        if HrJobsApplicants.Get(idNumber) then begin
            if maritalStatus = '' then
                HrJobsApplicants."Marital Status" := HrJobsApplicants."marital status"::" ";
            if maritalStatus = 'Single' then
                HrJobsApplicants."Marital Status" := HrJobsApplicants."marital status"::Single;
            if maritalStatus = 'Married' then
                HrJobsApplicants."Marital Status" := HrJobsApplicants."marital status"::Married;
            if maritalStatus = 'Separated' then
                HrJobsApplicants."Marital Status" := HrJobsApplicants."marital status"::Separated;
            if maritalStatus = 'Divorced' then
                HrJobsApplicants."Marital Status" := HrJobsApplicants."marital status"::Divorced;
            if maritalStatus = 'Widow(er)' then
                HrJobsApplicants."Marital Status" := HrJobsApplicants."marital status"::"Widow(er)";
            if maritalStatus = 'Other' then
                HrJobsApplicants."Marital Status" := HrJobsApplicants."marital status"::Other;
            if ethnicOrigin = 'African' then
                HrJobsApplicants."Ethnic Origin" := HrJobsApplicants."ethnic origin"::African;
            if ethnicOrigin = 'Indian' then
                HrJobsApplicants."Ethnic Origin" := HrJobsApplicants."ethnic origin"::Indian;
            if ethnicOrigin = 'White' then
                HrJobsApplicants."Ethnic Origin" := HrJobsApplicants."ethnic origin"::White;
            if ethnicOrigin = 'Coloured' then
                HrJobsApplicants."Ethnic Origin" := HrJobsApplicants."ethnic origin"::Coloured;
            if disabled = '' then
                HrJobsApplicants.Disabled := HrJobsApplicants.Disabled::" ";
            if disabled = 'No' then
                HrJobsApplicants.Disabled := HrJobsApplicants.Disabled::No;
            if disabled = 'Yes' then
                HrJobsApplicants.Disabled := HrJobsApplicants.Disabled::Yes;
            HrJobsApplicants."Health Assesment?" := healthAssessment;
            HrJobsApplicants."Health Assesment Date" := healthAssessmentDate;
            HrJobsApplicants."Date Of Birth" := dateOfBirth;
            if HrJobsApplicants.Modify(true) then begin
                status := 'success*Your profile was successfully updated' + Format(healthAssessmentDate);
            end else begin
                status := 'danger*Your profile could not be updated. Please try again later';
            end;
        end else begin
            status := 'danger*A user with the given ID Number does not exist';
        end;
    end;

    procedure updateCommunicationDetails(idNumber: Code[20]; homePhoneNumber: Text; postalAddress: Text; postalAddress2: Text; postalAddress3: Text; residentialAddress: Text; residentialAddress2: Text; residentialAddress3: Text; cellPhoneNumber: Text; workPhoneNumber: Text; extension: Text; fax: Text; postCode: Code[20]; postCode2: Code[20]) status: Text
    begin
        if HrJobsApplicants.Get(idNumber) then begin
            HrJobsApplicants."Home Phone Number" := homePhoneNumber;
            HrJobsApplicants."Postal Address" := postalAddress;
            HrJobsApplicants."Postal Address2" := postalAddress2;
            HrJobsApplicants."Postal Address3" := postalAddress3;
            HrJobsApplicants."Residential Address" := residentialAddress;
            HrJobsApplicants."Residential Address2" := residentialAddress2;
            HrJobsApplicants."Residential Address3" := residentialAddress3;
            HrJobsApplicants."Cell Phone Number" := cellPhoneNumber;
            HrJobsApplicants."Work Phone Number" := workPhoneNumber;
            HrJobsApplicants."Ext." := extension;
            HrJobsApplicants."Fax Number" := fax;
            HrJobsApplicants."Post Code" := postCode;
            HrJobsApplicants."Post Code2" := postCode2;
            if HrJobsApplicants.Modify(true) then begin
                status := 'success*Your profile was successfully updated';
            end else begin
                status := 'danger*Your profile could not be updated. Please try again later';
            end;
        end else begin
            status := 'danger*A user with the given ID Number does not exist';
        end;
    end;

    procedure addReferee(idNumber: Code[20]; refName: Text; refDesignation: Text; refInstitution: Text; refAddress: Text; refTelephone: Text; refEmail: Text) status: Text
    begin
        //JobApplicantReferees
        if HrJobsApplicants.Get(idNumber) then begin
            JobApplicantReferees.Init;
            JobApplicantReferees."Id Number" := idNumber;
            JobApplicantReferees.Names := refName;
            JobApplicantReferees.Designation := refDesignation;
            JobApplicantReferees.Institution := refInstitution;
            JobApplicantReferees.Address := refAddress;
            JobApplicantReferees."Telephone No" := refTelephone;
            JobApplicantReferees."E-Mail" := refEmail;
            if JobApplicantReferees.Insert(true) then begin
                status := 'success*The referee was successfully added';
            end else begin
                status := 'danger*The referee could not be added';
            end;
        end else begin
            status := 'danger*A user with the given ID Number does not exist';
        end;
    end;

    procedure addQualification(idNumber: Code[20]; qualificationType: Text; qualificationCode: Code[20]; qualificationFrom: Date; qualificationTo: Date; institution: Text) status: Text
    begin
        if HrJobsApplicants.Get(idNumber) then begin
            JobApplicantsQualifications.Init;
            JobApplicantsQualifications."Id No" := idNumber;
            JobApplicantsQualifications."Qualification Type" := qualificationType;
            JobApplicantsQualifications."Qualification Code" := qualificationCode;
            JobApplicantsQualifications.Validate("Qualification Code");
            JobApplicantsQualifications."From Date" := qualificationFrom;
            JobApplicantsQualifications."To Date" := qualificationTo;
            JobApplicantsQualifications."Institution/Company" := institution;
            if JobApplicantsQualifications.Insert(true) then begin
                status := 'success*The qualification was successfully added';
            end else begin
                status := 'danger*The qualification could not be added';
            end;
        end else begin
            status := 'danger*A user with the given ID Number does not exist';
        end;
    end;

    procedure apply(idNumber: Code[20]; jobId: Code[20]) status: Text
    begin
        if HrJobsApplicants.Get(idNumber) then begin
            CompanyJobs.Reset;
            CompanyJobs.SetRange("Job ID", jobId);
            CompanyJobs.SetRange(Advertised, true);
            if CompanyJobs.FindSet then begin
                if CompanyJobs."Vacant Positions" > 0 then begin
                    //apply for job
                    //check if user has already applied for the job
                    JobPositionApplications.Reset;
                    JobPositionApplications.SetRange(JobPositionApplications."Job Applied For", jobId);
                    JobPositionApplications.SetRange(JobPositionApplications."ID Number", idNumber);
                    if JobPositionApplications.FindSet then begin
                        status := 'danger*It seems you have already applied for this position. Please try another position';
                    end else begin
                        JobPositionApplications.Init;
                        JobPositionApplications."First Name" := HrJobsApplicants."First Name";
                        JobPositionApplications."Middle Name" := HrJobsApplicants."Middle Name";
                        JobPositionApplications."Last Name" := HrJobsApplicants."Last Name";
                        JobPositionApplications.Initials := HrJobsApplicants.Initials;
                        JobPositionApplications."First Language (R/W/S)" := HrJobsApplicants."First Language (R/W/S)";
                        JobPositionApplications."First Language (R/W/S)" := HrJobsApplicants."First Language (R/W/S)";
                        JobPositionApplications."ID Number" := HrJobsApplicants."ID Number";
                        JobPositionApplications."Job Applied For" := jobId;
                        JobPositionApplications."Second Language (R/W/S)" := HrJobsApplicants."Second Language (R/W/S)";
                        JobPositionApplications."Second Language Read" := HrJobsApplicants."Second Language Read";
                        JobPositionApplications."Second Language Speak" := HrJobsApplicants."Second Language Speak";
                        JobPositionApplications."Second Language Write" := HrJobsApplicants."Second Language Write";
                        JobPositionApplications."Additional Language" := HrJobsApplicants."Additional Language";
                        JobPositionApplications."Applicant Type" := JobPositionApplications."applicant type"::External;
                        JobPositionApplications.Gender := HrJobsApplicants.Gender;
                        JobPositionApplications.Citizenship := HrJobsApplicants.Citizenship;
                        JobPositionApplications.Validate(Citizenship);
                        JobPositionApplications."Marital Status" := HrJobsApplicants."Marital Status";
                        JobPositionApplications."Ethnic Origin" := HrJobsApplicants."Ethnic Origin";
                        JobPositionApplications.Disabled := HrJobsApplicants.Disabled;
                        JobPositionApplications."Health Assesment?" := HrJobsApplicants."Health Assesment?";
                        JobPositionApplications."Health Assesment Date" := HrJobsApplicants."Health Assesment Date";
                        JobPositionApplications."Date Of Birth" := HrJobsApplicants."Date Of Birth";
                        JobPositionApplications.Age := HrJobsApplicants.Age;
                        JobPositionApplications."Home Phone Number" := HrJobsApplicants."Home Phone Number";
                        JobPositionApplications."Postal Address" := HrJobsApplicants."Postal Address";
                        JobPositionApplications."Postal Address2" := HrJobsApplicants."Postal Address2";
                        JobPositionApplications."Postal Address3" := HrJobsApplicants."Postal Address3";
                        JobPositionApplications."Post Code" := HrJobsApplicants."Post Code";
                        JobPositionApplications."Post Code2" := HrJobsApplicants."Post Code2";
                        JobPositionApplications."Cell Phone Number" := HrJobsApplicants."Cell Phone Number";
                        JobPositionApplications."Work Phone Number" := HrJobsApplicants."Work Phone Number";
                        JobPositionApplications."Ext." := HrJobsApplicants."Ext.";
                        JobPositionApplications."E-Mail" := HrJobsApplicants."E-Mail";
                        JobPositionApplications."Fax Number" := HrJobsApplicants."Fax Number";
                        if JobPositionApplications.Insert(true) then begin
                            status := 'success*You job application was successfully captured. Thank you';
                        end else begin
                            status := 'danger*You application could not be captured. Please try again later';
                        end;
                    end;
                end else begin
                    status := 'danger*The selected job does not have any open position';
                end;
            end else begin
                status := 'danger*The selected job is no longer available';
            end;
        end else begin
            status := 'danger*A user with the given ID Number does not exist';
        end;
    end;

    // procedure imprestGeneralDetails(employeeNo: Code[50]; imprestNo: Code[20]; subject: Text; objective: Text; destinationNarration: Text; travelDate: Date; numberOfDays: Decimal; job: Code[50]; jobTaskNo: Code[50]; fundCode: Code[100]) status: Text
    // begin
    //     status := 'danger*Your imprest requisition could not be captured';
    //     if imprestNo = '' then begin
    //         ImprestMemo.Init;
    //         ImprestMemo."Document Type" := ImprestMemo."document type"::"Imprest Memo";
    //         ImprestMemo.Subject := subject;
    //         ImprestMemo.Validate(Subject);
    //         //ImprestMemo.Objective:= objective;
    //         ImprestMemo."Imprest Naration" := destinationNarration;
    //         ImprestMemo.Validate("Imprest Naration");
    //         ImprestMemo."Start Date" := travelDate;
    //         ImprestMemo.Validate("Start Date");
    //         ImprestMemo."No. of days" := numberOfDays;
    //         //ImprestMemo.VALIDATE("No. of days");
    //         ImprestMemo.Job := job;
    //         ImprestMemo.Validate(Job);
    //         ImprestMemo."Job  Task" := jobTaskNo;
    //         ImprestMemo.Validate("Job  Task");
    //         ImprestMemo.Requestor := employeeNo;
    //         ImprestMemo.Validate(Requestor);
    //         //
    //         if ImprestMemo.Insert(true) then begin
    //             ImprestMemo.Validate("No. of days");
    //             ImprestMemo.Requestor := employeeNo;
    //             ImprestMemo.Validate(Requestor);
    //             ImprestMemo.Validate("Shortcut Dimension 2 Code", fundCode);
    //             ImprestMemo.Modify(true);
    //             //try updating the blob field
    //             ImprestMemo.CalcFields(Objective);
    //             ImprestMemo.Rec.Objective.CreateInstream(LegInstr);
    //             Leg.Read(LegInstr);
    //             LegText := objective;
    //             if LegText <> Format(Leg) then begin
    //                 Clear(ImprestMemo.Objective);
    //                 Clear(Leg);
    //                 Leg.AddText(LegText);
    //                 ImprestMemo.Rec.Objective.CreateOutstream(LegOutStr);
    //                 Leg.Write(LegOutStr);
    //                 ImprestMemo.Modify;
    //             end;

    //             status := 'success*Your imprest requisition was successfully created*' + ImprestMemo."No.";
    //         end else begin
    //             status := 'danger*Your imprest requisition could not be created';
    //         end;
    //     end else begin
    //         ImprestMemo.Reset;
    //         ImprestMemo.SetRange(Requestor, employeeNo);
    //         ImprestMemo.SetRange("No.", imprestNo);
    //         ImprestMemo.SetRange("Document Type", ImprestMemo."document type"::"Imprest Memo");
    //         ImprestMemo.SetRange(Status, ImprestMemo.Status::Open);
    //         if ImprestMemo.FindSet then begin
    //             ImprestMemo."Document Type" := ImprestMemo."document type"::"Imprest Memo";
    //             ImprestMemo.Subject := subject;
    //             ImprestMemo.Validate(Subject);
    //             //ImprestMemo.Objective:= objective;
    //             ImprestMemo."Imprest Naration" := destinationNarration;
    //             ImprestMemo.Validate("Imprest Naration");
    //             ImprestMemo."Start Date" := travelDate;
    //             ImprestMemo.Validate("Start Date");
    //             ImprestMemo."No. of days" := numberOfDays;
    //             //ImprestMemo.VALIDATE("No. of days");
    //             ImprestMemo.Job := job;
    //             ImprestMemo.Validate(Job);
    //             ImprestMemo."Job  Task" := jobTaskNo;
    //             ImprestMemo.Validate("Job  Task");
    //             ImprestMemo.Requestor := employeeNo;
    //             ImprestMemo.Validate(Requestor);
    //             if ImprestMemo.Modify(true) then begin
    //                 ImprestMemo.Validate("No. of days");
    //                 ImprestMemo.Requestor := employeeNo;
    //                 ImprestMemo.Validate(Requestor);
    //                 ImprestMemo.Validate("Shortcut Dimension 2 Code", fundCode);
    //                 ImprestMemo.Modify(true);
    //                 //try updating the blob field
    //                 ImprestMemo.CalcFields(Objective);
    //                 ImprestMemo.Rec.Objective.CreateInstream(LegInstr);
    //                 Leg.Read(LegInstr);
    //                 LegText := objective;
    //                 if LegText <> Format(Leg) then begin
    //                     Clear(ImprestMemo.Objective);
    //                     Clear(Leg);
    //                     Leg.AddText(LegText);
    //                     ImprestMemo.Rec.Objective.CreateOutstream(LegOutStr);
    //                     Leg.Write(LegOutStr);
    //                     ImprestMemo.Modify;
    //                 end;

    //                 status := 'success*Your imprest requisition was successfully created*' + ImprestMemo."No.";
    //             end else begin
    //                 status := 'danger*Your imprest requisition could not be created';
    //             end;

    //         end else begin
    //             status := 'danger*You are not the requester of the specified imprest memo. Please create a new imprest memo';
    //         end;


    //     end;


    //     exit(status);
    // end;



    procedure imprestGeneralDetails(employeeNo: Code[50]; imprestNo: Code[20]; subject: Text; objective: Text; destinationNarration: Text; travelDate: Date; numberOfDays: Decimal; job: Code[50]; jobTaskNo: Code[50]; fundCode: Code[100]) status: Text
    var
        ImprestMemo: Record "Imprest Memo";
        LegInstr: InStream;
        LegOutStr: OutStream;
        Leg: BigText;
        LegText: Text;
    begin
        status := 'danger*Your imprest requisition could not be captured';

        if imprestNo = '' then begin
            // Creating a new imprest memo
            ImprestMemo.Init;
            ImprestMemo."Document Type" := ImprestMemo."document type"::"Imprest Memo";
            ImprestMemo.Subject := subject;
            ImprestMemo.Validate(Subject);
            ImprestMemo."Imprest Naration" := destinationNarration;
            ImprestMemo.Validate("Imprest Naration");
            ImprestMemo."Start Date" := travelDate;
            ImprestMemo.Validate("Start Date");
            ImprestMemo."No. of days" := numberOfDays;
            ImprestMemo.Job := job;
            ImprestMemo.Validate(Job);
            ImprestMemo."Job  Task" := jobTaskNo;
            ImprestMemo.Validate("Job  Task");
            ImprestMemo.Requestor := employeeNo;
            ImprestMemo.Validate(Requestor);

            if ImprestMemo.Insert(true) then begin
                // Additional validation after insert
                ImprestMemo.Validate("No. of days");
                ImprestMemo.Validate("Shortcut Dimension 2 Code", fundCode);
                ImprestMemo.Modify(true);

                // Handle BLOB field (Objective)
                if objective <> '' then begin
                    ImprestMemo.CalcFields(Objective);
                    ImprestMemo.Objective.CreateInStream(LegInstr);
                    Leg.Read(LegInstr);
                    LegText := objective;

                    if LegText <> Format(Leg) then begin
                        Clear(Leg);
                        Leg.AddText(LegText);
                        ImprestMemo.Objective.CreateOutStream(LegOutStr);
                        Leg.Write(LegOutStr);
                        ImprestMemo.Modify(true);
                    end;
                end;

                status := 'success*Your imprest requisition was successfully created*' + ImprestMemo."No.";
            end else begin
                status := 'danger*Your imprest requisition could not be created';
            end;

        end else begin
            // Updating an existing imprest memo
            ImprestMemo.Reset;
            ImprestMemo.SetRange(Requestor, employeeNo);
            ImprestMemo.SetRange("No.", imprestNo);
            ImprestMemo.SetRange("Document Type", ImprestMemo."document type"::"Imprest Memo");
            ImprestMemo.SetRange(Status, ImprestMemo.Status::Open);

            if ImprestMemo.FindSet() then begin
                repeat
                    ImprestMemo."Document Type" := ImprestMemo."document type"::"Imprest Memo";
                    ImprestMemo.Subject := subject;
                    ImprestMemo.Validate(Subject);
                    ImprestMemo."Imprest Naration" := destinationNarration;
                    ImprestMemo.Validate("Imprest Naration");
                    ImprestMemo."Start Date" := travelDate;
                    ImprestMemo.Validate("Start Date");
                    ImprestMemo."No. of days" := numberOfDays;
                    ImprestMemo.Job := job;
                    ImprestMemo.Validate(Job);
                    ImprestMemo."Job  Task" := jobTaskNo;
                    ImprestMemo.Validate("Job  Task");
                    ImprestMemo.Requestor := employeeNo;
                    ImprestMemo.Validate(Requestor);

                    if ImprestMemo.Modify(true) then begin
                        ImprestMemo.Validate("No. of days");
                        ImprestMemo.Validate("Shortcut Dimension 2 Code", fundCode);
                        ImprestMemo.Modify(true);

                        // Handle BLOB field (Objective)
                        if objective <> '' then begin
                            ImprestMemo.CalcFields(Objective);
                            ImprestMemo.Objective.CreateInStream(LegInstr);
                            Leg.Read(LegInstr);
                            LegText := objective;

                            if LegText <> Format(Leg) then begin
                                Clear(Leg);
                                Leg.AddText(LegText);
                                ImprestMemo.Objective.CreateOutStream(LegOutStr);
                                Leg.Write(LegOutStr);
                                ImprestMemo.Modify(true);
                            end;
                        end;

                        status := 'success*Your imprest requisition was successfully updated*' + ImprestMemo."No.";
                    end else begin
                        status := 'danger*Your imprest requisition could not be updated';
                    end;
                until ImprestMemo.Next() = 0;

            end else begin
                status := 'danger*You are not the requester of the specified imprest memo. Please create a new imprest memo';
            end;
        end;

        exit(status);
    end;

    // procedure getImprestObjective(imprestNo: Code[50]; employeeNo: Code[50]) objective: Text
    // begin
    //     objective := '';
    //     ImprestMemo.Reset;
    //     ImprestMemo.SetRange("No.", imprestNo);
    //     ImprestMemo.SetRange(Requestor, employeeNo);
    //     if ImprestMemo.FindSet then begin
    //         ImprestMemo.CalcFields(Objective);
    //         ImprestMemo.Rec.Objective.CreateInstream(LegInstr);
    //         Leg.Read(LegInstr);
    //         LegText := Format(Leg);

    //         //Convert Project Legectives from BLOB to TXT
    //         ImprestMemo.CalcFields(Objective);
    //         ImprestMemo.Rec.Objective.CreateInstream(LegInstr);
    //         Leg.Read(LegInstr);

    //         if LegText <> Format(obj) then begin
    //             Clear(ImprestMemo.Objective);
    //             Clear(Leg);
    //             Leg.AddText(LegText);
    //             ImprestMemo.Rec.Objective.CreateOutstream(LegOutStr);
    //             Leg.Write(LegOutStr);
    //         end;
    //         objective := Format(Leg);
    //     end;
    //     exit(objective);
    // end;

    procedure getImprestObjective(imprestNo: Code[50]; employeeNo: Code[50]) objective: Text
    begin
        objective := '';
        ImprestMemo.Reset;
        ImprestMemo.SetRange("No.", imprestNo);
        ImprestMemo.SetRange(Requestor, employeeNo);

        if ImprestMemo.FindSet then begin
            ImprestMemo.CalcFields(Objective);
            ImprestMemo.Objective.CreateInstream(LegInstr);
            Leg.Read(LegInstr);
            objective := Format(Leg);
        end;

        exit(objective);
    end;

    procedure addTeamMember(employeeNo: Code[50]; imprestNo: Code[50]; destinationTown: Text; voteItem: Text; teamMember: Text; noOfDays: Decimal) status: Text
    var
        ProjectMembers: Record "Project Members";
    begin
        status := 'danger*The team member could not be added';
        ImprestMemo.Reset;
        ImprestMemo.SetRange(Requestor, employeeNo);
        ImprestMemo.SetRange("No.", imprestNo);
        ImprestMemo.SetRange(Status, ImprestMemo.Status::Open);
        if ImprestMemo.FindSet then begin
            ProjectMembers.Reset;
            ProjectMembers.SetRange("No.", teamMember);
            ProjectMembers.SetRange("Imprest Memo No.", imprestNo);
            ProjectMembers.SetRange("Work Type", destinationTown);
            if ProjectMembers.FindSet then begin
                status := 'danger*The given team member has already been added to the selected imprest';
            end else begin
                ProjectMembers.Init;
                ProjectMembers.Type := ProjectMembers.Type::Person;
                ProjectMembers."Imprest Memo No." := imprestNo;
                ProjectMembers."Work Type" := destinationTown;
                ProjectMembers.Validate("Work Type");
                ProjectMembers."Type of Expense" := voteItem;
                ProjectMembers.Validate("Type of Expense");
                ProjectMembers."No." := teamMember;
                ProjectMembers.Validate("No.");
                ProjectMembers."Time Period" := noOfDays;
                ProjectMembers.Validate("Time Period");
                if ProjectMembers.Insert(true) then begin
                    status := 'success*The team member was successfully added';
                end else begin
                    status := 'danger*The team member could not be added';
                end;
            end;
        end else begin
            status := 'danger*An imprest with the given number does not exist, you are not the requestor or is no longer open';
        end;
        exit(status);
    end;

    procedure addFuel(employeeNo: Code[50]; imprestNo: Code[50]; workType: Text; resource: Text; mileage: Decimal) status: Text
    var
        ProjectMembers: Record "Project Members";
    begin
        status := 'danger*The fuel could not be added';
        ImprestMemo.Reset;
        ImprestMemo.SetRange(Requestor, employeeNo);
        ImprestMemo.SetRange("No.", imprestNo);
        ImprestMemo.SetRange(Status, ImprestMemo.Status::Open);
        if ImprestMemo.FindSet then begin
            ProjectMembers.Reset;
            ProjectMembers.SetRange("No.", resource);
            ProjectMembers.SetRange("Imprest Memo No.", imprestNo);
            ProjectMembers.SetRange("Work Type", workType);
            if ProjectMembers.FindSet then begin
                status := 'danger*The given fuel has already been added to the selected imprest';
            end else begin
                ProjectMembers.Init;
                ProjectMembers.Type := ProjectMembers.Type::Machine;
                ProjectMembers."Imprest Memo No." := imprestNo;
                ProjectMembers."Work Type" := workType;
                ProjectMembers.Validate("Work Type");
                ProjectMembers.Validate("Type of Expense");
                ProjectMembers."No." := resource;
                ProjectMembers.Validate("No.");
                ProjectMembers."Time Period" := mileage;
                ProjectMembers.Validate("Time Period");
                if ProjectMembers.Insert(true) then begin
                    status := 'success*The fuel was successfully added';
                end else begin
                    status := 'danger*The fuel could not be added';
                end;
            end;
        end else begin
            status := 'danger*An imprest with the given number does not exist, you are not the requestor or is no longer open';
        end;
        exit(status);
    end;

    procedure addCasuals(employeeNo: Code[50]; imprestNo: Code[50]; type: Integer; resource: Text; workType: Text; noRequired: Decimal; noOfDays: Decimal) status: Text
    var
        Casuals: Record Casuals;
    begin
        //Casuals
        status := 'danger*The casual could not be added';

        ImprestMemo.Reset;
        ImprestMemo.SetRange(Requestor, employeeNo);
        ImprestMemo.SetRange("No.", imprestNo);
        ImprestMemo.SetRange(Status, ImprestMemo.Status::Open);
        if ImprestMemo.FindSet then begin
            Casuals.Reset;
            Casuals.SetRange("Imprest Memo No.", imprestNo);
            Casuals.SetRange(Type, type);
            Casuals.SetRange("Resource No.", resource);
            if Casuals.FindSet then begin
                status := 'danger*The casual has already been added to the selected imprest';
            end else begin
                //imprestNo : Code[50];type : Integer;resource : Text;workType : Text;noRequired : Decimal;noOfDays : Decimal
                Casuals.Init;
                Casuals.Type := type;
                Casuals."Imprest Memo No." := imprestNo;
                Casuals."Resource No." := resource;
                Casuals.Validate("Resource No.");
                Casuals.Validate("Imprest Memo No.");
                Casuals.Validate(Type);

                Casuals."Work Type" := workType;
                Casuals.Validate("Work Type");
                Casuals."No. Required" := noRequired;
                Casuals.Validate("No. Required");
                Casuals."No. of Days" := noOfDays;
                Casuals.Validate("No. of Days");
                if Casuals.Insert(true) then begin
                    status := 'success*The casual was successfully added';
                end else begin
                    status := 'danger*The casual could not be added';
                end;
            end;
        end else begin
            status := 'danger*An imprest with the given number does not exist, you are not the requestor or is no longer open';
        end;
        exit(status);
    end;

    procedure addOtherCosts(employeeNo: Code[50]; imprestNo: Code[50]; voteItem: Text; requiredFor: Text; quantityRequired: Decimal; noOfDays: Decimal; unitCost: Decimal) status: Text
    var
        OtherCosts: Record "Other Costs";
    begin
        //Casuals
        status := 'danger*The cost could not be added';

        ImprestMemo.Reset;
        ImprestMemo.SetRange(Requestor, employeeNo);
        ImprestMemo.SetRange("No.", imprestNo);
        ImprestMemo.SetRange(Status, ImprestMemo.Status::Open);
        if ImprestMemo.FindSet then begin

            // voteItem : Text;requiredFor : Text;quantityRequired : Decimal;noOfDays : Decimal;unitCost : Decimal
            OtherCosts.Init;
            OtherCosts."Line No." := getLineNo(imprestNo);
            ;
            OtherCosts."Imprest Memo No." := imprestNo;
            OtherCosts.Validate("Imprest Memo No.");
            OtherCosts."Type of Expense" := voteItem;
            OtherCosts.Validate("Type of Expense");
            OtherCosts."Required For" := requiredFor;
            OtherCosts.Validate("Required For");
            OtherCosts."Quantity Required" := quantityRequired;
            OtherCosts.Validate("Quantity Required");
            OtherCosts."No. of Days" := noOfDays;
            OtherCosts.Validate("No. of Days");
            OtherCosts."Unit Cost" := unitCost;
            OtherCosts.Validate("Unit Cost");
            if OtherCosts.Insert(true) then begin
                status := 'success*The cost was successfully added';
            end else begin
                status := 'danger*The cost could not be added';
            end;

        end else begin
            status := 'danger*An imprest with the given number does not exist, you are not the requestor or is no longer open';
        end;
        exit(status);
    end;

    local procedure getLineNo(imprestNo: Code[50]): Integer
    var
        OtherCosts: Record "Other Costs";
        lineNo: Integer;
    begin
        lineNo := 0;
        OtherCosts.Reset;
        OtherCosts.SetRange("Imprest Memo No.", imprestNo);
        if OtherCosts.FindSet then begin
            repeat
                if OtherCosts."Line No." > lineNo then begin
                    lineNo := OtherCosts."Line No.";
                end;
            until OtherCosts.Next = 0;
        end;
        exit(lineNo + 1000);
    end;

    procedure sendImprestMemoApproval(employeeNo: Code[50]; imprestNo: Code[50]) status: Text
    var
        TEXT012: label 'The Requestor Must Be Part Of the Project  Team on The Memo';
        ProjectTeam: Record "Project Members";
        ImprestMemo1: Record "Imprest Memo";
    begin
        status := 'danger*The imprest memo could not be sent for approval';

        ImprestMemo.Reset;
        ImprestMemo.SetRange(Requestor, employeeNo);
        ImprestMemo.SetRange("No.", imprestNo);
        ImprestMemo.SetRange(Status, ImprestMemo.Status::Open);
        if ImprestMemo.FindSet then begin

            ImprestMemo.TestField(Status, ImprestMemo.Status::Open);//status must be open.
                                                                    //TESTFIELD("User ID",USERID); //control so that only the initiator of the document can send for approval
            ImprestMemo.TestField(Objective);
            ImprestMemo.TestField(Subject);
            ImprestMemo.TestField(Date);
            ImprestMemo.TestField("Imprest Naration");
            //IF "Vote Amount"<"Total Subsistence Allowance" THEN
            //ERROR('Budgeted Amount is less than the Amount requested');

            //check if the requester is part of the team
            ProjectTeam.Reset;
            ProjectTeam.SetRange(ProjectTeam."No.", ImprestMemo.Requestor);
            if ProjectTeam.FindFirst = false then
                Error(TEXT012);

            //cc//if ApprovalsMgmt.CheckImpMemoApprovalsWorkflowEnabled(ImprestMemo) then
            //cc//ApprovalsMgmt.OnSendImpMemoForApproval(ImprestMemo);

            ImprestMemo1.Reset;
            ImprestMemo1.SetRange(Requestor, employeeNo);
            ImprestMemo1.SetRange("No.", imprestNo);
            if ImprestMemo1.FindSet then begin
                if ImprestMemo1.Status = ImprestMemo1.Status::"Pending Approval" then begin
                    status := 'success*The imprest memo was successfully sent for approval';
                end;
            end;

        end else begin
            status := 'danger*An imprest with the given number does not exist, you are not the requestor or is no longer open';
        end;
        exit(status);
    end;

    procedure createImprestSurrender(employeeNo: Code[50]; imprestNo: Code[50]; SurrenderNo: Code[50]) status: Text
    begin
        status := 'danger*Your imprest surrender could not be captured';
        if SurrenderNo = '' then begin //new imprest surrender
            Payments.Init;
            Payments."Document Type" := Payments."document type"::Surrender;
            Payments.Validate("Document Type");
            Payments."Payment Type" := Payments."payment type"::Surrender;
            Payments.Validate("Payment Type");
            Payments."Account Type" := Payments."account type"::Employee;
            Payments.Validate("Account Type");
            Payments."Account No." := employeeNo;
            Payments.Validate("Account No.");
            Payments."Imprest Issue Doc. No" := imprestNo;
            Payments.Validate("Imprest Issue Doc. No");
            if Payments.Insert(true) then begin
                Payments.Validate("Imprest Issue Doc. No");
                Payments.Modify(true);
                status := 'success*Your imprest surrender was successfully captured*' + Payments."No.";
            end else begin
                status := 'danger*Your imprest surrender could not be captured';
            end;

        end else begin //existing
            Payments.Reset;
            Payments.SetRange("No.", SurrenderNo);
            Payments.SetRange("Account No.", employeeNo);
            Payments.SetRange(Status, Payments.Status::Open);
            if Payments.FindSet then begin
                if not (Payments."Imprest Issue Doc. No" = imprestNo) then begin
                    Payments."Imprest Issue Doc. No" := imprestNo;
                    Payments.Validate("Imprest Issue Doc. No");
                    if Payments.Modify(true) then begin
                        status := 'success*Your imprest surrender was successfully updated';
                    end else begin
                        status := 'danger*Your imprest surrender could not be updated';
                    end;
                end else begin
                    status := 'success*No changes to be done';
                end;
            end else begin
                status := 'danger*An imprest surrender with the given number does not exist, you are not the owner or is no longer open';
            end;

        end;
        exit(status);
    end;

    procedure sendImprestSurrenderApproval(employeeNo: Code[50]; imprestSurrenderNo: Code[50]) status: Text
    var
        TEXT012: label 'The Requestor Must Be Part Of the Project  Team on The Memo';
        ProjectTeam: Record "Project Members";
        ImprestMemo1: Record "Imprest Memo";
    begin
        status := 'danger*The imprest surrender could not be sent for approval';

        Payments.Reset;
        Payments.SetRange("Account No.", employeeNo);
        Payments.SetRange("No.", imprestSurrenderNo);
        Payments.SetRange(Status, Payments.Status::Open);
        Payments.SetRange("Payment Type", Payments."payment type"::Surrender);
        Payments.SetRange("Document Type", Payments."document type"::Surrender);
        if Payments.FindSet then begin
            Payments.TestField("Shortcut Dimension 1 Code");
            Payments.TestField("Shortcut Dimension 2 Code");
            //TESTFIELD("Shortcut Dimension 3 Code");
            Payments.TestField("Imprest Issue Doc. No");
            //cc//if ApprovalsMgmt.CheckPaymentsApprovalsWorkflowEnabled(Payments) then
            //cc//ApprovalsMgmt.OnSendPaymentsForApproval(Payments);
            if Payments1.Get(Payments."Imprest Issue Doc. No") then begin
                Payments1.Selected := true;
                Payments1.Modify;
            end;
            if Payments2.Get(imprestSurrenderNo) then begin
                if Payments2.Status = Payments2.Status::"Pending Approval" then begin
                    status := 'success*The imprest Surrender was successfully sent for approval';
                end;
            end;
        end else begin
            status := 'danger*An imprest surrender with the given number does not exist, you are not the requestor or is no longer open';
        end;
        exit(status);
    end;

    procedure updateSurrenderLine(employeeNo: Code[50]; imprestSurrenderNo: Code[50]; lineNo: Integer; amountSpent: Decimal; receipt: Text) status: Text
    var
        ImprestLines: Record "Imprest Lines";
    begin
        status := 'danger*The imprest line could not be updated';
        Payments.Reset;
        Payments.SetRange("Account No.", employeeNo);
        Payments.SetRange("No.", imprestSurrenderNo);
        Payments.SetRange(Status, Payments.Status::Open);
        Payments.SetRange("Payment Type", Payments."payment type"::Surrender);
        Payments.SetRange("Document Type", Payments."document type"::Surrender);
        if Payments.FindSet then begin
            ImprestLines.Reset;
            ImprestLines.SetRange(No, imprestSurrenderNo);
            ImprestLines.SetRange("Line No", lineNo);
            if ImprestLines.FindSet then begin

                ImprestLines.Validate("Actual Spent", amountSpent);
                ImprestLines.Validate("Receipt No.", receipt);
                if ImprestLines.Modify(true) then begin
                    status := 'success*The imprest line was successfully updated';//+FORMAT(lineNo);
                end else begin
                    status := 'danger*The imprest line could not be updated';
                end;
            end else begin
                status := 'danger*The imprest line does not exist' + Format(lineNo);
            end;
        end else begin
            status := 'danger*An imprest surrender with the given number does not exist, you are not the requestor or is no longer open';
        end;
        exit(status);
    end;

    procedure createPurchaseStoreRequisition(employeeNo: Code[50]; requisitionNo: Code[50]; location: Code[50]; description: Text; type: Integer; fundCode: Code[100]; jobNo: Text; jobTask: Text) status: Text
    var
        myType: Text;
    begin
        myType := 'Store Requisition';
        if type = 0 then
            myType := 'Purchase Requisition';
        status := 'danger*Your ' + myType + ' could not be captured';
        if requisitionNo = '' then begin //new  requisition
            PurchaseHeader.Init;
            PurchaseHeader."Document Type" := PurchaseHeader."document type"::"Store Requisition";
            if type = 0 then
                PurchaseHeader."Document Type" := PurchaseHeader."document type"::"Purchase Requisition";
            PurchaseHeader.Validate("Document Type");
            if type = 0 then begin
                PurchaseHeader."Requisition Type" := PurchaseHeader."requisition type"::Project;
                PurchaseHeader.Validate("Requisition Type");
            end;
            PurchaseHeader."Requester ID" := UserId;
            PurchaseHeader."Request-By No." := employeeNo;
            PurchaseHeader.Validate("Request-By No.");
            PurchaseHeader."Location Code" := location;
            PurchaseHeader.Validate("Location Code");
            PurchaseHeader.Description := description;
            PurchaseHeader.Validate(Description);
            PurchaseHeader.Validate("Order Date", Today);

            if PurchaseHeader.Insert(true) then begin
                //  PurchaseHeader.VALIDATE("Request-By No.", employeeNo);
                // PurchaseHeader.VALIDATE(Description,description);
                PurchaseHeader.Validate("Request-By No.");
                PurchaseHeader.Validate("Location Code", location);
                PurchaseHeader.Validate("Shortcut Dimension 2 Code", fundCode);
                PurchaseHeader.Validate(Job, jobNo);
                PurchaseHeader.Validate("Job Task No.", jobTask);
                PurchaseHeader.Modify(true);
                status := 'success*Your ' + myType + ' was successfully created*' + PurchaseHeader."No.";
            end else begin
                status := 'danger*Your ' + myType + ' could not be captured';
            end;

        end else begin //existing
            PurchaseHeader.Reset;
            if type = 0 then begin
                PurchaseHeader.SetRange("Document Type", PurchaseHeader."document type"::"Purchase Requisition");
            end else begin
                PurchaseHeader.SetRange("Document Type", PurchaseHeader."document type"::"Store Requisition");
            end;
            PurchaseHeader.SetRange("Request-By No.", employeeNo);
            PurchaseHeader.SetRange(Status, PurchaseHeader.Status::Open);
            PurchaseHeader.SetRange("No.", requisitionNo);
            if PurchaseHeader.FindSet then begin

                PurchaseHeader.Validate("Request-By No.");
                PurchaseHeader.Validate(Description, description);
                PurchaseHeader.Validate("Location Code", location);
                PurchaseHeader.Validate(Job, jobNo);
                PurchaseHeader.Validate("Job Task No.", jobTask);
                PurchaseHeader.Validate("Shortcut Dimension 2 Code", fundCode);
                if PurchaseHeader.Modify(true) then begin
                    status := 'success*Your ' + myType + ' was successfully updated';
                end else begin
                    status := 'danger*Your ' + myType + ' could not be updated';
                end;

            end else begin
                status := 'danger*A ' + myType + ' with the given number does not exist, you are not the owner or is no longer open' + requisitionNo;
            end;

        end;
        exit(status);
    end;

    procedure createRequisitionLine(employeeNo: Code[250]; requisitionNo: Code[250]; budget: Code[250]; procurementPlan: Code[250]; itemCategory: Code[250]; item: Code[250]; quantity: Decimal; directUnitCost: Decimal) status: Text
    var
        PurchaseLine: Record "Purchase Line";
    begin
        status := 'danger*Your Requisition Line could not be added';
        PurchaseHeader.Reset;
        PurchaseHeader.SetRange("Request-By No.", employeeNo);
        PurchaseHeader.SetRange(Status, PurchaseHeader.Status::Open);
        PurchaseHeader.SetRange("No.", requisitionNo);
        if PurchaseHeader.FindSet then begin
            if (PurchaseHeader."Document Type" = PurchaseHeader."document type"::"Store Requisition") or (PurchaseHeader."Document Type" = PurchaseHeader."document type"::"Purchase Requisition") then begin
                //add line
                PurchaseLine.Init;
                //Document Type,Document No.,Line No.
                if PurchaseHeader."Document Type" = PurchaseHeader."document type"::"Store Requisition" then begin
                    PurchaseLine."Document Type" := PurchaseLine."document type"::"Store Requisition";
                end;
                if PurchaseHeader."Document Type" = PurchaseHeader."document type"::"Purchase Requisition" then begin
                    PurchaseLine."Document Type" := PurchaseLine."document type"::"Purchase Requisition";
                end;
                PurchaseLine."Document No." := requisitionNo;
                PurchaseLine.Validate("Document No.");
                PurchaseLine."Line No." := getPurchaseLineNo(requisitionNo, PurchaseLine."Document Type");
                PurchaseLine.Validate("Line No.");
                PurchaseLine."Procurement Plan" := budget;
                PurchaseLine.Validate("Procurement Plan");
                PurchaseLine."Procurement Plan Item" := procurementPlan;
                PurchaseLine.Validate("Procurement Plan Item");
                PurchaseLine."Item Category" := itemCategory;
                PurchaseLine.Validate("Item Category");
                PurchaseLine."Service/Item Code" := item;
                PurchaseLine.Validate("Service/Item Code");
                PurchaseLine."Qty. Requested" := quantity;
                PurchaseLine.Validate("Qty. Requested");
                PurchaseLine.Validate("Direct Unit Cost", directUnitCost);

                if PurchaseLine.Insert(true) then begin
                    PurchaseLine.Validate("Qty. Requested", quantity);
                    PurchaseLine.Validate("Direct Unit Cost", directUnitCost);
                    PurchaseLine.Validate("Unit Cost", directUnitCost);

                    PurchaseLine.Modify(true);
                    status := 'success*The Requisition Line was successfully added';//+FORMAT(directUnitCost);
                end else begin
                    status := 'danger*Your Requisition Line could not be added';
                end;
            end;
        end else begin
            status := 'danger*A Requisition with the given number does not exist, you are not the owner or is no longer open';
        end;
        exit(status);
    end;

    local procedure getPurchaseLineNo(requisitionNo: Code[50]; requisitionType: Option): Integer
    var
        purchaseLine: Record "Purchase Line";
        lineNo: Integer;
    begin
        lineNo := 0;
        purchaseLine.Reset;
        purchaseLine.SetRange("Document No.", requisitionNo);
        purchaseLine.SetRange("Document Type", requisitionType);
        if purchaseLine.FindSet then begin
            repeat
                if purchaseLine."Line No." > lineNo then begin
                    lineNo := purchaseLine."Line No.";
                end;
            until purchaseLine.Next = 0;
        end;
        exit(lineNo + 1000);
    end;

    procedure sendPurchaseRequisitionApproval(employeeNo: Code[50]; requisitionNo: Code[50]) status: Text
    var
        TEXT012: label 'The Requestor Must Be Part Of the Project  Team on The Memo';
        PurchaseHeader1: Record "Purchase Header";
    begin
        status := 'danger*The Purchase Requisition could not be sent for approval';
        PurchaseHeader.Reset;
        PurchaseHeader.SetRange("Request-By No.", employeeNo);
        PurchaseHeader.SetRange(Status, PurchaseHeader.Status::Open);
        PurchaseHeader.SetRange("No.", requisitionNo);
        PurchaseHeader.SetRange("Document Type", PurchaseHeader."document type"::"Purchase Requisition");
        if PurchaseHeader.FindSet then begin
            PurchaseHeader.TestField("Shortcut Dimension 1 Code");
            PurchaseHeader.TestField("Shortcut Dimension 2 Code");
            PurchaseHeader.TestField(Description);
            //TESTFIELD("Requester ID",USERID);
            PurchaseHeader.CalcFields("Requisition Amount");
            PurchaseHeader.TestField("Requisition Amount");
            //cc//if ApprovalsMgmt.CheckPurchaseApprovalPossible(PurchaseHeader) then
            //cc//ApprovalsMgmt.OnSendPurchaseDocForApproval(PurchaseHeader);

            PurchaseHeader1.Reset;
            PurchaseHeader1.SetRange("Request-By No.", employeeNo);
            PurchaseHeader1.SetRange("No.", requisitionNo);
            PurchaseHeader1.SetRange("Document Type", PurchaseHeader."document type"::"Purchase Requisition");
            if PurchaseHeader1.FindSet then begin
                if PurchaseHeader1.Status = PurchaseHeader1.Status::"Pending Approval" then begin
                    status := 'success*The Purchase Requisition was successfully sent for approval';
                end;
            end;
        end else begin
            status := 'danger*A Purchase Requisition with the given number does not exist, you are not the requestor or is no longer open';
        end;
        exit(status);
    end;

    procedure createFleetRequisition(employeeNo: Code[50]; requisitionNo: Code[50]; from: Text; destination: Text; dateOfTrip: Date; timeOut: DateTime; journeyRoute: Text; noOfDaysRequested: Decimal; purposeOfTrip: Text; comments: Text) status: Text
    var
        TransportRequisition: Record "Transport Requisition";
    begin
        status := 'danger*Your Fleet Requisition could not be created';
        if requisitionNo = '' then begin //a new record
            TransportRequisition.Init;
            TransportRequisition.Commencement := from;
            TransportRequisition.Validate(Commencement);
            TransportRequisition.Destination := destination;
            TransportRequisition.Validate(Destination);
            TransportRequisition."Date of Trip" := dateOfTrip;
            TransportRequisition.Validate("Date of Trip");
            TransportRequisition."Time out" := Dt2Time(timeOut);
            TransportRequisition.Validate("Time out");
            TransportRequisition."Journey Route" := journeyRoute;
            TransportRequisition.Validate("Journey Route");
            TransportRequisition."No of Days Requested" := noOfDaysRequested;
            TransportRequisition.Validate("No of Days Requested");
            TransportRequisition."Purpose of Trip" := purposeOfTrip;
            TransportRequisition.Validate("Purpose of Trip");
            TransportRequisition.Comments := comments;
            TransportRequisition.Validate(Comments);
            TransportRequisition."Employee No" := employeeNo;
            TransportRequisition.Validate("Employee No");
            TransportRequisition."Date of Request" := Today;
            if TransportRequisition.Insert(true) then begin
                status := 'success*Your Fleet Requisition was successfully created*' + TransportRequisition."Transport Requisition No";
            end;

        end else begin //update existing record
            TransportRequisition.Reset;
            TransportRequisition.SetRange("Transport Requisition No", requisitionNo);
            TransportRequisition.SetRange(Status, TransportRequisition.Status::Open);
            TransportRequisition.SetRange("Employee No", employeeNo);
            if TransportRequisition.FindSet then begin
                TransportRequisition.Commencement := from;
                TransportRequisition.Validate(Commencement);
                TransportRequisition.Destination := destination;
                TransportRequisition.Validate(Destination);
                TransportRequisition."Date of Trip" := dateOfTrip;
                TransportRequisition.Validate("Date of Trip");
                TransportRequisition."Time out" := Dt2Time(timeOut);
                TransportRequisition.Validate("Time out");
                TransportRequisition."Journey Route" := journeyRoute;
                TransportRequisition.Validate("Journey Route");
                TransportRequisition."No of Days Requested" := noOfDaysRequested;
                TransportRequisition.Validate("No of Days Requested");
                TransportRequisition."Purpose of Trip" := purposeOfTrip;
                TransportRequisition.Validate("Purpose of Trip");
                TransportRequisition.Comments := comments;
                TransportRequisition.Validate(Comments);
                if TransportRequisition.Modify(true) then begin
                    status := 'success*Your Fleet Requisition was successfully updated';
                end else begin
                    status := 'danger*Your Fleet Requisition could not be updated';
                end;
            end else begin
                status := 'danger*A Fleet Requisition with the given number does not exist, you are not the owner or is no longer open';
            end;

        end;
        //
        exit(status);
    end;

    procedure addFleetRequisitionStaff(employeeNo: Code[50]; requisitionNo: Code[50]; staffNo: Code[50]) status: Text
    var
        TransportRequisition: Record "Transport Requisition";
        TravelRequisitionStaff: Record "Travel Requisition Staff";
    begin
        status := 'danger*The Staff member could not be added to your Fleet Requisition';
        TransportRequisition.Reset;
        TransportRequisition.SetRange("Transport Requisition No", requisitionNo);
        TransportRequisition.SetRange(Status, TransportRequisition.Status::Open);
        if TransportRequisition.FindSet then begin
            TravelRequisitionStaff.Init;
            TravelRequisitionStaff."Req No" := requisitionNo;
            TravelRequisitionStaff.Validate("Req No");
            TravelRequisitionStaff."Employee No" := staffNo;
            TravelRequisitionStaff.Validate("Employee No");
            if TravelRequisitionStaff.Insert(true) then begin
                status := 'success*The Staff member was successfully added to your Fleet Requisition';
            end else begin
                status := 'danger*The Staff member could not be added to your Fleet Requisition';
            end;

        end else begin
            status := 'danger*A Fleet Requisition with the given number does not exist or is no longer open';
        end;
        exit(status);
    end;

    procedure sendFleetRequisitionApproval(employeeNo: Code[50]; requisitionNo: Code[50]) status: Text
    var
        TransportRequisition: Record "Transport Requisition";
    begin
        status := 'danger*The fleet requisition could not be sent for approval';
        TransportRequisition.Reset;
        TransportRequisition.SetRange("Employee No", employeeNo);
        TransportRequisition.SetRange("Transport Requisition No", requisitionNo);
        if TransportRequisition.FindSet then begin
            TransportRequisition.TestField(Status, TransportRequisition.Status::Open);
            TransportRequisition.TestField(Commencement);
            TransportRequisition.TestField(Destination);
            TransportRequisition.TestField("Date of Trip");
            TransportRequisition.TestField("Purpose of Trip");


            //cc//if ApprovalsMgmt.CheckFleetApprovalsWorkflowEnabled(TransportRequisition) then
            //cc//ApprovalsMgmt.OnSendFleetForApproval(TransportRequisition);

        end else begin
            status := 'danger*A fleet requisition with the given number does not exist, is no longer open or you are not the owner';
        end;
        exit(status);
    end;

    procedure removeStaffFromTravelRequisition(employeeNo: Code[50]; requisitionNo: Code[50]; entryNo: Integer) status: Text
    var
        TransportRequisition: Record "Transport Requisition";
        TravelRequisitionStaff: Record "Travel Requisition Staff";
    begin
        //status:='danger*The Staff member could not be removed from your Fleet Requisition';
        TransportRequisition.Reset;
        TransportRequisition.SetRange("Transport Requisition No", requisitionNo);
        TransportRequisition.SetRange(Status, TransportRequisition.Status::Open);
        if TransportRequisition.FindSet then begin
            TravelRequisitionStaff.Reset;
            TravelRequisitionStaff.SetRange(EntryNo, entryNo);
            TravelRequisitionStaff.SetRange("Req No", requisitionNo);
            if TravelRequisitionStaff.FindSet then begin
                if TravelRequisitionStaff.Delete(true) then begin
                    status := 'success*The Staff member was successfully removed from your Fleet Requisition';
                end;

            end;


        end else begin
            // status:='danger*A Fleet Requisition with the given number does not exist or is no longer open';
        end;
        exit(status);
    end;

    procedure removeMemberFromImprestMemo(number: Code[50]; workType: Code[50]; mEmployeeNo: Code[50]; imprestNo: Code[50]) status: Text
    var
        ProjectMembers: Record "Project Members";
    begin
        status := 'danger*The team member could not be removed';
        ImprestMemo.Reset;
        ImprestMemo.SetRange(Requestor, mEmployeeNo);
        ImprestMemo.SetRange("No.", imprestNo);
        ImprestMemo.SetRange(Status, ImprestMemo.Status::Open);
        if ImprestMemo.FindSet then begin
            ProjectMembers.Reset;
            //Imprest Memo No.,No.,Work Type
            ProjectMembers.SetRange("No.", number);
            ProjectMembers.SetRange("Imprest Memo No.", imprestNo);
            ProjectMembers.SetRange("Work Type", workType);
            if ProjectMembers.FindSet then begin
                if ProjectMembers.Delete(true) then begin
                    status := 'success*The team member was successfully removed from the imprest memo';
                end else begin
                    status := 'danger*The team member could not be removed';
                end;
            end else begin
                status := 'danger*The given team member has not been added to the selected imprest';
            end;
        end else begin
            status := 'danger*An imprest with the given number does not exist, you are not the requestor or is no longer open';
        end;
        exit(status);
    end;

    procedure editTeamMember(employeeNo: Code[50]; imprestNo: Code[50]; destinationTown: Text; voteItem: Text; teamMember: Text; noOfDays: Decimal; originalNumber: Code[50]; originalWorkType: Code[50]) status: Text
    var
        ProjectMembers: Record "Project Members";
    begin
        status := 'danger*The team member could not be edited';
        ImprestMemo.Reset;
        ImprestMemo.SetRange(Requestor, employeeNo);
        ImprestMemo.SetRange("No.", imprestNo);
        ImprestMemo.SetRange(Status, ImprestMemo.Status::Open);
        if ImprestMemo.FindSet then begin
            //Imprest Memo No.,No.,Work Type
            ProjectMembers.Reset;
            ProjectMembers.SetRange("No.", originalNumber);
            ProjectMembers.SetRange("Imprest Memo No.", imprestNo);
            ProjectMembers.SetRange("Work Type", originalWorkType);
            if ProjectMembers.FindSet then begin
                ProjectMembers.Type := ProjectMembers.Type::Person;
                ProjectMembers."Imprest Memo No." := imprestNo;
                ProjectMembers."Work Type" := destinationTown;
                ProjectMembers.Validate("Work Type");
                ProjectMembers."Type of Expense" := voteItem;
                ProjectMembers.Validate("Type of Expense");
                ProjectMembers."No." := teamMember;
                ProjectMembers.Validate("No.");
                ProjectMembers."Time Period" := noOfDays;
                if ProjectMembers.Modify(true) then begin
                    status := 'success*The team member was successfully edited';
                end else begin
                    status := 'danger*The team member could not be edited';
                end;

            end else begin
                status := 'danger*The given team member has not been added to the selected imprest' + originalWorkType;
            end;
        end else begin
            status := 'danger*An imprest with the given number does not exist, you are not the requestor or is no longer open';
        end;
        exit(status);
    end;

    procedure removeFuelFromImprestMemo(number: Code[50]; workType: Code[50]; mEmployeeNo: Code[50]; imprestNo: Code[50]) status: Text
    var
        ProjectMembers: Record "Project Members";
    begin
        status := 'danger*The fuel could not be removed';
        ImprestMemo.Reset;
        ImprestMemo.SetRange(Requestor, mEmployeeNo);
        ImprestMemo.SetRange("No.", imprestNo);
        ImprestMemo.SetRange(Status, ImprestMemo.Status::Open);
        if ImprestMemo.FindSet then begin

            ProjectMembers.Reset;
            ProjectMembers.SetRange("No.", number);
            ProjectMembers.SetRange("Imprest Memo No.", imprestNo);
            ProjectMembers.SetRange("Work Type", workType);
            if ProjectMembers.FindSet then begin
                if ProjectMembers.Delete(true) then begin
                    status := 'success*The fuel was successfully removed from the imprest memo';
                end else begin
                    status := 'danger*The fuel could not be removed';
                end;
            end else begin
                status := 'danger*The given fuel has not been added to the selected imprest';
            end;
        end else begin
            status := 'danger*An imprest with the given number does not exist, you are not the requestor or is no longer open';
        end;
        exit(status);
    end;

    procedure editFuel(employeeNo: Code[50]; imprestNo: Code[50]; workType: Text; resource: Text; mileage: Decimal; originalNo: Code[50]; originalWorkType: Code[50]) status: Text
    var
        ProjectMembers: Record "Project Members";
    begin
        status := 'danger*The fuel could not be added';
        ImprestMemo.Reset;
        ImprestMemo.SetRange(Requestor, employeeNo);
        ImprestMemo.SetRange("No.", imprestNo);
        ImprestMemo.SetRange(Status, ImprestMemo.Status::Open);
        if ImprestMemo.FindSet then begin
            ProjectMembers.Reset;
            ProjectMembers.SetRange("No.", originalNo);
            ProjectMembers.SetRange("Imprest Memo No.", imprestNo);
            ProjectMembers.SetRange("Work Type", originalWorkType);
            if ProjectMembers.FindSet then begin
                ProjectMembers.Type := ProjectMembers.Type::Machine;
                ProjectMembers."Imprest Memo No." := imprestNo;
                ProjectMembers."Work Type" := workType;
                ProjectMembers.Validate("Work Type");
                ProjectMembers.Validate("Type of Expense");
                ProjectMembers."No." := resource;
                ProjectMembers.Validate("No.");
                ProjectMembers."Time Period" := mileage;
                if ProjectMembers.Modify(true) then begin
                    status := 'success*The fuel was successfully updated';
                end else begin
                    status := 'danger*The fuel could not be added';
                end;

            end else begin
                status := 'danger*The given fuel has not been added to the selected imprest';
            end;
        end else begin
            status := 'danger*An imprest with the given number does not exist, you are not the requestor or is no longer open';
        end;
        exit(status);
    end;

    procedure removeCasuals(employeeNo: Code[50]; imprestNo: Code[50]; resourceType: Text; resourceNo: Code[50]) status: Text
    var
        Casuals: Record Casuals;
    begin
        //Casuals
        status := 'danger*The casual could not be removed';

        ImprestMemo.Reset;
        ImprestMemo.SetRange(Requestor, employeeNo);
        ImprestMemo.SetRange("No.", imprestNo);
        ImprestMemo.SetRange(Status, ImprestMemo.Status::Open);
        if ImprestMemo.FindSet then begin
            Casuals.Reset;
            Casuals.SetRange("Imprest Memo No.", imprestNo);
            if Lowercase(resourceType) = 'skilled' then begin
                Casuals.SetRange(Type, Casuals.Type::Skilled);
            end else begin
                Casuals.SetRange(Type, Casuals.Type::Unskilled);
            end;

            Casuals.SetRange("Resource No.", resourceNo);
            if Casuals.FindSet then begin

                if Casuals.Delete(true) then begin
                    status := 'success*The casual was successfully removed from the imprest';
                end else begin
                    status := 'danger*The casual could not be removed from the imprest';
                end;

            end else begin
                //imprestNo : Code[50];type : Integer;resource : Text;workType : Text;noRequired : Decimal;noOfDays : Decimal
                status := 'danger*The casual has not been added to the selected imprest' + resourceNo;
            end;
        end else begin
            status := 'danger*An imprest with the given number does not exist, you are not the requestor or is no longer open';
        end;
        exit(status);
    end;

    procedure editCasuals(employeeNo: Code[50]; imprestNo: Code[50]; type: Integer; resource: Text; workType: Text; noRequired: Decimal; noOfDays: Decimal; originalResourceType: Code[50]; originalResourceNo: Code[50]) status: Text
    var
        Casuals: Record Casuals;
    begin
        //Casuals
        status := 'danger*The casual could not be edited';

        ImprestMemo.Reset;
        ImprestMemo.SetRange(Requestor, employeeNo);
        ImprestMemo.SetRange("No.", imprestNo);
        ImprestMemo.SetRange(Status, ImprestMemo.Status::Open);
        if ImprestMemo.FindSet then begin
            Casuals.Reset;
            Casuals.SetRange("Imprest Memo No.", imprestNo);
            if Lowercase(originalResourceType) = 'skilled' then begin
                Casuals.SetRange(Type, Casuals.Type::Skilled);
            end else begin
                Casuals.SetRange(Type, Casuals.Type::Unskilled);
            end;
            Casuals.SetRange("Resource No.", originalResourceNo);
            if Casuals.FindSet then begin
                Casuals.Type := type;
                Casuals."Imprest Memo No." := imprestNo;
                Casuals."Resource No." := resource;
                Casuals.Validate("Resource No.");
                Casuals.Validate("Imprest Memo No.");
                Casuals.Validate(Type);

                Casuals."Work Type" := workType;
                Casuals.Validate("Work Type");
                Casuals."No. Required" := noRequired;
                Casuals.Validate("No. Required");
                Casuals."No. of Days" := noOfDays;
                Casuals.Validate("No. of Days");
                if Casuals.Modify(true) then begin
                    status := 'success*The casual was successfully updated';
                end else begin
                    status := 'danger*The casual could not be updated';
                end;
            end else begin
                status := 'danger*The casual has not been added to the selected imprest';

            end;
        end else begin
            status := 'danger*An imprest with the given number does not exist, you are not the requestor or is no longer open';
        end;
        exit(status);
    end;

    procedure removeOtherCosts(imprestNo: Code[50]; employeeNo: Code[50]; lineNo: Integer) status: Text
    var
        OtherCosts: Record "Other Costs";
    begin
        status := 'danger*The cost could not be removed';

        ImprestMemo.Reset;
        ImprestMemo.SetRange(Requestor, employeeNo);
        ImprestMemo.SetRange("No.", imprestNo);
        ImprestMemo.SetRange(Status, ImprestMemo.Status::Open);
        if ImprestMemo.FindSet then begin
            OtherCosts.Reset;
            OtherCosts.SetRange("Line No.", lineNo);
            OtherCosts.SetRange("Imprest Memo No.", imprestNo);
            if OtherCosts.FindSet then begin
                if OtherCosts.Delete(true) then begin
                    status := 'success*The cost was successfully removed';
                end else begin
                    status := 'danger*The cost could not be removed';
                end;
            end else begin
                status := 'danger*The cost does not exists in the selected imprest memo';
            end;

        end else begin
            status := 'danger*An imprest with the given number does not exist, you are not the requestor or is no longer open';
        end;

        exit(status);
    end;

    procedure editOtherCosts(employeeNo: Code[50]; imprestNo: Code[50]; voteItem: Text; requiredFor: Text; quantityRequired: Decimal; noOfDays: Decimal; unitCost: Decimal; originalLineNo: Integer) status: Text
    var
        OtherCosts: Record "Other Costs";
    begin
        //Casuals
        status := 'danger*The cost could not be updated';

        ImprestMemo.Reset;
        ImprestMemo.SetRange(Requestor, employeeNo);
        ImprestMemo.SetRange("No.", imprestNo);
        ImprestMemo.SetRange(Status, ImprestMemo.Status::Open);
        if ImprestMemo.FindSet then begin
            OtherCosts.Reset;
            OtherCosts.SetRange("Imprest Memo No.", imprestNo);
            OtherCosts.SetRange("Line No.", originalLineNo);
            if OtherCosts.FindSet then begin
                OtherCosts."Imprest Memo No." := imprestNo;
                OtherCosts.Validate("Imprest Memo No.");
                OtherCosts."Type of Expense" := voteItem;
                OtherCosts.Validate("Type of Expense");
                OtherCosts."Required For" := requiredFor;
                OtherCosts.Validate("Required For");
                OtherCosts."Quantity Required" := quantityRequired;
                OtherCosts.Validate("Quantity Required");
                OtherCosts."No. of Days" := noOfDays;
                OtherCosts.Validate("No. of Days");
                OtherCosts."Unit Cost" := unitCost;
                OtherCosts.Validate("Unit Cost");
                if OtherCosts.Modify(true) then begin
                    status := 'success*The cost was successfully updated';
                end else begin
                    status := 'danger*The cost could not be updated';
                end;
            end else begin
                status := 'danger*The cost has not been added to the selected imprest memo';
            end;
        end else begin
            status := 'danger*An imprest with the given number does not exist, you are not the requestor or is no longer open';
        end;
        exit(status);
    end;

    procedure generateLeaveForm(employeeNo: Code[50]; leaveNo: Code[50]) status: Text
    var
        leaveFileName: Text;
    begin
        status := 'danger*The leave form could not be generated';
        leaveApplications.Reset;
        leaveApplications.SetRange("Application Code", leaveNo);
        leaveApplications.SetRange("Employee No", employeeNo);
        if leaveApplications.FindSet then begin
            leaveFileName := FILESPATH + 'leave' + leaveNo + '.pdf';
            //MUGA
            // if FILE.Exists(leaveFileName) then begin
            //     FILE.Erase(leaveFileName);
            // end;
            // Report.SaveAsPdf(69005, leaveFileName, leaveApplications);
            // if FILE.Exists(leaveFileName) then begin
            //     status := 'success*' + 'Downloads\leave' + leaveNo + '.pdf';
            // end;
        end else begin
            status := 'danger*The leave does not exist or you are not the requester';
        end;
        exit(status);
    end;

    procedure sendRecordForApproval(employeeNo: Code[50]; recordNo: Code[50]; recordType: Text) status: Text
    var
        HRLeaveApplication1: Record "HR Leave Application";
    begin
        status := 'danger*The record could not be sent for approval';
        recordType := Lowercase(recordType);
        if recordType = 'leave' then begin
            status := 'danger*The leave could not be sent for approval';
            leaveApplications.Reset;
            leaveApplications.SetRange("Application Code", recordNo);
            leaveApplications.SetRange("Employee No", employeeNo);
            if leaveApplications.FindSet then begin
                //cc//if ApprovalsMgmt.CheckLeaveAppApprovalsWorkflowEnabled(leaveApplications) then
                //cc//ApprovalsMgmt.OnSendLeaveAppForApproval(leaveApplications);
                if HRLeaveApplication1.Get(leaveApplications."Application Code") then begin
                    if HRLeaveApplication1.Status = HRLeaveApplication1.Status::Open then begin
                        status := 'warning*Your leave application  could not be sent for approval';
                    end else begin
                        status := 'success*Your leave application was successfully  sent for approval';
                    end;
                end;
            end else begin
                status := 'danger*The leave does not exist or you are not the requester';
            end;
        end;
        exit(status);
    end;

    procedure cancelRecordApproval(employeeNo: Code[50]; recordNo: Code[50]; recordType: Text) status: Text
    var
        HRLeaveApplication1: Record "HR Leave Application";
        ImprestMemo1: Record "Imprest Memo";
        Payments2: Record Payments;
        ImprestHeader: Record Payments;
        PurchaseHeader1: Record "Purchase Header";
        TransportRequisition: Record "Transport Requisition";
        TransportRequisition1: Record "Transport Requisition";
    begin
        status := 'danger*The record approval could not be cancelled';
        recordType := Lowercase(recordType);
        if recordType = 'leave' then begin
            status := 'danger*The leave approval could not be cancelled';
            leaveApplications.Reset;
            leaveApplications.SetRange("Application Code", recordNo);
            leaveApplications.SetRange("Employee No", employeeNo);
            if leaveApplications.FindSet then begin
                ////cc//if ApprovalsMgmt.CheckLeaveAppApprovalsWorkflowEnabled(leaveApplications) THEN
                //ApprovalsMgmt.OnCancelLeaveAppApprovalRequest(leaveApplications);
                if HRLeaveApplication1.Get(leaveApplications."Application Code") then begin
                    if HRLeaveApplication1.Status = leaveApplications.Status then begin
                        status := 'warning*Your leave application  approval could not be cancelled';
                    end else begin
                        status := 'success*Your leave application approval was successfully cancelled';
                    end;
                end;
            end else begin
                status := 'danger*The leave does not exist or you are not the requester';

            end;
        end else if recordType = 'imprest memo' then begin
            status := 'danger*The imprest memo approval could not be cancelled';

            ImprestMemo.Reset;
            ImprestMemo.SetRange(Requestor, employeeNo);
            ImprestMemo.SetRange("No.", recordNo);
            ImprestMemo.SetRange(Status, ImprestMemo.Status::"Pending Approval");
            if ImprestMemo.FindSet then begin

                //ApprovalsMgmt.OnCancelImpMemoApprovalRequest(ImprestMemo);

                ImprestMemo1.Reset;
                ImprestMemo1.SetRange(Requestor, employeeNo);
                ImprestMemo1.SetRange("No.", recordNo);
                if ImprestMemo1.FindSet then begin
                    if not (ImprestMemo1.Status = ImprestMemo1.Status::"Pending Approval") then begin
                        status := 'success*The imprest memo approval was successfully cancelled';
                    end;
                end;

            end else begin
                status := 'danger*An imprest with the given number does not exist, you are not the requestor or has not been sent for approval';
            end;
            exit(status);
        end else if recordType = 'imprest surrender' then begin
            status := 'danger*The imprest surrender could not be sent for approval';

            Payments.Reset;
            Payments.SetRange("Account No.", employeeNo);
            Payments.SetRange("No.", recordNo);
            Payments.SetRange(Status, Payments.Status::"Pending Approval");
            Payments.SetRange("Payment Type", Payments."payment type"::Surrender);
            Payments.SetRange("Document Type", Payments."document type"::Surrender);
            if Payments.FindSet then begin
                //ApprovalsMgmt.OnCancelPaymentsApprovalRequest(Payments);

                if Payments2.Get(recordNo) then begin
                    if not (Payments2.Status = Payments2.Status::"Pending Approval") then begin
                        status := 'success*The imprest Surrender approval was successfully cancelled';
                        if ImprestHeader.Get(Payments2."Imprest Issue Doc. No") then begin
                            ImprestHeader.Selected := false;
                            ImprestHeader.Modify;
                        end;
                    end;
                end;
            end else begin
                status := 'danger*An imprest surrender with the given number does not exist, you are not the requestor or has not been sent for approval';
            end;
            exit(status);
        end else if recordType = 'purchase requisition' then begin
            status := 'danger*The Purchase Requisition approval could not be cancelled';
            PurchaseHeader.Reset;
            PurchaseHeader.SetRange("Request-By No.", employeeNo);
            PurchaseHeader.SetRange(Status, PurchaseHeader.Status::"Pending Approval");
            PurchaseHeader.SetRange("No.", recordNo);
            PurchaseHeader.SetRange("Document Type", PurchaseHeader."document type"::"Purchase Requisition");
            if PurchaseHeader.FindSet then begin

                //ApprovalsMgmt.OnCancelPurchaseApprovalRequest(PurchaseHeader);

                PurchaseHeader1.Reset;
                PurchaseHeader1.SetRange("Request-By No.", employeeNo);
                PurchaseHeader1.SetRange("No.", recordNo);
                PurchaseHeader1.SetRange("Document Type", PurchaseHeader."document type"::"Purchase Requisition");
                if PurchaseHeader1.FindSet then begin
                    if not (PurchaseHeader1.Status = PurchaseHeader1.Status::"Pending Approval") then begin
                        status := 'success*The Purchase Requisition approval was successfully cancelled';
                    end;
                end;
            end else begin
                status := 'danger*A Purchase Requisition with the given number does not exist, you are not the requestor or has not been sent for approval';
            end;
        end else if recordType = 'store requisition' then begin
            status := 'danger*The Store Requisition approval could not be cancelled';
            PurchaseHeader.Reset;
            PurchaseHeader.SetRange("Request-By No.", employeeNo);
            PurchaseHeader.SetRange(Status, PurchaseHeader.Status::"Pending Approval");
            PurchaseHeader.SetRange("No.", recordNo);
            PurchaseHeader.SetRange("Document Type", PurchaseHeader."document type"::"Store Requisition");
            if PurchaseHeader.FindSet then begin

                //ApprovalsMgmt.OnCancelPurchaseApprovalRequest(PurchaseHeader);

                PurchaseHeader1.Reset;
                PurchaseHeader1.SetRange("Request-By No.", employeeNo);
                PurchaseHeader1.SetRange("No.", recordNo);
                PurchaseHeader1.SetRange("Document Type", PurchaseHeader."document type"::"Store Requisition");
                if PurchaseHeader1.FindSet then begin
                    if not (PurchaseHeader1.Status = PurchaseHeader1.Status::"Pending Approval") then begin
                        status := 'success*The Store Requisition approval was successfully cancelled';
                    end;
                end;
            end else begin
                status := 'danger*A Store Requisition with the given number does not exist, you are not the requestor or has not been sent for approval';
            end;
        end else if recordType = 'transport requisition' then begin
            status := 'danger*The fleet requisition approval could not be cancelled';
            TransportRequisition.Reset;
            TransportRequisition.SetRange("Employee No", employeeNo);
            TransportRequisition.SetRange("Transport Requisition No", recordNo);
            if TransportRequisition.FindSet then begin
                TransportRequisition.TestField(Status, TransportRequisition.Status::"Pending Approval");
                //ApprovalsMgmt.OnCancelFleetApprovalRequest(TransportRequisition);
                if TransportRequisition1.Get(recordNo) then begin
                    if not (TransportRequisition1.Status = TransportRequisition1.Status::"Pending Approval") then begin
                        status := 'success*The fleet requisition approval was successfully cancelled';
                    end;
                end;
            end else begin
                status := 'danger*A fleet requisition with the given number does not exist, has not been sent for approval or you are not the owner';
            end;
        end else if recordType = 'staff claim' then begin
            status := 'danger*The Staff claim approval could not be cancelled';

            Payments.Reset;
            Payments.SetRange("Account No.", employeeNo);
            Payments.SetRange("No.", recordNo);
            Payments.SetRange(Status, Payments.Status::"Pending Approval");
            Payments.SetRange("Payment Type", Payments."payment type"::"Staff Claim");
            Payments.SetRange("Document Type", Payments."document type"::"Staff Claims");
            if Payments.FindSet then begin
                //ApprovalsMgmt.OnCancelPaymentsApprovalRequest(Payments);

                if Payments2.Get(recordNo) then begin
                    if not (Payments2.Status = Payments2.Status::"Pending Approval") then begin
                        status := 'success*The staff claim approval was successfully cancelled';
                    end;
                end;
            end else begin
                status := 'danger*A Staff Claim with the given number does not exist, you are not the requestor or has not been sent for approval';
            end;
        end;
        exit(status);
    end;

    procedure changePassword(employeeNo: Code[50]; currentPassword: Text; newPassword: Text; confirmPassword: Text) status: Text
    var
        HRPortalUsers: Record HRPortalUsers;
    begin
        status := 'danger*Your password could not be changed. Please try again';
        HRPortalUsers.Reset;
        HRPortalUsers.SetRange(employeeNo, employeeNo);
        HRPortalUsers.SetRange(password, currentPassword);
        if HRPortalUsers.FindSet then begin
            if StrLen(newPassword) > 3 then begin
                if newPassword = confirmPassword then begin
                    HRPortalUsers.password := newPassword;
                    HRPortalUsers.changedPassword := true;
                    if HRPortalUsers.Modify(true) then begin
                        status := 'success*Your password was successfully updated';
                    end else begin
                        status := 'danger*Your password could not be changed. Please try again';
                    end;
                end else begin
                    status := 'danger*New Password and confirm new password do not match!!!';
                end;
            end else begin
                status := 'danger*The password you entered as your new password is too short. It should be atleast 4 characters';
            end;
        end else begin
            status := 'danger*The password you entered as your current password is wrong. Please try again';
        end;
        exit(status);
    end;

    procedure deleteRequisitionLine(employeeNo: Code[250]; requisitionNo: Code[250]; lineNo: Integer; documentType: Integer) status: Text
    var
        PurchaseLine: Record "Purchase Line";
    begin
        status := 'danger*Your Requisition Line could not be deleted';
        PurchaseHeader.Reset;
        PurchaseHeader.SetRange("Request-By No.", employeeNo);
        PurchaseHeader.SetRange(Status, PurchaseHeader.Status::Open);
        PurchaseHeader.SetRange("No.", requisitionNo);
        if PurchaseHeader.FindSet then begin
            PurchaseLine.Reset;
            PurchaseLine.SetRange("Document Type", documentType);
            PurchaseLine.SetRange("Document No.", requisitionNo);
            PurchaseLine.SetRange("Line No.", lineNo);
            if PurchaseLine.FindSet then begin
                if PurchaseLine.Delete(true) then begin
                    status := 'success*The Requisition Line was successfully deleted';//+FORMAT(directUnitCost);
                end else begin
                    status := 'danger*Your Requisition Line could not be deleted';
                end;
            end else begin
                status := 'danger*The Requisition Line does not exist' + Format(lineNo);
            end;
        end else begin
            status := 'danger*A Requisition with the given number does not exist, you are not the owner or is no longer open';
        end;
        exit(status);
    end;

    procedure sendStaffClaimApproval(employeeNo: Code[50]; staffClaim: Code[50]) status: Text
    var
        TEXT012: label 'The Requestor Must Be Part Of the Project  Team on The Memo';
        ProjectTeam: Record "Project Members";
        ImprestMemo1: Record "Imprest Memo";
    begin
        status := 'danger*The staff claim could not be sent for approval';

        Payments.Reset;
        Payments.SetRange("Account No.", employeeNo);
        Payments.SetRange("No.", staffClaim);
        Payments.SetRange(Status, Payments.Status::Open);
        Payments.SetRange("Payment Type", Payments."payment type"::"Staff Claim");
        Payments.SetRange("Document Type", Payments."document type"::"Staff Claims");
        if Payments.FindSet then begin
            Payments.TestField("Account No.");
            Payments.TestField("Account Name");
            Payments.TestField("Shortcut Dimension 1 Code");
            Payments.TestField(Job);
            Payments.TestField("Job Task No");
            //cc//if ApprovalsMgmt.CheckPaymentsApprovalsWorkflowEnabled(Payments) then
            //cc//ApprovalsMgmt.OnSendPaymentsForApproval(Payments);
            if Payments2.Get(staffClaim) then begin
                if Payments2.Status = Payments2.Status::"Pending Approval" then begin
                    status := 'success*The staff claim was successfully sent for approval';
                end;
            end;
        end else begin
            status := 'danger*A staff claim with the given number does not exist, you are not the requestor or is no longer open';
        end;
        exit(status);
    end;

    procedure createStaffClaim(employeeNo: Code[50]; claimNo: Code[50]; paymentNarration: Text; fundCode: Code[100]; job: Code[100]; jobTask: Code[100]) status: Text
    begin
        status := 'danger*Your staff claim could not be captured';
        if claimNo = '' then begin //new imprest surrender
            Payments.Init;
            Payments."Document Type" := Payments."document type"::"Staff Claims";
            Payments.Validate("Document Type");
            Payments."Payment Type" := Payments."payment type"::"Staff Claim";
            Payments.Validate("Payment Type");
            Payments."Account Type" := Payments."account type"::Employee;
            Payments.Validate("Account Type");
            Payments."Account No." := employeeNo;
            Payments.Validate("Account No.");
            Payments."Payment Narration" := paymentNarration;
            Payments.Validate("Payment Narration");
            Payments."Shortcut Dimension 2 Code" := fundCode;
            Payments.Validate("Shortcut Dimension 2 Code");
            Payments.Job := job;
            Payments.Validate(Job);
            Payments."Job Task No" := jobTask;
            Payments.Validate("Job Task No");
            Payments."Job Task No." := jobTask;
            Payments.Validate("Job Task No.");
            if Payments.Insert(true) then begin
                status := 'success*Your staff claim was successfully captured*' + Payments."No.";
            end else begin
                status := 'danger*Your staff claim could not be captured';
            end;

        end else begin //existing
            Payments.Reset;
            Payments.SetRange("No.", claimNo);
            Payments.SetRange("Account No.", employeeNo);
            Payments.SetRange(Status, Payments.Status::Open);
            if Payments.FindSet then begin
                Payments."Payment Narration" := paymentNarration;
                Payments.Validate("Payment Narration");
                Payments."Shortcut Dimension 2 Code" := fundCode;
                Payments.Validate("Shortcut Dimension 2 Code");
                Payments.Job := job;
                Payments.Validate(Job);
                Payments."Job Task No" := jobTask;
                Payments.Validate("Job Task No");
                Payments."Job Task No." := jobTask;
                Payments.Validate("Job Task No.");

                if Payments.Modify(true) then begin
                    status := 'success*Your staff claim was successfully updated';
                end else begin
                    status := 'danger*Your staff claim could not be updated';
                end;

            end else begin
                status := 'danger*A staff claim with the given number does not exist, you are not the owner or is no longer open';
            end;

        end;
        exit(status);
    end;

    procedure deleteStaffClaimLine(employeeNo: Code[100]; claimNo: Code[100]; lineNo: Integer) status: Text
    var
        PVLines: Record "PV Lines";
    begin
        status := 'danger*The staff claim line could not be deleted';
        Payments.Reset;
        Payments.SetRange("No.", claimNo);
        Payments.SetRange("Account No.", employeeNo);
        Payments.SetRange(Status, Payments.Status::Open);
        if Payments.FindSet then begin
            PVLines.Reset;
            PVLines.SetRange(No, claimNo);
            PVLines.SetRange("Line No", lineNo);
            if PVLines.FindSet then begin
                if PVLines.Delete(true) then begin
                    status := 'success*The staff claim line was successfully deleted';
                end else begin
                    status := 'danger*The staff claim line could not be deleted'
                end;
            end else begin
                status := 'danger*The staff claim line could not be deleted';
            end;
        end else begin
            status := 'danger*A staff claim with the given number does not exist, you are not the owner or is no longer open';
        end;
    end;

    procedure createStaffClaimLine(employeeNo: Code[100]; claimNo: Code[100]; voteItem: Code[100]; description: Text; amount: Decimal) status: Text
    var
        PVLines: Record "PV Lines";
    begin
        status := 'danger*The staff claim line could not be deleted';
        Payments.Reset;
        Payments.SetRange("No.", claimNo);
        Payments.SetRange("Account No.", employeeNo);
        Payments.SetRange(Status, Payments.Status::Open);
        if Payments.FindSet then begin
            PVLines.Init;
            PVLines.No := claimNo;
            PVLines.Validate(No);
            PVLines."Type of Expense" := voteItem;
            PVLines.Validate("Type of Expense");
            PVLines.Description := description;
            PVLines.Validate(Description);
            PVLines.Amount := amount;
            PVLines.Validate(Amount);
            if PVLines.Insert(true) then begin
                status := 'success*The staff claim line was successfully added';
            end else begin
                status := 'danger*The staff claim line could not be added'
            end;

        end else begin
            status := 'danger*A staff claim with the given number does not exist, you are not the owner or is no longer open';
        end;
    end;

    procedure editStaffClaimLine(lineNo: Integer; employeeNo: Code[100]; claimNo: Code[100]; voteItem: Code[100]; description: Text; amount: Decimal) status: Text
    var
        PVLines: Record "PV Lines";
    begin
        status := 'danger*The staff claim line could not be deleted';
        Payments.Reset;
        Payments.SetRange("No.", claimNo);
        Payments.SetRange("Account No.", employeeNo);
        Payments.SetRange(Status, Payments.Status::Open);
        if Payments.FindSet then begin
            PVLines.Reset;
            PVLines.SetRange("Line No", lineNo);
            PVLines.SetRange(No, claimNo);
            if PVLines.FindSet then begin
                PVLines.Validate(No);
                PVLines."Type of Expense" := voteItem;
                PVLines.Validate("Type of Expense");
                PVLines.Description := description;
                PVLines.Validate(Description);
                PVLines.Amount := amount;
                PVLines.Validate(Amount);
                if PVLines.Modify(true) then begin
                    status := 'success*The staff claim line was successfully updated';
                end else begin
                    status := 'danger*The staff claim line could not be updated'
                end;
            end else begin
                status := 'danger*The staff claim line does not exist';
            end;
        end else begin
            status := 'danger*A staff claim with the given number does not exist, you are not the owner or is no longer open';
        end;
    end;

    procedure sendStoreRequisitionApproval(employeeNo: Code[50]; requisitionNo: Code[50]) status: Text
    var
        TEXT012: label 'The Requestor Must Be Part Of the Project  Team on The Memo';
        PurchaseHeader1: Record "Purchase Header";
    begin
        status := 'danger*The Store Requisition could not be sent for approval';
        PurchaseHeader.Reset;
        PurchaseHeader.SetRange("Request-By No.", employeeNo);
        PurchaseHeader.SetRange(Status, PurchaseHeader.Status::Open);
        PurchaseHeader.SetRange("No.", requisitionNo);
        PurchaseHeader.SetRange("Document Type", PurchaseHeader."document type"::"Store Requisition");
        if PurchaseHeader.FindSet then begin
            PurchaseHeader.TestField("Shortcut Dimension 1 Code");
            PurchaseHeader.TestField("Shortcut Dimension 2 Code");
            PurchaseHeader.TestField(Description);
            //TESTFIELD("Requester ID",USERID);
            /*
            TESTFIELD(Description);
       TESTFIELD("Shortcut Dimension 1 Code");
       TESTFIELD("Shortcut Dimension 2 Code");
       //TESTFIELD("Shortcut Dimension 3 Code");
       //cc//if ApprovalsMgmt.CheckPurchaseApprovalPossible(Rec) THEN
         //cc//ApprovalsMgmt.OnSendPurchaseDocForApproval(Rec);*/
            //cc//if ApprovalsMgmt.CheckPurchaseApprovalPossible(PurchaseHeader) then
            //cc//ApprovalsMgmt.OnSendPurchaseDocForApproval(PurchaseHeader);

            PurchaseHeader1.Reset;
            PurchaseHeader1.SetRange("Request-By No.", employeeNo);
            PurchaseHeader1.SetRange("No.", requisitionNo);
            PurchaseHeader1.SetRange("Document Type", PurchaseHeader."document type"::"Store Requisition");
            if PurchaseHeader1.FindSet then begin
                if PurchaseHeader1.Status = PurchaseHeader1.Status::"Pending Approval" then begin
                    status := 'success*The Store Requisition was successfully sent for approval';
                end;
            end;
        end else begin
            status := 'danger*A Store Requisition with the given number does not exist, you are not the requestor or is no longer open';
        end;
        exit(status);

    end;

    procedure createStoreRequisitionLine(employeeNo: Code[250]; requisitionNo: Code[250]; itemCategory: Code[250]; item: Code[250]; quantity: Decimal) status: Text
    var
        PurchaseLine: Record "Purchase Line";
    begin
        status := 'danger*Your Requisition Line could not be added';
        PurchaseHeader.Reset;
        PurchaseHeader.SetRange("Request-By No.", employeeNo);
        PurchaseHeader.SetRange(Status, PurchaseHeader.Status::Open);
        PurchaseHeader.SetRange("No.", requisitionNo);
        if PurchaseHeader.FindSet then begin
            if (PurchaseHeader."Document Type" = PurchaseHeader."document type"::"Store Requisition") or (PurchaseHeader."Document Type" = PurchaseHeader."document type"::"Purchase Requisition") then begin
                //add line
                PurchaseLine.Init;
                //Document Type,Document No.,Line No.
                if PurchaseHeader."Document Type" = PurchaseHeader."document type"::"Store Requisition" then begin
                    PurchaseLine."Document Type" := PurchaseLine."document type"::"Store Requisition";
                end;
                if PurchaseHeader."Document Type" = PurchaseHeader."document type"::"Purchase Requisition" then begin
                    PurchaseLine."Document Type" := PurchaseLine."document type"::"Purchase Requisition";
                end;
                PurchaseLine."Document No." := requisitionNo;
                PurchaseLine.Validate("Document No.");
                PurchaseLine."Line No." := getPurchaseLineNo(requisitionNo, PurchaseLine."Document Type");
                PurchaseLine.Validate("Line No.");
                PurchaseLine."Item Category" := itemCategory;
                PurchaseLine.Validate("Item Category");
                PurchaseLine."Service/Item Code" := item;
                PurchaseLine.Validate("Service/Item Code");
                PurchaseLine."Qty. Requested" := quantity;
                PurchaseLine.Validate("Qty. Requested");

                if PurchaseLine.Insert(true) then begin
                    PurchaseLine.Validate("Qty. Requested", quantity);

                    PurchaseLine.Modify(true);
                    status := 'success*The Requisition Line was successfully added';//+FORMAT(directUnitCost);
                end else begin
                    status := 'danger*Your Requisition Line could not be added';
                end;
            end;
        end else begin
            status := 'danger*A Requisition with the given number does not exist, you are not the owner or is no longer open';
        end;
        exit(status);
    end;
}
