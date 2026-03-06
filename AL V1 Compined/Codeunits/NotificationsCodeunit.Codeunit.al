#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Codeunit 50013 "Notifications Codeunit"
{

    trigger OnRun()
    var
        message: Text;
    begin
    end;

    var
     //   objMail: Codeunit "SMTP Mail";
       // SMTPMailSetup: Record "SMTP Mail Setup";
        bDMeetings: Record "Board Meetings1";
        EmpRec: Record Employee;
        meetingDay: Date;
        objCommMeetings: Record "Board Meetings";
        objVendor: Record Vendor;


    procedure updateMeetingStatus(meetingNo: Code[50]): Boolean
    var
        message: Text;
        BoardMeetings: Record "Board Meetings";
        MeetingTime: Time;
    begin

        // bDMeetings.RESET;
        // bDMeetings.SETRANGE(bDMeetings.Status,bDMeetings.Status::Upcoming);
        // IF bDMeetings.FIND('-') THEN BEGIN
        //  REPEAT
        //    meetingDay:=bDMeetings."Start date";
        //   //meetingDay:=bDMeetings."End Date";
        //   IF meetingDay < TODAY THEN BEGIN
        //      EmpRec.RESET;
        //      EmpRec.SETRANGE(EmpRec."Claim Limit",TRUE);
        //      IF EmpRec.FIND('-') THEN BEGIN
        //        REPEAT
        //          log();
        //          SMTPMailSetup.GET();
        //              message:='Dear '+EmpRec."First Name" +' '+ EmpRec."Last Name" +',<br>The meeting '+bDMeetings.Title+' is past. Kindly action on it.' ;
        //              objMail.CreateMessage('NACOSTI EMAIL NOTIFICATION',SMTPMailSetup."Email Sender Address",  EmpRec."Company E-Mail", 'NACOSTI EMAIL NOTIFICATION',
        //              message, TRUE);
        //
        //            IF bDMeetings."Contact Email"<>'' THEN
        //            objMail.Send();
        //          UNTIL EmpRec.NEXT=0;
        //          END;
        //    END;
        //   UNTIL bDMeetings.NEXT=0;
        //  END
        // ELSE BEGIN
        //  ERROR('No meeting today');
        // END;
    end;


    procedure sendNotificationEmail(message: Text)
    begin
        //SMTPMailSetup.Get();
      //  objMail.CreateMessage('NACOSTI MEETING NOTIFICATION', SMTPMailSetup."Email Sender Address", 'D365@nacosti.go.ke', 'NACOSTI MEETING NOTIFICATION',
       // message, true);
      //  objMail.Send();
    end;


    procedure fnCheckMeetingTime(meetingNo: Code[10])
    var
        meetingTimeIs: Time;
        meetingDay: Date;
        message: Text;
    begin
        // bDMeetings.RESET;
        // bDMeetings.SETRANGE(bDMeetings.No, meetingNo);
        // bDMeetings.SETRANGE(bDMeetings.Status,bDMeetings.Status::Pending);
        // IF bDMeetings.FIND('-') THEN
        //  BEGIN
        //    meetingDay:=bDMeetings."Start date";
        //   //meetingDay:=bDMeetings."End Date";
        //    IF meetingDay < TODAY THEN BEGIN
        //      EmpRec.RESET;
        //      EmpRec.SETRANGE(EmpRec."Claim Limit",TRUE);
        //      IF EmpRec.FIND('-') THEN BEGIN
        //        REPEAT
        //          log();
        //          SMTPMailSetup.GET();
        //          message:='The meeting'+bDMeetings.Title+' starting time Elapsed. It has been marked as completed!';
        //          objMail.CreateMessage('NCIA NOTIFICATION SERVICE NOTIFICATION', SMTPMailSetup."Email Sender Address", {EmpRec."Company E-Mail"} 'larrykiprop@dynasoft.co.ke' , 'NCIA NOTIFICATION SERVICE NOTIFICATION', message,TRUE);
        //            IF bDMeetings."Contact Email"<>'' THEN
        //            objMail.Send();
        //
        //            bDMeetings.Status:= bDMeetings.Status::Completed;
        //            //bDMeetings.MODIFY(TRUE);
        //          UNTIL EmpRec.NEXT=0;
        //          END;
        //      END;
        //  END
        // ELSE BEGIN
        //  ERROR('No meeting today');
        // END;
    end;
}
