#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Codeunit 50100 eprocurement
{

    trigger OnRun()
    begin
        //MESSAGE(FORMAT(fnInsertRFIresponseHeader('VEND002', 'IFP00006')))
        //MESSAGE(FORMAT(fnSubmisionResponseStatus('PRQ00012')))
        //MESSAGE(FORMAT(fnCompleteSupplierReg('VEND002') ))
        //MESSAGE(FORMAT(fnGetEvalCritScores('BST00001', 2)))
        //MESSAGE(FORMAT(FnGenerateVendorstatement('VEND0922', 20190101D, 20191010D)));
        //MESSAGE(FORMAT(fnGetOwnerPercentage('VEND002')));
        //MESSAGE(fnInsertSpecialGrp('VEND002', 'Youth','KKK89' ,20201212D, 20201212D, 'Adulut'));
        //MESSAGE(FnReqforRegistration('Shawn Test','03474647738554', 'shawnkkk@mail6680.com','PPP89w879872', 'nmanmshsduudusu'))
        // MESSAGE(fnNewSubmitTenderResponse('VEND039','NACOSTI:19/20TND_001'));
        //MESSAGE(fnDeleteBidAuditedBalsheet('2019' , 'VEND039', 'P-QUO019'))
        //MESSAGE(fngetBidResponseNumber('ITT00043','VEND017'));
    end;

    var
        Contact: Record Contact;
        QuotationsEvaluation: Record "Quotations Evaluation";
        objFiscalYear: Record "Financial Year Code";
        Bidders: Record Bidders;
        objPortalUsers: Record portalusers;
        objProcReqs: Record "Procurement Request";
        objBlogPost: Record Blog_Vendors;
        objBlogReply: Record BlogVendors_Replies;
        FILESPATH: label '\\41.89.63.253\Downloads30\';
        objVendor: Record Vendor;
        objPRLines: Record "Procurement Request Lines";
        objSuppSelection: Record "Supplier Selection1";
        objDocAttachedTbl: Record "Document Attachment";
        objVendorBank: Record "Vendor Bank Account";
        objDirectors: Record "Vendor Business Owner";
        objLitigHistory: Record "Vendor Litigation History";
        objEmailsendCodeunit: Codeunit "Procurement Processing";
        objNoSeriesManagement: Codeunit "No. Series";
        objProcsetup: Record "Procurement Setup";
        objVendorSpecGentry: Record "Vendor Special Group Entry";
        objPastXp: Record "Vendor Past Experience";
        objBidResponseBalanceSheet: Record "Bid Audited Balance Sheet";
        objBalanceSheet: Record "Vendor Audited Balance Sheet";
        objPastExperience: Record "Bid Past Experience";
        objIncomeStatement: Record "Vendor Audited Income Statemen";
        objPurhcaseLinesDetails: Record "Purchase Line";
        objBidResponseIncomeStatement: Record "Bid Audited Income Statement";
        objFiledUploads: Record "Vendor Filed Reg Document";
        objBidResponseEquipments: Record "Bid Equipment Specification";
        objProfstaff: Record "Vendor Professional Staff";
        objStaffQualif: Record "Vendor Staff Qualification";
        objStaffXP: Record "Vendor Staff Experience";
        objRFIResponse: Record "RFI Response";
        objIFPResponseLine: Record "IFP Response Line";
        ProcurementSetup: Record "Procurement Setup";
        NoMgt: Codeunit "No. Series";
        objRFIrespFiledDocument: Record "RFI Response Filed Document";
        objBidScoreCriteria: Record "Bid Score Criteria Group";
        Purch: Record "Purchase Header";
        Vendor: Record Vendor;
        BidOwner: Record "Bid Business Owner";
        VendBusinessOwner: Record "Vendor Business Owner";
        BidPreferences: Record "Bid Preference & Reservation";
        VendSpecialGroup: Record "Vendor Special Group Entry";
        BidLitigation: Record "Bid Litigation History";
        VendLitigation: Record "Vendor Litigation History";
        BidPastExperience: Record "Bid Past Experience";
        VendPastExperience: Record "Vendor Past Experience";
        BidAuditedBal: Record "Bid Audited Balance Sheet";
        VendAuditedBal: Record "Vendor Audited Balance Sheet";
        BidIncomeStat: Record "Bid Audited Income Statement";
        VendIncomeStat: Record "Vendor Audited Income Statemen";
        BidVendBankAccount: Record "Bid Vendor Bank Account";
        VendBankAccount: Record "Vendor Bank Account";
        BidKeyStaff: Record "Bid Key Staff";
        VendKeyStaff: Record "Vendor Professional Staff";
        BidKeyStaffQual: Record "Bid Key Staff Qualification";
        VendKeyStaffQual: Record "Vendor Staff Qualification";
        BidStaffExperience: Record "Bid Key Staff Experience";
        VendStaffExperience: Record "Vendor Staff Experience";
        IFS: Record "Standard Purchase Code";
        IFSLines: Record "Standard Purchase Line";
        PurchLines: Record "Purchase Line";
        objTenderSecurity: Record "Bid_Contract Security Register";
        objVendorSpecialGroup: Record "Vendor Special Group Entry";
        RecordIDNumber: RecordID;
        EprocurementStatistics: Record "Eprocurement Statistics";
        FileDirectory: Text[50];
        FileName: Text[500];

    procedure FnRegisterVendor(vendorName: Code[100]; supplierCategory: Code[20]; country: Code[10]; postAddress: Text; postCode: Code[20]; phoneNumber: Code[20]; emailAddress: Text; kraPin: Code[20]; taxCompliance: Code[100]; password: Text; confirmPassword: Text) status: Text
    begin
        status := 'danger*Your account could not be created. Please try again later';
        if not (password = confirmPassword) then begin
            status := 'danger*Password does not match confirm password. Please enter again';
        end else if StrLen(password) < 4 then begin
            status := 'danger*Password is too short. Minimum four(4) characters. Please enter again!';
        end
        else begin
            Contact.Reset;
            Contact.SetRange("E-Mail", emailAddress);
            if Contact.FindSet then begin
                status := 'danger*Another vendor with the given email address exists!';
            end else begin
                Contact.Init;
                Contact.Name := vendorName;
                Contact."Country/Region Code" := country;
                Contact.Address := postAddress;
                Contact."Post Code" := postCode;
                Contact.Validate("Post Code");
                Contact."Phone No." := phoneNumber;
                Contact."E-Mail" := emailAddress;
                Contact."KRA PIN" := kraPin;
                Contact."Tax Compliance Certificate No" := taxCompliance;
                Contact."Entity Type" := Contact."entity type"::Organization;
                Contact.password := password;
                if Contact.Insert(true) then begin
                    //success insert into contact
                    objPortalUsers.Reset;
                    objPortalUsers.SetRange("customer No", Contact."No.");
                    if objPortalUsers.FindSet then begin
                        status := 'danger*The username already exist!';
                    end else begin
                        objPortalUsers.Init;
                        objPortalUsers."customer No" := Contact."No.";
                        objPortalUsers.Password := Contact.password;
                        objPortalUsers.Email := Contact."E-Mail";
                        objPortalUsers.IDNoorRegNo := Contact."ID Number";
                        if objPortalUsers.Insert(true) then
                          //success insert into portal users
                          begin
                            status := 'success*Your vendor account was successfully created. Please log in to complete your profile!';
                        end
                        else begin
                            status := 'danger*Error!, unknown error occured while saving, contact main office';
                        end
                    end
                end
                else begin
                    status := 'danger*Error!, unknown error occured, contact main office';
                end
            end;
        end;
        exit(status);
    end;

    procedure resetPass(emailAddress: Text) status: Text
    var
        emailvalidations: Record emailvalidations;
        password: Integer;
        error: Boolean;
        emailvalidations2: Record emailvalidations;
        message: Text;
    begin
        status := 'Reset Password Unsuccessful*We could not reset your password. Please try again later*error';
        error := false;
        Contact.Reset;
        Contact.SetRange("E-Mail", emailAddress);
        if Contact.FindSet then begin
            emailvalidations.Reset;
            emailvalidations.SetRange(user, Contact."No.");
            emailvalidations.SetRange(used, false);
            if emailvalidations.FindSet then begin
                emailvalidations.used := true;
                emailvalidations.Modify(true);
                Commit;
            end;
            while not error do begin
                password := Random(9999999);
                if password > 999999 then
                    error := true;
            end;
            if error then begin
                emailvalidations2.Init;
                emailvalidations2.user := Contact."No.";
                emailvalidations2.generatedAt := CurrentDatetime;
                emailvalidations2.key := Format(password);
                emailvalidations2.Email := Contact."E-Mail";
                emailvalidations2.used := false;
                if emailvalidations2.Insert(true) then begin
                    message := 'Dear <strong>' + Contact.Name + '</strong>, <br/> We have received your password reset request. <br/> <a href="http://localhost:56572/Activate?userCode=' + emailvalidations2.user + '&&key=' + emailvalidations2.key;
                    message += '"> Please click here to complete your request.</a> <br/> <br/> This link will expire in 30 minutes';
                    sendEmail(Contact."E-Mail", 'Password Reset Request', message);
                    status := 'Reset Password Successful*Your request to reset your password was successful. Please follow the instructions sent to your email*success';
                end else begin
                    status := 'Reset Password Unsuccessful*We could not reset your password. Please try again later*error';
                end;

            end;
        end else begin
            status := 'Reset Password Unsuccessful*A user with the given email address does not exist. Please try again later*error';
        end;
        exit(status);
    end;

    procedure FnApplyPreQualification(contactNo: Code[20]; supplierCategory: Code[50]) status: Text
    var
        PrequalifiedSuppliers1: Record "Prequalified Suppliers1";
    begin
        Contact.Reset;
        Contact.SetRange("No.", contactNo);
        if Contact.FindSet then begin
            PrequalifiedSuppliers1.Reset;
            PrequalifiedSuppliers1.SetRange("Contact No", contactNo);
            PrequalifiedSuppliers1.SetRange(Category, supplierCategory);
            if PrequalifiedSuppliers1.FindSet then begin
                status := 'danger*Your have already applied for prequalification in this category!';
            end else begin
                PrequalifiedSuppliers1.Init;
                PrequalifiedSuppliers1."Contact No" := contactNo;
                PrequalifiedSuppliers1.Validate("Contact No");
                PrequalifiedSuppliers1.Category := supplierCategory;
                PrequalifiedSuppliers1.Validate(Category);

                if PrequalifiedSuppliers1.Insert(true) then begin
                    status := 'success*Your registration for prequalification has been received!';
                end else begin
                    status := 'danger*Your application for PreQualification was unsuccessful. Please try again later!';
                end;
            end;
        end else begin
            status := 'danger*Account Error, Kindly contact Nacosti Office for Assistance!';
        end;
        exit(status);
    end;

    procedure FnApplyPreQualificationsDetails(contactNo: Code[20]; supplierCategory: Code[50]) status: Text
    var
        PrequalifiedSuppliers1: Record "Prequalified Suppliers1";
    begin
        Contact.Reset;
        Contact.SetRange("No.", contactNo);
        if Contact.FindSet then begin
            PrequalifiedSuppliers1.Reset;
            PrequalifiedSuppliers1.SetRange("Contact No", contactNo);
            PrequalifiedSuppliers1.SetRange(Category, supplierCategory);
            if PrequalifiedSuppliers1.FindSet then begin
                status := 'danger*Your have already applied for prequalification in this category!';
            end else begin
                PrequalifiedSuppliers1.Init;
                PrequalifiedSuppliers1."Contact No" := contactNo;
                PrequalifiedSuppliers1.Validate("Contact No");
                PrequalifiedSuppliers1.Category := supplierCategory;
                PrequalifiedSuppliers1.Validate(Category);

                if PrequalifiedSuppliers1.Insert(true) then begin
                    status := 'success*Your registration for prequalification has been received!';
                end else begin
                    status := 'danger*Your application for PreQualification was unsuccessful. Please try again later!';
                end;
            end;
        end else begin
            status := 'danger*Account Error, Kindly contact Nacosti Office for Assistance!';
        end;
        exit(status);
    end;

    procedure getCurrentYear(): Code[50]
    var
        PurchasesPayablesSetup: Record "Purchases & Payables Setup";
    begin
        if PurchasesPayablesSetup.Get() then
            exit(PurchasesPayablesSetup."Current Year");
    end;

    procedure fnApplyRFQ(contactNo: Code[50]; quantity: Decimal; amount: Decimal; rfqNo: Code[50]; email: Text; vendorNo: Code[50]) status: Text
    var
        TenderBids: Record "Tender Bids";
    begin
        TenderBids.Reset;
        TenderBids.SetRange("Bidder Email", email);
        TenderBids.SetRange("Requisition No", rfqNo);
        if TenderBids.FindSet then begin
            status := 'danger*You have already applied in the chosen RFQ!';
        end else begin
            TenderBids.Init;
            TenderBids.contactNo := contactNo;
            TenderBids.Validate(contactNo);
            TenderBids."Requisition No" := rfqNo;
            TenderBids.Validate("Requisition No");
            TenderBids.Quantity := quantity;
            TenderBids."Unit Price" := amount;
            TenderBids.Validate("Unit Price");
            TenderBids."Vendor No" := vendorNo;
            if TenderBids.Insert(true) then begin
                status := 'success*Your submission for RFQ has been received!';
            end else begin
                status := 'danger*Snaap! Unknown error occured, contact NACOSTI Office!';
            end;
        end;
        exit(status);
    end;

    procedure applyRFQOLD(contactNo: Code[50]; password: Text; quantity: Decimal; amount: Decimal; rfqNo: Code[50]) status: Text
    begin
        status := 'RFQ Application Unsuccessful*Your application for RFQ was not successful*error';
        Contact.Reset;
        Contact.SetRange("No.", contactNo);
        Contact.SetRange(password, password);
        if not Contact.FindSet then begin
            status := 'RFQ Application Unsuccessful*An account with the given credentials does not exist*error';
        end else begin
            QuotationsEvaluation.Reset;
            QuotationsEvaluation.SetRange("Contact No", contactNo);
            QuotationsEvaluation.SetRange("Ref No.", rfqNo);
            if QuotationsEvaluation.FindSet then begin
                status := 'Duplicate RFQ*You have already applied in the chosen RFQ*error';
            end else begin
                QuotationsEvaluation.Init;
                QuotationsEvaluation."Contact No" := contactNo;
                QuotationsEvaluation.Validate("Contact No");
                QuotationsEvaluation."Ref No." := rfqNo;
                QuotationsEvaluation.Validate("Ref No.");
                QuotationsEvaluation."Minimum Order Amount" := amount;
                QuotationsEvaluation."Minimum Order Quantity" := quantity;
                if QuotationsEvaluation.Insert(true) then begin
                    status := 'RFQ Application Received*Your application for RFQ has been received*success';
                end else begin
                    status := 'RFQ Application Unsuccessful*Your application for RFQ was not successful*error';
                end;
            end;
        end;
        exit(status);
    end;

    procedure sendEmail(recipient: Text; title: Text; message: Text): Boolean
    var
        objMail: Codeunit "Mail";
        SMTPMailSetup: Record "Email Account";
    begin

        SMTPMailSetup.Get;
        //objMail.CreateMessage(SMTPMailSetup."Email Sender Name", SMTPMailSetup."Email Sender Address", recipient, title, message, true);
        //objMail.Send();
    end;

    procedure FnAddVendorSpecialGroupDetails(vendorNo: Code[100]; agpocertno: Code[10]; registeredspecialgroup: Code[10]; productservicecategory: Text; certeffectivedate: Date; certexpirydate: Date) status: Text
    begin

        objVendorSpecialGroup.Reset;
        objVendorSpecialGroup.SetRange("Certifcate No", agpocertno);
        if objVendorSpecialGroup.FindSet then begin
            objVendorSpecialGroup."Certifcate No" := agpocertno;
            objVendorSpecialGroup."Vendor Category" := registeredspecialgroup;
            objVendorSpecialGroup."Vendor No" := vendorNo;
            objVendorSpecialGroup."Registered Special Group" := registeredspecialgroup;
            objVendorSpecialGroup."Products/Service Category" := productservicecategory;
            objVendorSpecialGroup."Certificate Expiry Date" := certexpirydate;
            objVendorSpecialGroup."Effective Date" := certeffectivedate;
            if objVendorSpecialGroup.Modify(true) then begin
                status := 'success*The Certificate Details was successfully updated';
            end else begin
                status := 'danger*The Certificate Details was not successfully inserted';
            end;
        end else begin
            objVendorSpecialGroup.Init;
            objVendorSpecialGroup."Vendor Category" := registeredspecialgroup;
            objVendorSpecialGroup."Certifcate No" := agpocertno;
            objVendorSpecialGroup."Vendor No" := vendorNo;
            objVendorSpecialGroup."Registered Special Group" := registeredspecialgroup;
            objVendorSpecialGroup."Products/Service Category" := productservicecategory;
            objVendorSpecialGroup."Certificate Expiry Date" := certexpirydate;
            objVendorSpecialGroup."Effective Date" := certeffectivedate;
            if objVendorSpecialGroup.Insert(true) then begin
                status := 'success*The Certificate Details was successfully Inseted';
            end else begin
                status := 'danger*The Certificate Details was not successfully inserted';
            end;
            exit(status);
        end;
    end;

    procedure activateAccount(userCode: Code[100]; "key": Text; password: Text; confirmpassword: Text) status: Text
    var
        emailvalidations: Record emailvalidations;
        error: Boolean;
        duration: Decimal;
    begin
        status := 'Reseting password Unsuccessful*Your request to reset your password failed. Please try again*error';
        error := false;
        if StrLen(password) < 4 then begin
            error := true;
            status := 'Reseting password Unsuccessful*Your chosen password is too short. It should be at least 4 characters*error';
        end;
        if not (password = confirmpassword) then begin
            error := true;
            status := 'Reseting password Unsuccessful*Password does not match confirm password*error';
        end;


        if not error then begin
            emailvalidations.Reset;
            emailvalidations.SetRange(user, userCode);
            emailvalidations.SetRange(key, key);
            //emailvalidations.SETRANGE(used, FALSE);
            if emailvalidations.FindSet then begin
                if emailvalidations.used then begin
                    status := 'Reseting password Unsuccessful*The given passkey has already been used. Please try resetting the password again*error';
                end else begin
                    duration := CurrentDatetime - emailvalidations.generatedAt;
                    duration := (duration / 60000);
                    if (duration > 30) then begin
                        status := 'Reseting password Unsuccessful*The given passkey has expired. Please try resetting the password again*error';
                    end else begin
                        Contact.Reset;
                        Contact.SetRange("No.", userCode);
                        if Contact.FindSet then begin
                            Contact.password := password;
                            if Contact.Modify(true) then begin
                                emailvalidations.used := true;
                                emailvalidations.Modify(true);
                                status := 'Reseting Password Successful*Your password was successfully updated. Please proceed to log in*success';

                            end else begin
                                status := 'Reseting password Unsuccessful*Your password could not be updated. Please try again*error';
                            end;
                        end else begin
                            status := 'Reseting password Unsuccessful*An account with the given credentials does not exist*error';
                        end;
                    end;
                end;
            end else begin
                status := 'Reseting password Unsuccessful*A request with the given pass key does not exist. Please try resetting the password again*error';
            end;
        end;
        exit(status);
    end;

    procedure FnAddDirectors(contactNo: Code[100]; directorFullname: Text) status: Text
    begin
        Contact.Reset;
        Contact.SetRange("No.", contactNo);
        if Contact.FindSet then begin
            Contact."Director 1 Name" := directorFullname;
            if Contact.Modify(true) then begin
                status := 'success*The director successfully updated';
            end else begin
                status := 'danger*Unknown error occured, could not update!';
            end;
        end else begin
            status := 'danger*User not available';
        end;
        exit(status);
    end;

    procedure FnApplyforTender(tenderNo: Code[50]; vendorNo: Code[50]; Email: Text[100]) status: Text
    begin
        Bidders.Reset;
        Bidders.SetRange("Ref No.", tenderNo);
        Bidders.SetRange("E-mail", Email);
        if Bidders.FindSet then begin
            status := 'danger*You have already applied for this tender!'
        end else begin
            Bidders.Init;
            Bidders."Vendor No" := vendorNo;
            Bidders.Validate("Vendor No");
            Bidders."E-mail" := Email;
            Bidders."Ref No." := tenderNo;
            if Bidders.Insert(true) then begin
                status := 'success*Your bid placed successfully!'
            end else begin
                status := 'danger*Snaap! Unknown error occured, contact NACOSTI Office'
            end
        end;
        exit(status);
    end;

    procedure fnCountOpenTenders() myCount: Integer
    begin
        objProcReqs.Reset;
        objProcReqs.SetRange("Process Type", objProcReqs."process type"::Tender);
        objProcReqs.SetRange(Status, objProcReqs.Status::Open);
        if objProcReqs.FindSet then begin
            myCount := objProcReqs.Count;
        end else begin
            myCount := 0;
        end
    end;

    procedure fnCountAppliedTenders(vendorNo: Code[30]) myCount: Integer
    begin
        Bidders.Reset;
        Bidders.SetRange("Vendor No", vendorNo);
        if Bidders.FindSet then begin
            myCount := Bidders.Count;
        end else begin
            myCount := 0;
        end
    end;

    procedure fnCountTendersAwarded(vendorNo: Code[30]) myCount: Integer
    begin
        Bidders.Reset;
        Bidders.SetRange("Vendor No", vendorNo);
        Bidders.SetRange(Successful, true);
        if Bidders.FindSet then begin
            myCount := Bidders.Count;
        end else begin
            myCount := 0;
        end
    end;

    procedure FnApplyforOpenTender(tenderNo: Code[50]; amount: Decimal; contactNo: Code[50]; Email: Text[100]) status: Text
    begin
        //  Bidders.RESET;
        //  Bidders.SETRANGE("Ref No.", tenderNo);
        //  Bidders.SETRANGE("E-mail", Email);
        //
        // IF Bidders.FINDSET THEN BEGIN
        //  status:= 'danger*You have already applied for this tender!'
        //  END ELSE BEGIN
        //     Bidders.INIT;
        //     Bidders."Vendor No":= contactNo;
        //     Bidders.VALIDATE("Contact No");
        //     Bidders."E-mail":=Email;
        //     Bidders."Ref No.":=tenderNo;
        //     Bidders."Tender Amount":= amount;
        //
        //    IF Bidders.INSERT(TRUE) THEN
        //      BEGIN
        //         status:= 'success*Your bid placed successfully!'
        //      END ELSE BEGIN
        //          status:= 'danger*Snaap! Unknown error occured, contact NACOSTI Office'
        //      END
        //  END;
        // EXIT(status);
    end;

    procedure FnInsertBlog(blogTitle: Text[250]; blogBody: Text[250]; dirNo: Code[20]; dirName: Text) insertStatus: Text
    begin
        objBlogPost.Reset;
        objBlogPost.SetRange("Blog Title", blogTitle);
        if objBlogPost.Find('+') then begin
            insertStatus := 'danger*The forum Title already exists, kindly reply on it!';
        end
        else begin
            objBlogPost.Init;
            objBlogPost."Blog Title" := blogTitle;
            objBlogPost."Blog Body" := blogBody;
            objBlogPost."Created ByVendorNo" := dirNo;
            objBlogPost."Created ByVendorName" := dirName;
            objBlogPost."Date Created" := Today;
            objBlogPost."Time Created" := Time;

            if objBlogPost.Insert = true then begin
                insertStatus := 'success*Forum created successfully, kindly follow up on replies';
            end else begin
                insertStatus := 'danger*Error occured, forum could not be created!';
            end
        end
    end;

    procedure FnInsertBlogReply(blogReply: Text[250]; dirNo: Code[20]; dirName: Text; blogId: Integer) insertStatus: Text
    begin
        objBlogReply.Init;
        objBlogReply.BlogIdCode := blogId;
        objBlogReply."Blog Reply" := blogReply;
        objBlogReply."Replier VendorNo" := dirNo;
        objBlogReply."Replier Name" := dirName;
        objBlogReply."Date Replied" := Today;
        objBlogReply."Time Replied" := Time;

        if objBlogReply.Insert = true then begin
            insertStatus := 'success*Your reply successfully send';
        end else begin
            insertStatus := 'danger*Error occured, reply could not be created!';
        end
    end;

    procedure FnChangePassword(emailaddress: Text; currentPassword: Text; newPassword: Text; confirmNewPassword: Text) status: Text
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

    procedure FnEditProfile(email: Text; fullname: Text; kraPin: Code[20]; taxtPin: Code[20]; phoneNo: Code[20]) status: Text
    begin
        Contact.Reset;
        Contact.SetRange("E-Mail", email);
        if Contact.FindSet then begin
            Contact.Name := fullname;
            Contact."KRA PIN" := kraPin;
            Contact."Tax Compliance Certificate No" := taxtPin;
            Contact."Phone No." := phoneNo;
            if Contact.Modify then begin
                status := 'success*Profile modified successfully!'
            end
            else begin
                status := 'danger*Profile modification failed!'
            end
        end else begin
            status := 'danger*user nor found';
        end
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
            if DynasoftPortalUser.Modify(true) then begin
                //Portal Statistics
                EprocurementStatistics.Reset;
                EprocurementStatistics.SetRange("Vendor Email", DynasoftPortalUser."Authentication Email");
                EprocurementStatistics.SetRange("Procurement Process", EprocurementStatistics."procurement process"::"Password Reset");
                if EprocurementStatistics.FindSet then begin
                    EprocurementStatistics.Step := 'Password Reset';
                    EprocurementStatistics."Last Modified Date" := CurrentDatetime;
                    EprocurementStatistics.Modify(true);
                end else begin
                    EprocurementStatistics.Init;
                    EprocurementStatistics."Vendor No" := DynasoftPortalUser."Record ID";
                    EprocurementStatistics.Validate("Vendor No");
                    EprocurementStatistics."Procurement Process" := EprocurementStatistics."procurement process"::"Password Reset";
                    EprocurementStatistics.Step := 'Password Reset';
                    EprocurementStatistics."Last Modified Date" := CurrentDatetime;
                    EprocurementStatistics.Insert(true);
                end;
                passChangestatus := 'success*Password Reset Successfully';
                ResetSendEmail(emailaddress);
            end else begin
                passChangestatus := 'danger*The Password was Not Modified';
            end;
        end else begin
            passChangestatus := 'emailnotfound*Email Address is Missing';
        end;
    end;

    procedure FnGenerateVendorstatement(vendorNo: Code[20]; startDate: Date; endDate: Date) status: Text
    begin
        objVendor.Reset;
        objVendor.SetRange(objVendor."No.", vendorNo);
        if objVendor.FindSet then begin
            // objVendor.SETFILTER(objVendor."Date Filter", FORMAT(FORMAT(startDate)  +'..'+ FORMAT(endDate)));

            // if FILE.Exists(FILESPATH + '\Statements\' + Format(vendorNo) + '.pdf') then begin
            //     FILE.Erase(FILESPATH + '\Statements\' + Format(vendorNo) + '.pdf');
            //     Report.SaveAsPdf(304, FILESPATH + '\Statements\' + Format(vendorNo) + '.pdf');
            //     status := 'success*Downloads30\Statements\' + Format(vendorNo) + '.pdf';
            // end
            // else begin
            //     status := 'danger*Error generating vendor Report!';
            //     Error(status);
            // end
        end
        else begin
            status := 'danger*Vendor number not found!';
        end;
    end;

    procedure FnGenerateRfQDocument(vendorNo: Code[20]; rfQNo: Code[50]) status: Text
    begin
        objVendor.Reset;
        objVendor.SetRange(objVendor."No.", vendorNo);
        if objVendor.FindSet then begin
            // objVendor.SETFILTER(objVendor."Date Filter", FORMAT(FORMAT(startDate)  +'..'+ FORMAT(endDate)));

            // if FILE.Exists(FILESPATH + '\RFQs\' + Format(vendorNo) + '.pdf') then begin
            //     FILE.Erase(FILESPATH + '\RFQs\' + Format(vendorNo) + '.pdf');
            //     Report.SaveAsPdf(70002, FILESPATH + '\RFQs\' + Format(vendorNo) + '.pdf');
            //     status := 'success*Downloads30\RFQs\' + Format(vendorNo) + '.pdf';
            // end
            // else begin
            //     status := 'danger*Error generating vendor Report!';
            //     Error(status);
            // end
        end
        else begin
            status := 'danger*Vendor number not found!';
        end;
    end;

    procedure fnAddPurchaseReqLine(reqNo: Code[30]; itemNo: Code[30]; quantity: Decimal; unitPrice: Decimal; vendorNo: Code[30]; lineNo: Integer; type: Option) insertStatus: Text
    begin
        objPRLines.Reset;
        objPRLines.SetRange("Vendor No", vendorNo);
        objPRLines.SetRange(No, itemNo);
        if objPRLines.FindSet then begin
            insertStatus := 'danger*You have already applied for that Item';
        end
        else begin
            objPRLines.Init;
            objPRLines."Requisition No" := reqNo;
            //  IF objPRLines.FINDLAST THEN
            //    objPRLines."Line No":=objPRLines."Line No"+1000;
            objPRLines.Validate("Requisition No");
            objPRLines.No := itemNo;
            objPRLines.Validate(No);
            objPRLines.Quantity := quantity;
            objPRLines."Unit Price" := unitPrice;
            objPRLines.Validate("Unit Price");
            objPRLines."Vendor No" := vendorNo;
            objPRLines."Order Date" := Today;
            objPRLines.Type := type;

            if objPRLines.Insert(true) then begin
                insertStatus := 'success*Your Application successfully submitted!';
            end else begin
                insertStatus := 'danger*Error occured while submitting your request!';
            end
        end
    end;

    procedure FnReqforRegistration(registeredBusinessName: Code[100]; phoneNumber: Code[100]; emailAddress: Text; taxRegkraPin: Code[100]; contactName: Code[100]) status: Text
    begin
        Contact.Reset;
        Contact.SetRange("E-Mail", emailAddress);
        if Contact.FindSet then begin
            //status:='danger*Another vendor with the given email address exists!';
            status := 'danger*You have an active vendor registration that is awaiting processing. Kindly contact NACOSTI at scm@nacosti.go.ke for further guidelines.';
        end else begin
            objProcsetup.Get;
            Contact.Init;
            Contact."No." := objNoSeriesManagement.GetNextNo(objProcsetup."Request For Registration Nos", Today, true);
            Contact."Company No." := Contact."No.";
            Contact.Validate("No.");
            //MESSAGE(Contact."No.");
            Contact."Portal Request" := true;
            Contact.Name := registeredBusinessName;
            Contact."Name 2" := contactName;
            Contact."Phone No." := phoneNumber;
            Contact."E-Mail" := emailAddress;
            Contact."VAT Registration No." := taxRegkraPin;
            Contact.Type := Contact.Type::Company;
            if Contact.Insert() then begin
                //Portal Statistics
                EprocurementStatistics.Reset;
                EprocurementStatistics.SetRange("Vendor Email", emailAddress);
                EprocurementStatistics.SetRange("Procurement Process", EprocurementStatistics."procurement process"::"Portal Registration");
                if EprocurementStatistics.FindSet then begin
                    EprocurementStatistics.Step := 'Account Creation';
                    EprocurementStatistics."Last Modified Date" := CurrentDatetime;
                    EprocurementStatistics.Modify(true);
                end else begin
                    EprocurementStatistics.Init;
                    EprocurementStatistics."Vendor Name" := registeredBusinessName;
                    EprocurementStatistics."Vendor Email" := emailAddress;
                    EprocurementStatistics."Procurement Process" := EprocurementStatistics."procurement process"::"Portal Registration";
                    EprocurementStatistics.Step := 'Account Creation';
                    EprocurementStatistics."Last Modified Date" := CurrentDatetime;
                    EprocurementStatistics.Insert(true);
                end;
                //success insert into contact
                status := 'success*Your Account Creation Request have been successfully submitted.Kindly Check your Email Account for More Details!';
                //send  email notif to procurement department //get code here
                objEmailsendCodeunit.FnSendEmaiNotificationOnSupplierRegRequest(Contact);
            end else begin
                status := 'danger*Error!,unknown error occured while saving, contact main office';
            end
        end;

        exit(status);
    end;

    // procedure fnBLOBRfQDocument(Vendorname: Code[50]; RFQNo: Code[50]; var BigText: BigText)
    // var
    //     Filename: Text[100];
    //     Convert: dotnet Convert;
    //     Path: dotnet Path;
    //     _File: dotnet File;
    //     FileAccess: dotnet FileAccess;
    //     FileMode: dotnet FileMode;
    //     MemoryStream: dotnet MemoryStream;
    //     FileStream: dotnet FileStream;
    //     Outputstream: OutStream;
    // begin
    //     objSuppSelection.Reset;
    //     objSuppSelection.SetRange("Supplier Name", Vendorname);

    //     Filename := Path.GetTempPath() + Path.GetRandomFileName();

    //     if objSuppSelection.FindSet()
    //       then begin
    //         objProcReqs.SetFilter(No, RFQNo);

    //         Report.SaveAsPdf(70002, Filename, objSuppSelection);
    //         FileMode := 4;
    //         FileAccess := 1;

    //         FileStream := _File.Open(Filename, FileMode, FileAccess);

    //         MemoryStream := MemoryStream.MemoryStream();

    //         MemoryStream.SetLength(FileStream.Length);
    //         FileStream.Read(MemoryStream.GetBuffer(), 0, FileStream.Length);

    //         BigText.AddText((Convert.ToBase64String(MemoryStream.GetBuffer())));

    //         MemoryStream.Close();
    //         MemoryStream.Dispose();
    //         FileStream.Close();
    //         FileStream.Dispose();
    //         _File.Delete(Filename);

    //     end
    //     else begin
    //         Error('Error generating report');
    //     end;
    // end;

    procedure fnBLOBRfQDocument(Vendorname: Code[50]; RFQNo: Code[50]; var BigText: BigText)
    var
        Filename: Text[100];
        // Convert: dotnet Convert;
        // Path: dotnet Path;
        // _File: dotnet File;
        //  FileAccess: dotnet FileAccess;

        // FileMode: dotnet FileMode;
        // MemoryStream: dotnet MemoryStream;
        // FileStream: dotnet FileStream;
        Outputstream: OutStream;
    begin
        objSuppSelection.Reset;
        objSuppSelection.SetRange("Supplier Name", Vendorname);

        //Filename := Path.GetTempPath() + Path.GetRandomFileName();

        if objSuppSelection.FindSet()
          then begin
            objProcReqs.SetFilter(No, RFQNo);

            // Report.SaveAsPdf(70002, Filename, objSuppSelection);
            // FileMode := 4;
            // //   FileAccess := 1;

            // // FileStream := _File.Open(Filename, FileMode, FileAccess);

            // MemoryStream := MemoryStream.MemoryStream();

            // MemoryStream.SetLength(FileStream.Length);
            // FileStream.Read(MemoryStream.GetBuffer(), 0, FileStream.Length);

            // BigText.AddText((Convert.ToBase64String(MemoryStream.GetBuffer())));

            // MemoryStream.Close();
            // MemoryStream.Dispose();
            // FileStream.Close();
            // FileStream.Dispose();
            // _File.Delete(Filename);

        end
        else begin
            Error('Error generating report');
        end;
    end;

    procedure fnDownloadRfQPTDoc()
    begin
    end;

    procedure fnSupplierRegistration(businessType: Text; vendorType: Option; ownershipType: Option; industryGroup: Text; postacode: Code[20]; countryofOrigin: Code[20]; companysize: Code[20]; nominalCap: Decimal; dealerType: Option; dateofIncorporation: Date; dateofOps: Date; languageCode: Code[20]; vision: Text; mision: Text; poAddress: Code[20]; locationAddress: Code[50]; postaCity: Text; webUrl: Text; telephoneNo: Code[20]; buildingNo: Code[20]; floorNo: Code[10]; plotNo: Code[10]; streetorRoad: Text; faxNo: Code[20]; maxbizvalue: Decimal; mobileNo: Code[20]; natureofBiz: Code[250]; vendorNo: Code[20]; certofIncopNo: Code[20]; SupplierCategory: Code[50]) insertstatus: Text
    begin
        objVendor.Reset;
        objVendor.SetRange("No.", vendorNo);
        if objVendor.FindSet then begin

            objVendor.SetRange("Registrn Submitted onPortal", true);
            if objVendor.FindSet then begin
                insertstatus := 'danger*You have already submitted your application, consider editing it!';
            end
            else begin
                objVendor."Business Type" := businessType;
                objVendor."Supplier Type" := vendorType;
                objVendor."Dealer Type" := dealerType;
                objVendor."Registration/Incorporation No." := certofIncopNo;
                objVendor."Ownership Type" := ownershipType;
                objVendor."Reg/Incorporation Date" := dateofIncorporation;
                objVendor."Operations Start Date" := dateofOps;
                objVendor."Language Code" := languageCode;
                objVendor."Industry Group" := industryGroup;
                objVendor."Vision Statement" := vision;
                objVendor."Mission Statement" := mision;
                objVendor.Address := poAddress;
                objVendor."Address 2" := locationAddress;
                objVendor."Post Code" := postacode;
                objVendor."Supplier Category" := SupplierCategory;
                objVendor.City := postaCity;
                objVendor."Country/Region Code" := countryofOrigin;
                objVendor."Website Url" := webUrl;
                objVendor.Tel := telephoneNo;
                objVendor."Building/House No" := buildingNo;
                objVendor.Floor := floorNo;
                objVendor."Plot No" := plotNo;
                objVendor.Street := streetorRoad;
                objVendor."Fax No." := faxNo;
                objVendor."Company Size" := companysize;
                objVendor."Nominal Capital LCY" := nominalCap;
                objVendor."Max Value of Business" := maxbizvalue;
                objVendor."Phone No." := mobileNo;
                objVendor."Nature of Business" := natureofBiz;
                if objVendor.Modify(true) then begin
                    insertstatus := 'success*Your information submitted successfully!';
                end else begin
                    insertstatus := 'danger*System Unknown Error Occured!';
                end

            end
        end
        else begin
            insertstatus := 'danger*Vendor does not exist!';
        end
    end;

    procedure fnSupplierCommunicationDetailsRegistration(vendor: Text; tpostcode: Text; tCountryofOrigin: Code[100]; tPoBox: Code[100]; tPhysicalLocation: Text; tPostaCity: Code[100]; tstreetorRoad: Code[100]) insertstatus: Text
    begin
        objVendor.Reset;
        objVendor.SetRange("No.", vendor);
        if objVendor.FindSet then begin
            objVendor.SetRange("Registrn Submitted onPortal", true);
            if objVendor.FindSet then begin
                insertstatus := 'danger*You have already submitted your application, consider editing it!';
            end
            else begin
                objVendor."Post Code" := tpostcode;
                objVendor.Validate("Post Code");
                objVendor."Country/Region Code" := tCountryofOrigin;
                objVendor."Location Code" := tPhysicalLocation;
                objVendor.City := tPostaCity;
                objVendor.Street := tstreetorRoad;
                objVendor.Address := tPoBox;
                objVendor."Address 2" := tPhysicalLocation;
                if objVendor.Modify(true) then begin
                    insertstatus := 'success*Your information submitted successfully!';
                end else begin
                    insertstatus := 'danger*System Unknown Error Occured!';
                end
            end
        end
        else begin
            insertstatus := 'danger*Vendor does not exist!';
        end
    end;

    procedure fnSupplierBusinessProfileRegistration(vendor: Text; tNominalCap: Decimal; tDealerType: Integer; tMaxBizValue: Decimal; tNatureofBz: Text; tIndustryGroup: Code[100]; tOtherGroups: Code[100]) insertstatus: Text
    begin
        objVendor.Reset;
        objVendor.SetRange("No.", vendor);
        if objVendor.FindSet then begin
            objVendor.SetRange("Registrn Submitted onPortal", true);
            if objVendor.FindSet then begin
                insertstatus := 'danger*You have already submitted your application, consider editing it!';
            end
            else begin
                objVendor."Nominal Capital LCY" := tNominalCap;
                objVendor."Max Value of Business" := tMaxBizValue;
                objVendor."Nature of Business" := tNatureofBz;
                objVendor."Industry Group" := tIndustryGroup;
                if objVendor.Modify(true) then begin
                    insertstatus := 'success*Your information submitted successfully!';
                end else begin
                    insertstatus := 'danger*System Unknown Error Occured!';
                end
            end
        end
        else begin
            insertstatus := 'danger*Vendor does not exist!';
        end
    end;

    procedure fnSupplierGeneralDetailsRegistration(ownershipType: Option; vendortype: Option; businesstype: Text; certificatenumber: Code[60]; dateofIncorporation: Date; dateofoperation: Date; languageCode: Code[90]; vendorNo: Code[90]; CountyCode: Code[50]; PrequalificationCategory: Code[250]; tpostcode: Text; tCountryofOrigin: Code[100]; tPoBox: Code[100]; tPhysicalLocation: Text; tPostaCity: Code[100]; tstreetorRoad: Code[100]) insertstatus: Text
    begin
        objVendor.Reset;
        objVendor.SetRange("No.", vendorNo);
        if objVendor.FindSet then begin
            objVendor."Ownership Type" := ownershipType;
            objVendor."Vendor Type" := vendortype;
            ;
            objVendor."Business Type" := businesstype;
            objVendor."Registration/Incorporation No." := certificatenumber;
            objVendor."Reg/Incorporation Date" := dateofIncorporation;
            objVendor."Operations Start Date" := dateofoperation;
            objVendor."Language Code" := languageCode;
            objVendor.County := CountyCode;
            objVendor."Post Code" := tpostcode;
            objVendor.Validate("Post Code");
            objVendor."Country/Region Code" := tCountryofOrigin;
            objVendor."Location Code" := tPhysicalLocation;
            objVendor.City := tPostaCity;
            objVendor.Street := tstreetorRoad;
            objVendor.Address := tPoBox;
            objVendor."Address 2" := tPhysicalLocation;
            if objVendor.Modify() then begin
                insertstatus := 'success*Your information submitted successfully!';
            end else begin
                insertstatus := 'danger*System Unknown Error Occured!';
            end
        end else begin
            insertstatus := 'danger*Your Supplier Account Could not be found';
        end;
    end;

    [NonDebuggable]
    procedure fnInsertBank(vendorNo: Code[20]; bankCode: Code[20]; bankName: Code[100]; currencyCode: Code[20]; bankAccountNo: Code[20]) bankinserted: Text
    begin
        objVendorBank.Reset;
        objVendorBank.SetRange("Vendor No.", vendorNo);
        objVendorBank.SetRange(Code, bankCode);
        if objVendorBank.FindSet then begin
            objVendorBank.Code := bankCode;
            objVendorBank.Name := bankName;
            objVendorBank."Bank Account No." := bankAccountNo;

            if objVendorBank.Modify() then begin
                bankinserted := 'success*You bank account details edited successfully!'
            end else begin
                bankinserted := 'danger*Unknown Error editing!'
            end
        end
        else begin
            objVendorBank.Init;
            objVendorBank."Vendor No." := vendorNo;
            objVendorBank.Code := bankCode;
            objVendorBank.Name := bankName;
            objVendorBank."Bank Account No." := bankAccountNo;
            if objVendorBank.Insert() then begin
                bankinserted := 'success*You bank Account details saved successfully!'
            end else begin
                bankinserted := 'danger*Unknown Error occured!'
            end
        end
    end;

    [NonDebuggable]
    procedure fnInsertBankDetails(vendorNo: Code[30]; bankCode: Code[30]; bankName: Code[100]; currencyCode: Code[30]; bankAccountNo: Code[30]; bankbranchno: Code[30]; phonenumber: Text; country: Code[30]; postcode: Code[50]) bankinserted: Text
    begin
        objVendorBank.Reset;
        objVendorBank.SetRange("Vendor No.", vendorNo);
        objVendorBank.SetRange(Code, bankCode);
        if objVendorBank.FindSet then begin
            objVendorBank.Code := bankCode;
            objVendorBank.Name := bankName;
            objVendorBank."Bank Account No." := bankAccountNo;
            objVendorBank."Currency Code" := currencyCode;
            objVendorBank."Phone No." := phonenumber;
            objVendorBank."Bank Branch No." := bankbranchno;
            objVendorBank."Post Code" := postcode;
            if objVendorBank.Modify(true) then begin
                bankinserted := 'success*You bank account details edited successfully!'
            end else begin
                bankinserted := 'danger*Unknown Error editing!'
            end
        end
        else begin
            objVendorBank.Init;
            objVendorBank."Vendor No." := vendorNo;
            objVendorBank.Code := bankCode;
            objVendorBank.Name := bankName;
            objVendorBank."Bank Account No." := bankAccountNo;
            objVendorBank."Currency Code" := currencyCode;
            objVendorBank."Phone No." := phonenumber;
            objVendorBank."Bank Branch No." := bankbranchno;
            objVendorBank."Post Code" := postcode;
            if objVendorBank.Insert(true) then begin
                bankinserted := 'success*You bank Account details saved successfully!'
            end else begin
                bankinserted := 'danger*Unknown Error occured!'
            end
        end
    end;

    [NonDebuggable]
    procedure fnDeleteBank(vendorNo: Code[20]; bankCode: Code[20]) status: Text
    var
        VendorBankAccount: Record "Vendor Bank Account";
    begin
        VendorBankAccount.Reset;
        VendorBankAccount.SetRange("Vendor No.", vendorNo);
        VendorBankAccount.SetRange(Code, bankCode);
        if objVendorBank.FindSet then begin
            if objVendorBank.Delete(true) then begin
                status := 'success*You bank Account details have been successfully deleted!'
            end else begin
                status := 'danger*You bank Account details could not be deleted!'
            end
        end;
    end;

    procedure fnInsertDirector(vendorNo: Code[20]; phoneNo: Code[20]; ownershippercentage: Decimal; country: Code[20]; email: Text; address: Code[20]; directorFullname: Text[100]; idNumber: Code[30]; citizenType: Option) dirinserted: Text
    begin
        objDirectors.Reset;
        objDirectors.SetRange("Vendor No.", vendorNo);
        objDirectors.SetRange("Nationality ID", idNumber);

        if objDirectors.FindSet then begin
            //modify
            objDirectors.Name := directorFullname;
            objDirectors."Phone No." := phoneNo;
            objDirectors."E-Mail" := email;
            objDirectors."Entity Ownership %" := ownershippercentage;
            objDirectors."Country/Region Code" := country;
            objDirectors.Address := address;
            objDirectors."Citizenship Type" := citizenType;
            if objDirectors.Modify then begin
                dirinserted := 'success*Director edited successfully!';
            end
            else begin
                dirinserted := 'danger*Unknown error while editing!';
            end
        end else begin
            //insert
            objDirectors.Init;
            objDirectors."Vendor No." := vendorNo;
            objDirectors.Name := directorFullname;
            objDirectors."Phone No." := phoneNo;
            objDirectors."E-Mail" := email;
            objDirectors."Nationality ID" := idNumber;
            objDirectors."Entity Ownership %" := ownershippercentage;
            objDirectors."Country/Region Code" := country;
            objDirectors.Address := address;
            objDirectors."Citizenship Type" := citizenType;
            if objDirectors.Insert then begin
                dirinserted := 'success*Director added successfully!';
            end
            else begin
                dirinserted := 'danger*Unknown error while adding!';
            end
        end
    end;

    procedure fnInsertDirectorDetails(vendorNo: Code[20]; directorname: Code[20]; idnumber: Code[20]; citizenship: Integer; ownershippercent: Decimal; phonenumber: Text[100]; address: Code[30]; email: Text) dirinserted: Text
    begin
        objDirectors.Reset;
        objDirectors.SetRange("Vendor No.", vendorNo);
        objDirectors.SetRange("Nationality ID", idnumber);
        if objDirectors.FindSet then begin
            //modify
            objDirectors.Name := directorname;
            objDirectors."Phone No." := phonenumber;
            objDirectors."E-Mail" := email;
            objDirectors."Entity Ownership %" := ownershippercent;
            //objDirectors."Country/Region Code":=country;
            objDirectors.Address := address;
            objDirectors."Citizenship Type" := citizenship;
            if objDirectors.Modify(true) then begin
                dirinserted := 'success*Director edited successfully!';
            end
            else begin
                dirinserted := 'danger*Unknown error while editing!';
            end
        end else begin
            //insert
            objDirectors.Init;
            objDirectors."Vendor No." := vendorNo;
            objDirectors.Name := directorname;
            objDirectors."Phone No." := phonenumber;
            objDirectors."E-Mail" := email;
            objDirectors."Nationality ID" := idnumber;
            objDirectors."Entity Ownership %" := ownershippercent;
            //objDirectors."Country/Region Code":=country;
            objDirectors.Address := address;
            objDirectors."Citizenship Type" := citizenship;
            if objDirectors.Insert(true) then begin
                dirinserted := 'success*Director added successfully!';
            end
            else begin
                dirinserted := 'danger*Unknown error while adding!';
            end
        end
    end;

    [NonDebuggable]
    procedure fnDeleteShareholder(vendorNo: Code[20]; shareholdercode: Integer) status: Text
    var
        VendorBusinessOwner: Record "Vendor Business Owner";
    begin

        VendorBusinessOwner.Reset;
        VendorBusinessOwner.SetRange("Vendor No.", vendorNo);
        VendorBusinessOwner.SetRange("Entry No.", shareholdercode);
        if VendorBusinessOwner.FindSet then begin
            if VendorBusinessOwner.Delete(true) then begin
                status := 'success*You Shareholder details have been successfully deleted!'
            end else begin
                status := 'danger*You Shareholder details could not be deleted!.Kindly Try Again Later'
            end
        end;
    end;

    procedure fnInsertBidResponseSecurityDetails(vendorNo: Code[50]; bidnumber: Code[50]; ifsnumber: Code[50]; formofbidesecurity: Code[50]; issuertype: Integer; securitytype: Integer; gaurantorname: Code[50]; issueroffices: Text; description: Text; securityamount: Decimal; bidsecurityeffectivedate: Date; bidsecurityexpirydate: Date) dirinserted: Text
    begin
        objTenderSecurity.Init;
        objTenderSecurity."Vendor No." := vendorNo;
        objTenderSecurity."No." := bidnumber;
        objTenderSecurity."IFS No" := ifsnumber;
        objTenderSecurity."Form of Security" := ifsnumber;
        objTenderSecurity."Security Amount (LCY)" := securityamount;
        objTenderSecurity."Issuer Institution Type" := issuertype;
        objTenderSecurity."Issuer Registered Offices" := issueroffices;
        objTenderSecurity."Issuer/Guarantor Name" := gaurantorname;
        objTenderSecurity."Bid Security Effective Date" := bidsecurityeffectivedate;
        objTenderSecurity."Bid Security Validity Expiry" := bidsecurityexpirydate;
        objTenderSecurity.Description := description;
        if objTenderSecurity.Insert then begin
            dirinserted := 'success*Director added successfully!';
        end
        else begin
            dirinserted := 'danger*Unknown error while adding!';
        end;
    end;

    procedure fnInsertLitigationH(vendorNo: Code[15]; disputeDescription: Text; categoryofDispute: Option; year: Code[10]; theotherDisputeparty: Text; disputeAmount: Decimal; awardType: Option) insertstatus: Text
    begin
        objLitigHistory.Init;
        objLitigHistory."Vendor No." := vendorNo;
        objLitigHistory."Dispute Matter" := disputeDescription;
        objLitigHistory."Category of Matter" := categoryofDispute;
        objLitigHistory.Year := year;
        objLitigHistory."Other Dispute Party" := theotherDisputeparty;
        objLitigHistory."Dispute Amount LCY" := disputeAmount;
        objLitigHistory."Award Type" := awardType;
        if objLitigHistory.Insert then begin
            insertstatus := 'success*Your litigation history entry saved successfully!';
        end
        else begin
            insertstatus := 'danger*Unknown Error occured while saving!';
        end
    end;

    procedure fnInsertLitigationHistoryDetails(vendorNo: Code[15]; disputeDescription: Text; categoryofDispute: Option; year: Code[10]; theotherDisputeparty: Text; disputeAmount: Decimal; awardType: Option) insertstatus: Text
    begin
        objLitigHistory.Init;
        objLitigHistory."Vendor No." := vendorNo;
        objLitigHistory."Dispute Matter" := disputeDescription;
        objLitigHistory."Category of Matter" := categoryofDispute;
        objLitigHistory.Year := year;
        objLitigHistory."Other Dispute Party" := theotherDisputeparty;
        objLitigHistory."Dispute Amount LCY" := disputeAmount;
        objLitigHistory."Award Type" := awardType;
        if objLitigHistory.Insert then begin
            insertstatus := 'success*Your litigation history entry saved successfully!';
        end
        else begin
            insertstatus := 'danger*Unknown Error occured while saving!';
        end
    end;

    [NonDebuggable]
    procedure fnDeleteLitigationHistoryDetails(vendorNo: Code[20]; litigationCode: Integer) status: Text
    var
        VendorLitigationHistory: Record "Vendor Litigation History";
    begin
        VendorLitigationHistory.Reset;
        VendorLitigationHistory.SetRange("Vendor No.", vendorNo);
        VendorLitigationHistory.SetRange("Entry No.", litigationCode);
        if VendorLitigationHistory.FindSet then begin
            if VendorLitigationHistory.Delete(true) then begin
                status := 'success*Your Litigation History details have been successfully deleted!'
            end else begin
                status := 'danger*Your Litigation History details could not be deleted!'
            end
        end;
    end;

    procedure fnInsertSpecialGrp(vendoNo: Code[10]; specialGrpcatg: Code[20]; certficateNo: Code[20]; certeffectiveDate: Date; certXpiryDate: Date; prodservCategory: Text) inserstatus: Text
    begin
        objVendorSpecGentry.Reset;
        objVendorSpecGentry.SetRange("Vendor No", vendoNo);
        objVendorSpecGentry.SetRange("Certifcate No", certficateNo);
        if objVendorSpecGentry.FindSet then begin
            inserstatus := 'danger*You have already submitted this Certificate';
        end else begin
            objVendorSpecGentry.Init;
            objVendorSpecGentry."Vendor No" := vendoNo;
            objVendorSpecGentry."Certifcate No" := certficateNo;
            objVendorSpecGentry."Vendor Category" := specialGrpcatg;
            objVendorSpecGentry."Products/Service Category" := certficateNo;
            objVendorSpecGentry."Effective Date" := certeffectiveDate;
            objVendorSpecGentry."Certificate Expiry Date" := certXpiryDate;
            objVendorSpecGentry."Products/Service Category" := prodservCategory;
            if objVendorSpecGentry.Insert then begin
                inserstatus := 'success*Your Special Group entry saved successfully!';
            end else begin
                inserstatus := 'danger*Unknown error occured, could not save!';
            end
        end
    end;

    procedure fnInsertPurchaseLinesDetails(vendorNo: Code[10]; bidresponseNumber: Code[50]; itemlinenumber: Integer; itemnumber: Code[10]; costexlvat: Decimal; costinclvat: Decimal) insertstatus: Text
    begin
        objPurhcaseLinesDetails.SetRange("Buy-from Vendor No.", vendorNo);
        objPurhcaseLinesDetails.SetRange("Document No.", bidresponseNumber);
        objPurhcaseLinesDetails.SetRange("Line No.", itemlinenumber);
        if objPurhcaseLinesDetails.FindSet then begin
            objPurhcaseLinesDetails."Amount Including VAT" := costinclvat;
            objPurhcaseLinesDetails."Direct Unit Cost Inc. VAT" := costinclvat;
            objPurhcaseLinesDetails."Direct Unit Cost" := costexlvat;
            objPurhcaseLinesDetails.Amount := costexlvat;
            if objPurhcaseLinesDetails.Modify(true) then begin
                insertstatus := 'success*Your past experience entry saved successfully!';
            end else begin
                insertstatus := 'danger*Unknown error occured!';
            end;
        end;
    end;

    procedure fnInsertPastXep(vendorNo: Code[10]; clientName: Code[50]; address: Code[30]; assignmentProject: Text; projectScope: Text; projectStartDate: Date; projectEndDate: Date; projectValue: Decimal) insertstatus: Text
    begin
        objPastXp.Init;
        objPastXp."Vendor No." := vendorNo;
        objPastXp."Client Name" := clientName;
        objPastXp.Address := address;
        objPastXp."Assignment Name" := assignmentProject;
        objPastXp."Project Scope Summary" := projectScope;
        objPastXp."Assignment Start Date" := projectStartDate;
        objPastXp."Assignment End Date" := projectEndDate;
        objPastXp."Assignment Value LCY" := projectValue;

        if objPastXp.Insert then begin
            insertstatus := 'success*Your past experience entry saved successfully!';
        end else begin
            insertstatus := 'danger*Unknown error occured!';
        end
    end;

    procedure fnInsertPastExperienceDetails(vendorNo: Code[10]; clientName: Code[50]; address: Code[30]; assignmentProject: Text; projectScope: Text; projectStartDate: Date; projectEndDate: Date; projectValue: Decimal) insertstatus: Text
    begin
        objPastXp.Init;
        objPastXp."Vendor No." := vendorNo;
        objPastXp."Client Name" := clientName;
        objPastXp.Address := address;
        objPastXp."Assignment Name" := assignmentProject;
        objPastXp."Project Scope Summary" := projectScope;
        objPastXp."Assignment Start Date" := projectStartDate;
        objPastXp."Assignment End Date" := projectEndDate;
        objPastXp."Assignment Value LCY" := projectValue;
        if objPastXp.Insert then begin
            insertstatus := 'success*Your past experience entry saved successfully!';
        end else begin
            insertstatus := 'danger*Unknown error occured!';
        end
    end;

    [NonDebuggable]
    procedure fnDeletePastExperienceDetails(vendorNo: Code[20]; experienceCode: Integer) status: Text
    var
        VendorPastExperience: Record "Vendor Past Experience";
    begin
        VendorPastExperience.Reset;
        VendorPastExperience.SetRange("Vendor No.", vendorNo);
        VendorPastExperience.SetRange("Entry No.", experienceCode);
        if VendorPastExperience.FindSet then begin
            if VendorPastExperience.Delete(true) then begin
                status := 'success*Your Past Experience details have been successfully deleted!'
            end else begin
                status := 'danger*Your Past Experience details could not be deleted!'
            end
        end;
    end;

    [NonDebuggable]
    procedure fnDeleteStaffExperience(vendorNo: Code[20]; staffCode: Code[50]) status: Text
    var
        VendorProfessionalStaff: Record "Vendor Professional Staff";
    begin

        VendorProfessionalStaff.Reset;
        VendorProfessionalStaff.SetRange("Vendor No.", vendorNo);
        VendorProfessionalStaff.SetRange("Staff Number", staffCode);
        if VendorProfessionalStaff.FindSet then begin
            if VendorProfessionalStaff.Delete(true) then begin
                status := 'success*Your Past Experience details have been successfully deleted!'
            end else begin
                status := 'danger*Your Past Experience details could not be deleted!'
            end
        end;
    end;

    procedure fnInsertBalanceSheet(yearCode: Code[10]; totalCurrentAssets: Decimal; totalFixedAssets: Decimal; totalCurrentLiability: Decimal; totalLongtermliabilty: Decimal; totalOwnersequity: Decimal; vendorNo: Code[20]) inserstatus: Text
    begin
        objBalanceSheet.Reset;
        objBalanceSheet.SetRange("Vendor No.", vendorNo);
        objBalanceSheet.SetRange("Audit Year Code Reference", yearCode);
        if objBalanceSheet.FindSet then begin
            objBalanceSheet.Reset;
            objBalanceSheet."Vendor No." := vendorNo;
            objBalanceSheet."Audit Year Code Reference" := yearCode;
            objBalanceSheet."Current Assets (LCY)" := totalCurrentAssets;
            objBalanceSheet."Fixed Assets (LCY)" := totalFixedAssets;
            objBalanceSheet."Current Liabilities (LCY)" := totalCurrentLiability;
            objBalanceSheet."Long-term Liabilities (LCY)" := totalLongtermliabilty;
            objBalanceSheet."Owners Equity (LCY)" := totalOwnersequity;
            if objBalanceSheet.Modify(true) then begin
                inserstatus := 'success*You have submitted this entry successfully!';
            end;
        end else begin
            objBalanceSheet.Init;
            objBalanceSheet."Vendor No." := vendorNo;
            objBalanceSheet."Audit Year Code Reference" := yearCode;
            objBalanceSheet."Current Assets (LCY)" := totalCurrentAssets;
            objBalanceSheet."Fixed Assets (LCY)" := totalFixedAssets;
            objBalanceSheet."Current Liabilities (LCY)" := totalCurrentLiability;
            objBalanceSheet."Long-term Liabilities (LCY)" := totalLongtermliabilty;
            objBalanceSheet."Owners Equity (LCY)" := totalOwnersequity;
            if objBalanceSheet.Insert(true) then begin
                inserstatus := 'success*You have submitted this entry successfully!';
            end else begin
                inserstatus := 'danger*Unknown Error Occured!';
            end
        end
    end;

    procedure fnBidResponseInsertBalanceSheet(bidresponseNumber: Code[50]; yearCode: Code[10]; totalCurrentAssets: Decimal; totalFixedAssets: Decimal; totalCurrentLiability: Decimal; totalLongtermliabilty: Decimal; totalOwnersequity: Decimal; vendorNo: Code[20]) inserstatus: Text
    begin
        objBidResponseBalanceSheet.Reset;
        objBidResponseBalanceSheet.SetRange("Vendor No.", vendorNo);
        objBidResponseBalanceSheet.SetRange("Audit Year Code Reference", yearCode);
        objBidResponseBalanceSheet.SetRange("No.", bidresponseNumber);
        if objBidResponseBalanceSheet.FindSet then begin
            objBidResponseBalanceSheet.Reset;
            objBidResponseBalanceSheet."No." := bidresponseNumber;
            objBidResponseBalanceSheet."Vendor No." := vendorNo;
            objBidResponseBalanceSheet."Audit Year Code Reference" := yearCode;
            objBidResponseBalanceSheet."Current Assets (LCY)" := totalCurrentAssets;
            objBidResponseBalanceSheet."Fixed Assets (LCY)" := totalFixedAssets;
            objBidResponseBalanceSheet."Current Liabilities (LCY)" := totalCurrentLiability;
            objBidResponseBalanceSheet."Long-term Liabilities (LCY)" := totalLongtermliabilty;
            objBidResponseBalanceSheet."Owners Equity (LCY)" := totalOwnersequity;
            if objBidResponseBalanceSheet.Modify(true) then begin
                inserstatus := 'success*You have submitted this entry successfully!';
            end;
        end else begin
            objBidResponseBalanceSheet.Init;
            objBidResponseBalanceSheet."No." := bidresponseNumber;
            objBidResponseBalanceSheet."Vendor No." := vendorNo;
            objBidResponseBalanceSheet."Audit Year Code Reference" := yearCode;
            objBidResponseBalanceSheet."Current Assets (LCY)" := totalCurrentAssets;
            objBidResponseBalanceSheet."Fixed Assets (LCY)" := totalFixedAssets;
            objBidResponseBalanceSheet."Current Liabilities (LCY)" := totalCurrentLiability;
            objBidResponseBalanceSheet."Long-term Liabilities (LCY)" := totalLongtermliabilty;
            objBidResponseBalanceSheet."Owners Equity (LCY)" := totalOwnersequity;
            if objBidResponseBalanceSheet.Insert then begin
                inserstatus := 'success*You have submitted this entry successfully!';
            end else begin
                inserstatus := 'danger*Unknown Error Occured!';
            end
        end
    end;

    [NonDebuggable]
    procedure fnDeleteBalanceSheetDetails(vendorNo: Code[20]; yearcode: Code[20]) status: Text
    var
        VendorBalanceSheet: Record "Vendor Audited Balance Sheet";
    begin

        VendorBalanceSheet.Reset;
        VendorBalanceSheet.SetRange("Vendor No.", vendorNo);
        VendorBalanceSheet.SetRange("Audit Year Code Reference", yearcode);
        if VendorBalanceSheet.FindSet then begin
            if VendorBalanceSheet.Delete(true) then begin
                status := 'success*Your Balance Sheet details have been successfully deleted!'
            end else begin
                status := 'danger*Your Balance Sheet details could not be deleted!'
            end
        end;
    end;

    procedure fnEditBidResponseInsertBalanceSheet(bidresponseNumber: Code[50]; yearCode: Code[10]; totalCurrentAssets: Decimal; totalFixedAssets: Decimal; totalCurrentLiability: Decimal; totalLongtermliabilty: Decimal; totalOwnersequity: Decimal; vendorNo: Code[20]) inserstatus: Text
    begin
        objBidResponseBalanceSheet.Reset;
        objBidResponseBalanceSheet.SetRange("Vendor No.", vendorNo);
        objBidResponseBalanceSheet.SetRange("Audit Year Code Reference", yearCode);
        objBidResponseBalanceSheet.SetRange("No.", bidresponseNumber);
        if objBidResponseBalanceSheet.FindSet then begin
            objBidResponseBalanceSheet.Reset;
            objBidResponseBalanceSheet."No." := bidresponseNumber;
            objBidResponseBalanceSheet."Vendor No." := vendorNo;
            objBidResponseBalanceSheet."Audit Year Code Reference" := yearCode;
            objBidResponseBalanceSheet."Current Assets (LCY)" := totalCurrentAssets;
            objBidResponseBalanceSheet."Fixed Assets (LCY)" := totalFixedAssets;
            objBidResponseBalanceSheet."Current Liabilities (LCY)" := totalCurrentLiability;
            objBidResponseBalanceSheet."Long-term Liabilities (LCY)" := totalLongtermliabilty;
            objBidResponseBalanceSheet."Owners Equity (LCY)" := totalOwnersequity;
            if objBidResponseBalanceSheet.Modify(true) then begin
                inserstatus := 'success*You have submitted this entry successfully!';
            end else begin
                inserstatus := 'danger*Unknown Error Occured!';
            end
        end
    end;

    procedure fnInsertIncomestatement(yearCode: Code[10]; totalRevenue: Decimal; totaCostofsoldgoods: Decimal; totaOperatingexpenses: Decimal; othernoneOperevenue: Decimal; interestExpense: Decimal; vendorNo: Code[20]) inserstatus: Text
    begin
        objIncomeStatement.Reset;
        objIncomeStatement.SetRange("Vendor No.", vendorNo);
        objIncomeStatement.SetRange("Audit Year Code Reference", yearCode);
        if objIncomeStatement.FindSet then begin
            objIncomeStatement.Reset;
            objIncomeStatement."Vendor No." := vendorNo;
            objIncomeStatement."Audit Year Code Reference" := yearCode;
            objIncomeStatement."Total Revenue (LCY)" := totalRevenue;
            objIncomeStatement."Total COGS (LCY)" := totaCostofsoldgoods;
            objIncomeStatement."Total Operating Expenses (LCY)" := totaOperatingexpenses;
            objIncomeStatement."Other Non-operating Re/Exp LCY" := othernoneOperevenue;
            objIncomeStatement."Interest Expense (LCY)" := interestExpense;
            if objIncomeStatement.Modify(true) then begin
                inserstatus := 'success*You have submitted this entry successfully!';
            end;
        end else begin
            objIncomeStatement.Init;
            objIncomeStatement."Vendor No." := vendorNo;
            objIncomeStatement."Audit Year Code Reference" := yearCode;
            objIncomeStatement."Total Revenue (LCY)" := totalRevenue;
            objIncomeStatement."Total COGS (LCY)" := totaCostofsoldgoods;
            objIncomeStatement."Total Operating Expenses (LCY)" := totaOperatingexpenses;
            objIncomeStatement."Other Non-operating Re/Exp LCY" := othernoneOperevenue;
            objIncomeStatement."Interest Expense (LCY)" := interestExpense;
            if objIncomeStatement.Insert(true) then begin
                inserstatus := 'success*You have submitted this entry successfully!';
            end else begin
                inserstatus := 'danger*Unknown Error Occured!';
            end
        end
    end;

    [NonDebuggable]
    procedure fnDeleteIncomeStatementDetails(vendorNo: Code[20]; yearcode: Code[20]) status: Text
    var
        VendorIncomeStatement: Record "Vendor Audited Income Statemen";
    begin

        VendorIncomeStatement.Reset;
        VendorIncomeStatement.SetRange("Vendor No.", vendorNo);
        VendorIncomeStatement.SetRange("Audit Year Code Reference", yearcode);
        if VendorIncomeStatement.FindSet then begin
            if VendorIncomeStatement.Delete(true) then begin
                status := 'success*Your Income Statement details have been successfully deleted!'
            end else begin
                status := 'danger*Your Income Statement details could not be deleted!'
            end
        end;
    end;

    procedure fnEditInsertIncomestatementDetails(bidresponsenumber: Code[20]; yearCode: Code[10]; totalRevenue: Decimal; totaCostofsoldgoods: Decimal; totaOperatingexpenses: Decimal; othernoneOperevenue: Decimal; interestExpense: Decimal; vendorNo: Code[20]) inserstatus: Text
    begin
        objBidResponseIncomeStatement.Reset;
        objBidResponseIncomeStatement.SetRange("Vendor No.", vendorNo);
        objBidResponseIncomeStatement.SetRange("Audit Year Code Reference", yearCode);
        objBidResponseIncomeStatement.SetRange("No.", bidresponsenumber);
        if objBidResponseIncomeStatement.FindSet then begin
            objBidResponseIncomeStatement."Vendor No." := vendorNo;
            objBidResponseIncomeStatement."Audit Year Code Reference" := yearCode;
            objBidResponseIncomeStatement."Total Revenue (LCY)" := totalRevenue;
            objBidResponseIncomeStatement."Total COGS (LCY)" := totaCostofsoldgoods;
            objBidResponseIncomeStatement."Total Operating Expenses (LCY)" := totaOperatingexpenses;
            objBidResponseIncomeStatement."Other Non-operating Re/Exp LCY" := othernoneOperevenue;
            if objBidResponseIncomeStatement.Modify(true) then begin
                inserstatus := 'success*You have submitted this entry successfully!';
            end else begin
                inserstatus := 'danger*Unknown Error Occured!';
            end;
        end;
    end;

    procedure fnBidResponseInsertIncomestatement(bidresponseNumber: Code[30]; yearCode: Code[10]; totalRevenue: Decimal; totaCostofsoldgoods: Decimal; totaOperatingexpenses: Decimal; othernoneOperevenue: Decimal; interestExpense: Decimal; vendorNo: Code[20]) inserstatus: Text
    begin

        objBidResponseIncomeStatement.Reset;
        objBidResponseIncomeStatement.SetRange("Vendor No.", vendorNo);
        objBidResponseIncomeStatement.SetRange("Audit Year Code Reference", yearCode);
        objBidResponseIncomeStatement.SetRange("No.", bidresponseNumber);
        if objBidResponseIncomeStatement.FindSet then begin
            objBidResponseIncomeStatement.Reset;
            objBidResponseIncomeStatement."No." := bidresponseNumber;
            objBidResponseIncomeStatement."Vendor No." := vendorNo;
            objBidResponseIncomeStatement."Audit Year Code Reference" := yearCode;
            objBidResponseIncomeStatement."Total Revenue (LCY)" := totalRevenue;
            objBidResponseIncomeStatement."Total COGS (LCY)" := totaCostofsoldgoods;
            objBidResponseIncomeStatement."Total Operating Expenses (LCY)" := totaOperatingexpenses;
            objBidResponseIncomeStatement."Other Non-operating Re/Exp LCY" := othernoneOperevenue;
            objBidResponseIncomeStatement."Interest Expense (LCY)" := interestExpense;
            if objBidResponseIncomeStatement.Modify(true) then begin
                inserstatus := 'success*You have submitted this entry successfully!';
            end;
        end else begin
            objBidResponseIncomeStatement.Init;
            objBidResponseIncomeStatement."No." := bidresponseNumber;
            objBidResponseIncomeStatement."Vendor No." := vendorNo;
            objBidResponseIncomeStatement."Audit Year Code Reference" := yearCode;
            objBidResponseIncomeStatement."Total Revenue (LCY)" := totalRevenue;
            objBidResponseIncomeStatement."Total COGS (LCY)" := totaCostofsoldgoods;
            objBidResponseIncomeStatement."Total Operating Expenses (LCY)" := totaOperatingexpenses;
            objBidResponseIncomeStatement."Other Non-operating Re/Exp LCY" := othernoneOperevenue;
            objBidResponseIncomeStatement."Interest Expense (LCY)" := interestExpense;
            if objBidResponseIncomeStatement.Insert(true) then begin
                inserstatus := 'success*You have submitted this entry successfully!';
            end else begin
                inserstatus := 'danger*Unknown Error Occured!';
            end
        end
    end;

    [NonDebuggable]
    procedure fnDeleteBidResponsIncomeStatamentDetails(vendorNo: Code[20]; yearcode: Code[20]; responsenumber: Code[40]) status: Text
    var
        VendoIncomeStatement: Record "Bid Audited Income Statement";
    begin

        VendoIncomeStatement.Reset;
        VendoIncomeStatement.SetRange("Vendor No.", vendorNo);
        VendoIncomeStatement.SetRange("No.", responsenumber);
        VendoIncomeStatement.SetRange("Audit Year Code Reference", yearcode);
        if VendoIncomeStatement.FindSet then begin
            if VendoIncomeStatement.Delete(true) then begin
                status := 'success*Your Balance Sheet details have been successfully deleted!'
            end else begin
                status := 'danger*Your Balance Sheet details could not be deleted!'
            end
        end;
    end;

    [NonDebuggable]
    procedure fnDeleteBidResponsBalanceSheetDetails(vendorNo: Code[20]; yearcode: Code[20]; responsenumber: Code[40]) status: Text
    var
        VendorBalanceSheet: Record "Bid Audited Balance Sheet";
    begin

        VendorBalanceSheet.Reset;
        VendorBalanceSheet.SetRange("Vendor No.", vendorNo);
        VendorBalanceSheet.SetRange("No.", responsenumber);
        VendorBalanceSheet.SetRange("Audit Year Code Reference", yearcode);
        if VendorBalanceSheet.FindSet then begin
            if VendorBalanceSheet.Delete(true) then begin
                status := 'success*Your Balance Sheet details have been successfully deleted!'
            end else begin
                status := 'danger*Your Balance Sheet details could not be deleted!'
            end
        end;
    end;

    [NonDebuggable]
    procedure fnDeleteBidResponsPastExperienceDetails(vendorNo: Code[20]; responsenumber: Code[40]) status: Text
    var
        VendorPastExperience: Record "Bid Past Experience";
    begin

        VendorPastExperience.Reset;
        VendorPastExperience.SetRange("Vendor No.", vendorNo);
        VendorPastExperience.SetRange("No.", responsenumber);
        if VendorPastExperience.FindSet then begin
            if VendorPastExperience.Delete(true) then begin
                status := 'success*Your Past Experience details have been successfully deleted!'
            end else begin
                status := 'danger*Your Past Experience details could not be deleted!'
            end
        end;
    end;

    [NonDebuggable]
    procedure fnDeleteBidResponTenderSecurity(vendorNo: Code[20]; responsenumber: Code[40]; securityid: Integer) status: Text
    var
        TenderBidSecurity: Record "Bid_Contract Security Register";
    begin

        TenderBidSecurity.Reset;
        TenderBidSecurity.SetRange("Vendor No.", vendorNo);
        TenderBidSecurity.SetRange("No.", responsenumber);
        TenderBidSecurity.SetRange("Security ID", securityid);
        if TenderBidSecurity.FindSet then begin
            if TenderBidSecurity.Delete(true) then begin
                status := 'success*Your Tender Security details have been successfully deleted!'
            end else begin
                status := 'danger*Your Tender Security details could not be deleted!'
            end
        end;
    end;

    procedure fnInsertFiledetails(vendorNo: Code[30]; procDoctype: Code[250]; docdescription: Text; certNo: Code[100]; issuedDate: Date; expiryDate: Date; fileName: Text) insertstatus: Text
    begin
        objFiledUploads.Init;
        objFiledUploads."Vendor No" := vendorNo;
        objFiledUploads."Procurement Document Type ID" := procDoctype;
        objFiledUploads.Description := docdescription;
        objFiledUploads."Certificate No." := certNo;
        objFiledUploads."Date Filed" := Today;
        objFiledUploads."Issue Date" := issuedDate;
        objFiledUploads."Expiry Date" := expiryDate;
        objFiledUploads."File Name" := fileName;
        objFiledUploads."Procurement Process" := objFiledUploads."procurement process"::Registration;
        if objFiledUploads.Insert(true) then begin
            insertstatus := 'success*Document saved successfully!';
        end
        else begin
            insertstatus := 'danger*Error occured!';
        end
    end;

    procedure fnBidResponsePastExperience(bidresponseNumber: Code[30]; clientname: Code[70]; clientaddresss: Text; phonenumber: Text; county: Text; email: Text; projectscope: Text; projectname: Text; contractref: Code[80]; assignmentvalue: Decimal; assignmentstatus: Integer; vendorNo: Code[20]) inserstatus: Text
    begin

        objPastExperience.Init;
        objPastExperience."No." := bidresponseNumber;
        objPastExperience."Vendor No." := vendorNo;
        objPastExperience."Client Name" := clientname;
        objPastExperience.Address := clientaddresss;
        objPastExperience."Phone No." := phonenumber;
        objPastExperience.County := county;
        objPastExperience."E-Mail" := email;
        objPastExperience."Project Scope Summary" := projectscope;
        objPastExperience."Assignment/Project Name" := projectname;
        objPastExperience."Contract Ref No" := contractref;
        objPastExperience."Assignment Value LCY" := assignmentvalue;
        objPastExperience."Assignment Status" := assignmentstatus;
        if objPastExperience.Insert then begin
            inserstatus := 'success*You have submitted this entry successfully!';
        end else begin
            inserstatus := 'danger*Unknown Error Occured!';
        end;
    end;

    procedure fnInsertStaffEntry(vendorNo: Code[12]; staffName: Text; profession: Text; designation: Text; phoneNumber: Code[15]; nationality: Code[30]; dateofBirth: Date; email: Text; joiningDate: Date; yearsWithFirm: Decimal; staffNumber: Code[20]) inserstatus: Text
    begin
        objProfstaff.SetRange("Vendor No.", vendorNo);
        objProfstaff.SetRange("Staff Number", staffNumber);
        if objProfstaff.FindSet then begin
            objProfstaff.Reset;
            objProfstaff."Vendor No." := vendorNo;
            objProfstaff."Staff Name" := staffName;
            objProfstaff."Staff Number" := staffNumber;
            objProfstaff.Proffesion := profession;
            objProfstaff."Current Designation" := designation;
            objProfstaff."Phone No." := phoneNumber;
            objProfstaff."Country/Region Code" := nationality;
            objProfstaff."Date of Birth" := dateofBirth;
            objProfstaff."E-Mail" := email;
            objProfstaff."Joining Date" := joiningDate;
            objProfstaff."Years With the Firm" := yearsWithFirm;
            if objProfstaff.Modify(true) then begin
                inserstatus := 'success*Staff entry saved successfully!';
            end;
        end else begin
            objProfstaff.Init;
            objProfstaff."Vendor No." := vendorNo;
            objProfstaff."Staff Name" := staffName;
            objProfstaff."Staff Number" := staffNumber;
            objProfstaff.Proffesion := profession;
            objProfstaff."Current Designation" := designation;
            objProfstaff."Phone No." := phoneNumber;
            objProfstaff."Country/Region Code" := nationality;
            objProfstaff."Date of Birth" := dateofBirth;
            objProfstaff."E-Mail" := email;
            objProfstaff."Joining Date" := joiningDate;
            objProfstaff."Years With the Firm" := yearsWithFirm;
            if objProfstaff.Insert then begin
                inserstatus := 'success*Staff entry saved successfully!';
            end
            else begin
                inserstatus := 'danger*Unknown error occured!'
            end
        end
    end;

    procedure fnInsertStaffQlfEntry(vendorNo: Code[12]; staffNIDorNumber: Code[20]; qualifCategory: Option; qualifcName: Text; institution: Text; startYear: Code[10]; endYear: Code[10]; outstandingAchievement: Text) inserstatus: Text
    begin
        objStaffQualif.Init;
        objStaffQualif."Vendor No" := vendorNo;
        objStaffQualif."Staff Id" := staffNIDorNumber;
        objStaffQualif."Qualification Category" := qualifCategory;
        objStaffQualif."Qualification Name" := qualifcName;
        objStaffQualif.Institution := institution;
        objStaffQualif."Start Year" := startYear;
        objStaffQualif."End Year" := endYear;
        objStaffQualif."Outstanding Achievements" := outstandingAchievement;
        if objStaffQualif.Insert then begin
            inserstatus := 'success*Staff qualification saved successfully!';
        end
        else begin
            inserstatus := 'danger*Unknown error occured!'
        end
    end;

    procedure fnInsertStaffXPrEntry(vendorNo: Code[12]; staffNIDorNumber: Code[20]; xPrCategory: Option; xPrSummarry: Text; assignmentDescription: Text; startYear: Code[10]; endYear: Code[10]; yrsofXpr: Decimal) inserstatus: Text
    begin
        objStaffXP.Init;
        objStaffXP."Vendor No" := vendorNo;
        objStaffXP."Staff ID" := staffNIDorNumber;
        objStaffXP."Experience Category" := xPrCategory;
        objStaffXP."Experience Summary" := xPrSummarry;
        objStaffXP."Assignment Description" := assignmentDescription;
        objStaffXP."Start Year" := startYear;
        objStaffXP."End Year" := endYear;
        objStaffXP."Years of Experience" := yrsofXpr;
        if objStaffXP.Insert then begin
            inserstatus := 'success*Staff Experience saved successfully!';
        end
        else begin
            inserstatus := 'danger*Unknown error occured!'
        end
    end;

    procedure fnCompleteSupplierReg(vendorNo: Code[20]) insertstatus: Text
    begin
        objVendor.Reset;
        objVendor.SetRange("No.", vendorNo);
        if objVendor.FindSet then begin
            objVendor."Registrn Submitted onPortal" := true;
            if objVendor.Modify() then begin
                insertstatus := 'success*You have successfully submitted your registration, kindly wait for Kerra to review and communicate to you!';
            end
            else begin
                insertstatus := 'danger*Unknown error Occured!';
            end
        end
        else begin

        end
    end;

    procedure fnGetOwnerPercentage(vendorNo: Code[10]) percentage: Text
    var
        accruedpercentage: Decimal;
    begin
        objDirectors.Reset;
        objDirectors.SetRange("Vendor No.", vendorNo);
        objDirectors.CalcSums("Entity Ownership %");

        accruedpercentage := objDirectors."Entity Ownership %";
        if accruedpercentage > 100 then begin
            percentage := 'danger*Ownership percentage cannot go beyond 100% by ' + '' + Format(-1 * (100 - accruedpercentage)) + '%';
        end
        else begin
            percentage := 'success*Remaining ownership percentage is ' + '' + Format((100 - accruedpercentage));
        end
    end;

    procedure fnInsertRFIresponseHeader(vendorNo: Code[20]; rfiDocumentNo: Code[12]) insertstatus: Text
    var
        rfiApplNo: Code[12];
    begin
        objRFIResponse.Reset;
        objRFIResponse.SetRange("Vendor No.", vendorNo);
        objRFIResponse.SetRange("RFI Document No.", rfiDocumentNo);
        objRFIResponse.SetRange("Document Type", objRFIResponse."document type"::"IFP Response");
        if objRFIResponse.FindSet then begin
            //edit entry
            insertstatus := 'danger*' + fnGetLastDocumentNo(vendorNo, rfiDocumentNo);
        end
        else begin
            //fresh insert
            objRFIResponse.Init;
            objRFIResponse."Document Type" := objRFIResponse."document type"::"IFP Response";

            ProcurementSetup.Get;
            if objRFIResponse."Document Type" = objRFIResponse."document type"::"IFP Response" then begin
                ProcurementSetup.TestField("IFP Response Nos");

                //NoMgt.InitSeries(ProcurementSetup."IFP Response Nos", objRFIResponse."No. Series", 0D, objRFIResponse."Document No.", objRFIResponse."No. Series");
            end;

            objRFIResponse."RFI Document No." := rfiDocumentNo;
            objRFIResponse."Document Date" := Today;
            objRFIResponse."Vendor No." := vendorNo;
            objRFIResponse."Document Status" := objRFIResponse."document status"::Draft;
            objRFIResponse.Validate("Vendor No.");
            if objRFIResponse.Insert() then
                insertstatus := 'success*' + fnGetLastDocumentNo(vendorNo, rfiDocumentNo)
            else
                insertstatus := 'danger*Unknown error occured!';
        end
    end;

    procedure fnGetLastDocumentNo(vendorNo: Code[20]; rfiDocumentNo: Code[12]) insertstatus: Text
    var
        rfiApplNo: Code[12];
        EprocurementStatistics: Record "Eprocurement Statistics";
    begin
        objRFIResponse.Reset;
        objRFIResponse.SetRange("Vendor No.", vendorNo);
        objRFIResponse.SetRange("RFI Document No.", rfiDocumentNo);
        objRFIResponse.SetRange("Document Type", objRFIResponse."document type"::"IFP Response");
        if objRFIResponse.FindLast then begin
            rfiApplNo := objRFIResponse."Document No.";
            insertstatus := rfiApplNo;
        end
        else begin
            insertstatus := 'danger*not found!';
        end
    end;

    procedure fnInsertRFIResponseLines(documentNo: Code[30]; procurementCategory: Code[30]; rfiDocumentNo: Code[30]; vendorNo: Code[30]) insertstatus: Text
    var
        EprocurementStatistics: Record "Eprocurement Statistics";
    begin
        objIFPResponseLine.Reset;
        objIFPResponseLine.SetRange("Procurement Category", procurementCategory);
        objIFPResponseLine.SetRange("Document Type", objIFPResponseLine."document type"::"IFP Response");
        objIFPResponseLine.SetRange("RFI Document No.", rfiDocumentNo);
        //objIFPResponseLine."Document No.":=documentNo;
        objIFPResponseLine.SetRange("Document No.", documentNo);
        objIFPResponseLine.SetRange("Vendor No.", vendorNo);
        if objIFPResponseLine.FindSet then begin
            objIFPResponseLine."Document No." := documentNo;
            objIFPResponseLine."Vendor No." := vendorNo;
            objIFPResponseLine."RFI Document No." := rfiDocumentNo;
            if objIFPResponseLine.Modify(true) then begin
                EprocurementStatistics.Reset;
                EprocurementStatistics.SetRange("Vendor No", vendorNo);
                EprocurementStatistics.SetRange("Document No", rfiDocumentNo);
                EprocurementStatistics.SetRange("Procurement Process", EprocurementStatistics."procurement process"::Prequalification);
                if EprocurementStatistics.FindSet then begin
                    EprocurementStatistics.Step := 'Categories Section';
                    EprocurementStatistics."Last Modified Date" := CurrentDatetime;
                    EprocurementStatistics.Modify(true);
                end else begin
                    EprocurementStatistics.Init;
                    EprocurementStatistics."Vendor No" := vendorNo;
                    EprocurementStatistics.Validate("Vendor No");
                    EprocurementStatistics."Document No" := rfiDocumentNo;
                    EprocurementStatistics."Procurement Process" := EprocurementStatistics."procurement process"::Prequalification;
                    EprocurementStatistics.Step := 'Categories Section';
                    EprocurementStatistics."Last Modified Date" := CurrentDatetime;
                    EprocurementStatistics.Insert(true);
                end;
                insertstatus := 'success*Item successfully modified!';
            end;
        end else begin
            objIFPResponseLine.Init;
            objIFPResponseLine."Document Type" := objIFPResponseLine."document type"::"IFP Response";
            objIFPResponseLine."Document No." := documentNo;
            objIFPResponseLine."RFI Document No." := rfiDocumentNo;
            objIFPResponseLine."Procurement Category" := procurementCategory;
            objIFPResponseLine.Validate("Procurement Category");
            objIFPResponseLine."Vendor No." := vendorNo;
            if objIFPResponseLine.Insert(true) then begin
                EprocurementStatistics.Reset;
                EprocurementStatistics.SetRange("Vendor No", vendorNo);
                EprocurementStatistics.SetRange("Document No", rfiDocumentNo);
                EprocurementStatistics.SetRange("Procurement Process", EprocurementStatistics."procurement process"::Prequalification);
                if EprocurementStatistics.FindSet then begin
                    EprocurementStatistics.Step := 'Categories Section';
                    EprocurementStatistics."Last Modified Date" := CurrentDatetime;
                    EprocurementStatistics.Modify(true);
                end else begin
                    EprocurementStatistics.Init;
                    EprocurementStatistics."Vendor No" := vendorNo;
                    EprocurementStatistics.Validate("Vendor No");
                    EprocurementStatistics."Document No" := rfiDocumentNo;
                    EprocurementStatistics."Procurement Process" := EprocurementStatistics."procurement process"::Prequalification;
                    EprocurementStatistics.Step := 'Categories Section';
                    EprocurementStatistics."Last Modified Date" := CurrentDatetime;
                    EprocurementStatistics.Insert(true);
                end;
                insertstatus := 'success*Item successfully inserted!'
            end else begin
                insertstatus := 'danger*Unknown error while saving!';
            end;
        end;
    end;

    procedure fnInsertRFIResponseLinesDetails(documentNo: Code[30]; procurementCategory: Code[30]; rfiDocumentNo: Code[30]; vendorNo: Code[30]) insertstatus: Text
    begin
        objIFPResponseLine.Reset;
        objIFPResponseLine.SetRange("Procurement Category", procurementCategory);
        objIFPResponseLine.SetRange("RFI Document No.", rfiDocumentNo);
        objIFPResponseLine.SetRange("Vendor No.", vendorNo);

        if objIFPResponseLine.FindSet then begin
            //just modify
            objIFPResponseLine."Document Type" := objIFPResponseLine."document type"::"IFP Response";
            objIFPResponseLine."Document No." := documentNo;
            if objIFPResponseLine.Modify then
                insertstatus := 'success*Item successfully modified!'
            else
                insertstatus := 'danger*Unknown error while modifying!';
        end else begin
            objIFPResponseLine.Init;
            objIFPResponseLine."Document Type" := objIFPResponseLine."document type"::"IFP Response";
            objIFPResponseLine."Document No." := documentNo;
            objIFPResponseLine."RFI Document No." := rfiDocumentNo;
            objIFPResponseLine."Procurement Category" := procurementCategory;
            objIFPResponseLine.Validate("Procurement Category");
            objIFPResponseLine."Vendor No." := vendorNo;

            if objIFPResponseLine.Insert then
                insertstatus := 'success*Item successfully inserted!'
            else
                insertstatus := 'danger*Unknown error while saving!';

        end
    end;

    procedure fnSubmitResponseFinal(vendorNo: Code[20]; rfiDocumentNo: Code[12]; repFullname: Text; repDesignation: Text; rfiApplNo: Code[10]) insertstatus: Text
    begin
        objRFIResponse.Reset;
        objRFIResponse.SetRange("Vendor No.", vendorNo);
        objRFIResponse.SetRange("RFI Document No.", rfiDocumentNo);
        objRFIResponse.SetRange("Document No.", rfiApplNo);
        objRFIResponse.SetRange("Document Type", objRFIResponse."document type"::"IFP Response");
        if objRFIResponse.FindSet then begin
            //modify entry
            objRFIResponse."Vendor Representative Name" := repFullname;
            objRFIResponse."Vendor Repr Designation" := repDesignation;
            objRFIResponse."Document Status" := objRFIResponse."document status"::Submitted;
            if objRFIResponse.Modify() then
                insertstatus := 'success*You have successfully submitted your response'
            else
                insertstatus := 'danger*Unknown error occured!';
        end
        else begin
            insertstatus := 'danger*error occured,call the office!';
        end
    end;

    procedure fnPrequalificationResponseDetails(vendorNo: Code[20]; rfiDocumentNo: Code[12]; repFullname: Text; repDesignation: Text; rfiAppliNo: Code[50]) insertstatus: Text
    var
        EprocurementStatistics: Record "Eprocurement Statistics";
    begin
        objRFIResponse.Reset;
        objRFIResponse.SetRange("Vendor No.", vendorNo);
        objRFIResponse.SetRange("RFI Document No.", rfiDocumentNo);
        objRFIResponse.SetRange("Document No.", rfiAppliNo);
        objRFIResponse.SetRange("Document Type", objRFIResponse."document type"::"IFP Response");
        if objRFIResponse.FindSet then begin
            objRFIResponse."Vendor Representative Name" := repFullname;
            objRFIResponse."Vendor Repr Designation" := repDesignation;
            objRFIResponse."Document Status" := objRFIResponse."document status"::Submitted;
            if objRFIResponse.Modify() then begin
                EprocurementStatistics.Reset;
                EprocurementStatistics.SetRange("Vendor No", vendorNo);
                EprocurementStatistics.SetRange("Document No", rfiDocumentNo);
                EprocurementStatistics.SetRange("Procurement Process", EprocurementStatistics."procurement process"::Prequalification);
                if EprocurementStatistics.FindSet then begin
                    EprocurementStatistics.Step := 'General Details Section';
                    EprocurementStatistics."Last Modified Date" := CurrentDatetime;
                    EprocurementStatistics.Modify(true);
                end else begin
                    EprocurementStatistics.Init;
                    EprocurementStatistics."Vendor No" := vendorNo;
                    EprocurementStatistics.Validate("Vendor No");
                    EprocurementStatistics."Document No" := rfiDocumentNo;
                    EprocurementStatistics."Procurement Process" := EprocurementStatistics."procurement process"::Prequalification;
                    EprocurementStatistics.Step := 'General Details Section';
                    EprocurementStatistics."Last Modified Date" := CurrentDatetime;
                    EprocurementStatistics.Insert(true);
                end;
                insertstatus := 'success*You have successfully submitted your response';
            end else begin
                insertstatus := 'danger*Unknown error occured!';
            end
        end else begin
            insertstatus := 'danger*error occured,call the office!';
        end
    end;

    procedure fnInsertFiledetails_Rfi(vendorNo: Code[30]; procDoctype: Code[250]; docdescription: Text; certNo: Code[100]; issuedDate: Date; expiryDate: Date; fileName: Text; documentNo: Code[20]) insertstatus: Text
    begin
        objRFIrespFiledDocument.Init;
        objRFIrespFiledDocument."Document Type" := objRFIrespFiledDocument."document type"::"IFP Response";
        objRFIrespFiledDocument."Vendor No" := vendorNo;
        objRFIrespFiledDocument."Document No" := documentNo;
        objRFIrespFiledDocument."Procurement Document Type ID" := procDoctype;
        objRFIrespFiledDocument."Document Description" := docdescription;
        objRFIrespFiledDocument."Certificate No." := certNo;
        objRFIrespFiledDocument."Date Filed" := Today;
        objRFIrespFiledDocument."Issue Date" := issuedDate;
        objRFIrespFiledDocument."Expiry Date" := expiryDate;
        objRFIrespFiledDocument."File Name" := fileName;
        objRFIrespFiledDocument."Procurement Process" := objRFIrespFiledDocument."procurement process"::Prequalification;
        if objRFIrespFiledDocument.Insert then begin
            insertstatus := 'success*Document saved successfully!';
        end
        else begin
            insertstatus := 'danger*Error occured!';
        end
    end;

    procedure fnInsertFiledetailsTender(vendorNo: Code[30]; procDoctype: Code[250]; docdescription: Text; certNo: Code[100]; issuedDate: Date; expiryDate: Date; fileName: Text; documentNo: Code[20]; documentlink: Code[250]) insertstatus: Text
    var
        BidFiledDocument: Record "Bid Filed Document";
    begin
        BidFiledDocument.Init;
        BidFiledDocument."Document Type" := BidFiledDocument."document type"::Quote;
        BidFiledDocument."Vendor No" := vendorNo;
        BidFiledDocument."No." := documentNo;
        BidFiledDocument."Procurement Document Type ID" := procDoctype;
        BidFiledDocument.Description := docdescription;
        BidFiledDocument."Certificate No." := certNo;
        BidFiledDocument."Date Filed" := Today;
        BidFiledDocument."Issue Date" := issuedDate;
        BidFiledDocument."Expiry Date" := expiryDate;
        BidFiledDocument."File Name" := fileName;
        BidFiledDocument."Procurement Process" := BidFiledDocument."procurement process"::"ITT Response";
        BidFiledDocument.DocumentLink := documentlink;
        if BidFiledDocument.Insert then begin
            EprocurementStatistics.Reset;
            EprocurementStatistics.SetRange("Vendor No", vendorNo);
            EprocurementStatistics.SetRange("Document No", documentNo);
            EprocurementStatistics.SetRange("Procurement Process", EprocurementStatistics."procurement process"::"ITT Response");
            if EprocurementStatistics.FindSet then begin
                EprocurementStatistics.Step := 'Documents Section';
                EprocurementStatistics."Last Modified Date" := CurrentDatetime;
                EprocurementStatistics.Modify(true);
            end else begin
                EprocurementStatistics.Init;
                EprocurementStatistics."Vendor No" := vendorNo;
                EprocurementStatistics.Validate("Vendor No");
                EprocurementStatistics."Document No" := documentNo;
                EprocurementStatistics."Procurement Process" := EprocurementStatistics."procurement process"::"ITT Response";
                EprocurementStatistics.Step := 'Documents Section';
                EprocurementStatistics."Last Modified Date" := CurrentDatetime;
                EprocurementStatistics.Insert(true);
            end;
            insertstatus := 'success*Document saved successfully!';
        end
        else begin
            insertstatus := 'danger*Error occured!';
        end
    end;

    procedure fnInsertFiledetailsTenderFinancial(vendorNo: Code[30]; docdescription: Text; fileName: Text; documentNo: Code[20]; documentlink: Text[250]) insertstatus: Text
    var
        BidFiledDocument: Record "Bid Filed Document";
    begin
        BidFiledDocument.Init;
        BidFiledDocument."Document Type" := BidFiledDocument."document type"::Quote;
        BidFiledDocument."Vendor No" := vendorNo;
        BidFiledDocument."No." := documentNo;
        BidFiledDocument.Description := docdescription;
        BidFiledDocument."Date Filed" := Today;
        BidFiledDocument."File Name" := fileName;
        BidFiledDocument."Procurement Process" := BidFiledDocument."procurement process"::"ITT Response";
        BidFiledDocument.DocumentLink := documentlink;
        if BidFiledDocument.Insert then begin
            EprocurementStatistics.Reset;
            EprocurementStatistics.SetRange("Vendor No", vendorNo);
            EprocurementStatistics.SetRange("Document No", documentNo);
            EprocurementStatistics.SetRange("Procurement Process", EprocurementStatistics."procurement process"::"ITT Response");
            if EprocurementStatistics.FindSet then begin
                EprocurementStatistics.Step := '4';
                EprocurementStatistics."Last Modified Date" := CurrentDatetime;
                EprocurementStatistics.Modify(true);
            end else begin
                EprocurementStatistics.Init;
                EprocurementStatistics."Vendor No" := vendorNo;
                EprocurementStatistics.Validate("Vendor No");
                EprocurementStatistics."Document No" := documentNo;
                EprocurementStatistics."Procurement Process" := EprocurementStatistics."procurement process"::"ITT Response";
                EprocurementStatistics.Step := '4';
                EprocurementStatistics."Last Modified Date" := CurrentDatetime;
                EprocurementStatistics.Insert(true);
            end;
            insertstatus := 'success*Document saved successfully!';
        end
        else begin
            insertstatus := 'danger*Error occured!';
        end
    end;

    procedure fnSubmisionResponseStatus(rfiDocumentNo: Code[12]) insertstatus: Text
    var
        respStatus: Text;
    begin
        objRFIResponse.Reset;
        objRFIResponse.SetRange("Document No.", rfiDocumentNo);
        if objRFIResponse.FindSet then
            insertstatus := Format(objRFIResponse."Document Status")
        else
            insertstatus := 'danger*notfound!';

    end;

    procedure fnGetEvalCritScores(templateID: Code[20]; evaluationType: Option) totals: Decimal
    begin
        objBidScoreCriteria.Reset;
        objBidScoreCriteria.SetRange("Template ID", templateID);
        objBidScoreCriteria.SetRange("Evaluation Type", evaluationType);

        if objBidScoreCriteria.FindSet then begin
            repeat
                objBidScoreCriteria.CalcSums("Total Weight %");
                totals := objBidScoreCriteria."Total Weight %";
            until objBidScoreCriteria.Next = 0;
        end else begin
            totals := 0;
        end
    end;

    procedure fnrfiResponsetLinks(rfnumber: Code[50]; filename: Text; sharepointlink: Text) status: Text
    var
        RFIResponse: Record "RFI Response";
        RecordLink: Record "Record Link";
        RecordIDNumber: RecordID;
    begin
        // Create Document Link to Sharepoint **********Obadiah Korir****************
        RecordLink.Reset;
        if RecordLink."Link ID" = 0 then begin
            RecordLink.URL1 := sharepointlink;
            RecordLink.Description := filename;
            RecordLink.Type := RecordLink.Type::Link;
            RecordLink.Company := COMPANYNAME;
            RecordLink."User ID" := UserId;
            RecordLink.Created := CreateDatetime(Today, Time);
            RFIResponse.Reset;
            RFIResponse."Document No." := rfnumber;
            if RFIResponse.Find('=') then
                RecordIDNumber := RFIResponse.RecordId;
            RecordLink."Record ID" := RecordIDNumber;
            RecordLink.Insert(true);
        end
    end;

    procedure fnSupplierRegistrationLinks(vendorNumber: Code[50]; filename: Text; sharepointlink: Text) status: Text
    var
        SupplierRegistration: Record Vendor;
        RecordLink: Record "Record Link";
        RecordIDNumber: RecordID;
    begin
        // Create Document Link to Sharepoint **********Obadiah Korir****************
        RecordLink.Reset;
        if RecordLink."Link ID" = 0 then begin
            RecordLink.URL1 := sharepointlink;
            RecordLink.Description := filename;
            RecordLink.Type := RecordLink.Type::Link;
            RecordLink.Company := COMPANYNAME;
            RecordLink."User ID" := UserId;
            RecordLink.Created := CreateDatetime(Today, Time);
            SupplierRegistration.Reset;
            SupplierRegistration."No." := vendorNumber;
            if SupplierRegistration.Find('=') then
                RecordIDNumber := SupplierRegistration.RecordId;
            RecordLink."Record ID" := RecordIDNumber;
            RecordLink.Insert(true);
        end
    end;

    procedure fnSubmitTenderResponse(vendornumber: Code[50]; invitationnumber: Code[50]) status: Text
    var
        Purch: Record "Purchase Header";
        Vendor: Record Vendor;
        BidOwner: Record "Bid Business Owner";
        VendBusinessOwner: Record "Vendor Business Owner";
        BidPreferences: Record "Bid Preference & Reservation";
        VendSpecialGroup: Record "Vendor Special Group Entry";
        BidLitigation: Record "Bid Litigation History";
        VendLitigation: Record "Vendor Litigation History";
        BidPastExperience: Record "Bid Past Experience";
        VendPastExperience: Record "Vendor Past Experience";
        BidAuditedBal: Record "Bid Audited Balance Sheet";
        VendAuditedBal: Record "Vendor Audited Balance Sheet";
        BidIncomeStat: Record "Bid Audited Income Statement";
        VendIncomeStat: Record "Vendor Audited Income Statemen";
        BidVendBankAccount: Record "Bid Vendor Bank Account";
        VendBankAccount: Record "Vendor Bank Account";
        BidKeyStaff: Record "Bid Key Staff";
        VendKeyStaff: Record "Vendor Professional Staff";
        BidKeyStaffQual: Record "Bid Key Staff Qualification";
        VendKeyStaffQual: Record "Vendor Staff Qualification";
        BidStaffExperience: Record "Bid Key Staff Experience";
        VendStaffExperience: Record "Vendor Staff Experience";
        IFS: Record "Standard Purchase Code";
        IFSLines: Record "Standard Purchase Line";
        PurchLines: Record "Purchase Line";
        EntryNo: Integer;
        BidEquipmentCompliance: Record "Bid Equipment Specification";
        IFSRequiredEquipment: Record "IFS Required Equipment";
    begin
        Purch.Reset;
        Purch.SetRange("Invitation For Supply No", invitationnumber);
        Purch.SetRange("Vendor No.", vendornumber);
        Purch.SetRange("Document Type", Purch."document type"::Quote);
        Purch.SetRange("Document Status", Purch."document status"::Draft);
        if not Purch.FindSet then begin
            IFS.Reset;
            IFS.SetRange(Code, invitationnumber);
            if IFS.FindSet then begin
                Purch.Init;
                Purch."Document Type" := Purch."document type"::Quote;
                Purch."Invitation For Supply No" := invitationnumber;
                Purch."Pay-to Vendor No." := vendornumber;
                Purch."Vendor No." := vendornumber;
                Purch."Buy-from Vendor No." := vendornumber;
                Purch."Invitation Notice Type" := IFS."Invitation Notice Type";
                Purch."Bid Envelope Type" := IFS."Bid Envelop Type";
                Purch."Tender Description" := IFS."Tender Summary";
                Purch."Responsibility Center" := IFS."Responsibility Center";
                Purch.Validate(Purch."Location Code", IFS."Location Code");
                Purch."Language Code" := IFS."Language Code";
                Purch."Purchaser Code" := IFS."Purchaser Code";
                Purch."Currency Code" := IFS."Currency Code";
                Purch.Insert(true);
            end;
            IFSLines.Reset;
            IFSLines.SetRange("Standard Purchase Code", invitationnumber);
            if IFSLines.FindSet then begin
                Purch.Reset;
                Purch.SetRange("Invitation For Supply No", invitationnumber);
                Purch.SetRange("Vendor No.", vendornumber);
                if Purch.FindSet then begin
                    repeat
                        PurchLines.Init;
                        PurchLines.Validate("Document Type", PurchLines."document type"::Quote);
                        PurchLines.Validate("Document No.", Purch."No.");
                        PurchLines.Validate("Line No.", IFSLines."Line No.");
                        //PurchLines.VALIDATE("Buy-from Vendor No.",vendornumber);
                        PurchLines.Validate("No.", IFSLines."No.");
                        PurchLines.Validate(Type, IFSLines.Type);
                        PurchLines.Validate("Item Category", IFSLines."Item Category");
                        PurchLines.Validate(Description, IFSLines.Description);
                        PurchLines.Validate(Quantity, IFSLines.Quantity);
                        PurchLines.Validate("Unit of Measure Code", IFSLines."Unit of Measure Code");
                        PurchLines.Validate("Shortcut Dimension 1 Code", IFSLines."Shortcut Dimension 1 Code");
                        PurchLines.Validate("Shortcut Dimension 2 Code", IFSLines."Shortcut Dimension 2 Code");
                        PurchLines.Validate("Variant Code", IFSLines."Variant Code");
                        PurchLines.Validate("Dimension Set ID", IFSLines."Dimension Set ID");
                        //MESSAGE('%1',PurchLines."No.");
                        // PurchLines.INSERT(TRUE);
                        if PurchLines.Insert(true) then begin
                            // PurchLines.VALIDATE("No.",IFSLines."No.");
                            PurchLines.Quantity := IFSLines.Quantity;
                            PurchLines.Modify;
                            Message('%1', PurchLines."No.");
                        end;
                    until IFSLines.Next = 0;
                end;
            end;
            Vendor.Reset;
            Vendor.SetRange("No.", vendornumber);
            if Vendor.FindSet then begin
                Purch.Reset;
                //Purch.VALIDATE("Buy-from Vendor No.");
                //Purch.VALIDATE("Pay-to Name");
                //Purch.VALIDATE("Vendor No.");
                //Purch.VALIDATE("Pay-to Vendor No.");
                Purch."Building/House No" := Vendor."Building/House No";
                Purch."Plot No" := Vendor."Plot No";
                Purch.Street := Vendor.Street;
                Purch."Nature of Business" := Vendor."Nature of Business";
                Purch."Current Trade Licence No" := Vendor."Current Trade Licence No";
                Purch."Trade Licence Expiry Date" := Vendor."Trade Licence Expiry Date";
                Purch."Max Value of Business" := Vendor."Max Value of Business";
                Purch."Preferred Bank Account Code" := Vendor."Preferred Bank Account Code";
                Purch."Business Type" := Vendor."Business Type";
                Purch."Nominal Capital LCY" := Vendor."Nominal Capital LCY";
                Purch."Issued Capital LCY" := Vendor."Issued Capital LCY";
                Purch.Modify(true)
            end;
            //a)Owners/Directors
            Purch.Reset;
            Purch.SetRange("Invitation For Supply No", invitationnumber);
            Purch.SetRange("Vendor No.", vendornumber);
            if Purch.FindSet then begin
                Purch.Validate("Invitation For Supply No");
                Purch.Validate("Vendor No.");
                BidOwner.Reset;
                BidOwner.SetRange(No, Purch."No.");
                if not BidOwner.FindSet then begin
                    VendBusinessOwner.Reset;
                    VendBusinessOwner.SetRange("Vendor No.", Purch."Vendor No.");
                    VendBusinessOwner.SetRange(Blocked, false);
                    if VendBusinessOwner.FindSet then begin
                        repeat
                            BidOwner.Init;
                            BidOwner."Document Type" := Purch."Document Type";
                            BidOwner.No := Purch."No.";
                            BidOwner."Vendor No." := Purch."Vendor No.";
                            BidOwner."Entry No." := VendBusinessOwner."Entry No.";
                            BidOwner.Name := VendBusinessOwner.Name;
                            BidOwner.Address := VendBusinessOwner.Address;
                            BidOwner."Post Code" := VendBusinessOwner."Post Code";
                            BidOwner."Address 2" := VendBusinessOwner."Address 2";
                            BidOwner.City := VendBusinessOwner.City;
                            BidOwner."Phone No." := VendBusinessOwner."Phone No.";
                            BidOwner."Nationality ID" := VendBusinessOwner."Nationality ID";
                            BidOwner."Citizenship Type" := VendBusinessOwner."Citizenship Type";
                            BidOwner."ID/Passport No." := VendBusinessOwner."ID/Passport No.";
                            BidOwner."Entity Ownership %" := VendBusinessOwner."Entity Ownership %";
                            BidOwner."Share Types" := VendBusinessOwner."Share Types";
                            BidOwner."No. of Shares" := VendBusinessOwner."No. of Shares";
                            BidOwner."Nominal Value/Share" := VendBusinessOwner."Nominal Value/Share";
                            BidOwner."Total Nominal Value" := VendBusinessOwner."Total Nominal Value";
                            BidOwner."Ownership Effective Date" := VendBusinessOwner."Ownership Effective Date";
                            BidOwner.Blocked := VendBusinessOwner.Blocked;
                            BidOwner.Insert(true);
                        until VendBusinessOwner.Next = 0;
                    end;
                end;
            end;
            //b)Preference and Reservations
            Purch.Reset;
            Purch.SetRange("Invitation For Supply No", invitationnumber);
            Purch.SetRange("Buy-from Vendor No.", vendornumber);
            if Purch.FindSet then begin
                BidPreferences.Reset;
                BidPreferences.SetRange("Document No.", Purch."No.");
                if not BidPreferences.FindSet then begin
                    VendSpecialGroup.Reset;
                    VendSpecialGroup.SetRange("Vendor No", Purch."Vendor No.");
                    VendSpecialGroup.SetRange(Blocked, false);
                    if VendSpecialGroup.FindSet then begin
                        repeat
                            BidPreferences.Init;
                            BidPreferences."Document Type" := Purch."Document Type";
                            BidPreferences."Document No." := Purch."No.";
                            BidPreferences."Vendor No." := Purch."Vendor No.";
                            BidPreferences."AGPO Certificate No" := VendSpecialGroup."Certifcate No";
                            BidPreferences."Registered Special Group" := VendSpecialGroup."Registered Special Group";
                            BidPreferences."Products/Service Category" := VendSpecialGroup."Products/Service Category";
                            BidPreferences."Certificate Effective Date" := VendSpecialGroup."Effective Date";
                            BidPreferences."Certificate Expiry Date" := VendSpecialGroup."Certificate Expiry Date";
                            BidPreferences."Certifying Agency" := VendSpecialGroup."Certifying Agency";
                            BidPreferences.Insert(true);
                            EntryNo += 1;
                        until VendSpecialGroup.Next = 0;
                    end;
                end;
            end;
            //c)Litigation History
            Purch.Reset;
            Purch.SetRange("Invitation For Supply No", invitationnumber);
            Purch.SetRange("Vendor No.", vendornumber);
            if Purch.FindSet then begin
                BidLitigation.Reset;
                BidLitigation.SetRange("No.", Purch."No.");
                if not BidLitigation.FindSet then begin
                    VendLitigation.Reset;
                    VendLitigation.SetRange("Vendor No.", Purch."Vendor No.");
                    if VendLitigation.FindSet then begin
                        repeat
                            BidLitigation.Init;
                            BidLitigation."Document Type" := Purch."Document Type";
                            BidLitigation."No." := Purch."No.";
                            BidLitigation."Vendor No." := Purch."Vendor No.";
                            BidLitigation."Entry No." := VendLitigation."Entry No.";
                            BidLitigation."Dispute Matter" := VendLitigation."Dispute Matter";
                            BidLitigation."Other Dispute Party" := VendLitigation."Other Dispute Party";
                            BidLitigation."Dispute Amount LCY" := VendLitigation."Dispute Amount LCY";
                            BidLitigation."Category of Matter" := VendLitigation."Category of Matter";
                            BidLitigation.Year := VendLitigation.Year;
                            BidLitigation."Award Type" := VendLitigation."Award Type";
                            BidLitigation.Insert(true);
                        until VendLitigation.Next = 0;
                    end;
                end;
            end;
            //d)Past Experience
            /*
            Purch.RESET;
            Purch.SETRANGE("Invitation For Supply No",invitationnumber);
            Purch.SETRANGE("Vendor No.",vendornumber);
            IF Purch.FINDSET THEN BEGIN
                BidPastExperience.RESET;
                BidPastExperience.SETRANGE("No.",Purch."No.");
                 IF NOT BidPastExperience.FINDSET THEN BEGIN
                   VendPastExperience.RESET;
                   VendPastExperience.SETRANGE("Vendor No.",Purch."Vendor No.");
                   IF VendPastExperience.FINDSET THEN BEGIN
                     REPEAT
                       BidPastExperience.INIT;
                       BidPastExperience."Document Type":=Purch."Document Type";
                       BidPastExperience."No.":=Purch."No.";
                       BidPastExperience."Vendor No.":=Purch."Vendor No.";
                      //BidPastExperience."Entry No.":=VendPastExperience."Entry No.";
                       BidPastExperience."Client Name":=VendPastExperience."Client Name";
                       BidPastExperience.Address:=VendPastExperience.Address;
                       BidPastExperience."Address 2":=VendPastExperience."Address 2";
                       BidPastExperience."Country/Region Code":=VendPastExperience."Country/Region Code";
                       BidPastExperience."E-Mail":=VendPastExperience."E-Mail";
                       BidPastExperience."Primary Contact Person":=VendPastExperience."Primary Contact Person";
                       BidPastExperience."Primary Contact Designation":=VendPastExperience."Primary Contact Designation";
                       BidPastExperience."Primary Contact Tel":=VendPastExperience."Primary Contact Tel";
                       BidPastExperience."Primary Contact Email":=VendPastExperience."Primary Contact Email";
                       BidPastExperience."Assignment/Project Name":=VendPastExperience."Assignment Name";
                       BidPastExperience."Project Scope Summary":=VendPastExperience."Project Scope Summary";
                       BidPastExperience."Delivery Location":=VendPastExperience."Delivery Location";
                       BidPastExperience."Contract Ref No":=VendPastExperience."Contract Ref No";
                       BidPastExperience."Assignment Start Date":=VendPastExperience."Assignment Start Date";
                       BidPastExperience."Assignment End Date":=VendPastExperience."Assignment End Date";
                       BidPastExperience."Assignment Value LCY":=VendPastExperience."Assignment Value LCY";
                       BidPastExperience."Assignment Status":=VendPastExperience."Assignment Status";
                       BidPastExperience.INSERT(TRUE);
                       UNTIL VendPastExperience.NEXT=0;
                     END;
                  END;
                END;
                */
            //e)Audited Balance Sheet-
            Purch.Reset;
            Purch.SetRange("Invitation For Supply No", invitationnumber);
            Purch.SetRange("Vendor No.", vendornumber);
            if Purch.FindSet then begin
                BidAuditedBal.Reset;
                BidAuditedBal.SetRange("No.", Purch."No.");
                if not BidAuditedBal.FindSet then begin
                    VendAuditedBal.Reset;
                    VendAuditedBal.SetRange("Vendor No.", Purch."Vendor No.");
                    if VendAuditedBal.FindSet then begin
                        repeat
                            BidAuditedBal.Init;
                            BidAuditedBal."Document Type" := Purch."Document Type";
                            BidAuditedBal."No." := Purch."No.";
                            BidAuditedBal."Vendor No." := vendornumber;
                            BidAuditedBal."Audit Year Code Reference" := VendAuditedBal."Audit Year Code Reference";
                            BidAuditedBal."Current Assets (LCY)" := VendAuditedBal."Current Assets (LCY)";
                            BidAuditedBal."Fixed Assets (LCY)" := VendAuditedBal."Fixed Assets (LCY)";
                            BidAuditedBal."Total Assets (LCY)" := VendAuditedBal."Total Assets (LCY)";
                            BidAuditedBal."Current Liabilities (LCY)" := VendAuditedBal."Current Liabilities (LCY)";
                            BidAuditedBal."Long-term Liabilities (LCY)" := VendAuditedBal."Long-term Liabilities (LCY)";
                            BidAuditedBal."Total Liabilities (LCY)" := VendAuditedBal."Total Liabilities (LCY)";
                            BidAuditedBal."Owners Equity (LCY)" := VendAuditedBal."Owners Equity (LCY)";
                            BidAuditedBal."Total Liabilities & Equity(LCY" := VendAuditedBal."Total Liabilities & Equity(LCY";
                            BidAuditedBal."Debt Ratio" := VendAuditedBal."Debt Ratio";
                            BidAuditedBal."Current Ratio" := VendAuditedBal."Current Ratio";
                            BidAuditedBal."Working Capital (LCY)" := VendAuditedBal."Working Capital (LCY)";
                            BidAuditedBal."Assets-To-Equity Ratio" := VendAuditedBal."Assets-To-Equity Ratio";
                            BidAuditedBal."Debt-To-Equity Ratio" := VendAuditedBal."Debt-To-Equity Ratio";
                            BidAuditedBal.Insert(true);
                        until VendAuditedBal.Next = 0;

                    end;
                end;
            end;
            //f)Audited Income Statement-
            Purch.Reset;
            Purch.SetRange("Invitation For Supply No", invitationnumber);
            Purch.SetRange("Vendor No.", vendornumber);
            if Purch.FindSet then begin
                BidIncomeStat.Reset;
                BidIncomeStat.SetRange("No.", Purch."No.");
                if not BidIncomeStat.FindSet then begin
                    VendIncomeStat.Reset;
                    VendIncomeStat.SetRange("Vendor No.", Purch."Vendor No.");
                    if VendIncomeStat.FindSet then begin
                        repeat
                            BidIncomeStat.Init;
                            BidIncomeStat."Document Type" := Purch."Document Type";
                            BidIncomeStat."No." := Purch."No.";
                            BidIncomeStat."Vendor No." := vendornumber;
                            BidIncomeStat."Audit Year Code Reference" := VendIncomeStat."Audit Year Code Reference";
                            BidIncomeStat."Total Revenue (LCY)" := VendIncomeStat."Total Revenue (LCY)";
                            BidIncomeStat."Total COGS (LCY)" := VendIncomeStat."Total COGS (LCY)";
                            BidIncomeStat."Gross Margin (LCY)" := VendIncomeStat."Gross Margin (LCY)";
                            BidIncomeStat."Total Operating Expenses (LCY)" := VendIncomeStat."Total Operating Expenses (LCY)";
                            BidIncomeStat."Operating Income/EBIT (LCY)" := VendIncomeStat."Operating Income/EBIT (LCY)";
                            BidIncomeStat."Other Non-operating Re/Exp LCY" := VendIncomeStat."Other Non-operating Re/Exp LCY";
                            BidIncomeStat."Interest Expense (LCY)" := VendIncomeStat."Interest Expense (LCY)";
                            BidIncomeStat."Income Before Taxes (LCY)" := VendIncomeStat."Income Before Taxes (LCY)";
                            BidIncomeStat."Income Tax Expense (LCY)" := VendIncomeStat."Income Tax Expense (LCY)";
                            BidIncomeStat."Net Income from Ops  (LCY)" := VendIncomeStat."Net Income from Ops  (LCY)";
                            BidIncomeStat."Below-the-line Items (LCY)" := VendIncomeStat."Below-the-line Items (LCY)";
                            BidIncomeStat."Net Income" := VendIncomeStat."Net Income";
                            BidIncomeStat.Insert(true);
                        until VendIncomeStat.Next = 0;
                    end;
                end;
            end;
            //g)Vendor Bank Accounts
            Purch.Reset;
            Purch.SetRange("Invitation For Supply No", invitationnumber);
            Purch.SetRange("Vendor No.", vendornumber);
            if Purch.FindSet then begin
                BidVendBankAccount.Reset;
                BidVendBankAccount.SetRange("No.", Purch."No.");
                if not BidVendBankAccount.FindSet then begin
                    VendBankAccount.Reset;
                    VendBankAccount.SetRange("Vendor No.", Purch."Vendor No.");
                    if VendBankAccount.FindSet then begin
                        repeat
                            BidVendBankAccount.Init;
                            BidVendBankAccount."Document Type" := Purch."Document Type";
                            BidVendBankAccount."No." := Purch."No.";
                            BidVendBankAccount."Vendor No." := vendornumber;
                            BidVendBankAccount.Code := VendBankAccount.Code;
                            BidVendBankAccount.Name := VendBankAccount.Name;
                            BidVendBankAccount."Available Credit Line Valu" := VendBankAccount."Available Credit Line Valu";
                            BidVendBankAccount."Currency Code" := VendBankAccount."Currency Code";
                            BidVendBankAccount.Address := VendBankAccount.Address;
                            BidVendBankAccount."Address 2" := VendBankAccount."Address 2";
                            BidVendBankAccount."Post Code" := VendBankAccount."Post Code";
                            BidVendBankAccount.City := VendBankAccount.City;
                            BidVendBankAccount."Country/Region Code" := VendBankAccount."Country/Region Code";
                            BidVendBankAccount."Phone No." := VendBankAccount."Phone No.";
                            BidVendBankAccount."Bank Account No." := VendBankAccount."Bank Account No.";
                            BidVendBankAccount."Bank Branch No." := VendBankAccount."Bank Branch No.";
                            BidVendBankAccount.Contact := VendBankAccount.Contact;
                            BidVendBankAccount."Telex No." := VendBankAccount."Telex No.";
                            BidVendBankAccount."Transit No." := VendBankAccount."Transit No.";
                            BidVendBankAccount.County := VendBankAccount.County;
                            BidVendBankAccount."Fax No." := VendBankAccount."Fax No.";
                            BidVendBankAccount."Telex Answer Back" := VendBankAccount."Telex Answer Back";
                            BidVendBankAccount."Language Code" := VendBankAccount."Language Code";
                            BidVendBankAccount."E-Mail" := VendBankAccount."E-Mail";
                            BidVendBankAccount."Home Page" := VendBankAccount."Home Page";
                            BidVendBankAccount.Iban := VendBankAccount.Iban;
                            BidVendBankAccount."SWIFT Code" := VendBankAccount."SWIFT Code";
                            BidVendBankAccount."Bank Clearing Code" := VendBankAccount."Bank Clearing Code";
                            BidVendBankAccount."Bank Clearing Standard" := VendBankAccount."Bank Clearing Standard";
                            BidVendBankAccount.Insert(true);
                        until VendBankAccount.Next = 0;
                    end;

                end;
            end;
            //h)Key staff

            Purch.Reset;
            Purch.SetRange("Invitation For Supply No", invitationnumber);
            Purch.SetRange("Vendor No.", vendornumber);
            if Purch.FindSet then begin
                VendKeyStaff.Reset;
                VendKeyStaff.SetRange("Vendor No.", Purch."Vendor No.");
                if VendKeyStaff.FindSet then begin
                    repeat
                        BidKeyStaff.Init;
                        BidKeyStaff."Document Type" := Purch."Document Type";
                        BidKeyStaff."No." := Purch."No.";
                        BidKeyStaff."Vendor No." := vendornumber;
                        BidKeyStaff."Staff No." := VendKeyStaff."Staff Number";
                        BidKeyStaff."Staff Name" := VendKeyStaff."Staff Name";
                        BidKeyStaff."Years with Firm" := VendKeyStaff."Years With the Firm";
                        BidKeyStaff."Staff Category" := VendKeyStaff."Staff Category";
                        BidKeyStaff."Phone No." := VendKeyStaff."Phone No.";
                        BidKeyStaff.Nationality := VendKeyStaff.Nationality;
                        BidKeyStaff."E-Mail" := VendKeyStaff."E-Mail";
                        BidKeyStaff.Insert(true);
                    until VendKeyStaff.Next = 0;
                end;
            end;
            //i)Key Staff Qualifications-
            Purch.Reset;
            Purch.SetRange("Invitation For Supply No", invitationnumber);
            Purch.SetRange("Vendor No.", vendornumber);
            if Purch.FindSet then begin
                VendKeyStaffQual.Reset;
                VendKeyStaffQual.SetRange("Vendor No", vendornumber);
                if VendKeyStaffQual.FindSet then begin
                    repeat
                        BidKeyStaffQual.Init;
                        BidKeyStaffQual."Document Type" := Purch."Document Type";
                        BidKeyStaffQual."No." := Purch."No.";
                        BidKeyStaffQual."Vendor No." := vendornumber;
                        BidKeyStaffQual."Staff No." := VendKeyStaffQual."Staff Id";
                        BidKeyStaffQual."Entry No" := VendKeyStaffQual."Entry No";
                        BidKeyStaffQual."Qualification Category" := VendKeyStaffQual."Qualification Category";
                        BidKeyStaffQual."Qualification Name" := VendKeyStaffQual."Qualification Name";
                        BidKeyStaffQual.Institution := VendKeyStaffQual.Institution;
                        BidKeyStaffQual."Start Year" := VendKeyStaffQual."Start Year";
                        BidKeyStaffQual."End Year" := VendKeyStaffQual."End Year";
                        BidKeyStaffQual."Outstanding Achievements" := VendKeyStaffQual."Outstanding Achievements";
                        BidKeyStaffQual.Insert(true);
                    until VendKeyStaffQual.Next = 0;
                end;
            end;
            //j)Key Staff Experience-
            Purch.Reset;
            Purch.SetRange("Invitation For Supply No", invitationnumber);
            Purch.SetRange("Vendor No.", vendornumber);
            if Purch.FindSet then begin
                VendStaffExperience.Reset;
                VendStaffExperience.SetRange("Vendor No", vendornumber);
                if VendStaffExperience.FindSet then begin
                    repeat
                        BidStaffExperience.Init;
                        BidStaffExperience."Document Type" := Purch."Document Type";
                        BidStaffExperience."No." := Purch."No.";
                        BidStaffExperience."Vendor No." := vendornumber;
                        BidStaffExperience."Staff No." := VendStaffExperience."Staff ID";
                        BidStaffExperience."Entry No" := VendStaffExperience."Entry No";
                        BidStaffExperience."Experience Category" := VendStaffExperience."Experience Category";
                        BidStaffExperience."Years of Experience" := VendStaffExperience."Years of Experience";
                        BidStaffExperience."Experience Summary" := VendStaffExperience."Experience Summary";
                        BidStaffExperience."Sample Assignments/Projects" := VendStaffExperience."Assignment Description";
                        BidStaffExperience."Experience From Year" := VendStaffExperience."Start Year";
                        BidStaffExperience."Experience To Year" := VendStaffExperience."End Year";
                        BidStaffExperience.Insert(true);
                    until VendStaffExperience.Next = 0;
                end;
            end;

            //K Equipment Specifications.
            Purch.Reset;
            Purch.SetRange("Invitation For Supply No", invitationnumber);
            Purch.SetRange("Vendor No.", vendornumber);
            if Purch.FindSet then begin
                IFSRequiredEquipment.Reset;
                IFSRequiredEquipment.SetRange("Document No", invitationnumber);
                IFSRequiredEquipment.SetRange(Blocked, false);
                if IFSRequiredEquipment.FindSet then begin
                    repeat
                        BidEquipmentCompliance.Init;
                        BidEquipmentCompliance."No." := Purch."No.";
                        BidEquipmentCompliance."Equipment Type Code" := IFSRequiredEquipment."Equipment Type Code";
                        BidEquipmentCompliance.Description := IFSRequiredEquipment.Description;
                        BidEquipmentCompliance."Qty of Equipment" := IFSRequiredEquipment."Minimum Required Qty";
                        BidEquipmentCompliance.Insert(true);
                    until IFSRequiredEquipment.Next = 0;
                end;
            end;
            status := 'success*This has been created';
        end else begin
            status := 'found*Your application is in draft status, you can continue to submit!';
        end;

    end;

    procedure fngetBidResponseNumber(InvitationNumber: Code[100]; VendorNumber: Code[100]) responseNumber: Code[100]
    var
        PurchaseHeader: Record "Purchase Header";
    begin
        PurchaseHeader.Reset;
        PurchaseHeader.SetRange("Pay-to Vendor No.", VendorNumber);
        PurchaseHeader.SetRange("Document Type", PurchaseHeader."document type"::Quote);
        PurchaseHeader.SetRange("Invitation For Supply No", InvitationNumber);
        if PurchaseHeader.FindLast then begin
            responseNumber := PurchaseHeader."No.";
        end else begin
            responseNumber := '';
        end;
    end;

    procedure fnInserBidInfoTab1(vendorNo: Code[20]; ittNumber: Code[20]; bidderRepName: Text; bidderRepDesignation: Text; bidderRepAddr: Text; bidderWitnessName: Text; bidderWitnessDesignation: Text; bidderWitnessAddr: Text) insertstatus: Text
    begin
        Purch.Reset;
        Purch.SetRange("No.", ittNumber);
        Purch.SetRange("Vendor No.", vendorNo);
        Purch.SetRange("Document Status", Purch."document status"::Draft);
        if Purch.FindSet then begin
            Purch."Bidder Representative Name" := bidderRepName;
            Purch."Bidder Representative Desgn" := bidderRepDesignation;
            Purch."Bidder Representative Address" := bidderRepAddr;
            Purch."Bidder Witness Name" := bidderWitnessName;
            Purch."Bidder Witness Designation" := bidderWitnessDesignation;
            Purch."Bidder Witness Address" := bidderWitnessAddr;
            if Purch.Modify then
                insertstatus := 'success*Bidder Representative saved successfully!'
            else
                insertstatus := 'danger*Error saving your info, contact Kerra Office!'
        end
        else begin
            insertstatus := 'danger*Some details not found!'
        end
    end;

    procedure fnInserBidGeneralDetails(vendorNo: Code[20]; ittNumber: Code[20]; bidderRepName: Text; bidderRepDesignation: Text; bidderdocumentssource: Code[10]) insertstatus: Text
    var
        TenderBids: Record "Tender Bids";
    begin
        TenderBids.Reset;
        TenderBids.SetRange("Requisition No", ittNumber);
        TenderBids.SetRange("Linked vendor", vendorNo);
        if TenderBids.FindSet then begin
            repeat
                TenderBids."Respresentative Name" := bidderRepName;
                TenderBids."Representative Designation" := bidderRepDesignation;
                TenderBids."Tender Document Source" := bidderdocumentssource;
                if TenderBids.Modify(true) then begin
                    EprocurementStatistics.Reset;
                    EprocurementStatistics.SetRange("Vendor No", vendorNo);
                    EprocurementStatistics.SetRange("Document No", ittNumber);
                    EprocurementStatistics.SetRange("Procurement Process", EprocurementStatistics."procurement process"::"ITT Response");
                    if EprocurementStatistics.FindSet then begin
                        EprocurementStatistics.Step := 'Genearal Details Section';
                        EprocurementStatistics."Last Modified Date" := CurrentDatetime;
                        EprocurementStatistics.Modify(true);
                    end else begin
                        EprocurementStatistics.Init;
                        EprocurementStatistics."Vendor No" := vendorNo;
                        EprocurementStatistics.Validate("Vendor No");
                        EprocurementStatistics."Document No" := ittNumber;
                        EprocurementStatistics."Procurement Process" := EprocurementStatistics."procurement process"::"ITT Response";
                        EprocurementStatistics.Step := 'Genearal Details Section';
                        EprocurementStatistics."Last Modified Date" := CurrentDatetime;
                        EprocurementStatistics.Insert(true);
                    end;
                    insertstatus := 'success*saved successfully!'
                end else begin
                    insertstatus := 'danger*Error saving your info!'
                end;
            until TenderBids.Next = 0;
        end else begin
            insertstatus := 'danger*Some details not found!'
        end;
    end;

    procedure fnInsertBidEquipmentsDetails(vendorNo: Code[20]; biddernumber: Code[20]; equipmentcategory: Code[20]; ownershiptypes: Integer; equipmentyearsused: Decimal; equipmentcondition: Integer; equipmentusabilitycode: Integer; equipmentserialnumber: Text) insertstatus: Text
    begin
        objBidResponseEquipments.Reset;
        objBidResponseEquipments.SetRange("No.", biddernumber);
        objBidResponseEquipments.SetRange("Equipment Type Code", equipmentcategory);
        objBidResponseEquipments.SetRange("Document Type", objBidResponseEquipments."document type"::Quote);
        if objBidResponseEquipments.FindSet then begin
            objBidResponseEquipments."No." := biddernumber;
            objBidResponseEquipments."Ownership Type" := ownershiptypes;
            objBidResponseEquipments."Equipment Type Code" := equipmentcategory;
            objBidResponseEquipments."Years of Previous Use" := equipmentyearsused;
            objBidResponseEquipments."Equipment Condition Code" := equipmentcondition;
            objBidResponseEquipments."Equipment Usability Code" := equipmentusabilitycode;
            objBidResponseEquipments."Equipment Serial" := equipmentserialnumber;
            if objBidResponseEquipments.Modify(true) then
                insertstatus := 'success*Bidder Equipments saved successfully!'
            else
                insertstatus := 'danger*Error saving your info, contact Kerra Office!'
        end
        else begin
            insertstatus := 'danger*Some details not found!'
        end
    end;

    procedure fnAddBidPrefr(agpoCertNo: Code[50]; vendornumber: Code[50]; invitationnumber: Code[50]; registeredSpecialgrpe: Code[50]; productorserviceCategory: Text; certEffectiveDate: Date; certXpiryDate: Date) insertstatus: Text
    begin
        Purch.SetRange("No.", invitationnumber);
        Purch.SetRange("Vendor No.", vendornumber);
        if Purch.FindSet then begin
            BidPreferences.Init;
            BidPreferences."Document Type" := Purch."Document Type";
            BidPreferences."Document No." := Purch."No.";
            BidPreferences."Vendor No." := Purch."Vendor No.";
            BidPreferences."AGPO Certificate No" := agpoCertNo;
            BidPreferences."Registered Special Group" := registeredSpecialgrpe;
            BidPreferences."Products/Service Category" := productorserviceCategory;
            BidPreferences."Certificate Effective Date" := certEffectiveDate;
            BidPreferences."Certificate Expiry Date" := certXpiryDate;
            if BidPreferences.Insert then begin
                insertstatus := 'success*Your Bid Preference entry inserted successfully!';
            end else begin
                insertstatus := 'danger*Unknown error occured!';
            end
        end;
    end;

    procedure fnDeleteBidAuditedBalsheet(auditYearCode: Code[20]; vendorNo: Code[30]; responseNo: Code[30]) deleteStatus: Text
    begin
        BidAuditedBal.Reset;
        BidAuditedBal.SetRange("Audit Year Code Reference", auditYearCode);
        BidAuditedBal.SetRange("Vendor No.", vendorNo);
        BidAuditedBal.SetRange("No.", responseNo);
        if BidAuditedBal.FindSet then begin
            if BidAuditedBal.Delete then
                deleteStatus := 'success*Balance sheet entry Removed successfully!'
            else
                deleteStatus := 'danger*Error while deleting..!'
        end
        else begin
            Error('entry not found!');
        end
    end;

    // procedure ResetSendEmail(emailaddress: Text)
    // var
    //     DynasoftPortalUser: Record "Dynasoft Portal User";
    //     SMTPMailSetup: Record "SMTP Mail Setup";
    //     Email2: Text;
    //     Body: Text;
    //     SMTP: Codeunit "SMTP Mail";
    // begin
    //     DynasoftPortalUser.Reset;
    //     DynasoftPortalUser.SetRange("Authentication Email", emailaddress);
    //     if DynasoftPortalUser.FindSet then begin
    //         //code to send email and link to Supplier
    //         //send notification email
    //         SMTPMailSetup.Get;
    //         Email2 := SMTPMailSetup."Email Sender Address";
    //         Body := 'SUPPLIER PASSWORD RESET';
    //         SMTP.CreateMessage('SUPPLIER PASSWORD RESET', Email2, emailaddress,
    //        'SUPPLIER PASSWORD RESET',
    //        'Dear ' + DynasoftPortalUser."Full Name" + ',<BR><BR>' +
    //        'Your Password for the account <b>' + ' ' + Format(DynasoftPortalUser."Authentication Email") + ' ' + '</b> has been Reset Successfully.Kindly Change your Password on Login<BR>' +
    //        'Use the following link to acess the system.' + ' ' + '<b><a href="http://192.168.1.87:7073">E- Procurement Portal</a></b><BR>Your New Credentials are:'
    //        + '<BR>'
    //        + 'Username:' + ' <b>' + DynasoftPortalUser."Authentication Email" + '</b><BR>Password:' + ' <b>' + DynasoftPortalUser."Password Value" + '</b>'
    //      , true);
    //         SMTP.AddBCC(Email2);
    //         SMTP.AppendBody('<BR><BR>Kind Regards,' + '<BR><BR>Supply Chain Department<BR><BR>National Commission for Science, Technology and Innovation.<BR><BR>[THIS IS AN AUTOMATED MESSAGE - PLEASE DO NOT REPLY DIRECTLY TO THIS EMAIL]<BR>');
    //         SMTP.Send();
    //         Message('Notification successfully sent to %1', DynasoftPortalUser."User Name");
    //     end;
    // end;

    procedure ResetSendEmail(emailaddress: Text)
    var
        DynasoftPortalUser: Record "Dynasoft Portal User";
        SMTPMailSetup: Record "Email Account";
        Email2: Text;
        Body: Text;
        SMTP: Codeunit Mail;
        SMTPMail: Codeunit "Email Message";
        Smail: Codeunit EMail;
        Subject: Text;
    begin
        DynasoftPortalUser.Reset;
        DynasoftPortalUser.SetRange("Authentication Email", emailaddress);
        DynasoftPortalUser.SetRange("Record Type", DynasoftPortalUser."Record Type"::Vendor);
        if DynasoftPortalUser.FindSet then begin
            Subject := 'Account Password Reset ';
            Body := 'Dear, ' + DynasoftPortalUser."Full Name" + ' your password for the account: ' + ' <strong>' + DynasoftPortalUser."Authentication Email" + '</strong> has been reset successfully. Kindly use the password below to access your account<br> <strong>Password: ' + DynasoftPortalUser."Password Value" + '</strong> <br>';
            Body := Body + ' ' + 'Nacosti' + '<br><br>';
            Body := Body + '[This email is automated. Kindly do not reply to it]<br><br>';
            SMTPMail.Create(Contact."E-Mail", Subject, Body, true);
            Smail.Send(SMTPMail, Enum::"Email Scenario"::Default);
        end;
    end;

    procedure fnNewSubmitTenderResponse(vendornumber: Code[50]; invitationnumber: Code[50]) status: Text
    var
        Purch: Record "Purchase Header";
        Vendor: Record Vendor;
        BidOwner: Record "Bid Business Owner";
        VendBusinessOwner: Record "Vendor Business Owner";
        BidPreferences: Record "Bid Preference & Reservation";
        VendSpecialGroup: Record "Vendor Special Group Entry";
        BidLitigation: Record "Bid Litigation History";
        VendLitigation: Record "Vendor Litigation History";
        BidPastExperience: Record "Bid Past Experience";
        VendPastExperience: Record "Vendor Past Experience";
        BidAuditedBal: Record "Bid Audited Balance Sheet";
        VendAuditedBal: Record "Vendor Audited Balance Sheet";
        BidIncomeStat: Record "Bid Audited Income Statement";
        VendIncomeStat: Record "Vendor Audited Income Statemen";
        BidVendBankAccount: Record "Bid Vendor Bank Account";
        VendBankAccount: Record "Vendor Bank Account";
        BidKeyStaff: Record "Bid Key Staff";
        VendKeyStaff: Record "Vendor Professional Staff";
        BidKeyStaffQual: Record "Bid Key Staff Qualification";
        VendKeyStaffQual: Record "Vendor Staff Qualification";
        BidStaffExperience: Record "Bid Key Staff Experience";
        VendStaffExperience: Record "Vendor Staff Experience";
        IFS: Record "Standard Purchase Code";
        IFSLines: Record "Standard Purchase Line";
        PurchLines: Record "Purchase Line";
        EntryNo: Integer;
        BidEquipmentCompliance: Record "Bid Equipment Specification";
        TenderBids: Record "Tender Bids";
        ProcurementRequest: Record "Procurement Request";
        ProcurementRequestLines: Record "Procurement Request Lines";
    begin
        Vendor.Reset;
        Vendor.SetRange("No.", vendornumber);
        if Vendor.FindSet then begin
            TenderBids.Reset;
            TenderBids.SetRange("Requisition No", invitationnumber);
            TenderBids.SetRange("Linked vendor", vendornumber);
            if TenderBids.FindSet then begin
                ProcurementRequestLines.Reset;
                ProcurementRequestLines.SetRange("Requisition No", invitationnumber);
                if ProcurementRequestLines.FindSet then begin
                    //TenderBids.EntryNo:=TenderBids.EntryNo+100;
                    TenderBids."Line No" := ProcurementRequestLines."Line No";
                    TenderBids."Requisition No" := invitationnumber;
                    TenderBids."Bidder Name" := Vendor.Name;
                    TenderBids."Bidder Email" := Vendor.Email;
                    TenderBids."Vendor No" := vendornumber;
                    TenderBids."Linked vendor" := vendornumber;
                    TenderBids.Validate(Type, ProcurementRequestLines.Type);
                    TenderBids.Validate(No, ProcurementRequestLines.No);
                    TenderBids.Validate("Item No", ProcurementRequestLines.No);
                    // TenderBids.Type:=ProcurementRequestLines.Type;
                    //TenderBids.No:=ProcurementRequestLines.No;
                    TenderBids.Description := ProcurementRequestLines.Specifications;
                    TenderBids.Quantity := ProcurementRequestLines.Quantity;
                    TenderBids."Unit of Measure" := ProcurementRequestLines."Unit of Measure";
                    if TenderBids.Modify(true) then begin
                        EprocurementStatistics.Reset;
                        EprocurementStatistics.SetRange("Vendor No", vendornumber);
                        EprocurementStatistics.SetRange("Document No", invitationnumber);
                        EprocurementStatistics.SetRange("Procurement Process", EprocurementStatistics."procurement process"::"ITT Response");
                        if EprocurementStatistics.FindSet then begin
                            EprocurementStatistics.Step := 'Initial Section';
                            EprocurementStatistics."Last Modified Date" := CurrentDatetime;
                            EprocurementStatistics.Modify(true);
                        end else begin
                            EprocurementStatistics.Init;
                            EprocurementStatistics."Vendor No" := vendornumber;
                            EprocurementStatistics.Validate("Vendor No");
                            EprocurementStatistics."Document No" := invitationnumber;
                            EprocurementStatistics."Procurement Process" := EprocurementStatistics."procurement process"::"ITT Response";
                            EprocurementStatistics.Step := 'Initial Section';
                            EprocurementStatistics."Last Modified Date" := CurrentDatetime;
                            EprocurementStatistics.Insert(true);
                        end;
                        //MESSAGE('%1 Success',TenderBids."Requisition No");
                        status := 'success*The Tender Details has been successfully modified*' + TenderBids."Requisition No";
                    end else begin
                        // MESSAGE('Failed Success');
                        status := 'danger*The Tender Details could not be submitted successfully 6';
                    end;

                    //    REPEAT
                    //      TenderBids.INIT;
                    //      //TenderBids.EntryNo:=TenderBids.EntryNo+100;
                    //      TenderBids."Line No":=ProcurementRequestLines."Line No";
                    //      TenderBids."Requisition No":=invitationnumber;
                    //      TenderBids."Bidder Name":=Vendor.Name;
                    //      TenderBids."Bidder Email":=Vendor.Email;
                    //      TenderBids."Vendor No":=vendornumber;
                    //      TenderBids."Linked vendor":=vendornumber;
                    //      TenderBids.VALIDATE(Type,ProcurementRequestLines.Type);
                    //      TenderBids.VALIDATE(No,ProcurementRequestLines.No);
                    //      TenderBids.VALIDATE("Item No",ProcurementRequestLines.No);
                    //     // TenderBids.Type:=ProcurementRequestLines.Type;
                    //      //TenderBids.No:=ProcurementRequestLines.No;
                    //      TenderBids.Description:=ProcurementRequestLines.Specifications;
                    //      TenderBids.Quantity:=ProcurementRequestLines.Quantity;
                    //      TenderBids."Unit of Measure":=ProcurementRequestLines."Unit of Measure";
                    //   IF TenderBids.MODIFY(TRUE) THEN BEGIN
                    //    //MESSAGE('%1 Success',TenderBids."Requisition No");
                    //     status:='success*The Tender Details has been successfully submittted*'+TenderBids."Requisition No";
                    //    END ELSE BEGIN
                    //      // MESSAGE('Failed Success');
                    //  status:='danger*The Tender Details could not be submitted successfully 6';
                    //  END;
                    //  UNTIL ProcurementRequestLines.NEXT=0;
                end;
            end else begin
                ProcurementRequestLines.Reset;
                ProcurementRequestLines.SetRange("Requisition No", invitationnumber);
                if ProcurementRequestLines.FindSet then
                    repeat
                        TenderBids.Init;
                        //TenderBids.EntryNo:=TenderBids.EntryNo+100;
                        TenderBids."Line No" := ProcurementRequestLines."Line No";
                        TenderBids."Requisition No" := invitationnumber;
                        TenderBids."Bidder Name" := Vendor.Name;
                        TenderBids."Bidder Email" := Vendor.Email;
                        TenderBids."Vendor No" := vendornumber;
                        TenderBids."Linked vendor" := vendornumber;
                        TenderBids.Validate(Type, ProcurementRequestLines.Type);
                        TenderBids.Validate(No, ProcurementRequestLines.No);
                        TenderBids.Validate("Item No", ProcurementRequestLines.No);
                        //TenderBids.Type:=ProcurementRequestLines.Type;
                        //TenderBids."Item No":=ProcurementRequestLines.No;
                        // TenderBids.No:=ProcurementRequestLines.No;
                        TenderBids.Description := ProcurementRequestLines.Specifications;
                        TenderBids.Quantity := ProcurementRequestLines.Quantity;
                        TenderBids."Unit of Measure" := ProcurementRequestLines."Unit of Measure";

                        if TenderBids.Insert(true) then begin
                            //MESSAGE('Success %1',TenderBids."Requisition No");
                            status := 'success*The Tender Details has been successfully submittted*' + TenderBids."Requisition No";
                        end else begin
                            // MESSAGE('Failed Success');
                            status := 'danger*The Tender Details could not be submitted successfully 7';
                        end;
                    until ProcurementRequestLines.Next = 0;
            end;
        end;
    end;

    procedure fnNewSubmitRFQResponseOld(vendornumber: Code[50]; invitationnumber: Code[50]) status: Text
    var
        Purch: Record "Purchase Header";
        Vendor: Record Vendor;
        BidOwner: Record "Bid Business Owner";
        VendBusinessOwner: Record "Vendor Business Owner";
        BidPreferences: Record "Bid Preference & Reservation";
        VendSpecialGroup: Record "Vendor Special Group Entry";
        BidLitigation: Record "Bid Litigation History";
        VendLitigation: Record "Vendor Litigation History";
        BidPastExperience: Record "Bid Past Experience";
        VendPastExperience: Record "Vendor Past Experience";
        BidAuditedBal: Record "Bid Audited Balance Sheet";
        VendAuditedBal: Record "Vendor Audited Balance Sheet";
        BidIncomeStat: Record "Bid Audited Income Statement";
        VendIncomeStat: Record "Vendor Audited Income Statemen";
        BidVendBankAccount: Record "Bid Vendor Bank Account";
        VendBankAccount: Record "Vendor Bank Account";
        BidKeyStaff: Record "Bid Key Staff";
        VendKeyStaff: Record "Vendor Professional Staff";
        BidKeyStaffQual: Record "Bid Key Staff Qualification";
        VendKeyStaffQual: Record "Vendor Staff Qualification";
        BidStaffExperience: Record "Bid Key Staff Experience";
        VendStaffExperience: Record "Vendor Staff Experience";
        IFS: Record "Standard Purchase Code";
        IFSLines: Record "Standard Purchase Line";
        PurchLines: Record "Purchase Line";
        EntryNo: Integer;
        BidEquipmentCompliance: Record "Bid Equipment Specification";
        TenderBids: Record "Tender Bids";
        ProcurementRequest: Record "Procurement Request";
    begin

        Vendor.Reset;
        Vendor.SetRange("No.", vendornumber);
        if Vendor.FindSet then begin
            ProcurementRequest.Reset;
            ProcurementRequest.SetRange(No, invitationnumber);
            ProcurementRequest.SetRange(Status, ProcurementRequest.Status::Released);
            ProcurementRequest.SetRange("Quotation Pending Opening", true);
            if ProcurementRequest.FindSet then begin
                TenderBids.Reset;
                TenderBids.SetRange("Requisition No", invitationnumber);
                if TenderBids.FindSet then begin
                    TenderBids."Requisition No" := ProcurementRequest.No;
                    TenderBids."Bidder Name" := Vendor.Name;
                    TenderBids."Bidder Email" := Vendor.Email;
                    TenderBids."Vendor No" := vendornumber;
                    if TenderBids.Modify(true) then begin
                        status := 'success*The Tender Details has been successfully submittted*' + TenderBids."Requisition No";
                    end else begin
                        status := 'danger*The Tender Details could not be submitted successfully 6';
                    end;
                end else begin
                    TenderBids.Init;
                    TenderBids."Requisition No" := ProcurementRequest.No;
                    TenderBids."Bidder Name" := Vendor.Name;
                    TenderBids."Bidder Email" := Vendor.Email;
                    TenderBids."Vendor No" := vendornumber;
                    if TenderBids.Insert(true) then begin
                        status := 'success*The Tender Details has been successfully submittted*' + TenderBids."Requisition No";
                    end else begin
                        status := 'danger*The Tender Details could not be submitted successfully 7';
                    end;
                end;
            end;
        end;
    end;

    local procedure fnNewSubmitRFPesponseold()
    begin
    end;

    procedure fnNewSubmitRFQResponse(vendornumber: Code[50]; invitationnumber: Code[50]) status: Text
    var
        Purch: Record "Purchase Header";
        Vendor: Record Vendor;
        BidOwner: Record "Bid Business Owner";
        VendBusinessOwner: Record "Vendor Business Owner";
        BidPreferences: Record "Bid Preference & Reservation";
        VendSpecialGroup: Record "Vendor Special Group Entry";
        BidLitigation: Record "Bid Litigation History";
        VendLitigation: Record "Vendor Litigation History";
        BidPastExperience: Record "Bid Past Experience";
        VendPastExperience: Record "Vendor Past Experience";
        BidAuditedBal: Record "Bid Audited Balance Sheet";
        VendAuditedBal: Record "Vendor Audited Balance Sheet";
        BidIncomeStat: Record "Bid Audited Income Statement";
        VendIncomeStat: Record "Vendor Audited Income Statemen";
        BidVendBankAccount: Record "Bid Vendor Bank Account";
        VendBankAccount: Record "Vendor Bank Account";
        BidKeyStaff: Record "Bid Key Staff";
        VendKeyStaff: Record "Vendor Professional Staff";
        BidKeyStaffQual: Record "Bid Key Staff Qualification";
        VendKeyStaffQual: Record "Vendor Staff Qualification";
        BidStaffExperience: Record "Bid Key Staff Experience";
        VendStaffExperience: Record "Vendor Staff Experience";
        IFS: Record "Standard Purchase Code";
        IFSLines: Record "Standard Purchase Line";
        PurchLines: Record "Purchase Line";
        EntryNo: Integer;
        BidEquipmentCompliance: Record "Bid Equipment Specification";
        TenderBids: Record "Tender Bids";
        ProcurementRequest: Record "Procurement Request";
        ProcurementRequestLines: Record "Procurement Request Lines";
    begin

        Vendor.Reset;
        Vendor.SetRange("No.", vendornumber);
        if Vendor.FindSet then begin
            ProcurementRequestLines.Reset;
            ProcurementRequestLines.SetRange("Requisition No", invitationnumber);
            TenderBids.SetRange("Linked vendor", vendornumber);
            if ProcurementRequestLines.FindSet then begin
                repeat
                    TenderBids.Init;
                    // TenderBids.EntryNo:=TenderBids.EntryNo+100;
                    TenderBids."Line No" := ProcurementRequestLines."Line No";
                    TenderBids."Requisition No" := invitationnumber;
                    TenderBids."Bidder Name" := Vendor.Name;
                    TenderBids."Bidder Email" := Vendor.Email;
                    TenderBids."Vendor No" := vendornumber;
                    TenderBids."Linked vendor" := vendornumber;
                    TenderBids.Type := ProcurementRequestLines.Type;
                    TenderBids.No := ProcurementRequestLines.No;
                    TenderBids.Description := ProcurementRequestLines.Description;
                    TenderBids.Quantity := ProcurementRequestLines.Quantity;
                    TenderBids."Unit of Measure" := ProcurementRequestLines."Unit of Measure";
                until ProcurementRequestLines.Next = 0;
                if TenderBids.Modify(true) then begin
                    status := 'success*The Tender Details has been successfully submittted*' + TenderBids."Requisition No";
                end else begin
                    status := 'danger*The Tender Details could not be submitted successfully 6';
                end;
            end else begin
                ProcurementRequestLines.Reset;
                ProcurementRequestLines.SetRange("Requisition No", invitationnumber);
                if ProcurementRequestLines.FindSet then begin
                    repeat
                        TenderBids.Init;
                        //TenderBids.EntryNo:=TenderBids.EntryNo+100;
                        TenderBids."Line No" := ProcurementRequestLines."Line No";
                        TenderBids."Requisition No" := invitationnumber;
                        TenderBids."Bidder Name" := Vendor.Name;
                        TenderBids."Bidder Email" := Vendor.Email;
                        TenderBids."Vendor No" := vendornumber;
                        TenderBids."Linked vendor" := vendornumber;
                        TenderBids.Type := ProcurementRequestLines.Type;
                        TenderBids.No := ProcurementRequestLines.No;
                        TenderBids.Description := ProcurementRequestLines.Description;
                        TenderBids.Quantity := ProcurementRequestLines.Quantity;
                        TenderBids."Unit of Measure" := ProcurementRequestLines."Unit of Measure";
                    until ProcurementRequestLines.Next = 0;
                    if TenderBids.Insert(true) then begin
                        status := 'success*The Tender Details has been successfully submittted*' + TenderBids."Requisition No";
                    end else begin
                        status := 'danger*The Tender Details could not be submitted successfully 7';
                    end;
                end;
            end;
        end;
    end;

    procedure fnNewSubmitRFPResponse(vendornumber: Code[50]; invitationnumber: Code[50]) status: Text
    var
        Purch: Record "Purchase Header";
        Vendor: Record Vendor;
        BidOwner: Record "Bid Business Owner";
        VendBusinessOwner: Record "Vendor Business Owner";
        BidPreferences: Record "Bid Preference & Reservation";
        VendSpecialGroup: Record "Vendor Special Group Entry";
        BidLitigation: Record "Bid Litigation History";
        VendLitigation: Record "Vendor Litigation History";
        BidPastExperience: Record "Bid Past Experience";
        VendPastExperience: Record "Vendor Past Experience";
        BidAuditedBal: Record "Bid Audited Balance Sheet";
        VendAuditedBal: Record "Vendor Audited Balance Sheet";
        BidIncomeStat: Record "Bid Audited Income Statement";
        VendIncomeStat: Record "Vendor Audited Income Statemen";
        BidVendBankAccount: Record "Bid Vendor Bank Account";
        VendBankAccount: Record "Vendor Bank Account";
        BidKeyStaff: Record "Bid Key Staff";
        VendKeyStaff: Record "Vendor Professional Staff";
        BidKeyStaffQual: Record "Bid Key Staff Qualification";
        VendKeyStaffQual: Record "Vendor Staff Qualification";
        BidStaffExperience: Record "Bid Key Staff Experience";
        VendStaffExperience: Record "Vendor Staff Experience";
        IFS: Record "Standard Purchase Code";
        IFSLines: Record "Standard Purchase Line";
        PurchLines: Record "Purchase Line";
        EntryNo: Integer;
        BidEquipmentCompliance: Record "Bid Equipment Specification";
        TenderBids: Record "Tender Bids";
        ProcurementRequest: Record "Procurement Request";
        ProcurementRequestLines: Record "Procurement Request Lines";
    begin

        Vendor.Reset;
        Vendor.SetRange("No.", vendornumber);
        if Vendor.FindSet then begin
            ProcurementRequestLines.Reset;
            ProcurementRequestLines.SetRange("Requisition No", invitationnumber);
            TenderBids.SetRange("Linked vendor", vendornumber);
            if ProcurementRequestLines.FindSet then begin
                repeat
                    TenderBids.Init;
                    // TenderBids.EntryNo:=TenderBids.EntryNo+100;
                    TenderBids."Line No" := ProcurementRequestLines."Line No";
                    TenderBids."Requisition No" := invitationnumber;
                    TenderBids."Bidder Name" := Vendor.Name;
                    TenderBids."Bidder Email" := Vendor.Email;
                    TenderBids."Vendor No" := vendornumber;
                    TenderBids."Linked vendor" := vendornumber;
                    TenderBids.Type := ProcurementRequestLines.Type;
                    TenderBids.No := ProcurementRequestLines.No;
                    TenderBids.Description := ProcurementRequestLines.Description;
                    TenderBids.Quantity := ProcurementRequestLines.Quantity;
                    TenderBids."Unit of Measure" := ProcurementRequestLines."Unit of Measure";
                until ProcurementRequestLines.Next = 0;
                if TenderBids.Modify(true) then begin
                    status := 'success*The Tender Details has been successfully submittted*' + TenderBids."Requisition No";
                end else begin
                    status := 'danger*The Tender Details could not be submitted successfully 6';
                end;
            end else begin
                ProcurementRequestLines.Reset;
                ProcurementRequestLines.SetRange("Requisition No", invitationnumber);
                if ProcurementRequestLines.FindSet then begin
                    repeat
                        TenderBids.Init;
                        //TenderBids.EntryNo:=TenderBids.EntryNo+100;
                        TenderBids."Line No" := ProcurementRequestLines."Line No";
                        TenderBids."Requisition No" := invitationnumber;
                        TenderBids."Bidder Name" := Vendor.Name;
                        TenderBids."Bidder Email" := Vendor.Email;
                        TenderBids."Vendor No" := vendornumber;
                        TenderBids."Linked vendor" := vendornumber;
                        TenderBids.Type := ProcurementRequestLines.Type;
                        TenderBids.No := ProcurementRequestLines.No;
                        TenderBids.Description := ProcurementRequestLines.Description;
                        TenderBids.Quantity := ProcurementRequestLines.Quantity;
                        TenderBids."Unit of Measure" := ProcurementRequestLines."Unit of Measure";
                    until ProcurementRequestLines.Next = 0;
                    if TenderBids.Insert(true) then begin
                        status := 'success*The Tender Details has been successfully submittted*' + TenderBids."Requisition No";
                    end else begin
                        status := 'danger*The Tender Details could not be submitted successfully 7';
                    end;
                end;
            end;
        end;
    end;

    procedure FnUpdateBid(vendorNo: Code[20]; ittNumber: Code[20]; bidderRepName: Text; bidderRepDesignation: Text; bidderRepAddr: Text; bidderWitnessName: Text; bidderWitnessDesignation: Text; bidderWitnessAddr: Text) insertstatus: Text
    begin
        Purch.Reset;
        Purch.SetRange("No.", ittNumber);
        Purch.SetRange("Vendor No.", vendorNo);
        Purch.SetRange("Document Status", Purch."document status"::Draft);
        if Purch.FindSet then begin
            Purch."Bidder Representative Name" := bidderRepName;
            Purch."Bidder Representative Desgn" := bidderRepDesignation;
            Purch."Bidder Representative Address" := bidderRepAddr;
            Purch."Bidder Witness Name" := bidderWitnessName;
            Purch."Bidder Witness Designation" := bidderWitnessDesignation;
            Purch."Bidder Witness Address" := bidderWitnessAddr;
            if Purch.Modify then
                insertstatus := 'success*Bidder Representative saved successfully!'
            else
                insertstatus := 'danger*Error saving your info, contact Kerra Office!'
        end
        else begin
            insertstatus := 'danger*Some details not found!'
        end
    end;

    procedure FnInsertRFQPurchaseLinesDetails(vendorNo: Code[10]; ittno: Code[50]; itemNo: Code[10]; lineno: Integer; unitcost: Decimal; remarks: Text) insertstatus: Text
    var
        TenderBids: Record "Tender Bids";
    begin
        TenderBids.Reset;
        TenderBids.SetRange("Requisition No", ittno);
        TenderBids.SetRange("Linked vendor", vendorNo);
        TenderBids.SetRange("Line No", lineno);
        if TenderBids.FindSet then begin
            TenderBids."Unit Price" := unitcost;
            TenderBids.Remarks := remarks;
            TenderBids.Amount := unitcost * TenderBids.Quantity;
            TenderBids."Amount LCY" := unitcost * TenderBids.Quantity;
            if TenderBids.Modify(true) then
                insertstatus := 'success*Details saved successfully!'
            else
                insertstatus := 'danger*Error saving your info!'
        end
        else begin
            insertstatus := 'danger*Some details not found!'
        end
    end;

    procedure FnCreateTenderDocumentsLink(VendorNumber: Code[50]; ResponseNumber: Code[50]; FileName: Text; FileLink: Text) status: Text
    var
        Vendor: Record Vendor;
        DocumentAttachment: Record "Document Attachment";
        RecordLink: Record "Record Link";
        TenderBids: Record "Tender Bids";
    begin
        // Record Links Attachment on the Applications -Obadiah Korir
        if RecordLink."Link ID" = 0 then begin
            RecordLink.URL1 := FileLink;
            RecordLink.Description := FileName;
            RecordLink.Type := RecordLink.Type::Link;
            RecordLink.Company := COMPANYNAME;
            RecordLink."User ID" := UserId;
            RecordLink.Created := CreateDatetime(Today, Time);

            TenderBids.Reset;
            TenderBids."Requisition No" := ResponseNumber;
            TenderBids."Vendor No" := VendorNumber;
            if TenderBids.Find('=') then
                RecordIDNumber := TenderBids.RecordId;
            RecordLink."Record ID" := RecordIDNumber;
            if RecordLink.Insert(true) then begin
                status := 'success*Link successfully created';
            end else begin
                status := 'error*An error occured during the process of creating link';
            end
        end;
    end;

    procedure FnCreateVendorDocumentsLink(VendorNumber: Code[50]; FileName: Text; FileLink: Text) status: Text
    var
        Vendor: Record Vendor;
        DocumentAttachment: Record "Document Attachment";
        RecordLink: Record "Record Link";
        TenderBids: Record "Tender Bids";
    begin
        // Record Links Attachment on the Applications -Obadiah Korir
        if RecordLink."Link ID" = 0 then begin
            RecordLink.URL1 := FileLink;
            RecordLink.Description := FileName;
            RecordLink.Type := RecordLink.Type::Link;
            RecordLink.Company := COMPANYNAME;
            RecordLink."User ID" := UserId;
            RecordLink.Created := CreateDatetime(Today, Time);
            Vendor.Reset;
            Vendor."No." := VendorNumber;
            if Vendor.Find('=') then
                RecordIDNumber := Vendor.RecordId;
            RecordLink."Record ID" := RecordIDNumber;
            if RecordLink.Insert(true) then begin
                status := 'success*Link successfully created';
            end else begin
                status := 'error*An error occured during the process of creating link';
            end
        end;
    end;

    procedure FnCreatePrequalififcationDocumentsLink(invitationNo: Code[50]; FileName: Text; FileLink: Text; vendorNo: Code[10]; procDocument: Code[50]; issueDate: Date; expiryDate: Date) status: Text
    var
        prequalification: Record "RFI Response Filed Document";
        DocumentAttachment: Record "Document Attachment";
        RecordLink: Record "Record Link";
        TenderBids: Record "Tender Bids";
        RFIResponse: Record "RFI Response";
        EprocurementStatistics: Record "Eprocurement Statistics";
    begin
        // Record Links Attachment on the Applications -Obadiah Korir
        // Record Links Attachment on the Applications -Obadiah Korir
        if RecordLink."Link ID" = 0 then begin
            RecordLink.URL1 := FileLink;
            RecordLink.Description := FileName;
            RecordLink.Type := RecordLink.Type::Link;
            RecordLink.Company := COMPANYNAME;
            RecordLink."User ID" := UserId;
            RecordLink.Created := CreateDatetime(Today, Time);
            prequalification.Reset;
            prequalification."Vendor No" := vendorNo;
            prequalification."Document No" := invitationNo;
            prequalification.Validate("Document No");
            prequalification."Document Type" := prequalification."document type"::"IFP Response";
            prequalification."Document Link" := FileLink;
            prequalification."Procurement Document Type ID" := procDocument;
            prequalification.Validate("Procurement Document Type ID");
            prequalification."Date Filed" := Today;
            prequalification."File Name" := FileName;
            prequalification."Issue Date" := issueDate;
            prequalification."Expiry Date" := expiryDate;
            prequalification."Procurement Process" := prequalification."procurement process"::Prequalification;
            RFIResponse.Reset;
            RFIResponse.SetRange("Document No.", invitationNo);
            if RFIResponse.FindFirst then begin
                prequalification."RFI Document No." := RFIResponse."RFI Document No.";
            end;
            if prequalification.Find('=') then
                RecordIDNumber := prequalification.RecordId;
            RecordLink."Record ID" := RecordIDNumber;
            if prequalification.Insert(true) then begin
                EprocurementStatistics.Reset;
                EprocurementStatistics.SetRange("Vendor No", vendorNo);
                EprocurementStatistics.SetRange("Document No", RFIResponse."RFI Document No.");
                EprocurementStatistics.SetRange("Procurement Process", EprocurementStatistics."procurement process"::Prequalification);
                if EprocurementStatistics.FindSet then begin
                    //EprocurementStatistics.VALIDATE("Vendor No");
                    EprocurementStatistics.Step := 'Documents Section';
                    EprocurementStatistics."Last Modified Date" := CurrentDatetime;
                    EprocurementStatistics.Modify(true);
                end else begin
                    EprocurementStatistics.Init;
                    EprocurementStatistics."Vendor No" := vendorNo;
                    EprocurementStatistics.Validate("Vendor No");
                    EprocurementStatistics."Document No" := RFIResponse."RFI Document No.";
                    EprocurementStatistics."Procurement Process" := EprocurementStatistics."procurement process"::Prequalification;
                    EprocurementStatistics.Step := 'Documents Section';
                    EprocurementStatistics."Last Modified Date" := CurrentDatetime;
                    EprocurementStatistics.Insert(true);
                end;
                status := 'success*Link successfully created';
            end else begin
                status := 'error*An error occured during the process of creating link';
            end
        end;
    end;

    procedure FnInsertFiledetailsTenderTechnical(vendorNo: Code[30]; docdescription: Text; fileName: Text; documentNo: Code[20]; documentlink: Text[250]) insertstatus: Text
    var
        BidFiledDocument: Record "Bid Filed Document";
    begin
        BidFiledDocument.Init;
        BidFiledDocument."Document Type" := BidFiledDocument."document type"::Quote;
        BidFiledDocument."Vendor No" := vendorNo;
        BidFiledDocument."No." := documentNo;
        BidFiledDocument.Description := docdescription;
        BidFiledDocument."Date Filed" := Today;
        BidFiledDocument."File Name" := fileName;
        BidFiledDocument."Procurement Process" := BidFiledDocument."procurement process"::"ITT Response";
        BidFiledDocument.DocumentLink := documentlink;
        if BidFiledDocument.Insert then begin
            EprocurementStatistics.Reset;
            EprocurementStatistics.SetRange("Vendor No", vendorNo);
            EprocurementStatistics.SetRange("Document No", documentNo);
            EprocurementStatistics.SetRange("Procurement Process", EprocurementStatistics."procurement process"::"ITT Response");
            if EprocurementStatistics.FindSet then begin
                EprocurementStatistics.Step := '3';
                EprocurementStatistics."Last Modified Date" := CurrentDatetime;
                EprocurementStatistics.Modify(true);
            end else begin
                EprocurementStatistics.Init;
                EprocurementStatistics."Vendor No" := vendorNo;
                EprocurementStatistics.Validate("Vendor No");
                EprocurementStatistics."Document No" := documentNo;
                EprocurementStatistics."Procurement Process" := EprocurementStatistics."procurement process"::"ITT Response";
                EprocurementStatistics.Step := '3';
                EprocurementStatistics."Last Modified Date" := CurrentDatetime;
                EprocurementStatistics.Insert(true);
            end;
            insertstatus := 'success*Document saved successfully!';
        end
        else begin
            insertstatus := 'danger*Error occured!';
        end
    end;

    procedure FnDeleteRFIFiledDocument(responseNo: Code[100]; entryNo: Integer) status: Text
    var
        RFIResponseFiledDocument: Record "RFI Response Filed Document";
    begin
        RFIResponseFiledDocument.Init;
        RFIResponseFiledDocument.SetRange("Document No", responseNo);
        RFIResponseFiledDocument.SetRange("Entry No", entryNo);
        if RFIResponseFiledDocument.FindSet then begin
            if RFIResponseFiledDocument.Delete(true) then begin
                status := 'success*The document has been deleted successfully';
            end else begin
                status := 'danger*An error occured while deleting the document';
            end
        end else begin
            status := 'danger*The document could not be found';
        end
    end;

    procedure FnSupplierPrequalificationsDetails(vendorNo: Code[50]; rfiDocumentNo: Code[50]) status: Text
    var
        EprocurementStatistics: Record "Eprocurement Statistics";
    begin
        status := 'success*Prequalification submitted successfully';
        EprocurementStatistics.Reset;
        EprocurementStatistics.SetRange("Vendor No", vendorNo);
        EprocurementStatistics.SetRange("Document No", rfiDocumentNo);
        EprocurementStatistics.SetRange("Procurement Process", EprocurementStatistics."procurement process"::Prequalification);
        if EprocurementStatistics.FindSet then begin
            EprocurementStatistics.Step := 'Submitted';
            EprocurementStatistics.Submitted := true;
            EprocurementStatistics."Sumitted Date" := CurrentDatetime;
            EprocurementStatistics.Modify(true);
        end else begin
            EprocurementStatistics.Init;
            EprocurementStatistics."Vendor No" := vendorNo;
            EprocurementStatistics.Validate("Vendor No");
            EprocurementStatistics."Document No" := rfiDocumentNo;
            EprocurementStatistics."Procurement Process" := EprocurementStatistics."procurement process"::Prequalification;
            EprocurementStatistics.Step := 'Submitted';
            EprocurementStatistics.Submitted := true;
            EprocurementStatistics."Sumitted Date" := CurrentDatetime;
            EprocurementStatistics.Insert(true);
        end;
    end;

    procedure FnSubmitTenderBid(vendorNo: Code[50]; rfiDocumentNo: Code[50]) status: Text
    var
        EprocurementStatistics: Record "Eprocurement Statistics";
    begin
        status := 'success*Prequalification submitted successfully';
        EprocurementStatistics.Reset;
        EprocurementStatistics.SetRange("Vendor No", vendorNo);
        EprocurementStatistics.SetRange("Document No", rfiDocumentNo);
        EprocurementStatistics.SetRange("Procurement Process", EprocurementStatistics."procurement process"::"ITT Response");
        if EprocurementStatistics.FindSet then begin
            EprocurementStatistics.Step := 'Submitted';
            EprocurementStatistics.Submitted := true;
            EprocurementStatistics."Sumitted Date" := CurrentDatetime;
            EprocurementStatistics.Modify(true);
        end else begin
            EprocurementStatistics.Init;
            EprocurementStatistics."Vendor No" := vendorNo;
            EprocurementStatistics.Validate("Vendor No");
            EprocurementStatistics."Document No" := rfiDocumentNo;
            EprocurementStatistics."Procurement Process" := EprocurementStatistics."procurement process"::"ITT Response";
            EprocurementStatistics.Step := 'Submitted';
            EprocurementStatistics.Submitted := true;
            EprocurementStatistics."Sumitted Date" := CurrentDatetime;
            EprocurementStatistics.Insert(true);
        end;
    end;

    procedure FnDeleteTenderFiledDocument(responseNo: Code[100]; entryNo: Integer) status: Text
    var
        RFIResponseFiledDocument: Record "Bid Filed Document";
    begin
        RFIResponseFiledDocument.Init;
        RFIResponseFiledDocument.SetRange("No.", responseNo);
        RFIResponseFiledDocument.SetRange("Entry No", entryNo);
        if RFIResponseFiledDocument.FindSet then begin
            if RFIResponseFiledDocument.Delete(true) then begin
                status := 'success*The document has been deleted successfully';
            end else begin
                status := 'danger*An error occured while deleting the document';
            end
        end else begin
            status := 'danger*The document could not be found';
        end
    end;

    procedure fnDeleteRFIResponseLines(documentNo: Code[30]; procurementCategory: Code[30]; rfiDocumentNo: Code[30]; vendorNo: Code[30]) insertstatus: Text
    var
        EprocurementStatistics: Record "Eprocurement Statistics";
    begin
        objIFPResponseLine.Reset;
        objIFPResponseLine.SetRange("Procurement Category", procurementCategory);
        objIFPResponseLine.SetRange("Document Type", objIFPResponseLine."document type"::"IFP Response");
        objIFPResponseLine.SetRange("RFI Document No.", rfiDocumentNo);
        //objIFPResponseLine."Document No.":=documentNo;
        objIFPResponseLine.SetRange("Document No.", documentNo);
        objIFPResponseLine.SetRange("Vendor No.", vendorNo);
        if objIFPResponseLine.FindFirst then begin
            if objIFPResponseLine.Delete(true) then begin
                insertstatus := 'success*Registration Category has been successfully deleted!';
            end else begin
                insertstatus := 'danger*An error occured while deleting the category';
            end

        end else begin
            insertstatus := 'danger*Unknown error while deleting your Registration Category!';
        end;
    end;

    procedure fnGenerateRFQForm(tenderNo: Code[50]; supplierName: Text[100]) status: Text
    var
        supplierrec: Record "Prequalified Suppliers1";
        rfqreport: Report "Request for Quotation";
        Supplierrec2: Record "Supplier Selection1";
        setuprec: Record "Purchases & Payables Setup";
    begin
        Supplierrec2.Reset;
        Supplierrec2.SetFilter("Reference No.", tenderNo);
        Supplierrec2.SetFilter("Supplier Name", supplierName);
        if Supplierrec2.FindFirst then begin
            setuprec.Reset;
            setuprec.Get;
            FileDirectory := setuprec."RFQ Documents Path";
            FileName := 'QUOTE_' + DelChr('Quotation' + Supplierrec2."Reference No." + '_' + Supplierrec2."Supplier Name", '=', '/') + '.pdf';
            if FileName <> '' then begin
                //Report.SaveAsPdf(70002, FileDirectory + FileName, Supplierrec2);
                status := 'Success*' + FileDirectory + FileName;
            end;
        end
    end;
}
