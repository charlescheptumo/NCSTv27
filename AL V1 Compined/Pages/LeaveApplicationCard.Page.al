#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Page 69207 "Leave Application Card"
{
    Caption = 'Leave Application';
    DeleteAllowed = false;
    PageType = Card;
    PromotedActionCategories = 'New,Process,Report,Functions,Comments';
    SourceTable = "HR Leave Application";
    ApplicationArea = All;

    layout
    {
        area(content)
        {
            group(General)
            {
                Caption = 'General';
                field("Application Code"; Rec."Application Code")
                {
                    ApplicationArea = Basic;
                    Caption = 'Application No';
                    Editable = false;
                    Importance = Promoted;

                    trigger OnValidate()
                    begin
                        CurrPage.Update;
                    end;
                }
                field("Responsibility Center"; Rec."Responsibility Center")
                {
                    ApplicationArea = Basic;
                    Editable = "Responsibility CenterEditable";
                    Visible = false;
                }
                field("Leave Type"; Rec."Leave Type")
                {
                    ApplicationArea = Basic;
                    Editable = "Leave TypeEditable";
                    Importance = Promoted;

                    trigger OnValidate()
                    var
                        LeaveLedger: Record "HR Leave Ledger Entries";
                        Period: Record "HR Leave Periods";
                    begin
                        if Rec."Leave Type" = '' then begin
                            //Do maternity test
                            //Test leave ledger entry for any existing maternity leaves this year

                            //Process range of last open period
                            Period.Reset;
                            Period.SetRange(Period.Closed, false);
                            Period.Find('-');

                            LeaveLedger.Reset;
                            LeaveLedger.SetRange(LeaveLedger."Staff No.", Rec."Employee No");
                            LeaveLedger.SetRange(LeaveLedger."Leave Start Date", Period.Starts, Period.Ends);
                            LeaveLedger.SetRange(LeaveLedger."Leave Type", 'MATERNITY');
                            if LeaveLedger.Find('-') then begin
                                Error('You cannot apply maternity twice in the same leave period');
                            end;
                            //*******End do maternity test
                        end;


                        GetLeaveStats(Rec."Leave Type");
                        //  CurrPage.UPDATE;
                        //29/05/2019
                        HREmp.Get(Rec."Employee No");
                        if Rec."Leave Type" = 'ANNUAL' then begin
                            if Rec."Days Applied" > dLeft then
                                Error('Days applied cannot exceed leave balance for this leave');
                        end else begin
                            HRLeaveTypes.Reset;
                            HRLeaveTypes.SetRange(HRLeaveTypes.Code, Rec."Leave Type");
                            if HRLeaveTypes.Find('-') then begin
                                if Rec."Days Applied" > HRLeaveTypes.Days then
                                    Error('Days applied cannot exceed leave balance for this leave');
                            end;

                        end;
                    end;
                }
                field("Days Applied"; Rec."Days Applied")
                {
                    ApplicationArea = Basic;
                    Editable = "Days AppliedEditable";
                    Importance = Promoted;

                    trigger OnValidate()
                    begin
                        HREmp.Get(Rec."Employee No");
                        if Rec."Leave Type" = 'ANNUAL' then begin
                            if Rec."Days Applied" > dLeft then
                                Error('Days applied cannot exceed leave balance for this leave');
                        end else begin
                            HRLeaveTypes.Reset;
                            HRLeaveTypes.SetRange(HRLeaveTypes.Code, Rec."Leave Type");
                            if HRLeaveTypes.Find('-') then begin
                                if Rec."Days Applied" > HRLeaveTypes.Days then
                                    Error('Days applied cannot exceed leave balance for this leave');
                            end;

                        end;

                        if Rec."Leave Type" = 'MATERNITY' then begin
                            HRLeaveTypes.Reset;
                            HRLeaveTypes.SetRange(HRLeaveTypes.Code, Rec."Leave Type");
                            if HRLeaveTypes.Find('-') then begin
                                if Rec."Days Applied" < HRLeaveTypes.Days then
                                    Error(TEXT004, HRLeaveTypes.Days);
                            end;
                        end;

                        if Rec."Days Applied" < 0 then
                            Error('Days applied cannot be less than zero');
                    end;
                }
                field("Start Date"; Rec."Start Date")
                {
                    ApplicationArea = Basic;
                    Editable = "Start DateEditable";
                    Importance = Promoted;
                }
                field("Return Date"; Rec."Return Date")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                label("Employee Details")
                {
                    ApplicationArea = Basic;
                    Caption = 'Employee Details';
                    Style = StrongAccent;
                    StyleExpr = true;
                }
                field("Employee No"; Rec."Employee No")
                {
                    ApplicationArea = Basic;
                    Caption = 'Employee No.';
                    Importance = Promoted;
                }
                field("Employee Name"; Rec."Employee Name")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field(EmpName; EmpName)
                {
                    ApplicationArea = Basic;
                    Caption = 'Applicant Name';
                    Editable = false;
                    Enabled = false;
                    Importance = Promoted;
                    Visible = true;
                }
                field(Designation; Rec.Designation)
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field(EmpJobDesc; EmpJobDesc)
                {
                    ApplicationArea = Basic;
                    Caption = 'Job Description';
                    Editable = false;
                    Enabled = false;
                    Importance = Promoted;
                }
                field("Shortcut Dimension 1 Code"; Rec."Shortcut Dimension 1 Code")
                {
                    ApplicationArea = Basic;
                    ShowMandatory = true;
                }
                field("Department Name"; Rec."Department Name")
                {
                    ApplicationArea = Basic;
                }
                field("Department Code"; Rec."Department Code")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Directorate Code"; Rec."Directorate Code")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field(Division; Rec.Division)
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field(Supervisor; Rec.Supervisor)
                {
                    ApplicationArea = Basic;
                }
                field("Supervisor Name"; Rec."Supervisor Name")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Supervisor E-mail"; Rec."Supervisor E-mail")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Approved days"; Rec."Approved days")
                {
                    ApplicationArea = Basic;
                    Editable = ApprovedDaysEditable;
                }
                label(Control1102755082)
                {
                    ApplicationArea = Basic;
                    CaptionClass = Text19010232;
                    Style = StrongAccent;
                    StyleExpr = true;
                }
                field(dEarnd; dEarnd)
                {
                    ApplicationArea = Basic;
                    Caption = 'Total Leave Days';
                    Editable = false;
                    Style = Strong;
                    StyleExpr = true;
                }
                field(dTaken; dTaken)
                {
                    ApplicationArea = Basic;
                    Caption = 'Total Leave Taken';
                    Editable = false;
                    Style = Strong;
                    StyleExpr = true;
                }
                field(dLeft; dLeft)
                {
                    ApplicationArea = Basic;
                    Caption = 'Leave Balance';
                    Editable = false;
                    Enabled = false;
                    Style = Strong;
                    StyleExpr = true;
                }
                field("Application Date"; Rec."Application Date")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    StyleExpr = true;
                }
                label(Control1000000000)
                {
                    ApplicationArea = Basic;
                    CaptionClass = Text1;
                    Style = StrongAccent;
                    StyleExpr = true;
                }
                field(Reliever; Rec.Reliever)
                {
                    ApplicationArea = Basic;
                    Caption = 'Reliever Code';
                    DrillDown = true;
                    Visible = false;
                }
                field("Reliever Name"; Rec."Reliever Name")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    Visible = false;
                }
                field(Attachments; Rec.Attachments)
                {
                    ApplicationArea = Basic;
                }
                field(Status; Rec.Status)
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    Style = StrongAccent;
                    StyleExpr = true;
                }
            }
            group("More Leave Details")
            {
                Caption = 'More Leave Details';
                field("Cell Phone Number"; Rec."Cell Phone Number")
                {
                    ApplicationArea = Basic;
                    Editable = "Cell Phone NumberEditable";
                    Importance = Promoted;
                }
                field("E-mail Address"; Rec."E-mail Address")
                {
                    ApplicationArea = Basic;
                    Editable = true;
                    Importance = Promoted;
                }
                field("Details of Examination"; Rec."Details of Examination")
                {
                    ApplicationArea = Basic;
                    Editable = "Details of ExaminationEditable";
                    Importance = Promoted;
                }
                field("Date of Exam"; Rec."Date of Exam")
                {
                    ApplicationArea = Basic;
                    Editable = "Date of ExamEditable";
                    Importance = Promoted;
                }
                field("Number of Previous Attempts"; Rec."Number of Previous Attempts")
                {
                    ApplicationArea = Basic;
                    Editable = NumberofPreviousAttemptsEditab;
                    Importance = Promoted;
                }
            }
        }
        area(factboxes)
        {
            part(Control1000000003; "HR Leave Applications Factbox")
            {
                SubPageLink = "No." = field("Employee No");
            }
            systempart(s; Outlook)
            {
            }
        }
    }

    actions
    {
        area(navigation)
        {
            group("&Show")
            {
                Caption = '&Show';
                action(Comments)
                {
                    ApplicationArea = Basic;
                    Caption = 'Comments';
                    Image = Comment;
                    Promoted = true;
                    PromotedCategory = Category5;

                    trigger OnAction()
                    var
                        DocumentType: Option Quote,"Order",Invoice,"Credit Memo","Blanket Order","Return Order","None","Payment Voucher","Petty Cash",Imprest,Requisition,ImprestSurrender,Interbank,Receipt,"Staff Claim","Staff Advance",AdvanceSurrender,"Bank Slip",Grant,"Grant Surrender","Employee Requisition",HRLeave,"Training Application","Transport Requisition";
                    begin
                        DocumentType := Documenttype::HRLeave;

                        /*ApprovalComments.Setfilters(DATABASE::"HR Leave Application",DocumentType,"Application Code");
                        ApprovalComments.SetUpLine(DATABASE::"HR Leave Application",DocumentType,"Application Code");
                        ApprovalComments.RUN;*/

                    end;
                }
                action(Attachments1)
                {
                    ApplicationArea = Basic;
                    Caption = 'Attachments1';
                    Image = Attachments;
                    Promoted = true;
                    PromotedCategory = Category6;
                    RunObject = Page "HR Leave Documents";
                    RunPageLink = "Doc No." = field("Application Code");
                    Visible = false;
                }
            }
            group("F&unctions")
            {
                Caption = 'F&unctions';
                action("&Approvals")
                {
                    ApplicationArea = Basic;
                    Caption = '&Approvals';
                    Image = Approvals;
                    Promoted = true;
                    PromotedCategory = Category4;

                    trigger OnAction()
                    begin
                        DocumentType := Documenttype::"Leave Application";
                        ApprovalEntries.SetRecordfilters(Database::"HR Leave Application", 15, Rec."Application Code");
                        //ApprovalEntries.SetRecordfilters(DATABASE::"HR Leave Application",DocumentType,"Application Code");
                        ApprovalEntries.Run;
                    end;
                }
                action(SendApprovalRequest)
                {
                    ApplicationArea = Basic;
                    Caption = 'Send A&pproval Request';
                    Enabled = not OpenApprovalEntriesExist;
                    Image = SendApprovalRequest;
                    Promoted = true;
                    PromotedCategory = New;

                    trigger OnAction()
                    begin
                        Rec.TestField(Rec.Supervisor);
                        Rec.TestField(Rec."Leave Type");
                        Rec.TestField(Rec."Days Applied");
                        Rec.TestField(Rec."Start Date");
                        if Rec."Leave Type" <> 'ANNUAL' then begin
                            DocumentAttachment.Reset;
                            DocumentAttachment.SetRange("Table ID", 69205);
                            DocumentAttachment.SetRange("No.", Rec."Application Code");
                            if not DocumentAttachment.FindSet then
                                Error('Please Attach Supporting Document');
                        end;
                        //cc//if ApprovalsMgmt.CheckLeaveAppApprovalsWorkflowEnabled(Rec) then
                        //cc//ApprovalsMgmt.OnSendLeaveAppForApproval(Rec);
                    end;
                }
                action(CancelApprovalRequest)
                {
                    ApplicationArea = Basic;
                    Caption = 'Cancel Approval Re&quest';
                    Image = Cancel;
                    Promoted = true;
                    PromotedCategory = New;

                    trigger OnAction()
                    begin
                        //TESTFIELD(Status,Status::"Pending Approval");
                        //ApprovalsMgmt.OnCancelLeaveAppApprovalRequest(Rec);
                    end;
                }
                action("Re-Open")
                {
                    ApplicationArea = Basic;
                    Caption = 'Re-Open';
                    Image = ReopenCancelled;
                    Promoted = true;
                    PromotedCategory = Category4;
                    Visible = false;

                    trigger OnAction()
                    begin
                        Rec.Status := Rec.Status::Open;
                        Rec.Modify;
                    end;
                }
                action(Print)
                {
                    ApplicationArea = Basic;
                    Caption = 'Print';
                    Image = PrintForm;
                    Promoted = true;
                    PromotedCategory = Category4;

                    trigger OnAction()
                    begin
                        HRLeaveApp.Reset;
                        HRLeaveApp.SetRange(HRLeaveApp."Application Code", Rec."Application Code");
                        if HRLeaveApp.Find('-') then
                            Report.Run(69005, true, true, HRLeaveApp);
                    end;
                }
                action("Create Leave Ledger Entries")
                {
                    ApplicationArea = Basic;
                    Caption = 'Create Leave Ledger Entries';
                    Image = CreateLinesFromJob;
                    Promoted = true;
                    PromotedCategory = Category4;
                    Visible = false;

                    trigger OnAction()
                    begin
                        Rec.CreateLeaveLedgerEntries;
                        Rec.Reset;
                    end;
                }
                action("&Post Leave Application")
                {
                    ApplicationArea = Basic;
                    Caption = '&Post Leave Application';
                    Image = Post;

                    trigger OnAction()
                    var
                        EMAILSNED: Codeunit EMAIL;
                        EMAILMESSAGE: Codeunit "Email Message";
                        BODY: Text[1024];
                    begin
                        //IF Status=Status:: THEN ERROR('This Leave application has already been posted');
                        if Rec.Status <> Rec.Status::Released then
                            Error('The Leave Status must be Approved')
                        else
                            HRLeaveApp.Reset;
                        HRLeaveApp.SetRange(HRLeaveApp."Application Code", Rec."Application Code");
                        if HRLeaveApp.Find('-') then begin
                            HRLeaveApp.CreateLeaveLedgerEntries;

                        end;
                        //Dave---To notify leave applicant
                        if Confirm('Do you wish to notify the employee') = true then begin
                            HREmp.Get(Rec."Employee No");
                            HREmp.TestField(HREmp."Company E-Mail");

                            //GET E-MAIL PARAMETERS FOR GENERAL E-MAILS
                            HREmailParameters.Reset;
                            //   HREmailParameters.SetRange(HREmailParameters."Associate With", HREmailParameters."associate with"::General);
                            if HREmailParameters.Find('-') then begin
                                HREmp.TestField(HREmp."Company E-Mail");
                                //     SMTP.CreateMessage(HREmailParameters."Sender Name", HREmailParameters."Sender Address", HREmp."Company E-Mail",
                                //       HREmailParameters.Subject, 'Dear' + ' ' + HREmp."First Name" + ' ' +
                                //      HREmailParameters.Body + ' ' + Rec."Application Code" + ' ' + HREmailParameters."Body 2", true);
                                //   SMTP.Send();
                                body := HREmailParameters.Body + ' ' + Rec."Application Code" + ' ' + HREmailParameters."Body 2";
                                emailmessage.Create(HREmp."Company E-Mail", HREmailParameters.Subject, body);
                                EMAILSNED.send(emailmessage, enum::"Email Scenario"::Default);
                            end;
                        end;


                        Message('Leave applicant has been notified successfully');
                    end;
                }
            }
            group(Approval)
            {
                Caption = 'Approval';
                action(Approve)
                {
                    ApplicationArea = Suite;
                    Caption = 'Approve';
                    Image = Approve;
                    Promoted = true;
                    PromotedCategory = Category4;
                    PromotedIsBig = true;
                    PromotedOnly = true;
                    ToolTip = 'Approve the requested changes.';
                    Visible = OpenApprovalEntriesExistForCurrUser;

                    trigger OnAction()
                    var
                        ApprovalsMgmt: Codeunit "Approvals Mgmt.";
                    begin
                        ApprovalsMgmt.ApproveRecordApprovalRequest(Rec.RecordId);
                    end;
                }
                action(Reject)
                {
                    ApplicationArea = Suite;
                    Caption = 'Reject';
                    Image = Reject;
                    Promoted = true;
                    PromotedCategory = Category4;
                    PromotedIsBig = true;
                    PromotedOnly = true;
                    ToolTip = 'Reject the requested changes.';
                    Visible = OpenApprovalEntriesExistForCurrUser;

                    trigger OnAction()
                    var
                        ApprovalsMgmt: Codeunit "Approvals Mgmt.";
                    begin
                        ApprovalsMgmt.RejectRecordApprovalRequest(Rec.RecordId);
                    end;
                }
                action(Delegate)
                {
                    ApplicationArea = Suite;
                    Caption = 'Delegate';
                    Image = Delegate;
                    Promoted = true;
                    PromotedCategory = Category4;
                    PromotedOnly = true;
                    ToolTip = 'Delegate the requested changes to the substitute approver.';
                    Visible = OpenApprovalEntriesExistForCurrUser;

                    trigger OnAction()
                    var
                        ApprovalsMgmt: Codeunit "Approvals Mgmt.";
                    begin
                        ApprovalsMgmt.DelegateRecordApprovalRequest(Rec.RecordId);
                    end;
                }
                action(Comment)
                {
                    ApplicationArea = Suite;
                    Caption = 'Comments';
                    Image = ViewComments;
                    Promoted = true;
                    PromotedCategory = Category4;
                    PromotedOnly = true;
                    ToolTip = 'View or add comments for the record.';
                    Visible = OpenApprovalEntriesExistForCurrUser;

                    trigger OnAction()
                    var
                        ApprovalsMgmt: Codeunit "Approvals Mgmt.";
                    begin
                        ApprovalsMgmt.GetApprovalComment(Rec);
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
                    Visible = true;

                    trigger OnAction()
                    var
                        DocumentAttachmentDetails: Page "Document Attachment Details";
                        RecRef: RecordRef;
                    begin
                        ////21.10.2019...Hunaina
                        Purch.Reset;
                        Purch.SetRange("Application Code", Rec."Application Code");
                        if Purch.FindSet then begin
                            RecRef.GetTable(Purch);
                            DocumentAttachmentDetails.OpenForRecRef(RecRef);
                            DocumentAttachmentDetails.Run;
                        end
                        else
                            RecRef.GetTable(Rec);
                        DocumentAttachmentDetails.OpenForRecRef(RecRef);
                        DocumentAttachmentDetails.Run;


                        // RecRef.GETTABLE(Rec);
                        // DocumentAttachmentDetails.OpenForRecRef(RecRef);
                        // DocumentAttachmentDetails.RUNMODAL;
                    end;
                }
                action(DocAttach1)
                {
                    ApplicationArea = All;
                    Caption = 'Attach Documents';
                    Image = Attach;
                    Promoted = true;
                    PromotedCategory = Category5;
                    PromotedIsBig = true;
                    PromotedOnly = true;
                    ToolTip = 'Add a file as an attachment. You can attach images as well as documents.';
                    Visible = false;

                    trigger OnAction()
                    var
                        DocumentAttachmentDetails: Page "Document Attachment Details";
                        RecRef: RecordRef;
                    begin
                        /*RecRef.GETTABLE(Rec);
                        DocumentAttachmentDetails.OpenForRecRef(RecRef);
                        DocumentAttachmentDetails.RUN;*/
                        /*
                        ELSE
                        RecRef.GETTABLE(Rec);
                        DocumentAttachmentDetails.OpenForRecRef(RecRef);
                        DocumentAttachmentDetails.RUN;
                        //*/
                        /*RecRef.GETTABLE(Rec);
                        DocumentAttachmentDetails.OpenForRecRef(RecRef);
                        DocumentAttachmentDetails.RUNMODAL;
                        */
                        //DMSManagement.UploadLeaveApplicationDoc(Rec."Application Code", 'Leave Applications', Rec.RecordId)

                    end;
                }
            }
        }
    }

    trigger OnAfterGetRecord()
    begin
        // EmpDept:='';
        //PASS VALUES TO VARIABLES ON THE FORM
        FillVariables;
        //GET LEAVE STATS FOR THIS EMPLOYEE FROM THE EMPLOYEE TABLE
        GetLeaveStats(Rec."Leave Type");
        //TO PREVENT USER FROM SEEING OTHER PEOPLES LEAVE APPLICATIONS
        // SETFILTER("User ID",USERID);
        //Machira
        Rec.SetFilter(Rec."Requester ID", UserId);

        Updatecontrols;
    end;

    trigger OnInit()
    begin
        NumberofPreviousAttemptsEditab := true;
        "Date of ExamEditable" := true;
        "Details of ExaminationEditable" := true;
        "Cell Phone NumberEditable" := true;
        SupervisorEditable := true;
        RequestLeaveAllowanceEditable := true;
        RelieverEditable := true;
        "Leave Allowance AmountEditable" := true;
        //"Start DateEditable" := TRUE;
        "Responsibility CenterEditable" := true;
        //"Days AppliedEditable" := TRUE;
        "Leave TypeEditable" := true;
        "Application CodeEditable" := true;
        sendr := false;
        cancelr := false;
    end;

    trigger OnModifyRecord(): Boolean
    begin
        /*IF (Status=Status::"7") OR (Status=Status::"10") THEN
        ERROR('You cannot edit an approved or posted leave application')
        */

    end;

    trigger OnOpenPage()
    begin
        if Rec.Status = Rec.Status::Open then begin
            sendr := true;
            RelieverEditable := false;
        end
        else begin
            cancelr := true;
            RelieverEditable := true;
        end;
    end;

    var
        ApprovalsMgmt: Codeunit "Approvals Mgmt.";
        OpenApprovalEntriesExist: Boolean;
        HREmp: Record Employee;
        EmpJobDesc: Text[250];
        HRJobs: Record "Company Jobs";
        SupervisorName: Text[60];
        // SMTP: Codeunit "SMTP Mail";
        URL: Text[500];
        dAlloc: Decimal;
        dEarnd: Decimal;
        dTaken: Decimal;
        dLeft: Decimal;
        cReimbsd: Decimal;
        cPerDay: Decimal;
        cbf: Decimal;
        HRSetup: Record "Human Resources Setup";
        EmpDept: Text[30];
        ApprovalMgt: Codeunit "Approvals Mgmt.";
        HRLeaveApp: Record "HR Leave Application";
        DocumentType: Option Quote,"Order",Invoice,"Credit Memo","Blanket Order","Return Order","Imprest Memo","Payment Voucher","Petty Cash"," Imprest","Imprest Surrender",Payroll,"Store Requisition","Purchase Requisition","Leave Application","Bank Transfer"," ";
        ApprovalEntries: Page "Approval Entries";
        HRLeaveLedgerEntries: Record "HR Leave Ledger Entries";
        EmpName: Text[70];
        ApprovalComments: Page "Approval Comments";
        [InDataSet]
        "Application CodeEditable": Boolean;
        [InDataSet]
        "Leave TypeEditable": Boolean;
        [InDataSet]
        "Days AppliedEditable": Boolean;
        [InDataSet]
        "Responsibility CenterEditable": Boolean;
        [InDataSet]
        "Start DateEditable": Boolean;
        [InDataSet]
        "Leave Allowance AmountEditable": Boolean;
        [InDataSet]
        RelieverEditable: Boolean;
        [InDataSet]
        RequestLeaveAllowanceEditable: Boolean;
        [InDataSet]
        SupervisorEditable: Boolean;
        [InDataSet]
        "Cell Phone NumberEditable": Boolean;
        [InDataSet]
        "Details of ExaminationEditable": Boolean;
        [InDataSet]
        "Date of ExamEditable": Boolean;
        [InDataSet]
        NumberofPreviousAttemptsEditab: Boolean;
        Text19010232: label 'Leave Statistics';
        Text1: label 'Reliver Details';
        NoSeriesMgt: Codeunit "No. Series";
        UserSetup: Record "User Setup";
        varDaysApplied: Integer;
        HRLeaveTypes: Record "HR Leave Types";
        BaseCalendarChange: Record "Base Calendar Change";
        ReturnDateLoop: Boolean;
        mSubject: Text[250];
        ApplicantsEmail: Text[30];
        LeaveGjline: Record "HR Journal Line";
        "LineNo.": Integer;
        sDate: Record Date;
        Customized: Record "Base Calendar";
        HREmailParameters: Record "Hr E-Mail Parameters";
        HRLeavePeriods: Record "HR Leave Periods";
        HRJournalBatch: Record "HR Leave Journal Template";
        ApprovedDaysEditable: Boolean;
        TEXT004: label 'You can not take Maternity Leave for less than %1 Days';
        OpenApprovalEntriesExistForCurrUser: Boolean;
        sendr: Boolean;
        cancelr: Boolean;
        Purch: Record "HR Leave Application";
        Reliever: Boolean;
        "Supervisor Name": Text;
        DocumentAttachment: Record "Document Attachment";
        DMSManagement: Codeunit "DMS Management";


    procedure FillVariables()
    begin
        //GET THE APPLICANT DETAILS

        HREmp.Reset;
        if HREmp.Get(Rec."Employee No") then begin
            EmpName := HREmp.FullName;
            EmpDept := HREmp."Global Dimension 1 Code";
            //EmpJobDesc:=HREmp."Job Title";
        end else begin
            EmpDept := '';
            //EmpJobDesc:='';
        end;

        //GET THE JOB DESCRIPTION FRON THE HR JOBS TABLE AND PASS IT TO THE VARIABLE

        HRJobs.Reset;
        if HRJobs.Get(HREmp.Position) then begin
            EmpJobDesc := HRJobs."Job Description";
        end else begin
            EmpJobDesc := '';
        end;

        //GET THE APPROVER NAMES
        HREmp.Reset;
        HREmp.SetRange(HREmp."User ID", Rec.Supervisor);
        if HREmp.Find('-') then begin
            SupervisorName := HREmp."First Name" + ' ' + HREmp."Middle Name" + ' ' + HREmp."Last Name";
        end else begin
            SupervisorName := '';
        end;
    end;


    procedure GetLeaveStats(LeaveType: Text[50])
    begin
        dAlloc := 0;
        dEarnd := 0;
        dTaken := 0;
        dLeft := 0;
        cReimbsd := 0;
        cPerDay := 0;
        cbf := 0;
        if HREmp.Get(Rec."Employee No") then begin
            HREmp.SetFilter(HREmp."Leave Type Filter", LeaveType);
            HREmp.CalcFields(HREmp."Allocated Leave Days");
            dAlloc := HREmp."Allocated Leave Days";
            HREmp.Validate(HREmp."Allocated Leave Days");
            dEarnd := HREmp."Total (Leave Days)";
            HREmp.CalcFields(HREmp."Total Leave Taken");
            dTaken := HREmp."Total Leave Taken";
            HREmp.CalcFields(HREmp."Leave Outstanding Bal");
            dLeft := HREmp."Leave Outstanding Bal";
            cReimbsd := HREmp."Cash - Leave Earned";
            cPerDay := HREmp."Cash per Leave Day";
            HREmp.CalcFields(HREmp."Reimbursed Leave Days");
            cbf := HREmp."Reimbursed Leave Days";
        end;
    end;


    procedure TESTFIELDS()
    begin
        Rec.TestField(Rec."Leave Type");
        Rec.TestField(Rec."Days Applied");
        Rec.TestField(Rec."Start Date");
        //TESTFIELD(Reliever);
        Rec.TestField(Rec.Supervisor);
        Rec.TestField(Rec."Cell Phone Number");
    end;


    procedure Updatecontrols()
    begin

        if Rec.Status = Rec.Status::Open then begin
            "Application CodeEditable" := true;
            "Leave TypeEditable" := true;
            "Days AppliedEditable" := true;
            "Responsibility CenterEditable" := true;
            "Start DateEditable" := true;
            "Leave Allowance AmountEditable" := true;
            RelieverEditable := false;
            RequestLeaveAllowanceEditable := true;
            SupervisorEditable := false;
            "Cell Phone NumberEditable" := true;
            //CurrForm."E-mail Address".EDITABLE:=TRUE;
            "Details of ExaminationEditable" := true;
            "Date of ExamEditable" := true;
            NumberofPreviousAttemptsEditab := true;
            ApprovedDaysEditable := false
        end else begin
            "Application CodeEditable" := false;
            "Leave TypeEditable" := false;
            "Days AppliedEditable" := false;
            "Responsibility CenterEditable" := false;
            "Start DateEditable" := false;
            "Leave Allowance AmountEditable" := false;
            RelieverEditable := true;
            RequestLeaveAllowanceEditable := false;
            SupervisorEditable := false;
            "Cell Phone NumberEditable" := false;
            ApprovedDaysEditable := true;
            //CurrForm."E-mail Address".EDITABLE:=FALSE;
            "Details of ExaminationEditable" := false;
            "Date of ExamEditable" := false;
            NumberofPreviousAttemptsEditab := false;
        end;
    end;


    procedure TestLeaveFamily()
    var
        LeaveFamily: Record "HR Leave Family Groups";
        LeaveFamilyEmployees: Record "HR Leave Family Employees";
        Employees: Record Employee;
    begin
        LeaveFamilyEmployees.SetRange(LeaveFamilyEmployees."Employee No", Rec."Employee No");
        if LeaveFamilyEmployees.FindSet then //find the leave family employee is associated with
            repeat
                LeaveFamily.SetRange(LeaveFamily.Code, LeaveFamilyEmployees.Family);
                LeaveFamily.SetFilter(LeaveFamily."Max Employees On Leave", '>0');
                if LeaveFamily.FindSet then //find the status other employees on the same leave family
                  begin
                    Employees.SetRange(Employees."No.", LeaveFamilyEmployees."Employee No");
                    Employees.SetRange(Employees."Leave Status", Employees."leave status"::" ");
                    if Employees.Count > LeaveFamily."Max Employees On Leave" then
                        Error('The Maximum number of employees on leave for this family has been exceeded, Contact th HR manager for more information');
                end
            until LeaveFamilyEmployees.Next = 0;
    end;


    procedure DetermineLeaveReturnDate(var fBeginDate: Date; var fDays: Decimal) fReturnDate: Date
    begin
        varDaysApplied := fDays;
        fReturnDate := fBeginDate;
        repeat
            if Rec.DetermineIfIncludesNonWorking(Rec."Leave Type") = false then begin
                fReturnDate := CalcDate('1D', fReturnDate);
                if Rec.DetermineIfIsNonWorking(fReturnDate) then
                    varDaysApplied := varDaysApplied + 1
                else
                    varDaysApplied := varDaysApplied;
                varDaysApplied := varDaysApplied - 1
            end
            else begin
                fReturnDate := CalcDate('1D', fReturnDate);
                varDaysApplied := varDaysApplied - 1;
            end;
        until varDaysApplied = 0;
        exit(fReturnDate);
    end;


    procedure DetermineIfIncludesNonWorking(var fLeaveCode: Code[10]): Boolean
    begin
        if HRLeaveTypes.Get(fLeaveCode) then begin
            if HRLeaveTypes."Inclusive of Non Working Days" = true then
                exit(true);
        end;
    end;


    procedure DetermineIfIsNonWorking(var bcDate: Date) Isnonworking: Boolean
    begin

        HRSetup.Find('-');
        HRSetup.TestField(HRSetup."Base Calendar");
        BaseCalendarChange.SetFilter(BaseCalendarChange."Base Calendar Code", HRSetup."Base Calendar");
        BaseCalendarChange.SetRange(BaseCalendarChange.Date, bcDate);

        if BaseCalendarChange.Find('-') then begin
            if BaseCalendarChange.Nonworking = false then
                Error('Start date can only be a Working Day Date');
            exit(true);
        end;

        /*
        Customized.RESET;
        Customized.SETRANGE(Customized.Date,bcDate);
        IF Customized.FIND('-') THEN BEGIN
            IF Customized."Non Working" = TRUE THEN
            EXIT(TRUE)
            ELSE
            EXIT(FALSE);
        END;
         */

    end;


    procedure DeterminethisLeaveEndDate(var fDate: Date) fEndDate: Date
    begin
        ReturnDateLoop := true;
        fEndDate := fDate;
        if fEndDate <> 0D then begin
            fEndDate := CalcDate('-1D', fEndDate);
            while (ReturnDateLoop) do begin
                if Rec.DetermineIfIsNonWorking(fEndDate) then
                    fEndDate := CalcDate('-1D', fEndDate)
                else
                    ReturnDateLoop := false;
            end
        end;
        exit(fEndDate);
    end;


    procedure CreateLeaveLedgerEntries()
    begin
        Rec.TestField(Rec."Approved days");
        HRSetup.Reset;
        if HRSetup.Find('-') then begin

            LeaveGjline.Reset;
            LeaveGjline.SetRange("Journal Template Name", HRSetup."Leave Template");
            LeaveGjline.SetRange("Journal Batch Name", HRSetup."Leave Batch");
            LeaveGjline.DeleteAll;
            //Dave
            //HRSetup.TESTFIELD(HRSetup."Leave Template");
            //HRSetup.TESTFIELD(HRSetup."Leave Batch");

            HREmp.Get(Rec."Employee No");
            HREmp.TestField(HREmp."Company E-Mail");

            //POPULATE JOURNAL LINES

            "LineNo." := 10000;
            LeaveGjline.Init;
            LeaveGjline."Journal Template Name" := HRSetup."Leave Template";
            LeaveGjline."Journal Batch Name" := HRSetup."Leave Batch";
            LeaveGjline."Line No." := "LineNo.";

            HRLeavePeriods.Reset;
            HRLeavePeriods.SetRange(HRLeavePeriods.Closed, false);
            if HRLeavePeriods.Find('-') then
                LeaveGjline."Leave Period" := Format(HRLeavePeriods.Code);
            LeaveGjline."Document No." := Rec."Application Code";
            LeaveGjline."Staff No." := Rec."Employee No";
            LeaveGjline.Validate(LeaveGjline."Staff No.");
            LeaveGjline."Posting Date" := Today;
            LeaveGjline."Leave Entry Type" := LeaveGjline."leave entry type"::Negative;
            LeaveGjline."Leave Approval Date" := Today;
            LeaveGjline.Description := 'Leave Taken';
            LeaveGjline."Leave Type" := Rec."Leave Type";
            //------------------------------------------------------------
            //HRSetup.RESET;
            //HRSetup.FIND('-');
            HRSetup.TestField(HRSetup."Leave Posting Period[FROM]");
            HRSetup.TestField(HRSetup."Leave Posting Period[TO]");
            //------------------------------------------------------------
            LeaveGjline."Leave Period Start Date" := HRSetup."Leave Posting Period[FROM]";
            LeaveGjline."Leave Period End Date" := HRSetup."Leave Posting Period[TO]";
            LeaveGjline."No. of Days" := Rec."Approved days";
            if LeaveGjline."No. of Days" <> 0 then
                LeaveGjline.Insert(true);

            //Post Journal
            LeaveGjline.Reset;
            LeaveGjline.SetRange("Journal Template Name", HRSetup."Leave Template");
            LeaveGjline.SetRange("Journal Batch Name", HRSetup."Leave Batch");
            if LeaveGjline.Find('-') then begin
                Codeunit.Run(Codeunit::"HR Leave Jnl.-Post", LeaveGjline);
            end;
            Rec.Status := Rec.Status::Released;
            Rec.Modify;

            /*END ELSE BEGIN
            ERROR('You must specify no of days');
            END;
            END;*/
            //NotifyApplicant;
        end;

    end;


    procedure NotifyApplicant()
    begin
        // HREmp.GET("Employee No");
        // HREmp.TESTFIELD(HREmp."Company E-Mail");
        //
        // //GET E-MAIL PARAMETERS FOR GENERAL E-MAILS
        // HREmailParameters.RESET;
        // HREmailParameters.SETRANGE(HREmailParameters."Associate With",HREmailParameters."Associate With"::General);
        // IF HREmailParameters.FIND('-') THEN
        // BEGIN
        //
        //
        //     HREmp.TESTFIELD(HREmp."Company E-Mail");
        //     SMTP.CreateMessage(HREmailParameters."Sender Name",HREmailParameters."Sender Address",HREmp."Company E-Mail",
        //     HREmailParameters.Subject,'Dear'+' '+ HREmp."First Name" +' '+
        //     HREmailParameters.Body+' '+"Application Code"+' '+ HREmailParameters."Body 2",TRUE);
        //     SMTP.Send();
        //
        //
        // MESSAGE('Leave applicant has been notified successfully');
        // END;
    end;

    local procedure SetControlAppearance()
    var
        ApprovalsMgmt: Codeunit "Approvals Mgmt.";
    begin
        OpenApprovalEntriesExist := ApprovalsMgmt.HasOpenApprovalEntries(Rec.RecordId);
        OpenApprovalEntriesExistForCurrUser := ApprovalsMgmt.HasOpenApprovalEntriesForCurrentUser(Rec.RecordId);
    end;
}
