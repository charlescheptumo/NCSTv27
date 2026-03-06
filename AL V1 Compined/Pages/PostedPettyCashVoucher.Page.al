#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Page 57164 "Posted  Petty Cash Voucher"
{
    CardPageID = "Approved Petty Cash Voucher";
    DelayedInsert = false;
    DeleteAllowed = false;
    InsertAllowed = false;
    ModifyAllowed = true;
    PageType = Card;
    ShowFilter = false;
    SourceTable = Payments;
    SourceTableView = where(Posted = const(True),
                            Status = const(Released),
                            "Payment Type" = const("Petty Cash"));

    layout
    {
        area(content)
        {
            group(General)
            {
                field("No."; Rec."No.")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field(Project; Rec.Project)
                {
                    ApplicationArea = Basic;
                    Caption = 'Job No.';
                    Editable = false;
                    Enabled = true;
                    Visible = false;
                }
                field("Project Description"; Rec."Project Description")
                {
                    ApplicationArea = Basic;
                    Editable = not OpenApprovalEntriesExist;
                    Enabled = false;
                    Visible = false;
                }
                field("Job Task Name"; Rec."Job Task Name")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    Visible = false;
                }
                field(Date; Rec.Date)
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    Enabled = false;
                }
                field("Pay Mode"; Rec."Pay Mode")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Paying Bank Account"; Rec."Paying Bank Account")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Bank Name"; Rec."Bank Name")
                {
                    ApplicationArea = Basic;
                }
                field("Account Type"; Rec."Account Type")
                {
                    ApplicationArea = Basic;
                    Editable = false;

                    trigger OnValidate()
                    begin
                        Rec.TestField("Account Type");
                    end;
                }
                field("Account No."; Rec."Account No.")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    TableRelation = Customer."Customer Posting Group" where("Customer Posting Group" = filter('PCASH'));
                }
                field("Account Name"; Rec."Account Name")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field(Payee; Rec.Payee)
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Payment Narration"; Rec."Payment Narration")
                {
                    ApplicationArea = Basic;
                    Editable = false;

                    trigger OnValidate()
                    begin
                        Rec."Payment Narration" := PCVLines.Description;
                    end;
                }
                field("Shortcut Dimension 1 Code"; Rec."Shortcut Dimension 1 Code")
                {
                    ApplicationArea = Basic;
                    Editable = false;
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
                field("Project Name"; Rec."Project Name")
                {
                    ApplicationArea = Basic;
                    Caption = 'Program Name';
                    Visible = false;
                }
                field("Shortcut Dimension 3 Code"; Rec."Shortcut Dimension 3 Code")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    Visible = false;
                }
                field("Unit  Name"; Rec."Unit  Name")
                {
                    ApplicationArea = Basic;
                    Caption = 'Section Name';
                    Visible = false;
                }
                field("Currency Code"; Rec."Currency Code")
                {
                    ApplicationArea = Basic;
                    Editable = not OpenApprovalEntriesExist;
                    Visible = false;
                }
                field("Total Amount"; Rec."Total Amount")
                {
                    ApplicationArea = Basic;
                }
                field("Posting Date"; Rec."Posting Date")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field(Status; Rec.Status)
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
            }
            group(Control27)
            {
                field("Reasons for Reversal"; Rec."Reasons for Reversal")
                {
                    ApplicationArea = Basic;
                }
                field("Reversed By"; Rec."Reversed By")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Reversal Date"; Rec."Reversal Date")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
            }
            part(Control1000000021; "PCV Lines")
            {
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
                    ShortCutKey = 'F12';

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
                action(Attachments)
                {
                    ApplicationArea = All;
                    Caption = 'Attachments';
                    Image = Attach;
                    Promoted = true;
                    PromotedCategory = Category9;
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
                        Report.Run(57003, true, true, Rec)
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
                    ShortCutKey = 'Ctrl+F9';

                    trigger OnAction()
                    var
                        ReleasePurchDoc: Codeunit "Release Purchase Document";
                    begin
                        //ReleasePurchDoc.PerformManualReopen(Rec);
                        //ReleasePurchDoc.ReopenPV(Rec);
                        if Confirm('Kindly reverse the entries before reopening, are you sure you want to reopen?') then begin
                            Rec.Posted := false;
                            Rec.Modify;
                            Message('Reopened , check  approved petty cash list');
                        end;
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
                        PaymentsPost.PostPettyCash(Rec);
                    end;
                }
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
                    Rec.TestField("Reasons for Reversal");
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
        }
    }

    trigger OnAfterGetRecord()
    begin
        SetControlAppearance;
    end;

    trigger OnInsertRecord(BelowxRec: Boolean): Boolean
    begin
        Rec."Payment Narration" := PCVLines.Description;
    end;

    trigger OnNewRecord(BelowxRec: Boolean)
    begin
        Rec."Payment Type" := Rec."payment type"::"Petty Cash";
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
        PCVLines: Record "PV Lines";

    local procedure SetControlAppearance()
    var
        ApprovalsMgmt: Codeunit "Approvals Mgmt.";
    begin
        OpenApprovalEntriesExist := ApprovalsMgmt.HasOpenApprovalEntries(Rec.RecordId);
    end;
}
