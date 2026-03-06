#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Codeunit 50010 portal
{

    trigger OnRun()
    begin

        //fnDeleteTestID('29501445');
        //fnLogin('DIR0001', '1234');
        //MESSAGE(FnMeetConfStatus('MEETING_043', 'DIR0001'));
        //MESSAGE(FORMAT(fnCountBoardMeetings('SFB')))
        //GetItemImage('DIR0010');
        Message(Format(fnMeetingsToday()));
        //generateDirectorPayslip('DIR0001', 20190801D)
        //MESSAGE(FnGenerateP9('DIR0001', 20180101D, 20191212D));
        //MESSAGE(generateMeetingResolutions('MEET_0011'));
    end;

    var
        objCustomer: Record Customer;
        objCopyright: Record "Copyright Registration Table";
        objNoSeriesLine: Record "No. Series Line";
        objNoSeries: Record "No. Series";
        objPortalUser: Record portalusers;
        obj: BigText;
        objInstream: InStream;
        objOutstream: OutStream;
        objText: Text;
        objValidation: Record emailvalidations;
        objServiceItems: Record "Service Item";
        Authentication: Record "Authentication Device Applicat";
        objVendor: Record Vendor;
        objCommittee: Record "Board Committees";
        objCommMembers: Record "Committee Board Members";
        objVoters: Record "Agenda Item Voters";
        objVoteItems: Record "Agenda vote items";
        objContact: Record Contact;
        objLanguages: Record Language;
        Leg: BigText;
        LegInstr: InStream;
        LegOutStr: OutStream;
        LegText: Text;
        fileManager: Codeunit "File Management";
        //CC//     tempBlob: Record TempBlob;
        successful: Boolean;
        salesHeader: Record "Sales Header";
        salesLines: Record "Sales Line";
        //SMTPMailSet: Record "SMTP Mail Setup";
        //CC//   Notification1: Codeunit "SMTP Mail";
        FILESPATH: label '\\41.89.63.253\Downloads\';
        IMAGEPATH: label '\\41.89.63.253\images\';
        objVendors: Record Vendor;
        objBoardMeetings: Record "Board Meetings1";
        objBoardMeetingsAttendance: Record "Board Meeting Attendance";
        objBoardComments: Record "Board Meeting Comments";
        objCommiteeMeeting: Record "Board Meetings";
        objBlogPost: Record Board_Blog;
        objBlogReply: Record Blog_Replies;


    procedure Testconnection()
    begin
    end;

    procedure fnLogin(customerNumber: Text[30]; password: Text) status: Text
    var
        iExists: Boolean;
    begin
        //status := 'danger*Customer does not exist';
        objPortalUser.Reset;
        objPortalUser.SetRange(objPortalUser."customer No", customerNumber);
        if objPortalUser.Find('-') then begin
            //the user exists on portal user tables
            if objPortalUser.Password = password then begin
                status := 'success*Login';
                //for Debug testing
                Message(status);
                //for Debug testing
            end else begin
                status := 'danger*Wrong password!';
                //for Debug testing
                Message(status);
                //for Debug testing
            end
        end
        else begin
            status := 'danger*Username does not exist!';
            //for Debug testing
            Message(status);
            //for Debug testing
        end;
        exit(status);
    end;

    procedure generateDirectorPayslip(director: Code[10]; payperiod: Date) status: Text
    begin
        if objVendor.Get(director) then begin
            objVendor.Reset;
            objVendor.SetRange("No.", director);
            if objVendor.FindFirst then begin
                objVendor.SetRange("Pay Period Filter", payperiod);
                //cc//orina       // if FILE.Exists(FILESPATH + Format(director) + '.pdf') then
                //     FILE.Erase(FILESPATH + Format(director) + '.pdf');
                // //Report.SaveAsPdf(89033, FILESPATH + director + '.pdf', objVendor);
                status := 'success*Downloads\' + director + '.pdf';
            end
        end else begin
            status := 'danger*The director number does not exist';
        end;
        Message(Format(status));
    end;

    procedure forgotPass(registrationNo: Code[10]) status: Text
    var
        email: Text;
    begin
        objContact.Reset;
        objContact.SetRange(objContact."Company No.", registrationNo);
        if objContact.Find('-') then begin
            email := objContact."E-Mail";
            if email = '' then begin
                status := 'danger*The customer does not have a valid email address';
            end else begin
                status := 'success*Reseting your password*' + email;
            end;
        end else begin
            status := 'danger*Customer with the specified id/registration number does not exist';
        end;
        exit(status);
    end;

    procedure changePassword(customerNo: Code[10]; currentPassword: Text; newPassword: Text; confirmNewPassword: Text) status: Text
    begin
        status := 'danger*user not found';
        objPortalUser.Reset;
        objPortalUser.SetRange(objPortalUser."customer No", customerNo);
        if objPortalUser.Find('-') then begin
            if objPortalUser.Password = currentPassword then begin
                if newPassword = confirmNewPassword then begin
                    objPortalUser.Password := newPassword;
                    if objPortalUser.Modify then begin
                        status := 'success*Your password was successfully changed';
                    end else begin
                        status := 'danger*Your password could not be reset';
                    end;
                end else begin
                    status := 'danger*New password and confirm new password do not match';
                end;
            end else begin
                status := 'danger*Wrong current password';
            end;
        end else begin
            status := 'danger*The specified customer does not exist';
        end;
    end;


    procedure fnIForgotMyPassword(CustomerNo: Code[50]; ResetPasswordIs: Text[50]) status: Text
    begin
        status := 'danger*Account not found!';
        objPortalUser.Reset;
        objPortalUser.SetRange(objPortalUser."customer No", CustomerNo);
        if objPortalUser.Find('-') then begin
            objPortalUser.Password := ResetPasswordIs;
            if objPortalUser.Modify then begin
                status := 'success*Your password was successfully changed, Kindly check your Email for the new password!';
            end
            else begin
                status := 'danger*Your password could not be reset';
            end;
        end
        else begin
            //When the user exists in customer table but not a portal user
            objCustomer.Reset;
            objCustomer.SetRange(objCustomer."ID. No.", CustomerNo);
            if objCustomer.Find('-') then begin
                objPortalUser."customer No" := CustomerNo;
                objPortalUser.validated := true;
                objPortalUser.changedPassword := 0;
                if objPortalUser.Insert(true) then begin
                    status := 'success* You account password has been set. Please click <a href="Login.aspx"> here</a> to login';
                end
                else begin
                    status := 'danger*Unknown Error Occured while resetting password, contact Admin!';
                end
            end
            else begin
                status := 'danger*Unknown Error Occured, kindly conduct System Admin!';
            end
        end;
    end;

    procedure GetItemImage(custNo: Code[50]) photo: Text
    begin
        photo := 'avatar.png';
        objVendors.Reset;
        objVendors.SetRange(objVendors."No.", custNo);
        if objVendors.FindSet then begin
            //orina 
            // objVendors.Image.ExportFile(IMAGEPATH + custNo + '.png');
            // if FILE.Exists(IMAGEPATH + custNo + '.png') then
            //     photo := custNo + '.png';
            // Message('photo saved to ' + IMAGEPATH);
        end;
    end;

    procedure fnRegisterBoard(idNumber: Code[30]) status: Text
    begin
        objVendor.Reset;
        objVendor.SetRange(objVendor."Currency Id", idNumber);
        if objVendor.Find('-') then begin
            //user is a director but not in portal users table
            //check user has email
            if objVendor."E-Mail" = '' then begin
                status := 'danger*Your account does not have a valid email address. Please contact the head office to have your details captured in the system';
            end
            else begin
                //create account in portal users
                objPortalUser.Init;
                objPortalUser."customer No" := idNumber;
                objPortalUser.validated := false;
                objPortalUser.changedPassword := 0;
                objPortalUser.usertype := 1;
                if objPortalUser.Insert then begin
                    //send mail with activation link
                    status := 'success*Board';
                    //for Debug testing
                    Message(status);
                    //for Debug testing

                end
                else begin
                    status := 'danger*Your account could not be created. Please try again later';

                    //for Debug testing
                    Message(status);
                    //for Debug testing
                end
            end
        end;
    end;

    procedure fnMeetingsToday() countMeetings: Integer
    begin
        objBoardMeetings.Reset;
        objBoardMeetings.SetRange("Start date", Today);
        if objBoardMeetings.Find('-') then begin
            countMeetings := objBoardMeetings.Count;
            // MESSAGE(FORMAT(countMeetings));
        end
        else begin
            countMeetings := 0;
            //MESSAGE(FORMAT(countMeetings));
        end;
        exit(countMeetings);
    end;

    procedure FnInsertComment(meetingCode: Code[30]; directorNo: Code[30]; commentText: Text) isInserted: Text
    begin
        objBoardComments.Init;
        objBoardComments."Meeting Code" := meetingCode;
        objBoardComments."Member No" := directorNo;
        objBoardComments.Comment := commentText;
        objBoardComments."Date Created" := Today;
        objBoardComments."Time Created" := Time;

        if objBoardComments.Insert = true then begin
            isInserted := 'success*Your Comment saved successfully!';
        end
        else begin
            isInserted := 'danger*Error occured, comment could not be saved!';
        end
    end;

    procedure generateMeetingResolutions(meetingCode: Code[20]) status: Text
    begin
        objBoardMeetings.Reset;
        objBoardMeetings.SetRange(No, meetingCode);
        if objBoardMeetings.FindFirst then begin
            //orina 
            // if FILE.Exists(FILESPATH + '\Resolutions\' + Format(meetingCode) + '.pdf') then
            //     FILE.Erase(FILESPATH + '\Resolutions\' + Format(meetingCode) + '.pdf');
            // //Report.SaveAsPdf(56004, FILESPATH + '\Resolutions\' + meetingCode + '.pdf');
            status := 'success*Downloads\Resolutions\' + meetingCode + '.pdf';
        end
        else begin
            status := 'danger*The meeting does not exist';
        end;
        Message(Format(status));
    end;

    procedure FnGenerateP9(dirNumber: Code[20]; startDate: Date; endDate: Date) status: Text
    begin
        objVendor.Reset;
        objVendor.SetRange(objVendor."No.", dirNumber);
        if objVendor.FindSet then begin
            objVendor.SetFilter("Date Filter", Format(Format(startDate) + '..' + Format(endDate)));

            //orina 
            // if FILE.Exists(FILESPATH + '\P9\' + dirNumber + '.pdf') then begin
            //     FILE.Erase(FILESPATH + '\P9\' + dirNumber + '.pdf');
            //     //Report.SaveAsPdf(69021, FILESPATH + '\P9\' + dirNumber + '.pdf', objVendor);
            //     status := 'success*Downloads\P9\' + dirNumber + '.pdf';
            // end
            // else begin
            //         status := 'danger*Error generating P9 Report!';
            //     end
            // end
            // else begin
            //     status := 'danger*Director number not found!';
        end;
    end;

    procedure generateCommitteeResolutions(meetingCode: Code[20]) status: Text
    begin
        objCommiteeMeeting.Reset;
        objCommiteeMeeting.SetRange(No, meetingCode);
        if objCommiteeMeeting.FindFirst then begin
            //         if FILE.Exists(FILESPATH + '\Resolutions\' + Format(meetingCode) + '.pdf') then
            //             FILE.Erase(FILESPATH + '\Resolutions\' + Format(meetingCode) + '.pdf');
            //     //Report.SaveAsPdf(56004, FILESPATH + '\Resolutions\' + meetingCode + '.pdf');
            //     status := 'success*Downloads\Resolutions\' + meetingCode + '.pdf';
            // end
            // else begin
            //     status := 'danger*The meeting does not exist';
        end;
        Message(Format(status));
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
            objBlogPost."Created ByDirNo" := dirNo;
            objBlogPost."Created ByDirName" := dirName;
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
        objBlogReply."Replier DirNo" := dirNo;
        objBlogReply."Replier Name" := dirName;
        objBlogReply."Date Replied" := Today;
        objBlogReply."Time Replied" := Time;

        if objBlogReply.Insert = true then begin
            insertStatus := 'success*Your reply successfully send';
        end else begin
            insertStatus := 'danger*Error occured, reply could not be created!';
        end
    end;

    procedure FnResetPassword(dirNo: Code[30]; newPassword: Text) passChangestatus: Text
    begin
        objPortalUser.Reset;
        objPortalUser.SetRange("customer No", dirNo);

        if objPortalUser.FindSet then begin
            objPortalUser.Password := newPassword;
            if objPortalUser.Modify(true) then begin
                passChangestatus := 'success*Your password was reset and sent to your email, kindly check your email!';
            end
            else begin
                passChangestatus := 'danger*Error changing Password!';
            end
        end
        else begin
            passChangestatus := 'danger*That director number does not exist';
        end
    end;

    procedure FnConfirmMeeting(meetingNo: Code[30]; dirNo: Code[30]; confirmStatus: Option) statusConfirmed: Text
    begin
        objBoardMeetingsAttendance.Reset;
        objBoardMeetingsAttendance.SetRange("Meeting Code", meetingNo);
        objBoardMeetingsAttendance.SetRange("Member No", dirNo);

        if objBoardMeetingsAttendance.FindSet then begin
            objBoardMeetingsAttendance."Attendance Confirmation" := confirmStatus;
            if objBoardMeetingsAttendance.Modify then begin
                statusConfirmed := 'success*Successfully reacted to the meeting confirmation!';
            end
            else begin
                statusConfirmed := 'danger*Unknown error occured, could not save your confirmation!';
            end
        end
        else begin
            statusConfirmed := 'danger*Meeting not found!';
        end
    end;

    procedure FnMeetConfStatus(meetCode: Code[30]; dirCode: Code[30]) confirmationStatus: Text
    begin
        objBoardMeetingsAttendance.Reset;
        objBoardMeetingsAttendance.SetRange("Meeting Code", meetCode);
        objBoardMeetingsAttendance.SetRange("Member No", dirCode);

        if objBoardMeetingsAttendance.FindSet then begin
            confirmationStatus := Format(objBoardMeetingsAttendance."Attendance Confirmation");
        end
        else begin
            confirmationStatus := 'Not found!';
        end
    end;

    procedure fnCountBoardMeetings(meetingCode: Code[30]) meetCount: Integer
    begin
        objBoardMeetings.Reset;
        objBoardMeetings.SetRange("Meeting group Code", meetingCode);
        objBoardMeetings.SetRange(Status, objBoardMeetings.Status::Completed);

        if objBoardMeetings.FindSet then begin
            meetCount := objBoardMeetings.Count;
        end
        else begin
            meetCount := 0;
        end
    end;

    procedure fnCountCommitteeMeetings(meetingCode: Code[30]) meetCount: Integer
    begin
        objCommiteeMeeting.Reset;
        objCommiteeMeeting.SetRange("Meeting group Code", meetingCode);
        objCommiteeMeeting.SetRange(Status, objCommiteeMeeting.Status::Completed);

        if objCommiteeMeeting.FindSet then begin
            meetCount := objCommiteeMeeting.Count;
        end
        else begin
            meetCount := 0;
        end
    end;

    procedure fInsertBoardAgendaComment(applicationNo: Code[50]; agendanNo: Code[30]; Comment: Text[50]) status: Text[100]
    var
        agendaLines: Record "Agenda Lines";
    begin
        agendaLines.Reset;
        agendaLines.SetRange("Board Meeting No", applicationNo);
        agendaLines.SetRange("Agenda No", agendanNo);
        if agendaLines.FindFirst then begin
            agendaLines.Comments := Comment;
            if agendaLines.Modify(true) then begin
                status := 'success*Your Comment saved successfully!';
            end else
                status := 'danger*danger*Error occured, comment could not be saved!';
        end
    end;
}
