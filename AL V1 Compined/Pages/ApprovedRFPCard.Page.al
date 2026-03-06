#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Page 70080 "Approved RFP Card"
{
    DeleteAllowed = false;
    PageType = Card;
    SourceTable = "Procurement Request";
    SourceTableView = where("Process Type" = const(RFP),
                            Status = filter(<> "Pending Approval"));

    layout
    {
        area(content)
        {
            group(General)
            {
                Caption = 'General';
                field(No; Rec.No)
                {
                    ApplicationArea = Basic;
                }
                field(Title; Rec.Title)
                {
                    ApplicationArea = Basic;
                }
                field("Requisition No"; Rec."Requisition No")
                {
                    ApplicationArea = Basic;
                    TableRelation = "Purchase Line" where(Committed = filter(false),
                                                           "Process Type" = filter('RFP'));
                }
                field("Procurement Plan No"; Rec."Procurement Plan No")
                {
                    ApplicationArea = Basic;
                }
                field("Procurement Method"; Rec."Procurement Method")
                {
                    ApplicationArea = Basic;
                }
                field("Creation Date"; Rec."Creation Date")
                {
                    ApplicationArea = Basic;
                }
                field("Tender Type"; Rec."Tender Type")
                {
                    ApplicationArea = Basic;
                    Caption = 'Proposal Type';
                }
                field("User ID"; Rec."User ID")
                {
                    ApplicationArea = Basic;
                }
                field("Supplier Category"; Rec."Supplier Category")
                {
                    ApplicationArea = Basic;
                }
                field("Document No"; Rec."Document No")
                {
                    ApplicationArea = Basic;
                }
                field("Issued Date"; Rec."Issued Date")
                {
                    ApplicationArea = Basic;
                }
                field("Opening Person 1"; Rec."Opening Person 1")
                {
                    ApplicationArea = Basic;
                }
                field("Opening Person 2"; Rec."Opening Person 2")
                {
                    ApplicationArea = Basic;
                }
                field("Opening Person 3"; Rec."Opening Person 3")
                {
                    ApplicationArea = Basic;
                }
                field("Tender Closing Date"; Rec."Tender Closing Date")
                {
                    ApplicationArea = Basic;
                    Caption = 'Proposal Closing Date';
                }
                field("Validity Period"; Rec."Validity Period")
                {
                    ApplicationArea = Basic;
                }
                field("Tender Opening Date"; Rec."Tender Opening Date")
                {
                    ApplicationArea = Basic;
                    Caption = 'Proposal Opening Date';
                }
                field("Extended Date"; Rec."Extended Date")
                {
                    ApplicationArea = Basic;
                }
                field("Tender Status"; Rec."Tender Status")
                {
                    ApplicationArea = Basic;
                    Caption = 'Proposal Status';
                }
                field("No of Tender Documents"; Rec."No of Tender Documents")
                {
                    ApplicationArea = Basic;
                }
                field("Generate Multiple LPO"; Rec."Generate Multiple LPO")
                {
                    ApplicationArea = Basic;
                }
                field("Tender Amount"; Rec."Tender Amount")
                {
                    ApplicationArea = Basic;
                    Caption = 'Proposal Amount';
                }
                field("Tender Committee"; Rec."Tender Committee")
                {
                    ApplicationArea = Basic;
                    Caption = 'Proposal Committee';
                }
                field("Technical Score"; Rec."Technical Score")
                {
                    ApplicationArea = Basic;
                }
                field("Financial Score"; Rec."Financial Score")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field(Status; Rec.Status)
                {
                    ApplicationArea = Basic;
                    Editable = true;
                }
                field("Approval Status"; Rec."Approval Status")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Evaluation Admin"; Rec."Evaluation Admin")
                {
                    ApplicationArea = Basic;
                }
            }
            part(Control32; "Bid Opening Register Line2")
            {
                SubPageLink = "Requisition No" = field(No);
            }
        }
    }

    actions
    {
        area(navigation)
        {
            group("Request for Quotation")
            {
                Caption = 'Request for Quotation';
                action("Select Suppliers")
                {
                    ApplicationArea = Basic;
                    Caption = 'Select Suppliers';
                    Image = SelectField;
                    Promoted = true;
                    PromotedCategory = Process;
                    PromotedIsBig = true;
                    Visible = false;

                    trigger OnAction()
                    var
                        ApprovalMgt: Codeunit "Approvals Mgmt.";
                    begin
                    end;
                }
                action("Request for Proposal")
                {
                    ApplicationArea = Basic;
                    Caption = 'Request for Proposal';
                    Image = Replan;
                    Promoted = true;
                    PromotedCategory = Process;
                    PromotedIsBig = true;
                    Visible = false;

                    trigger OnAction()
                    var
                        Text0000: label 'Are you sure you want to Request for Quoation for record No %1';
                    begin
                        if Confirm(Text0000, true, Rec.No) then begin

                            RequestForProposal;

                        end;
                    end;
                }
                action("Unseal Bid")
                {
                    ApplicationArea = Basic;
                    Image = OpenWorksheet;
                    Promoted = true;
                    PromotedCategory = Process;

                    trigger OnAction()
                    begin
                        ProcurementProcessing.UnsealBid(Rec);
                        Message('Unsealed Successfully');
                    end;
                }
                action("Send Bid Opening Codes")
                {
                    ApplicationArea = Basic;
                    Image = OpenJournal;
                    Promoted = true;

                    trigger OnAction()
                    begin
                        ProcurementProcessing.FnSendSecretCodeOnIFSBidOpening(Rec);
                        Message('Done');
                    end;
                }
                action(Bidders)
                {
                    ApplicationArea = Basic;
                    RunObject = Page Bidders;
                    RunPageLink = "Ref No." = field(No);
                    Visible = false;
                }
                action("Mandatory Evaluation List")
                {
                    ApplicationArea = Basic;
                    Image = Setup;
                    Promoted = true;
                    PromotedCategory = Process;
                    PromotedIsBig = true;
                    RunObject = Page "Mandatory Evaluation Checklist";
                    RunPageLink = "RFP No." = field(No),
                                  "Evaluation Type" = const(Mandatory);
                }
                action("Technical Evaluation List")
                {
                    ApplicationArea = Basic;
                    Image = Setup;
                    Promoted = true;
                    PromotedCategory = Process;
                    PromotedIsBig = true;
                    RunObject = Page "Technica Evaluation Checklist";
                    RunPageLink = "RFP No." = field(No),
                                  "Evaluation Type" = const(Technical);
                }
                action("Financial Evaluation List")
                {
                    ApplicationArea = Basic;
                    Image = Setup;
                    Promoted = true;
                    PromotedCategory = Process;
                    PromotedIsBig = true;
                    RunObject = Page "Financial Evaluation Checklist";
                    RunPageLink = "RFP No." = field(No),
                                  "Evaluation Type" = const(Financial);
                    Visible = false;
                }
                action(DocAttach)
                {
                    ApplicationArea = All;
                    Caption = 'Attachments';
                    Image = Attach;
                    Promoted = true;
                    PromotedCategory = Category8;
                    ToolTip = 'Add a file as an attachment. You can attach images as well as documents.';

                    trigger OnAction()
                    var
                        DocumentAttachmentDetails: Page "Document Attachment Details";
                        RecRef: RecordRef;
                    begin
                        RecRef.GetTable(Rec);
                        DocumentAttachmentDetails.OpenForRecRef(RecRef);
                        DocumentAttachmentDetails.RunModal;
                    end;
                }
                action("<Send Approval Request>")
                {
                    ApplicationArea = Basic;
                    Caption = 'Send Approval Request';
                    Image = SendApprovalRequest;
                    Promoted = true;
                    PromotedCategory = Process;
                    PromotedIsBig = true;

                    trigger OnAction()
                    var
                        emailmessage: Codeunit "Email Message";
                        emailsend: Codeunit "Email";
                        body: Text[150];
                        rfpevalrec: Record "RFQ Evaluation Lists";
                        filesrec2: Record "Document Attachment";
                        docrec: Record "Document Attachment";
                        TempBlob: Codeunit "Temp Blob";
                        InStr: InStream;
                        FileName: Text;
                    begin
                        Rec.TestField(Rec."Technical Score");
                        Rec.TestField(Rec.Title);
                        //============================================================verify existance of preriquisites
                        rfpevalrec.Reset;
                        rfpevalrec.SetFilter(rfpevalrec."RFP No.", Rec.No);
                        rfpevalrec.SetFilter(rfpevalrec."Evaluation Type", '%1', rfpevalrec."evaluation type"::Mandatory);
                        if not rfpevalrec.FindSet then begin
                            Error('Please Fill the Mandatory Requirements!!!');
                        end;
                        rfpevalrec.Reset;
                        rfpevalrec.SetFilter(rfpevalrec."RFP No.", Rec.No);
                        rfpevalrec.SetFilter(rfpevalrec."Evaluation Type", '%1', rfpevalrec."evaluation type"::Technical);
                        if not rfpevalrec.FindSet then begin
                            Error('Please Fill the Technical Requirements!!!');
                        end;

                        filesrec2.Reset;
                        filesrec2.SetFilter(filesrec2."No.", Rec.No);
                        if not filesrec2.FindSet then begin
                            Error('Please Attach Documents for RFP %1', Rec.No);
                        end;
                        //=============================================================================================
                        //====================================================================================
                        reqlist.Reset;
                        reqlist.SetFilter(reqlist."No.", Rec."Requisition No");
                        if reqlist.FindSet then begin
                            requser := reqlist."Requester ID";

                            Usersetuprec.Reset;
                            Usersetuprec.Get(requser);
                            useremail1 := Usersetuprec."E-Mail";

                            approvatemprec.Reset;
                            approvatemprec.SetFilter(approvatemprec."Document No.", '%1', Rec."Requisition No");
                            approvatemprec.SetFilter(approvatemprec."Sequence No.", '%1', 2);
                            if approvatemprec.FindSet then begin
                                Approveruser := approvatemprec."Approver ID";

                                Usersetuprec.Reset;
                                Usersetuprec.Get(Approveruser);
                                useremail2 := Usersetuprec."E-Mail";

                                //====================================================================
                                //  smtprec.Reset;
                                //   smtprec.Get;

                                mailheader := 'RE: RFQ NO:  ' + Rec.No;
                                mailbody := 'Dear Sir/Madam<br><br>';
                                mailbody := mailbody + 'Please Find Attached RFQ Document(s) for your review.<br><br>Kindly submit any comments on the same within 24 hours.<br><br>';
                                mailbody := mailbody + 'If you do not submit any Comments within 24 hours the Procurement Process will Continue.<br<br>';
                                mailbody := mailbody + '<br><br><i>This E-mail is sent to you because you Approved or Raised the Requisition No: <b>' + reqlist."No." + '</b> Which formed the basis of creating this RFQ Document</i><br><br>';
                                mailbody := mailbody + 'Kind Regards<br><br>';

                                // smtpcu.CreateMessage('RFQ Team', smtprec."User ID", useremail1, mailheader, mailbody, true);

                                docrec.Reset();
                                docrec.SetRange("No.", Rec."No");
                                if docrec.FindSet() then
                                    repeat
                                        EmailMessage.AddAttachment(
                                            docrec."File Name" + '.' + docrec."File Extension",
                                            '',
                                            InStr);

                                    until docrec.Next() = 0;

                                emailmessage.Create(useremail1, 'NACOSTI', mailbody);
                                emailsend.Send(emailmessage, Enum::"Email Scenario"::Default);


                                //=====================================put on queue=================
                                /*schedulerec.RESET;
                                schedulerec.SETFILTER(schedulerec."Document No",No);
                                IF schedulerec.FINDSET THEN BEGIN
                                   schedulerec.DELETEALL;
                                END;
                                schedulerec.RESET;
                                schedulerec.INIT;
                                schedulerec."Document No":=No;
                                schedulerec.Date:=CALCDATE('1D',TODAY);
                                schedulerec.time:= TIME;
                                schedulerec.INSERT;*/

                                Message('Email sent & Job Queue Entries setup successfully...');
                                //====================================================================
                            end;
                        end;
                        //====================================================================================
                        //ApprovalMgt.SendProcApprovalRequestRFP(Rec);

                    end;
                }
                action("Cancel Approval Request")
                {
                    ApplicationArea = Basic;
                    Caption = 'Cancel Approval Request';
                    Image = Cancel;
                    Promoted = true;
                    PromotedCategory = Process;
                    PromotedIsBig = true;

                    trigger OnAction()
                    begin
                        //IF ApprovalMgt.CancelProcApprovalRequest(Rec,TRUE,TRUE) THEN;
                    end;
                }
            }
        }
    }

    trigger OnInsertRecord(BelowxRec: Boolean): Boolean
    begin
        Rec."Process Type" := Rec."process type"::RFP;
    end;

    trigger OnNewRecord(BelowxRec: Boolean)
    begin
        Rec."Process Type" := Rec."process type"::RFP;
    end;

    var
        FileDirectory: Text[100];
        FileName: Text[500];
        ReportID: Integer;
        //"Object": Record "Object";
        Window: Dialog;
        RunOnceFile: Text[1000];
        TimeOut: Integer;
        Customer: Record Customer;
        Customer2: Record Customer;
        SupplierSelect: Record "Supplier Selection1";
        SupplierSelect2: Record "Supplier Selection1";
        Mail: Codeunit Mail;
        MailSent: Boolean;
        PrequalifiedSupRec: Record "Prequalified Suppliers1";
        Subject: Text[250];
        Body: Text[250];
        CCName: Text[30];
        ApprovalMgt: Codeunit "Approvals Mgmt.";
        CompInfo: Record "Company Information";
        Usersetuprec: Record "User Setup";
        approvatemprec: Record "Approval Entry";
        payablesetuprec: Record "Purchases & Payables Setup";
        reqlist: Record "Purchase Header";
        requser: Code[20];
        Approveruser: Code[20];
        //  smtpcu: Codeunit "SMTP Mail";
        mailheader: Text;
        mailbody: Text;
        //smtprec: Record "SMTP Mail Setup";
        useremail1: Text;
        useremail2: Text;
        schedulerec: Record "Job Queue Category";
        currentdatetime: DateTime;
        ProcurementProcessing: Codeunit "Procurement processing2";


    procedure RequestForProposal()
    var
        UserSetup: Record "User Setup";
        Emp: Record Employee;
        SenderName: Text;
        SenderAddress: Text;
        Recipients: Text;
        //     SMTPMail: Codeunit "SMTP Mail";
        emailmessage: Codeunit "Email Message";
        emailsend: Codeunit "Email";
        ProcurementReqRef: RecordRef;
        SearchString: Text;
        RecLink: Record "Record Link";
        filesrec2: Record "Document Attachment";
        docrec: Record "Document Attachment";
        FileMangement: Codeunit "File Management";
        NoSuppliers: Integer;
        InStr: InStream;
    begin
        ReportID := 51511025;
        NoSuppliers := 0;

        SupplierSelect.Reset;
        SupplierSelect.SetRange("Reference No.", Rec.No);
        SupplierSelect.SetRange(Invited, true);
        if SupplierSelect.Find('-') then begin

            Window.Open('processing Supplier ######################1##');
            // //Object.Get(Object.Type::Report, '', ReportID);

            CompInfo.Get;
            SenderAddress := CompInfo."Administrator Email";
            SenderName := CompInfo.Name;//Emp."First Name"+' '+Emp."Middle Name"+' '+Emp."Last Name";

            repeat

                Subject := 'REQUEST FOR QUOTATION ' + SupplierSelect."Reference No.";
                Body := 'Please find attached Quotation';

                if UserSetup.Get(UserId) then begin

                    PrequalifiedSupRec.Reset;
                    PrequalifiedSupRec.SetRange(PrequalifiedSupRec.Name, SupplierSelect."Supplier Name");
                    if PrequalifiedSupRec.Find('-') then
                        Recipients := PrequalifiedSupRec."E-mail";

                    NoSuppliers := NoSuppliers + 1;
                    //  SMTPMail.CreateMessage(SenderName, SenderAddress, Recipients, Subject, Body, true);

                    //Report.SaveAsPdf(Report::"Request for Quotation", FileName, SupplierSelect);
                    //cc//  FileName := FileMangement.ServerTempFileName('.pdf');
                    //SMTPMail.AddAttachment(FileName, '');

                    docrec.Reset();
                    docrec.SetRange("No.", Rec."No");
                    if docrec.FindSet() then
                        repeat
                            EmailMessage.AddAttachment(
                                docrec."File Name" + '.' + '.pdf',
                                '',
                                InStr);

                        until docrec.Next() = 0;


                    // SMTPMail.Send();
                    emailmessage.Create(Recipients, Subject, Body);
                    emailsend.Send(emailmessage, Enum::"Email Scenario"::Default);
                end;

            until SupplierSelect.Next = 0;

            Message('RFP Successfully Sent to %1 Suppliers', NoSuppliers);

            Window.Close;
        end else
            Error('There are no Suppliers Selected!');
    end;
}
