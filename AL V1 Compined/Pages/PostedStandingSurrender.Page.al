#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Page 57168 "Posted Standing Surrender"
{
    DeleteAllowed = false;
    InsertAllowed = false;
    ModifyAllowed = false;
    PageType = Card;
    SourceTable = Payments;
    SourceTableView = where("Payment Type" = const("Standing Imprest Surrender"),
                            Posted = const(True),
                            Status = filter(Released));

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
                field(Date; Rec.Date)
                {
                    ApplicationArea = Basic;
                    Editable = true;
                }
                field("Paying Bank Account"; Rec."Paying Bank Account")
                {
                    ApplicationArea = Basic;
                    Caption = 'Bank Account';
                    Editable = not OpenApprovalEntriesExist;
                }
                field("Bank Name"; Rec."Bank Name")
                {
                    ApplicationArea = Basic;
                }
                field("Payment Narration"; Rec."Payment Narration")
                {
                    ApplicationArea = Basic;
                    Caption = 'Surrender Narrations';
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
                field("Directorate Code"; Rec."Directorate Code")
                {
                    ApplicationArea = Basic;
                }
                field("Standing Imprest No."; Rec."Standing Imprest No.")
                {
                    ApplicationArea = Basic;
                }
                field(Job; Rec.Job)
                {
                    ApplicationArea = Basic;
                    ShowMandatory = true;
                }
                field("Job Task No"; Rec."Job Task No")
                {
                    ApplicationArea = Basic;
                    ShowMandatory = true;
                }
                field("Job Name"; Rec."Job Name")
                {
                    ApplicationArea = Basic;
                    Editable = false;
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
                    Visible = false;
                }
                field("Posted By"; Rec."Posted By")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field("Posted Date"; Rec."Posted Date")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    Visible = false;
                }
            }
            part(Control1000000021; "Standing Surrender Lines")
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
                    Visible = false;

                    trigger OnAction()
                    var
                        ApprovalEntries: Page "Approval Entries";
                    begin

                        ApprovalEntries.SetRecordfilters(Database::Payments, 8, Rec."No.");
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
                        Rec.TestField("Directorate Code");

                        Rec.TestField(Job);
                        Rec.TestField("Job Task No");
                        Rec.TestField("Paying Bank Account");
                        Rec.TestField(Date);
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
                        Report.Run(59098, true, true, Rec)
                    end;
                }
                action(DocAttach)
                {
                    ApplicationArea = Basic, Suite;
                    Caption = 'Attachments';
                    Image = Attach;
                    Promoted = true;
                    PromotedCategory = Process;
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
                    Visible = false;

                    trigger OnAction()
                    var
                        ReleasePurchDoc: Codeunit "Release Purchase Document";
                    begin
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
                        Rec.TestField("Paying Bank Account");
                        if (Rec.Status = Rec.Status::Released) then begin
                            PaymentsPost.PostStandingImprestSurrenders(Rec)
                        end else
                            Error('This document must be approved first');
                    end;
                }
                action(Approve)
                {
                    ApplicationArea = Basic;
                    Image = Approve;
                    Promoted = true;
                    PromotedCategory = New;
                }
                action(Reject)
                {
                    ApplicationArea = Basic;
                    Image = Reject;
                }
                action(Delegate)
                {
                    ApplicationArea = Basic;
                    Image = Delegate;
                }
            }
        }
    }

    trigger OnAfterGetRecord()
    begin
        SetControlAppearance;
    end;

    trigger OnNewRecord(BelowxRec: Boolean)
    begin
        Rec."Payment Type" := Rec."payment type"::"Standing Imprest Surrender";
        Rec."Document Type" := Rec."document type"::"Standing Imprest Surrender";
    end;

    trigger OnOpenPage()
    begin
        SetControlAppearance;
    end;

    var
        ApprovalsMgmt: Codeunit "Approvals Mgmt.";
        OpenApprovalEntriesExist: Boolean;
        PaymentsPost: Codeunit "Payments-Post";

    local procedure SetControlAppearance()
    var
        ApprovalsMgmt: Codeunit "Approvals Mgmt.";
    begin
        OpenApprovalEntriesExist := ApprovalsMgmt.HasOpenApprovalEntries(Rec.RecordId);
    end;
}
