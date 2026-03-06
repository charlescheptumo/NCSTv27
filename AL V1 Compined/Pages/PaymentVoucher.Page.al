#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Page 57001 "Payment Voucher"
{
    DeleteAllowed = false;
    Editable = true;
    PageType = Card;
    SourceTable = Payments;
    SourceTableView = where("Payment Type" = const("Payment Voucher"),
                            Posted = const(False),
                            Status = filter(Open | "Pending Approval"));

    layout
    {
        area(content)
        {
            group(General)
            {
                field("No."; Rec."No.")
                {
                    ApplicationArea = Basic;
                    Editable = not OpenApprovalEntriesExist;
                    Enabled = false;
                }
                field(Project; Rec.Project)
                {
                    ApplicationArea = Basic;
                    Caption = 'Job No.';
                    Editable = not OpenApprovalEntriesExist;
                    Visible = false;
                }
                field("Project Description"; Rec."Project Description")
                {
                    ApplicationArea = Basic;
                    Editable = not OpenApprovalEntriesExist;
                    Visible = false;
                }
                field("Vote Item"; Rec."Vote Item")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field("Job Task Name"; Rec."Job Task Name")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field("Account Type"; Rec."Account Type")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    Visible = false;
                }
                field("Account No."; Rec."Account No.")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field("Account Name"; Rec."Account Name")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field(Date; Rec.Date)
                {
                    ApplicationArea = Basic;
                    Editable = true;
                }
                field("Pay Mode"; Rec."Pay Mode")
                {
                    ApplicationArea = Basic;
                    Editable = not OpenApprovalEntriesExist;
                    Visible = false;
                }
                field("Cheque No"; Rec."Cheque No")
                {
                    ApplicationArea = Basic;
                    Editable = not OpenApprovalEntriesExist;
                    Visible = false;
                }
                field("Cheque Date"; Rec."Cheque Date")
                {
                    ApplicationArea = Basic;
                    Editable = not OpenApprovalEntriesExist;
                    Visible = false;
                }
                field("Paying Bank Account"; Rec."Paying Bank Account")
                {
                    ApplicationArea = Basic;
                    Editable = not OpenApprovalEntriesExist;
                    Visible = false;
                }
                field("Bank Name"; Rec."Bank Name")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field(Payee; Rec.Payee)
                {
                    ApplicationArea = Basic;
                }
                field("On behalf of"; Rec."On behalf of")
                {
                    ApplicationArea = Basic;
                    Editable = not OpenApprovalEntriesExist;
                }
                field("Payment Narration"; Rec."Payment Narration")
                {
                    ApplicationArea = Basic;
                    Editable = not OpenApprovalEntriesExist;
                }
                field("Shortcut Dimension 1 Code"; Rec."Shortcut Dimension 1 Code")
                {
                    ApplicationArea = Basic;
                    Editable = not OpenApprovalEntriesExist;
                }
                field("Department Name"; Rec."Department Name")
                {
                    ApplicationArea = Basic;
                }
                field("Shortcut Dimension 2 Code"; Rec."Shortcut Dimension 2 Code")
                {
                    ApplicationArea = Basic;
                    Editable = not OpenApprovalEntriesExist;
                }
                field("Project Name"; Rec."Project Name")
                {
                    ApplicationArea = Basic;
                }
                field("Shortcut Dimension 3 Code"; Rec."Shortcut Dimension 3 Code")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field("Unit  Name"; Rec."Unit  Name")
                {
                    ApplicationArea = Basic;
                }
                field("Total Amount"; Rec."Total Amount")
                {
                    ApplicationArea = Basic;
                }
                field("Total VAT Amount"; Rec."Total VAT Amount")
                {
                    ApplicationArea = Basic;
                }
                field("Total Witholding Tax Amount"; Rec."Total Witholding Tax Amount")
                {
                    ApplicationArea = Basic;
                }
                field("VAT Wthheld six %"; Rec."VAT Wthheld six %")
                {
                    ApplicationArea = Basic;
                }
                field("Total Retention Amount"; Rec."Total Retention Amount")
                {
                    ApplicationArea = Basic;
                }
                field("Advance Recovery"; Rec."Advance Recovery")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    Visible = false;
                }
                field("Total Net Amount"; Rec."Total Net Amount")
                {
                    ApplicationArea = Basic;
                }
                field("Amount Paid"; Rec."Amount Paid")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    Visible = false;
                }
                field("PV Remaining Amount"; Rec."PV Remaining Amount")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field(Status; Rec.Status)
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Posting Date"; Rec."Posting Date")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field("Archive Document"; Rec."Archive Document")
                {
                    ApplicationArea = Basic;
                }
            }
            part(Control1000000021; "PV Lines")
            {
                Editable = not OpenApprovalEntriesExist;
                SubPageLink = No = field("No.");
                UpdatePropagation = Both;
            }
        }
        area(factboxes)
        {
            systempart(Control1000000019; Notes)
            {
            }
            systempart(Control1000000020; Links)
            {
            }
        }
    }

    actions
    {
        area(navigation)
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
                    ApplicationArea = Basic;
                    Caption = 'Dimensions';
                    Image = Dimensions;
                    ShortCutKey = 'Shift+Ctrl+D';

                    trigger OnAction()
                    begin
                        Rec.ShowDocDim;
                        CurrPage.SaveRecord;
                    end;
                }
                action(Approvals)
                {
                    ApplicationArea = Basic;
                    Caption = 'Approvals';
                    Image = Approvals;
                    Promoted = true;
                    PromotedCategory = New;
                    PromotedIsBig = false;

                    trigger OnAction()
                    var
                        ApprovalEntries: Page "Approval Entries";
                    begin

                        ///Showing Approvals 16.10.2019 Hunaina
                        ApprovalEntries.SetRecordfilters(Database::Payments, Rec."Document Type", Rec."No.");
                        ApprovalEntries.SetRecordfilters(Database::Payments, 8, Rec."No.");
                        ApprovalEntries.Run;
                        ///End 16.10.2019 Hunaina

                        /*ApprovalEntries.SetRecordfilters(DATABASE::Payments,8,"No.");
                        ApprovalEntries.RUN;*/

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

                    trigger OnAction()
                    begin
                        Rec.TestField(Status, Rec.Status::Open);//status must be open.
                        Rec.TestField("Created By", UserId); //control so that only the initiator of the document can send for approval
                        if (Rec."Advance Recovery" <> 0) and (Rec."Account No." = '') then begin
                            Error(text0001);
                        end;
                        Rec.TestField("Payment Narration");
                        Rec.TestField(Payee);
                        Rec.TestField(Date);
                        pvheader.Reset;
                        pvheader.SetRange(pvheader."No.", Rec."No.");
                        if pvheader.Find('-') then begin
                            pvLines.Reset;
                            pvLines.SetRange(pvLines.No, pvheader."No.");
                            if pvLines.Find('-') then begin
                                repeat
                                    pvLines.TestField(pvLines."Applies to Doc. No");
                                //IF "Amount Paid">pvLines."Available Funds" THEN
                                //ERROR('Amount to be paid cannot exceed the Available Budget');
                                until pvLines.Next = 0;
                            end;

                        end;
                        /*
                        CALCFIELDS("Total Amount");
                        TotalAmount:=0;
                        TotalAmount:="Total Amount";
                        CashMgmtSetup.GET;
                        IF (CashMgmtSetup."Check Budget Vailability"=TRUE) THEN BEGIN
                          IF (TotalAmount>"Job Task Remaining Amount") THEN
                             ERROR('Total of Amount (%1) is more than Available Amount (%2)',TotalAmount,"Job Task Remaining Amount");
                          END;
                        
                        */
                        //cc//if ApprovalsMgmt.CheckPaymentsApprovalsWorkflowEnabled(Rec) then
                        //cc//ApprovalsMgmt.OnSendPaymentsForApproval(Rec);



                        /*IF Status=Status::"Pending Approval" THEN
                          OpenEntries:=FALSE
                        ELSE
                          OpenEntries:=TRUE;*/

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

                    trigger OnAction()
                    begin
                        Rec.TestField(Status, Rec.Status::"Pending Approval");//status must be open.
                        Rec.TestField("Created By", UserId); //control so that only the initiator of the document can send for approval
                        //ApprovalsMgmt.OnCancelPaymentsApprovalRequest(Rec);
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
                        Purch.SetRange("No.", Rec."No.");
                        if Purch.FindSet then begin
                            RecRef.GetTable(Purch);
                            DocumentAttachmentDetails.OpenForRecRef(RecRef);
                            DocumentAttachmentDetails.Run;
                        end
                        else
                            RecRef.GetTable(Rec);
                        DocumentAttachmentDetails.OpenForRecRef(RecRef);
                        DocumentAttachmentDetails.Run;

                        /*RecRef.GETTABLE(Rec);
                        DocumentAttachmentDetails.OpenForRecRef(RecRef);
                        DocumentAttachmentDetails.RUNMODAL;*/

                    end;
                }
                action("Doc Attach")
                {
                    ApplicationArea = All;
                    Caption = 'Attach Docments';
                    Image = Attach;
                    Promoted = true;
                    PromotedCategory = Category8;
                    ToolTip = 'Add a file as an attachment. You can attach images as well as documents.';
                    Visible = false;

                    trigger OnAction()
                    var
                        DocumentAttachmentDetails: Page "Document Attachment Details";
                        RecRef: RecordRef;
                    begin
                        ////21.10.2019...Hunaina
                        // Purch.RESET;
                        // Purch.SETRANGE("No.","No.");
                        // IF Purch.FINDSET THEN BEGIN
                        // RecRef.GETTABLE(Purch);
                        // DocumentAttachmentDetails.OpenForRecRef(RecRef);
                        // DocumentAttachmentDetails.RUN;
                        // END
                        // ELSE
                        // RecRef.GETTABLE(Rec);
                        // DocumentAttachmentDetails.OpenForRecRef(RecRef);
                        // DocumentAttachmentDetails.RUN;

                        /*RecRef.GETTABLE(Rec);
                        DocumentAttachmentDetails.OpenForRecRef(RecRef);
                        DocumentAttachmentDetails.RUNMODAL;*/

                        //DMSManagement.UploadPaymentVoucherDoc(Rec."No.", 'Payment Vouchers', Rec.RecordId);

                    end;
                }
            }
            group(Print)
            {
                Caption = 'Print';
                Image = Print;
                action("&Print")
                {
                    ApplicationArea = Basic;
                    Caption = '&Print';
                    Ellipsis = true;
                    Image = Print;
                    Promoted = true;
                    PromotedCategory = Process;

                    trigger OnAction()
                    begin
                        //DocPrint.PrintPurchHeader(Rec);


                        Rec.SetRange("No.", Rec."No.");
                        Report.Run(57000, true, true, Rec)
                    end;
                }
            }
            group(Release)
            {
                Caption = 'Release';
                Image = ReleaseDoc;
                action("Re&lease")
                {
                    ApplicationArea = Basic;
                    Caption = 'Re&lease';
                    Image = ReleaseDoc;
                    ShortCutKey = 'Ctrl+F9';

                    trigger OnAction()
                    var
                        ReleasePurchDoc: Codeunit "Release Purchase Document";
                    begin
                        Rec.TestField("Reasons to Reopen");
                        usersetup.Get(UserId);
                        usersetup.TestField(usersetup."Reopen Document", usersetup."Reopen Document" = true);
                        Rec.TestField("Reasons to Reopen");
                        if not Confirm('Are you sure you want to Release this document?', true) then begin
                            Error('Document not Released!');
                        end;
                        Rec.Status := Rec.Status::Released;
                        Rec.Modify;
                        Message('Released Successfully!');
                        /*usersetup.GET(USERID);
                        usersetup.TESTFIELD(usersetup."Reopen Document",usersetup."Reopen Document"=TRUE);
                        ReopenPV.PerformManualReopen(Rec);*/

                    end;
                }
                action("Re&open")
                {
                    ApplicationArea = Basic;
                    Caption = 'Re&open';
                    Image = ReOpen;

                    trigger OnAction()
                    var
                        ReleasePurchDoc: Codeunit "Release Purchase Document";
                    begin
                        usersetup.Get(UserId);
                        usersetup.TestField(usersetup."Reopen Document", usersetup."Reopen Document" = true);
                        Rec.TestField("Reasons to Reopen");
                        ReopenPV.PerformManualReopen(Rec);
                    end;
                }
                separator(Action1000000036)
                {
                }
            }
            group("P&osting")
            {
                Caption = 'P&osting';
                Image = Post;
                action(Post)
                {
                    ApplicationArea = Basic;
                    Caption = 'P&ost';
                    Image = PostOrder;
                    Promoted = true;
                    PromotedCategory = Process;
                    PromotedIsBig = true;
                    ShortCutKey = 'F9';
                    Visible = false;

                    trigger OnAction()
                    begin
                        //Post(CODEUNIT::"Sales-Post (Yes/No)");

                        //PVPost."Post Payment Voucher"(Rec);
                        PaymentsPost."Post Payment Voucher"(Rec);
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
                    Visible = not OpenApprovalEntriesExist;

                    trigger OnAction()
                    var
                        ApprovalsMgmt: Codeunit "Approvals Mgmt.";
                    begin
                        ApprovalsMgmt.GetApprovalComment(Rec);
                    end;
                }
            }
        }
    }

    trigger OnAfterGetCurrRecord()
    begin
        SetControlAppearance;
    end;

    trigger OnAfterGetRecord()
    begin
        SetControlAppearance;
    end;

    trigger OnModifyRecord(): Boolean
    begin
        /*IF USERID<>pvheader."Created By" THEN
          ERROR('%1',text0002);*///Machira

    end;

    trigger OnNewRecord(BelowxRec: Boolean)
    begin
        Rec."Payment Type" := Rec."payment type"::"Payment Voucher";
        Rec."Account Type" := Rec."account type"::Customer;
    end;

    trigger OnOpenPage()
    begin
        SetControlAppearance;
    end;

    var
        ApprovalsMgmt: Codeunit "Approvals Mgmt.";
        OpenApprovalEntriesExist: Boolean;
        PaymentsPost: Codeunit "Payments-Post";
        text0001: label 'The customer Account Number Must have a value. Cannot be empty If advance recovery is more than the user.';
        pvLines: Record "PV Lines";
        pvheader: Record Payments;
        ReopenPV: Codeunit Payments;
        usersetup: Record "User Setup";
        text0002: label 'This Payment Voucher can only be edited by the initiator';
        OpenApprovalEntriesExistForCurrUser: Boolean;
        Purch: Record Payments;
        pcv: Record "PV Lines";
        TotalAmount: Decimal;
        CashMgmtSetup: Record "Cash Management Setup";
        DMSManagement: Codeunit "DMS Management";
        ProcurementProcessing: Codeunit "Procurement Processing";

    local procedure SetControlAppearance()
    var
        ApprovalsMgmt: Codeunit "Approvals Mgmt.";
    begin
        OpenApprovalEntriesExist := ApprovalsMgmt.HasOpenApprovalEntries(Rec.RecordId);
        OpenApprovalEntriesExistForCurrUser := ApprovalsMgmt.HasOpenApprovalEntriesForCurrentUser(Rec.RecordId);
    end;
}
