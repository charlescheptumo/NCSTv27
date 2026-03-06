#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Codeunit 50004 "Email Notifications"
{

    // trigger OnRun()
    // begin
    // end;

    // var
    //   //  SMTP: Codeunit "SMTP Mail";
    //     TemplateFile: File;
    //     SenderName: Text[100];
    //     SenderAddress: Text[100];
    //     Recipient: Text[100];
    //     Subject: Text[100];
    //     Body: Text[1024];
    //     InStreamTemplate: InStream;
    //     InSReadChar: Text[1];
    //     CharNo: Text[4];
    //     I: Integer;
    //     FromUser: Text[100];
    //     MailCreated: Boolean;
    //     HRSEtup: Record "Human Resources Setup";
    //     Text001: label 'Sales %1';
    //     Text002: label 'Purchase %1';
    //     Text003: label 'requires your approval.';
    //     Text004: label 'To view your documents for approval, please use the following link:';
    //     Text005: label 'Customer';
    //     Text007: label 'Microsoft Dynamics NAV: %1 Mail';
    //     Text008: label 'Approval';
    //     Text009: label 'Cancellation';
    //     Text010: label 'Rejection';
    //     Text011: label 'Delegation';
    //     Text012: label 'Overdue Approvals';
    //     Text013: label 'Mwalimu Sacco Microsoft Dynamics NAV Document Approval System';
    //     Text014: label 'has been cancelled.';
    //     Text015: label 'To view the cancelled document, please use the following link:';
    //     Text016: label 'has been rejected.';
    //     Text017: label 'To view the rejected document, please use the following link:';
    //     Text018: label 'Vendor';
    //     Text020: label 'has been delegated.';
    //     Text021: label 'To view the delegated document, please use the following link:';
    //     Text022: label 'Overdue approval';
    //     Text030: label 'Not yet overdue';
    //     Text033: label 'Rejection comments:';
    //     Text040: label 'You must import an Approval Template in Approval Setup.';
    //     Text041: label 'You must import an Overdue Approval Template in Approval Setup.';
    //     Text042: label 'Available Credit Limit (LCY)';
    //     Text043: label 'Request Amount (LCY)';
    //     Text044: label 'Times U Sacco Welfare: %1 Mail';
    //     Text045: label 'Event Notification';
    //     Text046: label 'Microsoft Dynamics NAV Event Notification System';
    //     Text047: label 'Event ID :';
    //     Text048: label 'Requires your attention';
    //     Text049: label 'Welfare Message';
    //     Text050: label ' Event Venue';
    //     Text051: label ' .Kindly Contact the HR if you have any comments/queries regarding this event/activity';


    // procedure SendLeaveAppApprovalsMail(HRLeaveApp: Record "HR Leave Application"; ApprovalEntry: Record "Approval Entry")
    // begin

    //     SetTemplate(ApprovalEntry);
    //     Subject := StrSubstNo(Text007, Text008);
    //     Body := Text013;

    //     SMTP.CreateMessage(SenderName, SenderAddress, Recipient, Subject, Body, true);
    //     Body := '';

    //     while InStreamTemplate.eos() = false do begin
    //         InStreamTemplate.ReadText(InSReadChar, 1);
    //         if InSReadChar = '%' then begin
    //             SMTP.AppendBody(Body);
    //             Body := InSReadChar;
    //             if InStreamTemplate.ReadText(InSReadChar, 1) <> 0 then;
    //             if (InSReadChar >= '0') and (InSReadChar <= '9') then begin
    //                 Body := Body + '1';
    //                 CharNo := InSReadChar;
    //                 while (InSReadChar >= '0') and (InSReadChar <= '9') do begin
    //                     if InStreamTemplate.ReadText(InSReadChar, 1) <> 0 then;
    //                     if (InSReadChar >= '0') and (InSReadChar <= '9') then
    //                         CharNo := CharNo + InSReadChar;
    //                 end;
    //             end else
    //                 Body := Body + InSReadChar;
    //             FillLeaveApprovalNotMail(Body, CharNo, HRLeaveApp, ApprovalEntry, 0);
    //             SMTP.AppendBody(Body);
    //             Body := InSReadChar;
    //         end else begin
    //             Body := Body + InSReadChar;
    //             I := I + 1;
    //             if I = 500 then begin
    //                 SMTP.AppendBody(Body);
    //                 Body := '';
    //                 I := 0;
    //             end;
    //         end;
    //     end;
    //     SMTP.AppendBody(Body);
    //     SMTP.Send;
    // end;


    // procedure SendLeaveAppCancellationsMail(HRLeaveApp: Record "HR Leave Application"; ApprovalEntry: Record "Approval Entry")
    // begin

    //     if MailCreated then begin
    //         GetEmailAddress(ApprovalEntry);
    //         if Recipient <> SenderAddress then
    //             SMTP.AddCC(Recipient);
    //     end else begin
    //         SetTemplate(ApprovalEntry);
    //         Subject := StrSubstNo(Text007, Text009);
    //         Body := Text013;

    //         SMTP.CreateMessage(SenderName, FromUser, SenderAddress, Subject, Body, true);
    //         if Recipient <> SenderAddress then
    //             SMTP.AddCC(Recipient);

    //         Body := '';

    //         while InStreamTemplate.eos() = false do begin
    //             InStreamTemplate.ReadText(InSReadChar, 1);
    //             if InSReadChar = '%' then begin
    //                 SMTP.AppendBody(Body);
    //                 Body := InSReadChar;
    //                 if InStreamTemplate.ReadText(InSReadChar, 1) <> 0 then;
    //                 if (InSReadChar >= '0') and (InSReadChar <= '9') then begin
    //                     Body := Body + '1';
    //                     CharNo := InSReadChar;
    //                     while (InSReadChar >= '0') and (InSReadChar <= '9') do begin
    //                         if InStreamTemplate.ReadText(InSReadChar, 1) <> 0 then;
    //                         if (InSReadChar >= '0') and (InSReadChar <= '9') then
    //                             CharNo := CharNo + InSReadChar;
    //                     end;
    //                 end else
    //                     Body := Body + InSReadChar;
    //                 FillLeaveApprovalNotMail(Body, CharNo, HRLeaveApp, ApprovalEntry, 1);
    //                 SMTP.AppendBody(Body);
    //                 Body := InSReadChar;
    //             end else begin
    //                 Body := Body + InSReadChar;
    //                 I := I + 1;
    //                 if I = 500 then begin
    //                     SMTP.AppendBody(Body);
    //                     Body := '';
    //                     I := 0;
    //                 end;
    //             end;
    //         end;
    //         SMTP.AppendBody(Body);
    //         MailCreated := true;
    //     end;
    // end;


    // procedure SendLeaveRejectionsMail(HRLeaveApp: Record "HR Leave Application"; ApprovalEntry: Record "Approval Entry")
    // var
    //     AppCommentLine: Record "Approval Comment Line";
    // begin

    //     if MailCreated then begin
    //         GetEmailAddress(ApprovalEntry);
    //         if Recipient <> SenderAddress then
    //             SMTP.AddCC(Recipient);
    //     end else begin
    //         SetTemplate(ApprovalEntry);
    //         Subject := StrSubstNo(Text007, Text010);
    //         Body := Text013;

    //         SMTP.CreateMessage(SenderName, FromUser, SenderAddress, Subject, Body, true);
    //         SMTP.AddCC(Recipient);
    //         Body := '';

    //         while InStreamTemplate.eos() = false do begin
    //             InStreamTemplate.ReadText(InSReadChar, 1);
    //             if InSReadChar = '%' then begin
    //                 SMTP.AppendBody(Body);
    //                 Body := InSReadChar;
    //                 if InStreamTemplate.ReadText(InSReadChar, 1) <> 0 then;
    //                 if (InSReadChar >= '0') and (InSReadChar <= '9') then begin
    //                     Body := Body + '1';
    //                     CharNo := InSReadChar;
    //                     while (InSReadChar >= '0') and (InSReadChar <= '9') do begin
    //                         if InStreamTemplate.ReadText(InSReadChar, 1) <> 0 then;
    //                         if (InSReadChar >= '0') and (InSReadChar <= '9') then
    //                             CharNo := CharNo + InSReadChar;
    //                     end;
    //                 end else
    //                     Body := Body + InSReadChar;
    //                 FillLeaveApprovalNotMail(Body, CharNo, HRLeaveApp, ApprovalEntry, 2);
    //                 SMTP.AppendBody(Body);
    //                 Body := InSReadChar;
    //             end else begin
    //                 Body := Body + InSReadChar;
    //                 I := I + 1;
    //                 if I = 500 then begin
    //                     SMTP.AppendBody(Body);
    //                     Body := '';
    //                     I := 0;
    //                 end;
    //             end;
    //         end;
    //         SMTP.AppendBody(Body);

    //         // Append Comment Lines
    //         ApprovalEntry.CalcFields(Comment);
    //         if ApprovalEntry.Comment then begin
    //             AppCommentLine.SetCurrentkey("Table ID", "Document Type", "Document No.");
    //             AppCommentLine.SetRange("Table ID", ApprovalEntry."Table ID");
    //             AppCommentLine.SetRange("Document Type", ApprovalEntry."Document Type");
    //             AppCommentLine.SetRange("Document No.", ApprovalEntry."Document No.");
    //             if AppCommentLine.Find('-') then begin
    //                 Body := StrSubstNo('<p class="MsoNormal"><font face="Arial size 2"><b>%1</b></font></p>', Text033);
    //                 SMTP.AppendBody(Body);
    //                 repeat
    //                     BuildCommentLine(AppCommentLine);
    //                 until AppCommentLine.Next = 0;
    //             end;
    //         end;
    //         MailCreated := true;
    //     end;
    //     SMTP.Send;
    // end;


    // procedure SendLeaveDelegationsMail(HRLeaveApp: Record "HR Leave Application"; ApprovalEntry: Record "Approval Entry")
    // begin

    //     SetTemplate(ApprovalEntry);
    //     Subject := StrSubstNo(Text007, Text011);
    //     Body := Text013;

    //     SMTP.CreateMessage(SenderName, FromUser, Recipient, Subject, Body, true);
    //     SMTP.AddCC(SenderAddress);
    //     Body := '';

    //     while InStreamTemplate.eos() = false do begin
    //         InStreamTemplate.ReadText(InSReadChar, 1);
    //         if InSReadChar = '%' then begin
    //             SMTP.AppendBody(Body);
    //             Body := InSReadChar;
    //             if InStreamTemplate.ReadText(InSReadChar, 1) <> 0 then;
    //             if (InSReadChar >= '0') and (InSReadChar <= '9') then begin
    //                 Body := Body + '1';
    //                 CharNo := InSReadChar;
    //                 while (InSReadChar >= '0') and (InSReadChar <= '9') do begin
    //                     if InStreamTemplate.ReadText(InSReadChar, 1) <> 0 then;
    //                     if (InSReadChar >= '0') and (InSReadChar <= '9') then
    //                         CharNo := CharNo + InSReadChar;
    //                 end;
    //             end else
    //                 Body := Body + InSReadChar;
    //             FillLeaveApprovalNotMail(Body, CharNo, HRLeaveApp, ApprovalEntry, 3);
    //             SMTP.AppendBody(Body);
    //             Body := InSReadChar;
    //         end else begin
    //             Body := Body + InSReadChar;
    //             I := I + 1;
    //             if I = 500 then begin
    //                 SMTP.AppendBody(Body);
    //                 Body := '';
    //                 I := 0;
    //             end;
    //         end;
    //     end;
    //     SMTP.AppendBody(Body);
    //     SMTP.Send;
    // end;


    // procedure SetTemplate(AppEntry: Record "Approval Entry")
    // begin
    //     /*AppSetup.GET;
    //     AppSetup.CALCFIELDS("Approval Template");
    //     IF NOT AppSetup."Approval Template".HASVALUE THEN
    //       ERROR(Text040);
    //     AppSetup."Approval Template".CREATEINSTREAM(InStreamTemplate);*/
    //     SenderName := COMPANYNAME;
    //     Clear(SenderAddress);
    //     Clear(Recipient);
    //     GetEmailAddress(AppEntry);

    // end;


    // procedure FillLeaveApprovalNotMail(var Body: Text[254]; TextNo: Text[30]; HRLeaveApp: Record "HR Leave Application"; AppEntry: Record "Approval Entry"; CalledFrom: Option Approve,Cancel,Reject,Delegate)
    // var
    //     DocType: Option Quote,"Order",Invoice,"Credit Memo","Blanket Order","Return Order","None","Payment Voucher","Petty Cash",Imprest,Requisition,ImprestSurrender,Interbank,Receipt,"Staff Claim","Staff Advance",AdvanceSurrender,"Bank Slip",Grant,"Grant Surrender","Employee Requisition","Leave Application";
    // begin

    //     case TextNo of
    //         '1':
    //             Body := StrSubstNo('', 'Leave Application');
    //         '2':
    //             Body := StrSubstNo(Body, HRLeaveApp."Application Code");
    //         '3':
    //             case CalledFrom of
    //                 Calledfrom::Approve:
    //                     Body := StrSubstNo(Body, Text003);
    //                 Calledfrom::Cancel:
    //                     Body := StrSubstNo(Body, Text014);
    //                 Calledfrom::Reject:
    //                     Body := StrSubstNo(Body, Text016);
    //                 Calledfrom::Delegate:
    //                     Body := StrSubstNo(Body, Text020);
    //             end;
    //         '4':
    //             case CalledFrom of
    //                 Calledfrom::Approve:
    //                     Body := '';
    //                 Calledfrom::Cancel:
    //                     Body := '';
    //                 Calledfrom::Reject:
    //                     Body := '';
    //                 Calledfrom::Delegate:
    //                     Body := '';
    //             end;
    //         '5':
    //             Body := '';
    //         '6':
    //             Body := '';
    //         '7':
    //             Body := StrSubstNo(Body, AppEntry.FieldCaption(Amount));
    //         '8':
    //             Body := StrSubstNo(Body, AppEntry."Currency Code");
    //         '9':
    //             Body := StrSubstNo(Body, AppEntry.Amount);
    //         '10':
    //             Body := StrSubstNo(Body, AppEntry.FieldCaption("Amount (LCY)"));
    //         '11':
    //             Body := StrSubstNo(Body, AppEntry."Amount (LCY)");
    //         '12':
    //             Body := StrSubstNo(Body, Text005);
    //         '13':
    //             Body := StrSubstNo(Body, HRLeaveApp."Application Code");
    //         //'14': Body := STRSUBSTNO(Body,Header.Payee);
    //         '15':
    //             Body := StrSubstNo(Body, AppEntry.FieldCaption("Due Date"));
    //         '16':
    //             Body := StrSubstNo(Body, AppEntry."Due Date");
    //         '17':
    //             Body := Text042;
    //         '18':
    //             Body := StrSubstNo(Body, AppEntry."Available Credit Limit (LCY)");
    //     end;
    // end;


    // procedure GetEmailAddress(AppEntry: Record "Approval Entry")
    // var
    //     UserSetup: Record "User Setup";
    // begin
    //     UserSetup.Get(AppEntry."Sender ID");
    //     UserSetup.TestField("E-Mail");
    //     SenderAddress := UserSetup."E-Mail";
    //     UserSetup.Get(AppEntry."Approver ID");
    //     UserSetup.TestField("E-Mail");
    //     Recipient := UserSetup."E-Mail";
    //     UserSetup.Get(UserId);
    //     UserSetup.TestField("E-Mail");
    //     FromUser := UserSetup."E-Mail";
    // end;


    // procedure BuildCommentLine(Comments: Record "Approval Comment Line")
    // var
    //     CommentLine: Text[500];
    // begin
    //     CommentLine := '<p class="MsoNormal"><span style="font-family:Arial size 2">' +
    //       Comments.Comment + '</span></p>';
    //     SMTP.AppendBody(CommentLine);
    // end;


    // procedure SendLeaveApprovedMail(HRLeaveReq: Record "HR Leave Application"; ApprovalEntry: Record "Approval Entry")
    // var
    //     CR: Char;
    //     LF: Char;
    // begin
    //     SetTemplate(ApprovalEntry);

    //     Subject := StrSubstNo(Text007, Text008);//+'Testing -Please Ignore';
    //     //Body := Text013;

    //     //MESSAGE('receipient %1',SenderAddress);
    //     SMTP.CreateMessage(SenderName, SenderAddress, Recipient, Subject, Body, true);
    //     SMTP.AddCC(Recipient);

    //     SMTP.AppendBody(Body);

    //     Body := 'Dear Sir/Madam ' + HRLeaveReq.Names;
    //     SMTP.AppendBody(Body);
    //     Body := 'Your' + HRLeaveReq."Leave Type" + ' leave has been approved to start from date ' + Format(HRLeaveReq."Start Date") + ' up to ' + Format(HRLeaveReq."Return Date");
    //     SMTP.AppendBody(Body);
    //     Body := 'your reliever is ' + HRLeaveReq."Reliever Name";
    //     SMTP.AppendBody(Body);
    //     HRLeaveReq.CalcFields(HRLeaveReq.RelieverAddress);

    //     // SMTP.AppendBody(Body);
    //     //SMTP.AddCC(HRLeaveReq.RelieverAddress);
    //     SMTP.AddCC(HRLeaveReq."Supervisor E-mail");
    //     SMTP.Send;
    //     Message('Sent');
    // end;


    // procedure FnSendEmail(SenderEmailAddress: Text; SenderName: Text; RecepientsMail: Text; Subject: Text; Body: Text)
    // var
    //     SMTPMail: Codeunit "SMTP Mail";
    // begin
    //     if (SenderEmailAddress <> '') and (RecepientsMail <> '') and (Subject <> '') then begin
    //         SMTPMail.CreateMessage(SenderName, SenderEmailAddress, RecepientsMail, Subject, Body, true);
    //         SMTPMail.Send();
    //     end;
    // end;

    // local procedure InsuranceNotifications()
    // begin
    // end;

    // local procedure TenderOpenigNotifications()
    // begin
    // end;


    // procedure SendPRNApprovedMail(PRN: Record "Purchase Header")
    // var
    //     CR: Char;
    //     LF: Char;
    //     ProcSetup: Record "Procurement Setup";
    //     Text00009: label 'Final Approval of Purchase Requisition No: %1';
    //     Emp: Record Employee;
    //     CompInfo: Record "Company Information";
    //     ApprovalEntry: Record "Approval Entry";
    // begin
    //     /*ApprovalEntry.RESET;
    //     ApprovalEntry.SETRANGE("Document No.",PRN."No.");
    //     ApprovalEntry.SETRANGE("Table ID",38);

    //      SetTemplate(ApprovalEntry);*/
    //     Emp.Reset;
    //     Emp.SetRange("No.", PRN."Request-By No.");
    //     if Emp.FindSet then begin
    //         Recipient := Emp."Company E-Mail";
    //     end;
    //     CompInfo.Get;
    //     ProcSetup.Get;
    //     SenderAddress := ProcSetup."Default Proc Email Contact";
    //     SenderName := CompInfo.Name;
    //     Subject := StrSubstNo(Text00009, PRN."No.");//+'Testing -Please Ignore';
    //                                                 //Body := Text013;
    //     SMTP.CreateMessage(SenderName, SenderAddress, Recipient, Subject, Body, true);
    //     SMTP.AppendBody(Body);
    //     Body := 'Dear ' + PRN."Request-By Name";
    //     SMTP.AppendBody(Body);
    //     Body := 'Your Purchase Requisition Note Has now been fully approved/Released.';
    //     SMTP.AppendBody(Body);
    //     Body := 'PRN No:' + PRN."No.";
    //     SMTP.AppendBody(Body);
    //     Body := 'Requisition Summary:' + PRN.Description;
    //     SMTP.AppendBody(Body);
    //     Body := 'Total Requisition Amount Inc Taxes (LCY):' + Format(PRN."Amount Including VAT");
    //     SMTP.AppendBody(Body);
    //     Body := 'Please note taht you shall be notified once Procurement raises the invitation For supply (IFS) for this PRN';
    //     SMTP.AppendBody(Body);
    //     Body := 'NB: This is a system generated Email. Yu do not need to respond to it. in case of any further clarifications or help, kindly contact the Procurement Department';
    //     SMTP.AppendBody(Body);



    //     SMTP.Send;
    //     Message('Notifications sent successfully');

    // end;


    // procedure SendPRNApprovedMailAfterIFSCreation(PRN: Record "Purchase Header")
    // var
    //     CR: Char;
    //     LF: Char;
    //     ProcSetup: Record "Procurement Setup";
    //     Text00009: label 'Final Approval of Purchase Requisition No: %1';
    //     Emp: Record Employee;
    //     CompInfo: Record "Company Information";
    //     ApprovalEntry: Record "Approval Entry";
    // begin
    //     /*ApprovalEntry.RESET;
    //     ApprovalEntry.SETRANGE("Document No.",PRN."No.");
    //     ApprovalEntry.SETRANGE("Table ID",38);

    //      SetTemplate(ApprovalEntry);*/
    //     Emp.Reset;
    //     Emp.SetRange("No.", PRN."Request-By No.");
    //     if Emp.FindSet then begin
    //         Recipient := Emp."Company E-Mail";
    //     end;
    //     CompInfo.Get;
    //     ProcSetup.Get;
    //     SenderAddress := ProcSetup."Default Proc Email Contact";
    //     SenderName := CompInfo.Name;
    //     Subject := StrSubstNo(Text00009, PRN."No.");//+'Testing -Please Ignore';
    //                                                 //Body := Text013;
    //     SMTP.CreateMessage(SenderName, SenderAddress, Recipient, Subject, Body, true);
    //     SMTP.AppendBody(Body);
    //     Body := 'Dear ' + PRN."Request-By Name";
    //     SMTP.AppendBody(Body);
    //     Body := 'The Sourcing Process for your Purchase Requisition: ' + PRN."No." +
    //     ' has begun<BR>. An invitation for supply(IFS) Notice has been created by procurement Department.' +
    //     'You can track progress based on below summary:';
    //     SMTP.AppendBody(Body);
    //     Body := 'Purchase Requisition Note:' + PRN."No.";
    //     SMTP.AppendBody(Body);
    //     Body := 'Invitation Notice No:' + PRN."Linked IFS No.";
    //     SMTP.AppendBody(Body);
    //     Body := 'Notice Type:' + Format(PRN."PP  Invitation Notice Type");
    //     SMTP.AppendBody(Body);
    //     Body := 'Responsible Procurement Officer:' + Format(PRN."Purchaser Code");
    //     SMTP.AppendBody(Body);
    //     Body := 'Please note that you shall be notified once Procurement publishes this IFS to the bidders/vendors';
    //     SMTP.AppendBody(Body);
    //     Body := 'NB: This is a system generated Email. You do not need to respond to it. in case of any further clarifications or help, kindly contact the Procurement Department';
    //     SMTP.AppendBody(Body);



    //     SMTP.Send;
    //     Message('Notifications sent successfully');

    // end;


    // procedure SendStoreRequisitonIssued(Store: Record "Purchase Header")
    // var
    //     CR: Char;
    //     LF: Char;
    //     ProcSetup: Record "Procurement Setup";
    //     Text00009: label 'Final Approval of Purchase Requisition No: %1';
    //     Emp: Record Employee;
    //     CompInfo: Record "Company Information";
    //     ApprovalEntry: Record "Approval Entry";
    //     StoreLines: Record "Purchase Line";
    //     PersonIssuedTo: Text;
    //     QuantityRequested: Decimal;
    //     QuantityIssued: Decimal;
    //     RequestorEmail: Text;
    // begin
    //     /*ApprovalEntry.RESET;
    //     ApprovalEntry.SETRANGE("Document No.",PRN."No.");
    //     ApprovalEntry.SETRANGE("Table ID",38);

    //      SetTemplate(ApprovalEntry);*/

    //     StoreLines.Reset;
    //     StoreLines.SetRange("Document No.", Store."No.");
    //     if StoreLines.FindSet then begin
    //         repeat
    //             StoreLines.CalcFields(StoreLines."Employee Name");
    //             PersonIssuedTo := StoreLines."Employee Name";
    //             QuantityIssued := StoreLines."Quantity  issued";
    //             QuantityRequested := StoreLines."Qty. Requested";


    //             Emp.Reset;
    //             Emp.SetRange("No.", StoreLines."Employee No");
    //             if Emp.FindSet then begin
    //                 Recipient := Emp."Company E-Mail";
    //             end;
    //             Emp.Reset;
    //             Emp.SetRange("No.", Store."Request-By No.");
    //             if Emp.FindSet then begin
    //                 RequestorEmail := Emp."Company E-Mail";
    //             end;

    //             CompInfo.Get;
    //             ProcSetup.Get;
    //             SenderAddress := ProcSetup."Default Proc Email Contact";
    //             SenderName := CompInfo.Name;
    //             Subject := StrSubstNo(Text00009, Store."No.");//+'Testing -Please Ignore';
    //                                                           //Body := Text013;
    //             SMTP.CreateMessage(SenderName, SenderAddress, Recipient, Subject, Body, true);
    //             SMTP.AddCC(RequestorEmail);
    //             SMTP.AppendBody(Body);
    //             Body := 'Dear ' + Store."Request-By Name" + '<BR>';
    //             SMTP.AppendBody(Body);
    //             Body := '<BR> Your Store Requisition No';
    //             SMTP.AppendBody(Body);
    //             Body := ':' + Store."No." + '<BR>';
    //             SMTP.AppendBody(Body);


    //             Body := 'Has been Issued To:' + PersonIssuedTo + '<BR>';
    //             SMTP.AppendBody(Body);
    //             Body := 'Requisition Summary:' + Store.Description + '<BR>';
    //             SMTP.AppendBody(Body);
    //             Body := 'Quantity Requested:' + Format(QuantityRequested) + '<BR>';
    //             SMTP.AppendBody(Body);
    //             Body := 'Quantity Issued:' + Format(QuantityIssued) + '<BR>';
    //             SMTP.AppendBody(Body);

    //             /*Body :='Total Requisition Amount Inc Taxes (LCY):'+FORMAT(PRN."Amount Including VAT");
    //             SMTP.AppendBody(Body);
    //             Body :='Please note that you shall be notified once Procurement raises the invitation For supply (IFS) for this PRN';
    //             SMTP.AppendBody(Body);*/
    //             Body := 'NB: This is a system generated Email. You do not need to respond to it. in case of any further clarifications or help, kindly contact the Procurement Department';
    //             SMTP.AppendBody(Body);



    //             SMTP.Send();
    //         until StoreLines.Next = 0
    //     end;
    //     Message('Notifications sent successfully');

    // // end;
}
