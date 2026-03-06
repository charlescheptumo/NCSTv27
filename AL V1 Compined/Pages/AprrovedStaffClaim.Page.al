#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Page 57109 "Aprroved Staff Claim"
{
    DeleteAllowed = false;
    Editable = true;
    InsertAllowed = false;
    ModifyAllowed = true;
    PageType = Card;
    SourceTable = Payments;
    SourceTableView = where("Payment Type" = const("Staff Claim"),
                            Posted = const(False),
                            Status = const(Released));
    ApplicationArea = All;

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
                    Enabled = true;
                }
                field("Account Type"; Rec."Account Type")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Account No."; Rec."Account No.")
                {
                    ApplicationArea = Basic;
                    Editable = false;
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
                    Visible = false;
                }
                field("Paying Bank Account"; Rec."Paying Bank Account")
                {
                    ApplicationArea = Basic;
                    TableRelation = "Bank Account";
                }
                field("Bank Name"; Rec."Bank Name")
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
                field("Payment Narration"; Rec."Payment Narration")
                {
                    ApplicationArea = Basic;
                    Enabled = Rec.banked = true;
                }
                field("Total Amount"; Rec."Total Amount")
                {
                    ApplicationArea = Basic;
                }
                field("Staff Claim Payment Mode"; Rec."Staff Claim Payment Mode")
                {
                    ApplicationArea = Basic;
                    Enabled = Rec.banked = true;
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
                field("Posting Date"; Rec."Posting Date")
                {
                    ApplicationArea = Basic;
                    Editable = true;
                }
                field("Shortcut Dimension 1 Code"; Rec."Shortcut Dimension 1 Code")
                {
                    ApplicationArea = Basic;
                    Editable = not OpenApprovalEntriesExist;
                    Visible = true;
                }
                field("Department Name"; Rec."Department Name")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    Visible = true;
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
                }
                field("Job Task No."; Rec."Job Task No.")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field("Job Task No"; Rec."Job Task No")
                {
                    ApplicationArea = Basic;
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
                field(Select; Rec.Select)
                {
                    ApplicationArea = Basic;
                }
                field("Archive Document"; Rec."Archive Document")
                {
                    ApplicationArea = Basic;
                }
            }
            part(Control1000000021; "Staff Claim Lines")
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

                    trigger OnAction()
                    var
                        ApprovalEntries: Page "Approval Entries";
                    begin

                        ApprovalEntries.SetRecordfilters(Database::Payments, 7, Rec."No.");
                        ApprovalEntries.Run;
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
        area(processing)
        {
            group("F&unctions")
            {
                Caption = 'F&unctions';
                Image = "Action";
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

                    trigger OnAction()
                    var
                        ReleasePurchDoc: Codeunit "Release Purchase Document";
                    begin
                        Rec.TestField("Reasons to Reopen");
                        Usersetup.Get(UserId);
                        Usersetup.TestField(Usersetup."Reopen Document", Usersetup."Reopen Document" = true);
                        Rec.TestField("Reasons to Reopen");
                        if not Confirm('Are you sure you want to Re-Open this document?', true) then begin
                            Error('Document not Re-Opened!');
                        end;
                        Rec.Status := Rec.Status::Open;
                        Rec."Reopened by" := UserId;
                        Rec.Modify;
                        Message('Re-Opened Successfully!');
                        //ReleasePurchDoc.PerformManualReopen(Rec);
                        //ReleasePurchDoc.ReopenPV(Rec);
                    end;
                }
                separator(Action1000000036)
                {
                }
                action("Banked Staff Claim")
                {
                    ApplicationArea = Basic;
                    Enabled = Rec.banked = false;
                    Image = SendTo;
                    Promoted = true;
                    PromotedCategory = Process;
                    PromotedIsBig = true;

                    trigger OnAction()
                    begin
                        Payments.Reset;
                        Payments.SetRange("No.", Rec."No.");
                        //Payments.SETRANGE(Select,TRUE);
                        Payments.SetRange("Payment Type", Payments."payment type"::"Staff Claim");
                        Payments.SetRange(banked, false);
                        if Payments.Find('-') then begin
                            repeat
                                Payments.banked := true;
                                Payments.Modify(true);
                            until Payments.Next = 0;
                        end;
                        Message('Banked Successfully');
                    end;
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
                    Enabled = Rec.banked = true;
                    Image = PostOrder;
                    Promoted = true;
                    PromotedCategory = Process;
                    PromotedIsBig = true;
                    ShortCutKey = 'F9';

                    trigger OnAction()
                    begin
                        Rec.TestField("Paying Bank Account");
                        Rec.TestField(Job);
                        Rec.TestField("Job Task No");
                        Rec.TestField("Staff Claim Payment Mode", Rec."staff claim payment mode"::"Payment Voucher");
                        PaymentsPost.PostStaffClaims(Rec);
                        //Commitment.FnCommitStaffClaim(Rec);

                        //Commented to avooid double posting to Employees account
                    end;
                }
                action("Process Payments")
                {
                    ApplicationArea = Basic;
                    Caption = 'Process Payment Voucher';
                    Image = Payment;
                    Promoted = true;
                    Visible = false;

                    trigger OnAction()
                    begin
                        //add pv from claims
                        //added on 27/04/2017
                        Usersetup.Get(UserId);
                        Usersetup.TestField(Usersetup."Process Claims", Usersetup."Process Claims" = true);
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
                    Enabled = Rec.banked = true;
                    Image = Payment;
                    Promoted = true;

                    trigger OnAction()
                    begin
                        //process Petty Cash VOucher for Claims
                        //added on 05/October/2021...Fred
                        Rec.TestField("Staff Claim Payment Mode", Rec."staff claim payment mode"::"Petty Cash");
                        Usersetup.Get(UserId);
                        Usersetup.TestField(Usersetup."Process Claims", Usersetup."Process Claims" = true);
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
                                    Claimheaders.Posted := true;
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
        Payments: Record Payments;
        Commitment: Codeunit "Procurement Processing";
        Purch: Record Payments;
        Usersetup: Record "User Setup";
        Text004: label 'Are you sure you want to process a payment voucher for staff claim No. %1?';
        Text005: label 'Are you sure you want to process a petty cash voucher for staff claim No. %1?';
        pvlines: Record "PV Lines";
        pvheaders: Record Payments;
        Claimlines: Record "PV Lines";
        Claimheaders: Record Payments;
        NoSeriesMgt: Codeunit "No. Series";
        CashMgt: Record "Cash Management Setup";
        Noseries: Code[20];
        ReopenStaff: Codeunit Payments;

    local procedure SetControlAppearance()
    var
        ApprovalsMgmt: Codeunit "Approvals Mgmt.";
    begin
        OpenApprovalEntriesExist := ApprovalsMgmt.HasOpenApprovalEntries(Rec.RecordId);
    end;
}
