#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Page 57019 "Approved Petty Cash Voucher"
{
    CardPageID = "Approved Petty Cash Voucher";
    DelayedInsert = false;
    DeleteAllowed = false;
    InsertAllowed = false;
    PageType = Card;
    ShowFilter = false;
    SourceTable = Payments;
    SourceTableView = where(Posted = const(False),
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
                field("Job Task No."; Rec."Job Task No.")
                {
                    ApplicationArea = Basic;
                    Enabled = true;
                    Visible = false;

                    trigger OnValidate()
                    begin
                        Rec.TestField("Job Task No.");
                    end;
                }
                field("Job Task Name"; Rec."Job Task Name")
                {
                    ApplicationArea = Basic;
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
                }
                field("Paying Bank Account"; Rec."Paying Bank Account")
                {
                    ApplicationArea = Basic;
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

                    trigger OnValidate()
                    begin
                        //"Payment Narration":=PCVLines.Description;
                    end;
                }
                field("Shortcut Dimension 1 Code"; Rec."Shortcut Dimension 1 Code")
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
                }
                field(Status; Rec.Status)
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Reasons to Reopen"; Rec."Reasons to Reopen")
                {
                    ApplicationArea = Basic;
                    MultiLine = true;
                }
                field("Reopened by"; Rec."Reopened by")
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
                field("Archive Document"; Rec."Archive Document")
                {
                    ApplicationArea = Basic;
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
                        //cc//   //cc//if ApprovalsMgmt.CheckPaymentsApprovalsWorkflowEnabled(Rec) then
                        //cc//        //cc//ApprovalsMgmt.OnSendPaymentsForApproval(Rec);
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
                        //cc//         //ApprovalsMgmt.OnCancelPaymentsApprovalRequest(Rec);
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
                    Promoted = true;
                    PromotedCategory = Process;
                    ShortCutKey = 'Ctrl+F9';

                    trigger OnAction()
                    var
                        ReleasePurchDoc: Codeunit "Release Purchase Document";
                    begin
                        //Manual Re-open
                        Usersetup.Get(UserId);
                        Usersetup.TestField(Usersetup."Reopen Document", Usersetup."Reopen Document" = true);
                        Rec.TestField("Reasons to Reopen");
                        if not Confirm('Are you sure you want to Re-Open this document?', true) then begin
                            Error('Document not Re-Opened!');
                        end;
                        Rec.Status := Rec.Status::Open;
                        Rec.Modify;
                        Message('Re-Opened Successfuly!');
                        //ReleasePurchDoc.PerformManualReopen(Rec);
                        //ReleasePurchDoc.ReopenPV(Rec);
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
                        PaymentsPost.PostPettyCash(Rec);
                    end;
                }
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
        Usersetup: Record "User Setup";
        Payments: Record Payments;

    local procedure SetControlAppearance()
    var
        ApprovalsMgmt: Codeunit "Approvals Mgmt.";
    begin
        OpenApprovalEntriesExist := ApprovalsMgmt.HasOpenApprovalEntries(Rec.RecordId);
    end;
}
