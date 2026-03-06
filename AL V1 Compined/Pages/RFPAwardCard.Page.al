#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Page 70089 "RFP Award Card"
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
                action("<Send Approval Request>")
                {
                    ApplicationArea = Basic;
                    Caption = 'Send Approval Request';
                    Image = SendApprovalRequest;
                    Promoted = true;
                    PromotedCategory = Process;
                    PromotedIsBig = true;
                    Visible = false;

                    trigger OnAction()
                    begin
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
                                //    smtprec.Reset;
                                //    smtprec.Get;

                                mailheader := 'RE: RFQ NO:  ' + Rec.No;
                                mailbody := 'Dear Sir/Madam<br><br>';
                                mailbody := mailbody + 'Please Find Attached RFQ Document(s) for your review.<br><br>Kindly submit any comments on the same within 24 hours.<br><br>';
                                mailbody := mailbody + 'If you do not submit any Comments within 24 hours the Procurement Process will Continue.<br<br>';
                                mailbody := mailbody + '<br><br><i>This E-mail is sent to you because you Approved or Raised the Requisition No: <b>' + reqlist."No." + '</b> Which formed the basis of creating this RFQ Document</i><br><br>';
                                mailbody := mailbody + 'Kind Regards<br><br>';

                                // smtpcu.CreateMessage('RFQ Team', smtprec."User ID", useremail1, mailheader, mailbody, true);

                                docrec.Reset;
                                docrec.SetFilter(docrec."No.", Rec.No);
                                if docrec.FindSet then
                                    repeat
                                    //cc//     smtpcu.AddAttachment(docrec.Export(true), '');
                                    until docrec.Next = 0;

                                //cc//   smtpcu.AddCC(useremail2 + ';daudierick1@gmail.com');
                                //cc///    smtpcu.Send();
                                emailmessage.create(useremail1 + useremail2, mailheader, mailbody);
                                emailSNED.Send(emailmessage, enum::"Email Scenario"::default);




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

                                Message('Email sent  successfully...');
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
                    Visible = false;

                    trigger OnAction()
                    begin
                        //IF ApprovalMgt.CancelProcApprovalRequest(Rec,TRUE,TRUE) THEN;
                    end;
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
                action("Start Mandatory Evaluation")
                {
                    ApplicationArea = Basic;
                    Image = Migration;
                    Promoted = true;
                    PromotedCategory = Process;
                    PromotedIsBig = true;
                    Visible = false;

                    trigger OnAction()
                    begin
                        //=======================================================
                        //RFPREC.RESET;
                        //RFPREC.GET("Ref No.");
                        //IF RFPREC."Minutes Path"='' THEN BEGIN
                        //   ERROR('Please Attach Minutes First!!!');
                        //END;
                        //======================================================
                        Biddersrec.Reset;
                        Biddersrec.SetFilter(Biddersrec."Ref No.", Rec.No);
                        if Biddersrec.FindSet then
                            repeat
                                Biddersrec."visible?" := true;
                                Biddersrec.Modify;
                            until Biddersrec.Next = 0;
                        //====================================================Mandatory Evaluation....
                        MandatoryReq.Reset;
                        MandatoryReq.SetRange(MandatoryReq."RFP No.", Rec.No);
                        MandatoryReq.SetRange(MandatoryReq."Evaluation Type", MandatoryReq."evaluation type"::Mandatory);
                        if MandatoryReq.Find('-') then
                            repeat
                                Biddersrec.Reset;
                                Biddersrec.SetFilter(Biddersrec."Ref No.", Rec.No);
                                if Biddersrec.FindSet then
                                    repeat

                                        BidderMandatory.Reset;
                                        BidderMandatory.SetFilter(BidderMandatory."Tender No", Rec.No);
                                        BidderMandatory.SetFilter(BidderMandatory."Company Name", Biddersrec.Name);
                                        BidderMandatory.SetFilter(BidderMandatory.Specification, MandatoryReq.Description);
                                        if BidderMandatory.FindSet then begin
                                            BidderMandatory.Delete;
                                        end;
                                        //================================================================
                                        evaluatorsrec.Reset;
                                        evaluatorsrec.SetFilter(evaluatorsrec.tenderno, Rec.No);
                                        if evaluatorsrec.FindSet then begin
                                            if evaluatorsrec."Evaluator 1" <> '' then begin
                                                BidderMandatory.Reset;
                                                BidderMandatory.Init;
                                                BidderMandatory."Tender No" := Rec.No;
                                                BidderMandatory."Company Name" := Biddersrec.Name;
                                                BidderMandatory.Specification := MandatoryReq.Description;
                                                BidderMandatory."Evaluater User Id" := evaluatorsrec."Evaluator 1";
                                                BidderMandatory.Insert;
                                            end;
                                            if evaluatorsrec."Evaluator 2" <> '' then begin
                                                BidderMandatory.Reset;
                                                BidderMandatory.Init;
                                                BidderMandatory."Tender No" := Rec.No;
                                                BidderMandatory."Company Name" := Biddersrec.Name;
                                                BidderMandatory.Specification := MandatoryReq.Description;
                                                BidderMandatory."Evaluater User Id" := evaluatorsrec."Evaluator 2";
                                                BidderMandatory.Insert;
                                            end;
                                            if evaluatorsrec."Evaluator 3" <> '' then begin
                                                BidderMandatory.Reset;
                                                BidderMandatory.Init;
                                                BidderMandatory."Tender No" := Rec.No;
                                                BidderMandatory."Company Name" := Biddersrec.Name;
                                                BidderMandatory.Specification := MandatoryReq.Description;
                                                BidderMandatory."Evaluater User Id" := evaluatorsrec."Evaluator 3";
                                                BidderMandatory.Insert;
                                            end;
                                            if evaluatorsrec."Evaluator 4" <> '' then begin
                                                BidderMandatory.Reset;
                                                BidderMandatory.Init;
                                                BidderMandatory."Tender No" := Rec.No;
                                                BidderMandatory."Company Name" := Biddersrec.Name;
                                                BidderMandatory.Specification := MandatoryReq.Description;
                                                BidderMandatory."Evaluater User Id" := evaluatorsrec."Evaluator 4";
                                                BidderMandatory.Insert;
                                            end;
                                            if evaluatorsrec."Evaluator 5" <> '' then begin
                                                BidderMandatory.Reset;
                                                BidderMandatory.Init;
                                                BidderMandatory."Tender No" := Rec.No;
                                                BidderMandatory."Company Name" := Biddersrec.Name;
                                                BidderMandatory.Specification := MandatoryReq.Description;
                                                BidderMandatory."Evaluater User Id" := evaluatorsrec."Evaluator 5";
                                                BidderMandatory.Insert;
                                            end;
                                            if evaluatorsrec."Evaluator 6" <> '' then begin
                                                BidderMandatory.Reset;
                                                BidderMandatory.Init;
                                                BidderMandatory."Tender No" := Rec.No;
                                                BidderMandatory."Company Name" := Biddersrec.Name;
                                                BidderMandatory.Specification := MandatoryReq.Description;
                                                BidderMandatory."Evaluater User Id" := evaluatorsrec."Evaluator 6";
                                                BidderMandatory.Insert;
                                            end;
                                            if evaluatorsrec."Evaluator 7" <> '' then begin
                                                BidderMandatory.Reset;
                                                BidderMandatory.Init;
                                                BidderMandatory."Tender No" := Rec.No;
                                                BidderMandatory."Company Name" := Biddersrec.Name;
                                                BidderMandatory.Specification := MandatoryReq.Description;
                                                BidderMandatory."Evaluater User Id" := evaluatorsrec."Evaluator 7";
                                                BidderMandatory.Insert;
                                            end;
                                            if evaluatorsrec."Evaluator 8" <> '' then begin
                                                BidderMandatory.Reset;
                                                BidderMandatory.Init;
                                                BidderMandatory."Tender No" := Rec.No;
                                                BidderMandatory."Company Name" := Biddersrec.Name;
                                                BidderMandatory.Specification := MandatoryReq.Description;
                                                BidderMandatory."Evaluater User Id" := evaluatorsrec."Evaluator 8";
                                                BidderMandatory.Insert;
                                            end;

                                        end;
                                    //==============================================================
                                    until Biddersrec.Next = 0;
                            until MandatoryReq.Next = 0;
                        Message('Mandatory Evaluation can begin...');
                        //============================================================================
                    end;
                }
                action("Mandatory Evaluation Window")
                {
                    ApplicationArea = Basic;
                    Image = Evaluate;
                    Promoted = true;
                    PromotedCategory = Process;
                    PromotedIsBig = true;
                    RunObject = Page "Mandatory Evaluation Window";
                    RunPageLink = "Tender No" = field(No);
                    Visible = false;
                }
                action("Technical Evaluation Window")
                {
                    ApplicationArea = Basic;
                    Image = TaskList;
                    Promoted = true;
                    PromotedCategory = Process;
                    PromotedIsBig = true;
                    RunObject = Page "Technical Evaluation Window";
                    RunPageLink = "Tender No" = field(No);
                    Visible = false;
                }
                action("View Evaluation Report")
                {
                    ApplicationArea = Basic;
                    Image = Print;
                    Promoted = true;
                    PromotedCategory = Process;
                    PromotedIsBig = true;

                    trigger OnAction()
                    var
                        reportrec: Record "Bidder Mandatory Requirements";
                    begin
                        reportrec.Reset;
                        reportrec.SetFilter(reportrec."Tender No", Rec.No);
                        if reportrec.FindSet then begin
                            Report.Run(70008, true, false, reportrec);
                        end;
                    end;
                }
                action("Bid Winner")
                {
                    ApplicationArea = Basic;
                    Image = Salutation;
                    Promoted = true;
                    PromotedCategory = Process;
                    PromotedIsBig = true;
                    RunObject = Page "Bid Winner";
                    RunPageLink = "Ref No." = field(No),
                                  "Failed Mandatory" = const(false);
                    Visible = false;
                }
                action("Proceed to Award")
                {
                    ApplicationArea = Basic;
                    Image = SalutationFormula;
                    Promoted = true;
                    PromotedCategory = Process;
                    PromotedIsBig = true;
                    Visible = false;

                    trigger OnAction()
                    begin
                        conftxt := Confirm('Are you sure you want to Proceed to Award level?');
                        if Format(conftxt) = 'Yes' then begin
                            docrec.Reset;
                            docrec.SetFilter(docrec."No.", Rec.No);
                            if not docrec.FindSet then begin
                                Error('You cannot Proceed to Award Without Attaching Minutes!!!');
                            end;
                            Procrec.Reset;
                            Procrec.Get(Rec.No);
                            Procrec."Award Started" := true;
                            Procrec.Modify;
                            CurrPage.Close;
                        end;
                    end;
                }
                action("Attach Agenda/Minutes")
                {
                    ApplicationArea = Basic;
                    Image = Attach;
                    Promoted = true;
                    PromotedCategory = Process;
                    PromotedIsBig = true;

                    trigger OnAction()
                    var
                        filecu: Codeunit "File Management";
                    begin
                        //   FileName := filecu.OpenFileDialog('Select RFP Minutes Document', 'RFP Minutes Document', '');
                        Docno := Rec.No;
                        Docno := ConvertStr(Rec.No, '/', '_');
                        if FileName <> '' then begin
                            payablesetuprec.Get;
                            //      filecu.CopyClientFile(FileName, payablesetuprec."RFP Documents Path" + filecu.GetFileName(FileName), true);
                            Rec.minutesafterproceedtoaward := payablesetuprec."RFP Documents Path" + filecu.GetFileName(FileName);
                        end;
                    end;
                }
                action("Open Attached Agenda/Minutes")
                {
                    ApplicationArea = Basic;
                    Image = Document;
                    Promoted = true;
                    PromotedCategory = Process;
                    PromotedIsBig = true;

                    trigger OnAction()
                    begin
                        if Rec.minutesafterproceedtoaward <> '' then begin
                            Hyperlink(Rec.minutesafterproceedtoaward);
                        end;
                        if Rec.minutesafterproceedtoaward = '' then begin
                            Error('You have NOT Attached Minutes/Minutes!!!');
                        end;
                    end;
                }
                action(Award)
                {
                    ApplicationArea = Basic;
                    Image = Salutation;
                    Promoted = true;
                    PromotedCategory = Process;
                    PromotedIsBig = true;

                    trigger OnAction()
                    begin
                        conftxt := Confirm('Are you sure you want to Proceed to Award the Selected Bidder?');
                        if Format(conftxt) = 'Yes' then begin
                            if Rec.minutesafterproceedtoaward = '' then begin
                                Error('You cannot Proceed to Award Without Attaching Minutes or Agendas!!!');
                            end;
                            Procrec.Reset;
                            Procrec.Get(Rec.No);
                            Procrec."Awarded?" := true;
                            Procrec.Modify;
                            CurrPage.Close;
                            Message('Proceed to Award Menu...');
                        end;
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

    trigger OnOpenPage()
    begin
        seetechnical := false;
        if Rec."Technical started?" = true then begin
            seetechnical := true;
        end;
        ;
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
        EMAILSNED: Codeunit EMAIL;
        EMAILMESSAGE: Codeunit "Email Message";
        BODY: Text[1024];

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
        //   smtprec: Record "SMTP Mail Setup";
        useremail1: Text;
        useremail2: Text;
        schedulerec: Record "Job Queue Category";
        currentdatetime: DateTime;
        Docno: Text;
        MandatoryReq: Record "RFQ Evaluation Lists";
        BidderMandatory: Record "Bidder Mandatory Requirements";
        Biddersrec: Record Bidders;
        ans: Boolean;
        RFPREC: Record "Procurement Request";
        evaluatorsrec: Record "Procurement Evaluators";
        seetechnical: Boolean;
        conftxt: Boolean;
        Procrec: Record "Procurement Request";
        Seeevaladmin: Boolean;
        Seeevalwindow: Boolean;
        BidderMandatory2: Record "Bidder Mandatory Requirements";
        j: Integer;
        Seeevaladmin2: Boolean;
        technicalwindow: Boolean;
        Recommendwinnerwindow: Boolean;
        winnerrecommended: Boolean;
        docrec: Record "Document Attachment";


    procedure RequestForProposal()
    var
        UserSetup: Record "User Setup";
        Emp: Record Employee;
        SenderName: Text;
        SenderAddress: Text;
        Recipients: Text;
        //   SMTPMail: Codeunit "SMTP Mail";
        ProcurementReqRef: RecordRef;
        SearchString: Text;
        RecLink: Record "Record Link";
        FileMangement: Codeunit "File Management";
        NoSuppliers: Integer;
    begin
        ReportID := 51511025;
        NoSuppliers := 0;

        SupplierSelect.Reset;
        SupplierSelect.SetRange("Reference No.", Rec.No);
        SupplierSelect.SetRange(Invited, true);
        if SupplierSelect.Find('-') then begin

            Window.Open('processing Supplier ######################1##');
            //Object.Get(Object.Type::Report, '', ReportID);

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
                    //   SMTPMail.CreateMessage(SenderName, SenderAddress, Recipients, Subject, Body, true);

                    //Report.SaveAsPdf(Report::"Request for Quotation", FileName, SupplierSelect);
                   // FileName := FileMangement.ServerTempFileName('.pdf');
                    //  SMTPMail.AddAttachment(FileName, '');

                    //   SMTPMail.Send();
                    emailmessage.Create(Recipients, Subject, Body);
                    emailSNED.Send(emailmessage, enum::"Email Scenario"::default);
                end;

            until SupplierSelect.Next = 0;

            Message('RFP Successfully Sent to %1 Suppliers', NoSuppliers);

            Window.Close;
        end else
            Error('There are no Suppliers Selected!');
    end;
}
