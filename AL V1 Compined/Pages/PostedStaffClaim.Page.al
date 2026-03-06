#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Page 57111 "Posted Staff Claim"
{
    DeleteAllowed = false;
    Editable = false;
    PageType = Card;
    SourceTable = Payments;
    SourceTableView = where("Payment Type" = const("Staff Claim"),
                            Posted = const(True));

    layout
    {
        area(content)
        {
            group(General)
            {
                field("No."; Rec."No.")
                {
                    ApplicationArea = Basic;
                    Editable = true;
                }
                field(Date; Rec.Date)
                {
                    ApplicationArea = Basic;
                    Editable = not OpenApprovalEntriesExist;
                    Enabled = false;
                }
                field("Account Type"; Rec."Account Type")
                {
                    ApplicationArea = Basic;
                }
                field("Account No."; Rec."Account No.")
                {
                    ApplicationArea = Basic;
                }
                field("Account Name"; Rec."Account Name")
                {
                    ApplicationArea = Basic;
                }
                field(Payee; Rec.Payee)
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
                    Editable = false;
                }
                field("Unit  Name"; Rec."Unit  Name")
                {
                    ApplicationArea = Basic;
                    Caption = 'Section Name';
                    Visible = false;
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
                field(Job; Rec.Job)
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Job Task No"; Rec."Job Task No")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Job Name"; Rec."Job Name")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field(Project; Rec.Project)
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    Visible = false;
                }
                field("Project Description"; Rec."Project Description")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field("Total Amount"; Rec."Total Amount")
                {
                    ApplicationArea = Basic;
                }
                field(Status; Rec.Status)
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Posting Date"; Rec."Posting Date")
                {
                    ApplicationArea = Basic;
                }
                field(Posted; Rec.Posted)
                {
                    ApplicationArea = Basic;
                }
                field("Posted By"; Rec."Posted By")
                {
                    ApplicationArea = Basic;
                }
                field("Posted Date"; Rec."Posted Date")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
            }
            part(Control1000000021; "Staff Claim Lines")
            {
                Editable = not OpenApprovalEntriesExist;
                SubPageLink = No = field("No.");
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

                        ApprovalEntries.SetRecordfilters(Database::Payments, 7, Rec."No.");
                        ApprovalEntries.Run;
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
                        //cc//if ApprovalsMgmt.CheckPaymentsApprovalsWorkflowEnabled(Rec) then
                        //cc//ApprovalsMgmt.OnSendPaymentsForApproval(Rec);
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
                        //ApprovalsMgmt.OnCancelPaymentsApprovalRequest(Rec);
                    end;
                }
                separator(Action1000000043)
                {
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
                        Report.Run(57011, true, true, Rec)
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
                    Visible = false;

                    trigger OnAction()
                    var
                        ReleasePurchDoc: Codeunit "Release Purchase Document";
                    begin
                        //ReleasePurchDoc.PerformManualRelease(Rec);
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
                        //ReleasePurchDoc.PerformManualReopen(Rec);
                        //ReleasePurchDoc.ReopenPV(Rec);
                        ReopenStaff.PerformManualReopen(Rec);
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

                    trigger OnAction()
                    begin
                        //Post(CODEUNIT::"Sales-Post (Yes/No)");

                        //PVPost."Post Payment Voucher"(Rec);
                        PaymentsPost.PostStaffClaims(Rec);
                    end;
                }
                action("Process Payments")
                {
                    ApplicationArea = Basic;
                    Caption = 'Process Payment Voucher';
                    Image = Payment;
                    Promoted = true;

                    trigger OnAction()
                    begin
                        //add pv from claims
                        //added on 27/04/2017
                        Rec.TestField("Staff Claim Payment Mode", Rec."staff claim payment mode"::"Payment Voucher");
                        usersetup.Get(UserId);
                        usersetup.TestField(usersetup."Process Claims", usersetup."Process Claims" = true);
                        if Confirm(Text004, false, Rec."No.") then begin
                            if Rec."Payment processed" = false then begin
                                Claimheaders.Reset;
                                Claimheaders.SetRange(Claimheaders."No.", Rec."No.");
                                if Claimheaders.Find('-') then begin

                                    //get the no. series
                                    CashMgt.Reset;
                                    if CashMgt.Find('-') then begin
                                        Noseries := CashMgt."PV Nos";
                                    end;

                                    pvheaders.Init;
                                    pvheaders."No." := NoSeriesMgt.GetNextNo(Noseries, pvheaders.Date, true);
                                    pvheaders.Project := Rec.Project;
                                    pvheaders."Project Description" := Rec."Project Description";
                                    pvheaders.Date := Today;
                                    pvheaders."Created By" := UserId;
                                    pvheaders.Payee := Rec.Payee;
                                    pvheaders."On behalf of" := Claimheaders."Account Name";
                                    pvheaders."Payment Narration" := Rec."Payment Narration";
                                    pvheaders."Shortcut Dimension 1 Code" := Rec."Shortcut Dimension 1 Code";
                                    pvheaders."Shortcut Dimension 2 Code" := Rec."Shortcut Dimension 2 Code";
                                    pvheaders."Shortcut Dimension 3 Code" := Rec."Shortcut Dimension 3 Code";
                                    pvheaders."Created By" := UserId;
                                    pvheaders.Insert;
                                    Claimlines.Reset;
                                    Claimlines.SetRange(Claimlines.No, Claimheaders."No.");
                                    if Claimlines.Find('-') then begin
                                        repeat
                                            pvlines.Init;
                                            pvlines.No := pvheaders."No.";
                                            pvlines."Line No" := Claimlines."Line No";
                                            pvlines.Type := 'VENDOR D';
                                            pvlines."Account Type" := Claimheaders."Account Type";
                                            pvlines."Account No" := Claimheaders."Account No.";
                                            pvlines.Validate("Account No");
                                            pvlines."Account Name" := Claimheaders."Account Name";
                                            pvlines."Applies to Doc. No" := Claimheaders."No.";
                                            pvlines.Amount := Claimlines.Amount;
                                            pvlines.Validate(Amount);
                                            pvlines."Net Amount" := Claimlines.Amount;
                                            pvlines."Vote Item" := Claimlines.FnGetVoteItem();
                                            pvlines.Validate("Vote Item");
                                            pvlines.Insert;
                                        until Claimlines.Next = 0;
                                    end;
                                    pvheaders."Payment processed" := true;
                                    Claimheaders."Payment processed" := true;
                                    Claimheaders.Modify;
                                end;
                                Message('Payment voucher for the staff calim No. %1 has been processed, Kindly send it for approval', Rec."No.");
                            end else
                                Error('The payment for claim No. %1 has already been processed.', Claimheaders."No.");
                        end;
                    end;
                }
                action("Process Petty Cash Voucher")
                {
                    ApplicationArea = Basic;
                    Caption = 'Process Petty Cash Voucher';
                    Image = Payment;
                    Promoted = true;

                    trigger OnAction()
                    begin
                        //process Petty Cash VOucher for Claims
                        //added on 05/October/2021...Fred
                        usersetup.Get(UserId);
                        usersetup.TestField(usersetup."Process Claims", usersetup."Process Claims" = true);
                        Rec.TestField("Staff Claim Payment Mode", Rec."staff claim payment mode"::"Petty Cash");
                        if Confirm(Text005, false, Rec."No.") then begin
                            if Rec."Payment processed" = false then begin
                                Claimheaders.Reset;
                                Claimheaders.SetRange(Claimheaders."No.", Rec."No.");
                                if Claimheaders.Find('-') then begin

                                    //get the no. series
                                    CashMgt.Reset;
                                    if CashMgt.Find('-') then begin
                                        Noseries := CashMgt."Petty Cash Nos";
                                    end;

                                    pvheaders.Init;
                                    pvheaders."No." := NoSeriesMgt.GetNextNo(Noseries, pvheaders.Date, true);
                                    //      pvheaders.Project:=Project;
                                    //      pvheaders."Project Description":="Project Description";
                                    pvheaders."Payment Type" := pvheaders."payment type"::"Petty Cash";
                                    pvheaders.Date := Today;
                                    pvheaders."Created By" := UserId;
                                    pvheaders.Payee := Claimheaders.Payee;
                                    pvheaders."Account Type" := Claimheaders."Account Type";
                                    pvheaders."Account No." := Claimheaders."Account No.";
                                    pvheaders."Account Name" := Claimheaders."Account Name";
                                    pvheaders."On behalf of" := Claimheaders."Account Name";
                                    pvheaders."Payment Narration" := Claimheaders."Payment Narration";
                                    pvheaders."Department Code" := Claimheaders."Department Code";
                                    pvheaders."Department Name" := Claimheaders."Department Name";
                                    pvheaders.Job := Claimheaders.Job;
                                    pvheaders.Project := Claimheaders.Project;
                                    pvheaders."Job Name" := Claimheaders."Job Name";
                                    pvheaders."Job Task No" := Claimheaders."Job Task No";
                                    pvheaders."Job Task No." := Claimheaders."Job Task No.";
                                    pvheaders."Shortcut Dimension 1 Code" := Rec."Shortcut Dimension 1 Code";
                                    pvheaders."Shortcut Dimension 2 Code" := Rec."Shortcut Dimension 2 Code";
                                    pvheaders."Shortcut Dimension 3 Code" := Rec."Shortcut Dimension 3 Code";
                                    pvheaders."Created By" := UserId;
                                    pvheaders.Insert;
                                    //  PCV Lines
                                    Claimlines.Reset;
                                    Claimlines.SetRange(Claimlines.No, Claimheaders."No.");
                                    if Claimlines.Find('-') then begin
                                        repeat
                                            pvlines.Init;
                                            pvlines.No := pvheaders."No.";
                                            pvlines."Line No" := Claimlines."Line No";
                                            pvlines.Description := Claimlines.Description;
                                            pvlines."Account Type" := Claimlines."Account Type";
                                            pvlines."Account No" := Claimlines."Account No";
                                            pvlines."Account Name" := Claimlines."Account Name";
                                            //pvlines.Type:='VENDOR D';
                                            //pvlines."Account Type":=Claimheaders."Account Type";
                                            //pvlines."Account No":=Claimheaders."Account No.";
                                            //pvlines."Account Name":=Claimheaders."Account Name";
                                            //pvlines.Description:="Payment Narration";
                                            //pvlines."Applies to Doc. No":=Claimheaders."No.";
                                            pvlines.Amount := Claimlines.Amount;
                                            pvlines."Net Amount" := Claimlines.Amount;
                                            pvlines.Insert;
                                        until Claimlines.Next = 0;
                                    end;
                                    pvheaders."Payment processed" := true;
                                    Claimheaders."Payment processed" := true;
                                    Claimheaders.Modify;
                                end;
                                Message('Petty Cash voucher for the staff calim No. %1 has been processed, Kindly send it for approval', Rec."No.");
                                Page.Run(57017, pvheaders);
                            end else
                                Error('The payment for claim No. %1 has already been processed.', Claimheaders."No.");
                        end;
                    end;
                }
            }
            action("&Navigate")
            {
                ApplicationArea = Basic;
                Caption = '&Navigate';
                Image = Navigate;
                Promoted = true;
                PromotedCategory = Process;
                Scope = Repeater;

                trigger OnAction()
                var
                    Navigate: Page Navigate;
                    UserSetup: Record "User Setup";
                    GL: Record "G/L Entry";
                begin
                    Navigate.SetDoc(Rec.Date, Rec."No.");
                    Navigate.Run;
                end;
            }
            action("General Ledger Entries")
            {
                ApplicationArea = Basic;
                Image = LedgerBook;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                RunObject = Page "General Ledger Entries";
                RunPageLink = "Document No." = field("No."),
                              "Posting Date" = field("Cheque Date");
            }
            action(ReverseTransaction)
            {
                ApplicationArea = Basic, Suite;
                Caption = 'Reverse Transaction';
                Ellipsis = true;
                Image = ReverseRegister;
                Scope = Repeater;
                ToolTip = 'Reverse a posted general ledger entry.';

                trigger OnAction()
                var
                    ReversalEntry: Record "Reversal Entry";
                    GL: Record "G/L Entry";
                begin
                    //check if receipt is allocated


                    Clear(ReversalEntry);
                    Rec.CalcFields(Reversed);
                    GL.Reset;
                    GL.SetRange("Document No.", Rec."No.");
                    if GL.FindSet then begin
                        if Rec.Reversed then
                            ReversalEntry.AlreadyReversedEntry(Rec.TableCaption, GL."Entry No.");
                        /*IF GL."Journal Batch Name" = '' THEN
                          ReversalEntry.TestFieldError;*/
                        GL.TestField("Transaction No.");
                        ReversalEntry.ReverseTransaction(GL."Transaction No.")
                    end;

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
        }
    }

    trigger OnAfterGetRecord()
    begin
        SetControlAppearance;
    end;

    trigger OnNewRecord(BelowxRec: Boolean)
    begin
        Rec."Payment Type" := Rec."payment type"::"Staff Claim";
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
        pvlines: Record "PV Lines";
        pvheaders: Record Payments;
        Claimlines: Record "PV Lines";
        Claimheaders: Record Payments;
        NoSeriesMgt: Codeunit "No. Series";
        CashMgt: Record "Cash Management Setup";
        Noseries: Code[20];
        Text004: label 'Are you sure you want to process a payment voucher for staff claim No. %1?';
        usersetup: Record "User Setup";
        ReopenStaff: Codeunit Payments;
        Purch: Record Payments;
        Text005: label 'Are you sure you want to process a petty cash voucher for staff claim No. %1?';

    local procedure SetControlAppearance()
    var
        ApprovalsMgmt: Codeunit "Approvals Mgmt.";
    begin
        OpenApprovalEntriesExist := ApprovalsMgmt.HasOpenApprovalEntries(Rec.RecordId);
    end;
}
