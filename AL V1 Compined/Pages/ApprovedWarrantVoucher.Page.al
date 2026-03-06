#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Page 57101 "Approved  Warrant Voucher"
{
    DeleteAllowed = false;
    InsertAllowed = false;
    PageType = Card;
    SourceTable = Payments;

    layout
    {
        area(content)
        {
            group(General)
            {
                field("No."; Rec."No.")
                {
                    ApplicationArea = Basic;
                }
                field(Date; Rec.Date)
                {
                    ApplicationArea = Basic;
                }
                field("Pay Mode"; Rec."Pay Mode")
                {
                    ApplicationArea = Basic;
                }
                field("Cheque No"; Rec."Cheque No")
                {
                    ApplicationArea = Basic;
                    Caption = 'Transaction No.';
                }
                field("Cheque Date"; Rec."Cheque Date")
                {
                    ApplicationArea = Basic;
                    Caption = 'Transaction Date';
                }
                field("Posting Date"; Rec."Posting Date")
                {
                    ApplicationArea = Basic;
                }
                field("Imprest Memo No"; Rec."Imprest Memo No")
                {
                    ApplicationArea = Basic;
                }
                field("Payment Narration"; Rec."Payment Narration")
                {
                    ApplicationArea = Basic;
                }
                field("Paying Bank Account"; Rec."Paying Bank Account")
                {
                    ApplicationArea = Basic;
                }
                field("Department Name"; Rec."Department Name")
                {
                    ApplicationArea = Basic;
                }
                field("Shortcut Dimension 2 Code"; Rec."Shortcut Dimension 2 Code")
                {
                    ApplicationArea = Basic;
                    Caption = 'Funding Source';
                }
                field("Project Name"; Rec."Project Name")
                {
                    ApplicationArea = Basic;
                    Caption = 'Source of Funds';
                    Visible = false;
                }
                field(Job; Rec.Job)
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Job Name"; Rec."Job Name")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Job Task No"; Rec."Job Task No")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Job Task Name"; Rec."Job Task Name")
                {
                    ApplicationArea = Basic;
                }
                field("Job Task Budget"; Rec."Job Task Budget")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Job Task Remaining Amount"; Rec."Job Task Remaining Amount")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field(Status; Rec.Status)
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Imprest Voucher Amount"; Rec."Imprest Voucher Amount")
                {
                    ApplicationArea = Basic;
                }
            }
            part(Control17; "Imprest Voucher Lines")
            {
                SubPageLink = No = field("No.");
            }
        }
        area(factboxes)
        {
            systempart(Control19; Notes)
            {
            }
            systempart(Control18; Links)
            {
            }
        }
    }

    actions
    {
        area(creation)
        {
            group("Payment Voucher")
            {
                Caption = 'Payment Voucher';
                Image = "Order";
                action("Co&mments")
                {
                    ApplicationArea = Basic;
                    Caption = 'Co&mments';
                    Image = ViewComments;
                    RunObject = Page "Comment Sheet";
                    RunPageLink = "Table Name" = const(56000),
                                  "No." = field("No.");
                }
                action(Dimensions)
                {
                    AccessByPermission = TableData Dimension = R;
                    ApplicationArea = Dimensions;
                    Caption = 'Dimensions';
                    Enabled = Rec."No." <> '';
                    Image = Dimensions;
                    Promoted = true;
                    ShortCutKey = 'Shift+Ctrl+D';
                    ToolTip = 'View or edit dimensions, such as area, project, or department, that you can assign to sales and purchase documents to distribute costs and analyze transaction history.';

                    trigger OnAction()
                    begin
                        Rec.ShowDocDim;
                        CurrPage.SaveRecord;
                    end;
                }
            }
            group("P&osting")
            {
                Caption = 'P&osting';
                Image = Post;
                action("&Print")
                {
                    ApplicationArea = Basic;
                    Caption = '&Print';
                    Ellipsis = true;
                    Image = Print;
                    Promoted = true;
                    PromotedCategory = Process;
                    RunObject = Report "Warrant Voucher";
                    Visible = false;

                    trigger OnAction()
                    begin
                        //DocPrint.PrintPurchHeader(Rec);

                        // IF Status<>Status::Released THEN
                        // ERROR(Txt0001);
                        // IF Status=Status::Released THEN BEGIN
                        Rec.SetRange("No.", Rec."No.");
                        Report.Run(57004, true, true, Rec)
                    end;
                }
                action("Post Voucher")
                {
                    ApplicationArea = Basic;
                    Image = Post;
                    Promoted = true;
                    PromotedCategory = Process;

                    trigger OnAction()
                    begin
                        UserSetup.Get(UserId);
                        if UserSetup."Post Requisition" = false then
                            Error(Text001);
                        PaymentPost.PostWarrantVoucher(Rec);
                        //ProcurementProcessing.FnDeCommitImprestWarrantVoucher(Rec);
                    end;
                }
                action("Print Bank Schedule")
                {
                    ApplicationArea = Basic;
                    Caption = 'Print Bank Schedule';
                    Ellipsis = true;
                    Image = Print;
                    Promoted = true;
                    PromotedCategory = Process;

                    trigger OnAction()
                    begin
                        //DocPrint.PrintPurchHeader(Rec);

                        Rec.Reset;
                        Rec.SetRange("No.", Rec."No.");
                        Report.Run(57013, true, false, Rec)
                    end;
                }
                action(Action40)
                {
                    ApplicationArea = Basic;
                    Caption = '&Print';
                    Ellipsis = true;
                    Image = Print;
                    Promoted = true;
                    PromotedCategory = Process;
                    Visible = true;

                    trigger OnAction()
                    begin
                        //DocPrint.PrintPurchHeader(Rec);

                        // IF Status<>Status::Released THEN
                        // ERROR(Txt0001);
                        // IF Status=Status::Released THEN BEGIN
                        Rec.SetRange("No.", Rec."No.");
                        Report.Run(57012, true, true, Rec)
                    end;
                }
            }
        }
        area(processing)
        {
            group("F&unctions")
            {
                Caption = 'F&unctions';
                Image = "Action";
                action(SendApprovalRequest)
                {
                    ApplicationArea = Basic;
                    Caption = 'Send A&pproval Request';
                    Enabled = not OpenApprovalEntriesExist;
                    Image = SendApprovalRequest;
                    Promoted = true;
                    PromotedCategory = New;
                    Visible = false;

                    trigger OnAction()
                    begin
                        Rec.TestField(Status, Rec.Status::Open);//status must be open.
                        Rec.TestField("Payment Narration");
                        Rec.TestField("Posting Date");
                        Rec.TestField("Shortcut Dimension 1 Code");
                        Rec.TestField("Pay Mode");
                        Rec.TestField("Paying Bank Account");
                        Rec.TestField("Shortcut Dimension 2 Code");
                        Rec.TestField("Cheque No");
                        Rec.TestField("Cheque Date");

                        pvheader.Reset;
                        pvheader.SetRange(pvheader."No.", Rec."No.");
                        //   //cc//if ApprovalsMgmt.CheckPaymentsApprovalsWorkflowEnabled(Rec) then
                        //     //cc//ApprovalsMgmt.OnSendPaymentsForApproval(Rec);
                    end;
                }
                action(CancelApprovalRequest)
                {
                    ApplicationArea = Basic;
                    Caption = 'Cancel Approval Re&quest';
                    Enabled = OpenApprovalEntriesExist;
                    Image = Cancel;
                    Promoted = true;
                    PromotedCategory = New;
                    Visible = false;

                    trigger OnAction()
                    begin
                        Rec.TestField(Status, Rec.Status::"Pending Approval");//status must be open.
                        //TESTFIELD("Created By",USERID); //control so that only the initiator of the document can send for approval
                        //ApprovalsMgmt.OnCancelPaymentsApprovalRequest(Rec);
                    end;
                }
                separator(Action31)
                {
                }
                action(Approvals)
                {
                    ApplicationArea = Basic;
                    Caption = 'Approvals';
                    Image = Approvals;
                    Promoted = true;
                    PromotedCategory = New;
                    PromotedIsBig = false;
                    Visible = false;

                    trigger OnAction()
                    var
                        ApprovalEntries: Page "Approval Entries";
                    begin
                        ApprovalEntries.SetRecordfilters(Database::Payments, 23, Rec."No.");
                        ApprovalEntries.Run;
                    end;
                }
            }
        }
    }

    trigger OnNewRecord(BelowxRec: Boolean)
    begin
        Rec."Payment Type" := Rec."payment type"::"Warrant Voucher";
    end;

    var
        UserSetup: Record "User Setup";
        Text001: label 'Kindly consult the System administrator to give you the relevant permissions';
        PaymentPost: Codeunit "Payments-Post";
        ApprovalsMgmt: Codeunit "Approvals Mgmt.";
        OpenApprovalEntriesExist: Boolean;
        PaymentsPost: Codeunit "Payments-Post";
        pvLines: Record "PV Lines";
        pvheader: Record Payments;
        ReopenPV: Codeunit Payments;
        isFactBoxVisible: Boolean;
        text0001: label 'The customer Account Number Must have a value. Cannot be empty If advance recovery is more than the user.';
        text0002: label 'This Payment Voucher can only be edited by the initiator';
        ProcurementProcessing: Codeunit "Procurement Processing";
}
