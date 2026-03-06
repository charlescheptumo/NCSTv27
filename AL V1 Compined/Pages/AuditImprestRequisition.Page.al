#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Page 57123 "Audit Imprest Requisition"
{
    DeleteAllowed = false;
    Editable = false;
    PageType = Card;
    SourceTable = Payments;
    SourceTableView = where("Payment Type" = const(Imprest));

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
                    Editable = true;
                }
                field("Account Type"; Rec."Account Type")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Account No."; Rec."Account No.")
                {
                    ApplicationArea = Basic;
                    Editable = true;
                }
                field("Account Name"; Rec."Account Name")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Pay Mode"; Rec."Pay Mode")
                {
                    ApplicationArea = Basic;
                }
                field("Cheque No"; Rec."Cheque No")
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
                field("Travel Date"; Rec."Travel Date")
                {
                    ApplicationArea = Basic;
                }
                field("Posting Date"; Rec."Posting Date")
                {
                    ApplicationArea = Basic;
                }
                field("Created By"; Rec."Created By")
                {
                    ApplicationArea = Basic;
                }
                field(Status; Rec.Status)
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field(Project; Rec.Project)
                {
                    ApplicationArea = Basic;
                    Editable = true;
                }
                field("Project Description"; Rec."Project Description")
                {
                    ApplicationArea = Basic;
                    Editable = true;
                }
                field("Shortcut Dimension 1 Code"; Rec."Shortcut Dimension 1 Code")
                {
                    ApplicationArea = Basic;
                    Editable = true;
                }
                field("Department Name"; Rec."Department Name")
                {
                    ApplicationArea = Basic;
                    Editable = true;
                }
                field("Shortcut Dimension 2 Code"; Rec."Shortcut Dimension 2 Code")
                {
                    ApplicationArea = Basic;
                    Editable = true;
                }
                field("Project Name"; Rec."Project Name")
                {
                    ApplicationArea = Basic;
                }
                field("Shortcut Dimension 3 Code"; Rec."Shortcut Dimension 3 Code")
                {
                    ApplicationArea = Basic;
                    Editable = true;
                }
                field("Unit  Name"; Rec."Unit  Name")
                {
                    ApplicationArea = Basic;
                }
                field("Shortcut Dimension 4 Code"; Rec."Shortcut Dimension 4 Code")
                {
                    ApplicationArea = Basic;
                    Editable = true;
                }
                field("Division Name"; Rec."Division Name")
                {
                    ApplicationArea = Basic;
                }
                field("Imprest Amount"; Rec."Imprest Amount")
                {
                    ApplicationArea = Basic;
                }
                field("Imprest Deadline"; Rec."Imprest Deadline")
                {
                    ApplicationArea = Basic;
                }
            }
            part(Control1000000017; "Data Imprest Lines")
            {
                SubPageLink = No = field("No.");
            }
        }
        area(factboxes)
        {
            systempart(Control1000000015; Notes)
            {
            }
            systempart(Control1000000016; Links)
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
            action("Attach from Imprest Memo")
            {
                ApplicationArea = Basic;
                Enabled = ShowAttach;
                Image = Import;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;

                trigger OnAction()
                begin
                    Rec.AttachLines(Rec);
                end;
            }
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
                        //cc//if ApprovalsMgmt.CheckPaymentsApprovalsWorkflowEnabled(Rec) then
                        //cc//ApprovalsMgmt.OnSendPaymentsForApproval(Rec);
                    end;
                }
                action(CancelApprovalRequest)
                {
                    ApplicationArea = Basic;
                    Caption = 'Cancel Approval Re&quest';
                    Enabled = true;
                    Image = Cancel;
                    Promoted = true;
                    PromotedCategory = New;

                    trigger OnAction()
                    begin
                        //ApprovalsMgmt.OnCancelPaymentsApprovalRequest(Rec);
                    end;
                }
                separator(Action1000000037)
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

                        if Rec.Status <> Rec.Status::Released then
                            Error(Txt0001);
                        if Rec.Status = Rec.Status::Released then begin
                            Rec.SetRange("No.", Rec."No.");
                            Report.Run(57004, true, true, Rec)
                        end;
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
                    end;
                }
                separator(Action1000000031)
                {
                }
            }
            group("P&osting")
            {
                Caption = 'P&osting';
                Image = Post;
            }
        }
    }

    trigger OnAfterGetRecord()
    begin
        ShowAttach := Rec.OpenEntries(Rec);
    end;

    trigger OnNewRecord(BelowxRec: Boolean)
    begin
        Rec."Payment Type" := Rec."payment type"::Imprest;
        Rec."Account Type" := Rec."account type"::Customer;
        Rec."Imprest Type" := Rec."imprest type"::"Project Imprest";
        Rec."Document Type" := Rec."document type"::Imprest;
        Rec."Created By" := UserId;
    end;

    trigger OnOpenPage()
    begin
        ShowAttach := Rec.OpenEntries(Rec);
    end;

    var
        PaymentPost: Codeunit "Payments-Post";
        [InDataSet]
        ShowAttach: Boolean;
        Committment: Codeunit Committment;
        OpenApprovalEntriesExist: Boolean;
        ApprovalsMgmt: Codeunit "Approvals Mgmt.";
        Txt0001: label 'You Can only Print Fully Approved Imprest Requisition';
        users: Record "User Setup";
}
