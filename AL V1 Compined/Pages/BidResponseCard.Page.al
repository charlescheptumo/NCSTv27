#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Page 75253 "Bid Response Card"
{
    Caption = 'Purchase Quote';
    PageType = Document;
    PromotedActionCategories = 'New,Process,Report,Approve,Request Approval,Print/Send,Quote,Release,Navigate';
    RefreshOnActivate = true;
    SourceTable = "Purchase Header";
    SourceTableView = where("Document Type" = filter(Quote));

    layout
    {
        area(content)
        {
            group(General)
            {
                Caption = 'General';
                field("No."; Rec."No.")
                {
                    ApplicationArea = Suite;
                    Caption = 'Bid Response No.';
                    Editable = false;
                    Importance = Promoted;
                    ToolTip = 'Specifies the number of the involved entry or record, according to the specified number series.';
                    Visible = DocNoVisible;

                    trigger OnAssistEdit()
                    begin
                        if Rec.AssistEdit(xRec) then
                            CurrPage.Update;
                    end;
                }
                field("Document Date"; Rec."Document Date")
                {
                    ApplicationArea = Suite;
                    Editable = true;
                    ToolTip = 'Specifies the date when the related document was created.';
                }
                field("Invitation For Supply No"; Rec."Invitation For Supply No")
                {
                    ApplicationArea = Basic;
                }
                field("Vendor No."; Rec."Vendor No.")
                {
                    ApplicationArea = Basic;
                }
                field("Buy-from Vendor Name"; Rec."Buy-from Vendor Name")
                {
                    ApplicationArea = Suite;
                    Caption = 'Vendor Name';
                    Editable = false;
                    Importance = Promoted;
                    ShowMandatory = true;
                    ToolTip = 'Specifies the name of the vendor who delivers the products.';

                    trigger OnValidate()
                    begin
                        Rec.OnAfterValidateBuyFromVendorNo(Rec, xRec);
                        CurrPage.Update;
                    end;
                }
                field("VAT Registration No."; Rec."VAT Registration No.")
                {
                    ApplicationArea = Basic;
                    Caption = 'Tax Registration (PIN) No.';
                }
                group("Buy-from")
                {
                    Caption = 'Buy-from';
                    field("Buy-from Address"; Rec."Buy-from Address")
                    {
                        ApplicationArea = Suite;
                        Caption = 'Address';
                        Importance = Additional;
                        QuickEntry = false;
                        ToolTip = 'Specifies the address of the vendor who delivered the items.';
                    }
                    field("Buy-from Address 2"; Rec."Buy-from Address 2")
                    {
                        ApplicationArea = Suite;
                        Caption = 'Address 2';
                        Importance = Additional;
                        QuickEntry = false;
                        ToolTip = 'Specifies an additional part of the address of the vendor who delivered the items.';
                    }
                    group(Control79)
                    {
                        Visible = IsBuyFromCountyVisible;
                        field("Buy-from County"; Rec."Buy-from County")
                        {
                            ApplicationArea = Suite;
                            Caption = 'County';
                            Importance = Additional;
                            QuickEntry = false;
                        }
                    }
                    field("Buy-from Post Code"; Rec."Buy-from Post Code")
                    {
                        ApplicationArea = Suite;
                        Caption = 'Post Code';
                        Importance = Additional;
                        QuickEntry = false;
                        ToolTip = 'Specifies the post code of the vendor who delivered the items.';
                    }
                    field("Buy-from City"; Rec."Buy-from City")
                    {
                        ApplicationArea = Suite;
                        Caption = 'City';
                        Importance = Additional;
                        QuickEntry = false;
                        ToolTip = 'Specifies the city of the vendor who delivered the items.';
                    }
                    field("Buy-from Country/Region Code"; Rec."Buy-from Country/Region Code")
                    {
                        ApplicationArea = Suite;
                        Caption = 'Country/Region';
                        Importance = Additional;
                        QuickEntry = false;

                        trigger OnValidate()
                        begin
                            IsBuyFromCountyVisible := FormatAddress.UseCounty(Rec."Buy-from Country/Region Code");
                        end;
                    }
                    field("Buy-from Contact No."; Rec."Buy-from Contact No.")
                    {
                        ApplicationArea = Suite;
                        Caption = 'Contact No.';
                        Importance = Additional;
                        ToolTip = 'Specifies the number of contact person of the vendor who delivered the items.';
                    }
                }
                field("Buy-from Contact"; Rec."Buy-from Contact")
                {
                    ApplicationArea = Suite;
                    Caption = 'Contact';
                    Editable = Rec."Buy-from Vendor No." <> '';
                    ToolTip = 'Specifies the contact person at the vendor who delivered the items.';
                }
                field("Bidder Type"; Rec."Bidder Type")
                {
                    ApplicationArea = Basic;
                }
                field("Joint Venture Partner"; Rec."Joint Venture Partner")
                {
                    ApplicationArea = Basic;
                }
                field("Invitation Notice Type"; Rec."Invitation Notice Type")
                {
                    ApplicationArea = Basic;
                }
                field("Bid Envelope Type"; Rec."Bid Envelope Type")
                {
                    ApplicationArea = Basic;
                }
                field("Tender Description"; Rec."Tender Description")
                {
                    ApplicationArea = Basic;
                }
                field("Responsibility Center"; Rec."Responsibility Center")
                {
                    ApplicationArea = Basic;
                }
                field("Location Code"; Rec."Location Code")
                {
                    ApplicationArea = Basic;
                }
                field("Bidder Representative Name"; Rec."Bidder Representative Name")
                {
                    ApplicationArea = Basic;
                }
                field("Bidder Representative Desgn"; Rec."Bidder Representative Desgn")
                {
                    ApplicationArea = Basic;
                }
                field("Bidder Representative Address"; Rec."Bidder Representative Address")
                {
                    ApplicationArea = Basic;
                }
                field("Bidder Witness Name"; Rec."Bidder Witness Name")
                {
                    ApplicationArea = Basic;
                }
                field("Bidder Witness Designation"; Rec."Bidder Witness Designation")
                {
                    ApplicationArea = Basic;
                }
                field("Bidder Witness Address"; Rec."Bidder Witness Address")
                {
                    ApplicationArea = Basic;
                }
                field("Tender Document Source"; Rec."Tender Document Source")
                {
                    ApplicationArea = Basic;
                }
                field("Bid Charge Code"; Rec."Bid Charge Code")
                {
                    ApplicationArea = Basic;
                }
                field("Bid Charge (LCY)"; Rec."Bid Charge (LCY)")
                {
                    ApplicationArea = Basic;
                }
                field("Payment Reference No."; Rec."Payment Reference No.")
                {
                    ApplicationArea = Basic;
                }
                field("Posted Direct Income Voucher"; Rec."Posted Direct Income Voucher")
                {
                    ApplicationArea = Basic;
                }
                field("Language Code"; Rec."Language Code")
                {
                    ApplicationArea = Basic;
                }
                field("Purchaser Code"; Rec."Purchaser Code")
                {
                    ApplicationArea = Basic;
                }
                field("Currency Code"; Rec."Currency Code")
                {
                    ApplicationArea = Basic;
                }
                field(Amount; Rec.Amount)
                {
                    ApplicationArea = Basic;
                }
                field("Amount Including VAT"; Rec."Amount Including VAT")
                {
                    ApplicationArea = Basic;
                }
                field("No. of Addendum Notices issued"; Rec."No. of Addendum Notices issued")
                {
                    ApplicationArea = Basic;
                }
                field("Last Addendum Notice No."; Rec."Last Addendum Notice No.")
                {
                    ApplicationArea = Basic;
                }
                field("Document Status"; Rec."Document Status")
                {
                    ApplicationArea = Basic;
                }
                field(Status; Rec.Status)
                {
                    ApplicationArea = Suite;
                    Importance = Additional;
                    ToolTip = 'Specifies whether the record is open, waiting to be approved, invoiced for prepayment, or released to the next stage of processing.';
                }
            }
            part(PurchLines; "Bid Response Purchase Lines")
            {
                ApplicationArea = Suite;
                Editable = Rec."Buy-from Vendor No." <> '';
                Enabled = Rec."Buy-from Vendor No." <> '';
                SubPageLink = "Document No." = field("No.");
                UpdatePropagation = Both;
            }
            group("Confidential Business Questionnaire")
            {
                Caption = 'Confidential Business Questionnaire';
                field("Building/House No"; Rec."Building/House No")
                {
                    ApplicationArea = Basic;
                }
                field("Plot No"; Rec."Plot No")
                {
                    ApplicationArea = Basic;
                }
                field(Street; Rec.Street)
                {
                    ApplicationArea = Basic;
                }
                field("Nature of Business"; Rec."Nature of Business")
                {
                    ApplicationArea = Basic;
                }
                field("Current Trade Licence No"; Rec."Current Trade Licence No")
                {
                    ApplicationArea = Basic;
                }
                field("Trade Licence Expiry Date"; Rec."Trade Licence Expiry Date")
                {
                    ApplicationArea = Basic;
                }
                field("Max Value of Business"; Rec."Max Value of Business")
                {
                    ApplicationArea = Basic;
                }
                field("Preferred Bank Account Code"; Rec."Preferred Bank Account Code")
                {
                    ApplicationArea = Basic;
                }
                field("Bankers Name"; Rec."Bankers Name")
                {
                    ApplicationArea = Basic;
                }
                field("Bankers Branch"; Rec."Bankers Branch")
                {
                    ApplicationArea = Basic;
                }
                field("KNTC Agent"; Rec."KNTC Agent")
                {
                    ApplicationArea = Basic;
                }
                field("Business Type"; Rec."Business Type")
                {
                    ApplicationArea = Basic;
                }
                field("Nominal Capital LCY"; Rec."Nominal Capital LCY")
                {
                    ApplicationArea = Basic;
                }
                field("Issued Capital LCY"; Rec."Issued Capital LCY")
                {
                    ApplicationArea = Basic;
                }
            }
            group("Project Terms & Conditions")
            {
                Caption = 'Project Terms & Conditions';
                field("Works Category"; Rec."Works Category")
                {
                    ApplicationArea = Basic;
                }
                field("Planned Commencement Date"; Rec."Planned Commencement Date")
                {
                    ApplicationArea = Basic;
                }
                field("Priority Level"; Rec."Priority Level")
                {
                    ApplicationArea = Basic;
                }
                field("Commitments."; Rec."Commitments.")
                {
                    ApplicationArea = Basic;
                }
                field("Engineer Estimate (LCY)"; Rec."Engineer Estimate (LCY)")
                {
                    ApplicationArea = Basic;
                }
                field("Max Works Kickoff Duration"; Rec."Max Works Kickoff Duration")
                {
                    ApplicationArea = Basic;
                }
                field("Max Works Charter Duration"; Rec."Max Works Charter Duration")
                {
                    ApplicationArea = Basic;
                }
                field("Max Works Completion Duration"; Rec."Max Works Completion Duration")
                {
                    ApplicationArea = Basic;
                }
                field("Payment Terms Code"; Rec."Payment Terms Code")
                {
                    ApplicationArea = Basic;
                }
                field("Defects Liability Period"; Rec."Defects Liability Period")
                {
                    ApplicationArea = Basic;
                }
                field("Daily Liquidated Dam Unit Cost"; Rec."Daily Liquidated Dam Unit Cost")
                {
                    ApplicationArea = Basic;
                }
                field("Liquidated Damages Limit %"; Rec."Liquidated Damages Limit %")
                {
                    ApplicationArea = Basic;
                }
                field("Payment Retention %"; Rec."Payment Retention %")
                {
                    ApplicationArea = Basic;
                }
                field("Retention Amount Limit %"; Rec."Retention Amount Limit %")
                {
                    ApplicationArea = Basic;
                }
                field("Min Interim Certificate Amount"; Rec."Min Interim Certificate Amount")
                {
                    ApplicationArea = Basic;
                }
            }
            group("Sourcing History")
            {
                Caption = 'Sourcing History';
                field("Pre-bid Register No."; Rec."Pre-bid Register No.")
                {
                    ApplicationArea = Basic;
                }
                field("Prebid Conference Date"; Rec."Prebid Conference Date")
                {
                    ApplicationArea = Basic;
                }
                field("Bid Opening Register No."; Rec."Bid Opening Register No.")
                {
                    ApplicationArea = Basic;
                    Caption = 'Bid Opening Register No. (Technical)';
                }
                field("Bid Opening Date"; Rec."Bid Opening Date")
                {
                    ApplicationArea = Basic;
                    Caption = 'Bid Opening Date (Technical)';
                }
                field("Late Bid (Opening Stage)"; Rec."Late Bid (Opening Stage)")
                {
                    ApplicationArea = Basic;
                }
                field("Withdrawn Bid (Opening Stage)"; Rec."Withdrawn Bid (Opening Stage)")
                {
                    ApplicationArea = Basic;
                }
                field("Weighted Tech Score %"; Rec."Weighted Tech Score %")
                {
                    ApplicationArea = Basic;
                }
                field("Read-out Bid Price (A)"; Rec."Read-out Bid Price (A)")
                {
                    ApplicationArea = Basic;
                }
                field("Arithmetic Corrections (B)"; Rec."Arithmetic Corrections (B)")
                {
                    ApplicationArea = Basic;
                }
                field("Corrected Bid Price (C=A+B)"; Rec."Corrected Bid Price (C=A+B)")
                {
                    ApplicationArea = Basic;
                }
                field("Unconditional Discount % (D)"; Rec."Unconditional Discount % (D)")
                {
                    ApplicationArea = Basic;
                }
                field("Unconditional Disc Amount (E)"; Rec."Unconditional Disc Amount (E)")
                {
                    ApplicationArea = Basic;
                }
                field("Corrected & Disc Bid Price"; Rec."Corrected & Disc Bid Price")
                {
                    ApplicationArea = Basic;
                }
                field("Any Additional Adjustments (G)"; Rec."Any Additional Adjustments (G)")
                {
                    ApplicationArea = Basic;
                }
                field("Any Priced Deviations (H))"; Rec."Any Priced Deviations (H))")
                {
                    ApplicationArea = Basic;
                }
                field("Final Evaluated Bid Price"; Rec."Final Evaluated Bid Price")
                {
                    ApplicationArea = Basic;
                }
                field("Final Tender Outcome"; Rec."Final Tender Outcome")
                {
                    ApplicationArea = Basic;
                }
            }
        }
        area(factboxes)
        {
            part("Attached Documents"; "Document Attachment Factbox")
            {
                ApplicationArea = All;
                Caption = 'Attachments';
                SubPageLink = "Table ID" = const(38),
                              "No." = field("No."),
                              "Document Type" = field("Document Type");
            }
            part(Control13; "Pending Approval FactBox")
            {
                ApplicationArea = Suite;
                SubPageLink = "Table ID" = const(38),
                              "Document Type" = field("Document Type"),
                              "Document No." = field("No.");
                Visible = OpenApprovalEntriesExistForCurrUser;
            }
            part(Control1901138007; "Vendor Details FactBox")
            {
                ApplicationArea = Suite;
                SubPageLink = "No." = field("Buy-from Vendor No.");
                Visible = false;
            }
            part(Control1904651607; "Vendor Statistics FactBox")
            {
                ApplicationArea = Suite;
                SubPageLink = "No." = field("Pay-to Vendor No.");
            }
            part(Control1903435607; "Vendor Hist. Buy-from FactBox")
            {
                ApplicationArea = Suite;
                SubPageLink = "No." = field("Buy-from Vendor No.");
            }
            part(Control1906949207; "Vendor Hist. Pay-to FactBox")
            {
                ApplicationArea = Suite;
                SubPageLink = "No." = field("Pay-to Vendor No.");
                Visible = false;
            }
            part(Control5; "Purchase Line FactBox")
            {
                ApplicationArea = Suite;
                Provider = PurchLines;
                SubPageLink = "Document Type" = field("Document Type"),
                              "Document No." = field("Document No."),
                              "Line No." = field("Line No.");
            }
            part(ApprovalFactBox; "Approval FactBox")
            {
                ApplicationArea = Suite;
                Visible = false;
            }
            part(IncomingDocAttachFactBox; "Incoming Doc. Attach. FactBox")
            {
                ApplicationArea = Suite;
                ShowFilter = false;
                Visible = false;
            }
            part(WorkflowStatus; "Workflow Status FactBox")
            {
                ApplicationArea = Suite;
                Editable = false;
                Enabled = false;
                ShowFilter = false;
                Visible = ShowWorkflowStatus;
            }
            systempart(Control1900383207; Links)
            {
                ApplicationArea = RecordLinks;
                Visible = false;
            }
            systempart(Control1905767507; Notes)
            {
                ApplicationArea = Notes;
            }
        }
    }

    actions
    {
        area(navigation)
        {
            group("&Quote")
            {
                Caption = '&Quote';
                Image = Quote;
                action(AttachDocuments)
                {
                    ApplicationArea = Basic;
                    Caption = 'Attach Document';
                    Image = Attach;
                    Promoted = true;
                    PromotedCategory = Process;
                    PromotedIsBig = true;
                    PromotedOnly = true;
                    Visible = true;

                    trigger OnAction()
                    begin
                        ////DMSManagement.UploadDocument(DMSDocuments."document type"::"Imprest Memo", Rec."No.", 'Imprest Memo', Rec.RecordId);
                    end;
                }
                action(Statistics)
                {
                    ApplicationArea = Suite;
                    Caption = 'Statistics';
                    Image = Statistics;
                    Promoted = true;
                    PromotedCategory = Category7;
                    PromotedIsBig = true;
                    ShortCutKey = 'F7';
                    ToolTip = 'View statistical information, such as the value of posted entries, for the record.';

                    trigger OnAction()
                    begin
                        Rec.CalcInvDiscForHeader;
                        Commit;
                        Page.RunModal(Page::"Purchase Statistics", Rec);
                        PurchCalcDiscByType.ResetRecalculateInvoiceDisc(Rec);
                    end;
                }
                action(Vendor)
                {
                    ApplicationArea = Suite;
                    Caption = 'Vendor';
                    Enabled = Rec."Buy-from Vendor No." <> '';
                    Image = Vendor;
                    Promoted = true;
                    PromotedCategory = Category9;
                    RunObject = Page "Vendor Card";
                    RunPageLink = "No." = field("Buy-from Vendor No.");
                    ShortCutKey = 'Shift+F7';
                    ToolTip = 'View or edit detailed information about the vendor on the purchase document.';
                }
                action("Co&mments")
                {
                    ApplicationArea = Comments;
                    Caption = 'Co&mments';
                    Image = ViewComments;
                    Promoted = true;
                    PromotedCategory = Category7;
                    RunObject = Page "Purch. Comment Sheet";
                    RunPageLink = "Document Type" = field("Document Type"),
                                  "No." = field("No."),
                                  "Document Line No." = const(0);
                    ToolTip = 'View or add comments for the record.';
                }
                action(Dimensions)
                {
                    AccessByPermission = TableData Dimension = R;
                    ApplicationArea = Dimensions;
                    Caption = 'Dimensions';
                    Enabled = Rec."No." <> '';
                    Image = Dimensions;
                    Promoted = true;
                    PromotedCategory = Category7;
                    PromotedIsBig = true;
                    ShortCutKey = 'Shift+Ctrl+D';
                    ToolTip = 'View or edit dimensions, such as area, project, or department, that you can assign to sales and purchase documents to distribute costs and analyze transaction history.';

                    trigger OnAction()
                    begin
                        Rec.ShowDocDim;
                        CurrPage.SaveRecord;
                    end;
                }
                action(Approvals)
                {
                    AccessByPermission = TableData "Approval Entry" = R;
                    ApplicationArea = Suite;
                    Caption = 'Approvals';
                    Image = Approvals;
                    Promoted = true;
                    PromotedCategory = Category7;
                    ToolTip = 'View a list of the records that are waiting to be approved. For example, you can see who requested the record to be approved, when it was sent, and when it is due to be approved.';

                    trigger OnAction()
                    var
                        WorkflowsEntriesBuffer: Record "Workflows Entries Buffer";
                    begin
                        //cc// WorkflowsEntriesBuffer.RunWorkflowEntriesPage(Rec.RecordId, Database::"Purchase Header", Rec."Document Type", Rec."No.");
                    end;
                }
                action(DocAttach)
                {
                    ApplicationArea = All;
                    Caption = 'Attachments';
                    Image = Attach;
                    Promoted = true;
                    PromotedCategory = Category7;
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
                action("Owners/Directors")
                {
                    ApplicationArea = Basic;
                    Image = Absence;
                    Promoted = true;
                    PromotedCategory = Category7;
                    RunObject = Page "Bid Business Owner";
                    RunPageLink = No = field("No.");
                }
                action("Preference & Reservation")
                {
                    ApplicationArea = Basic;
                    Image = Reserve;
                    Promoted = true;
                    PromotedCategory = Category8;
                    RunObject = Page "Bid Preference & Reservation";
                    RunPageLink = "Document No." = field("No.");
                }
                action("Litigation History")
                {
                    ApplicationArea = Basic;
                    Image = History;
                    Promoted = true;
                    PromotedCategory = Category7;
                    RunObject = Page "Bid Litigation History";
                    RunPageLink = "No." = field("No.");
                }
                action("Bank Accounts")
                {
                    ApplicationArea = Basic, Suite;
                    Caption = 'Bank Accounts';
                    Image = BankAccount;
                    Promoted = true;
                    PromotedCategory = Category7;
                    RunObject = Page "Bid Vendor Bank Account";
                    RunPageLink = "No." = field("No.");
                    ToolTip = 'View or set up the vendor''s bank accounts. You can set up any number of bank accounts for each vendor.';
                }
                action("Past Experience")
                {
                    ApplicationArea = Basic;
                    Image = Relationship;
                    Promoted = true;
                    PromotedCategory = Category7;
                    RunObject = Page "Bid Past Experience";
                    RunPageLink = "No." = field("No.");
                }
                action("Audited Balance Sheet")
                {
                    ApplicationArea = Basic;
                    Image = Balance;
                    Promoted = true;
                    PromotedCategory = Category7;
                    RunObject = Page "Bid Audited Balance Sheet";
                    RunPageLink = "No." = field("No.");
                }
                action("Audited Income Statement")
                {
                    ApplicationArea = Basic;
                    Image = GLAccountBalance;
                    Promoted = true;
                    PromotedCategory = Category7;
                    RunObject = Page "Bid Audited Income Statement";
                    RunPageLink = "No." = field("No.");
                }
                action("Tender Security")
                {
                    ApplicationArea = Basic;
                    Image = SocialSecurity;
                    Promoted = true;
                    PromotedCategory = Category7;
                    RunObject = Page "Bid_Contract Security Register";
                    RunPageLink = "No." = field("No."),
                                  "IFS No" = field("Invitation For Supply No"),
                                  "Vendor No." = field("Vendor No.");
                }
                action("Proposed Personnel Specification")
                {
                    ApplicationArea = Basic;
                    Image = SalesPerson;
                    Promoted = true;
                    PromotedCategory = Category4;
                    RunObject = Page "Bid Key Staff";
                    RunPageLink = "No." = field("No.");
                }
                action("Personnel Compliance Checklist")
                {
                    ApplicationArea = Basic;
                    Image = CheckList;
                    Promoted = true;
                    PromotedCategory = Category4;
                    RunObject = Page "Bid Personnel Compliance";
                    RunPageLink = "Document No." = field("No.");
                }
                action("Proposed Equipment Specification")
                {
                    ApplicationArea = Basic;
                    Image = MachineCenterLoad;
                    Promoted = true;
                    PromotedCategory = Category4;
                    RunObject = Page "Bid Equipment Specification";
                    RunPageLink = "No." = field("No.");
                }
                action("Equipment Compliance Checklist")
                {
                    ApplicationArea = Basic;
                    Image = CheckList;
                    Promoted = true;
                    PromotedCategory = Category4;
                    RunObject = Page "Bid Equipment Compliance";
                    RunPageLink = "No." = field("No.");
                }
                action("Filed Bid Response Documents")
                {
                    ApplicationArea = Basic;
                    Image = Filed;
                    Promoted = true;
                    PromotedCategory = Category4;
                    RunObject = Page "Bid Filed Document";
                    RunPageLink = "No." = field("No."),
                                  "Vendor No" = field("Vendor No.");
                }
            }
        }
        area(processing)
        {
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
                    ToolTip = 'Reject to approve the incoming document. Note that this is not related to approval workflows.';
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
                    ToolTip = 'Delegate the approval to a substitute approver.';
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
            }
            group(ActionGroup92)
            {
                Caption = 'Print';
                action(Print)
                {
                    ApplicationArea = Suite;
                    Caption = '&Print';
                    Ellipsis = true;
                    Image = Print;
                    Promoted = true;
                    PromotedCategory = Category6;
                    ToolTip = 'Prepare to print the document. A report request window for the document opens where you can specify what to include on the print-out.';

                    trigger OnAction()
                    var
                        LinesInstructionMgt: Codeunit "Lines Instruction Mgt.";
                    begin
                        if ApplicationAreaMgmtFacade.IsFoundationEnabled then
                            LinesInstructionMgt.PurchaseCheckAllLinesHaveQuantityAssigned(Rec);

                        DocPrint.PrintPurchHeader(Rec);
                    end;
                }
                action(Send)
                {
                    ApplicationArea = Basic, Suite;
                    Caption = 'Send';
                    Ellipsis = true;
                    Image = SendToMultiple;
                    Promoted = true;
                    PromotedCategory = Category6;
                    ToolTip = 'Prepare to send the document according to the vendor''s sending profile, such as attached to an email. The Send document to window opens first so you can confirm or select a sending profile.';

                    trigger OnAction()
                    var
                        PurchaseHeader: Record "Purchase Header";
                    begin
                        PurchaseHeader := Rec;
                        CurrPage.SetSelectionFilter(PurchaseHeader);
                        PurchaseHeader.SendRecords;
                    end;
                }
            }
            group(ActionGroup3)
            {
                Caption = 'Release';
                Image = ReleaseDoc;
                separator(Action148)
                {
                }
                action(Release)
                {
                    ApplicationArea = Suite;
                    Caption = 'Re&lease';
                    Image = ReleaseDoc;
                    Promoted = true;
                    PromotedCategory = Category8;
                    PromotedIsBig = true;
                    PromotedOnly = true;
                    ShortCutKey = 'Ctrl+F9';
                    ToolTip = 'Release the document to the next stage of processing. When a document is released, it will be included in all availability calculations from the expected receipt date of the items. You must reopen the document before you can make changes to it.';

                    trigger OnAction()
                    var
                        ReleasePurchDoc: Codeunit "Release Purchase Document";
                    begin
                        ReleasePurchDoc.PerformManualRelease(Rec);
                    end;
                }
                action(Reopen)
                {
                    ApplicationArea = Suite;
                    Caption = 'Re&open';
                    Enabled = Rec.Status <> Rec.Status::Open;
                    Image = ReOpen;
                    Promoted = true;
                    PromotedCategory = Category8;
                    PromotedOnly = true;
                    ToolTip = 'Reopen the document to change it after it has been approved. Approved documents have the Released status and must be opened before they can be changed';

                    trigger OnAction()
                    var
                        ReleasePurchDoc: Codeunit "Release Purchase Document";
                    begin
                        ReleasePurchDoc.PerformManualReopen(Rec);
                    end;
                }
            }
            group("F&unctions")
            {
                Caption = 'F&unctions';
                Image = "Action";
                action(CalculateInvoiceDiscount)
                {
                    AccessByPermission = TableData "Vendor Invoice Disc." = R;
                    ApplicationArea = Suite;
                    Caption = 'Calculate &Invoice Discount';
                    Image = CalculateInvoiceDiscount;
                    ToolTip = 'Calculate the invoice discount for the purchase quote.';

                    trigger OnAction()
                    begin
                        ApproveCalcInvDisc;
                        PurchCalcDiscByType.ResetRecalculateInvoiceDisc(Rec);
                    end;
                }
                separator(Action144)
                {
                }
                action("Get St&d. Vend. Purchase Codes")
                {
                    ApplicationArea = Suite;
                    Caption = 'Get St&d. Vend. Purchase Codes';
                    Ellipsis = true;
                    Image = VendorCode;
                    ToolTip = 'View a list of the standard purchase lines that have been assigned to the vendor to be used for recurring purchases.';

                    trigger OnAction()
                    var
                        StdVendPurchCode: Record "Standard Vendor Purchase Code";
                    begin
                        StdVendPurchCode.InsertPurchLines(Rec);
                    end;
                }
                separator(Action146)
                {
                }
                action(CopyDocument)
                {
                    ApplicationArea = Suite;
                    Caption = 'Copy Document';
                    Ellipsis = true;
                    Enabled = Rec."No." <> '';
                    Image = CopyDocument;
                    Promoted = true;
                    PromotedCategory = Process;
                    ToolTip = 'Copy document lines and header information from another sales document to this document. You can copy a posted sales invoice into a new sales invoice to quickly create a similar document.';

                    trigger OnAction()
                    begin
                        CopyPurchDoc.SetPurchHeader(Rec);
                        CopyPurchDoc.RunModal;
                        Clear(CopyPurchDoc);
                        if Rec.Get(Rec."Document Type", Rec."No.") then;
                    end;
                }
                action("Archive Document")
                {
                    ApplicationArea = Suite;
                    Caption = 'Archi&ve Document';
                    Image = Archive;
                    ToolTip = 'Send the document to the archive, for example because it is too soon to delete it. Later, you delete or reprocess the archived document.';

                    trigger OnAction()
                    begin
                        ArchiveManagement.ArchivePurchDocument(Rec);
                        CurrPage.Update(false);
                    end;
                }
                group(IncomingDocument)
                {
                    Caption = 'Incoming Document';
                    Image = Documents;
                    action(IncomingDocCard)
                    {
                        ApplicationArea = Suite;
                        Caption = 'View Incoming Document';
                        Enabled = HasIncomingDocument;
                        Image = ViewOrder;
                        ToolTip = 'View any incoming document records and file attachments that exist for the entry or document, for example for auditing purposes';

                        trigger OnAction()
                        var
                            IncomingDocument: Record "Incoming Document";
                        begin
                            IncomingDocument.ShowCardFromEntryNo(Rec."Incoming Document Entry No.");
                        end;
                    }
                    action(SelectIncomingDoc)
                    {
                        AccessByPermission = TableData "Incoming Document" = R;
                        ApplicationArea = Suite;
                        Caption = 'Select Incoming Document';
                        Image = SelectLineToApply;
                        ToolTip = 'Select an incoming document record and file attachment that you want to link to the entry or document.';

                        trigger OnAction()
                        var
                            IncomingDocument: Record "Incoming Document";
                        begin
                            Rec.Validate(Rec."Incoming Document Entry No.", IncomingDocument.SelectIncomingDocument(Rec."Incoming Document Entry No.", Rec.RecordId));
                        end;
                    }
                    action(IncomingDocAttachFile)
                    {
                        ApplicationArea = Suite;
                        Caption = 'Create Incoming Document from File';
                        Ellipsis = true;
                        Enabled = (Rec."Incoming Document Entry No." = 0) and (Rec."No." <> '');
                        Image = Attach;
                        ToolTip = 'Create an incoming document from a file that you select from the disk. The file will be attached to the incoming document record.';

                        trigger OnAction()
                        var
                            IncomingDocumentAttachment: Record "Incoming Document Attachment";
                        begin
                            IncomingDocumentAttachment.NewAttachmentFromPurchaseDocument(Rec);
                        end;
                    }
                    action(RemoveIncomingDoc)
                    {
                        ApplicationArea = Suite;
                        Caption = 'Remove Incoming Document';
                        Enabled = HasIncomingDocument;
                        Image = RemoveLine;
                        ToolTip = 'Remove any incoming document records and file attachments.';

                        trigger OnAction()
                        var
                            IncomingDocument: Record "Incoming Document";
                        begin
                            if IncomingDocument.Get(Rec."Incoming Document Entry No.") then
                                IncomingDocument.RemoveLinkToRelatedRecord;
                            Rec."Incoming Document Entry No." := 0;
                            Rec.Modify(true);
                        end;
                    }
                }
            }
            group("Request Approval")
            {
                Caption = 'Request Approval';
                action(SendApprovalRequest)
                {
                    ApplicationArea = Basic, Suite;
                    Caption = 'Send A&pproval Request';
                    Enabled = not OpenApprovalEntriesExist;
                    Image = SendApprovalRequest;
                    Promoted = true;
                    PromotedCategory = Category5;
                    PromotedIsBig = true;
                    ToolTip = 'Request approval of the document.';

                    trigger OnAction()
                    var
                        ApprovalsMgmt: Codeunit "Approvals Mgmt.";
                    begin
                        //cc//if ApprovalsMgmt.CheckPurchaseApprovalPossible(Rec) then
                        //cc//ApprovalsMgmt.OnSendPurchaseDocForApproval(Rec);
                    end;
                }
                action(CancelApprovalRequest)
                {
                    ApplicationArea = Basic, Suite;
                    Caption = 'Cancel Approval Re&quest';
                    Enabled = CanCancelApprovalForRecord;
                    Image = CancelApprovalRequest;
                    Promoted = true;
                    PromotedCategory = Category5;
                    ToolTip = 'Cancel the approval request.';

                    trigger OnAction()
                    var
                        ApprovalsMgmt: Codeunit "Approvals Mgmt.";
                    begin
                        //ApprovalsMgmt.OnCancelPurchaseApprovalRequest(Rec);
                    end;
                }
            }
            group("Make Order")
            {
                Caption = 'Make Order';
                Image = MakeOrder;
                action(MakeOrder)
                {
                    ApplicationArea = Suite;
                    Caption = 'Make &Order';
                    Image = MakeOrder;
                    Promoted = true;
                    PromotedCategory = Process;
                    PromotedIsBig = true;
                    ToolTip = 'Convert the purchase quote to a purchase order.';

                    trigger OnAction()
                    var
                        ApprovalsMgmt: Codeunit "Approvals Mgmt.";
                    begin
                        if ApprovalsMgmt.PrePostApprovalCheckPurch(Rec) then
                            Codeunit.Run(Codeunit::"Purch.-Quote to Order (Yes/No)", Rec);
                    end;
                }
            }
        }
    }

    trigger OnAfterGetCurrRecord()
    begin
        SetControlAppearance;
        CurrPage.IncomingDocAttachFactBox.Page.LoadDataFromRecord(Rec);
        CurrPage.ApprovalFactBox.Page.UpdateApprovalEntriesFromSourceRecord(Rec.RecordId);
        ShowWorkflowStatus := CurrPage.WorkflowStatus.Page.SetFilterOnWorkflowRecord(Rec.RecordId);
    end;

    trigger OnAfterGetRecord()
    begin
        CalculateCurrentShippingAndPayToOption;
    end;

    trigger OnDeleteRecord(): Boolean
    begin
        CurrPage.SaveRecord;
        exit(Rec.ConfirmDeletion);
    end;

    trigger OnInit()
    begin
        ShowShippingOptionsWithLocation := ApplicationAreaMgmtFacade.IsLocationEnabled or ApplicationAreaMgmtFacade.IsAllDisabled;
    end;

    trigger OnNewRecord(BelowxRec: Boolean)
    begin
        Rec."Responsibility Center" := UserMgt.GetPurchasesFilter;

        if (not DocNoVisible) and (Rec."No." = '') then
            Rec.SetBuyFromVendorFromFilter;

        CalculateCurrentShippingAndPayToOption;
    end;

    trigger OnOpenPage()
    begin
        if UserMgt.GetPurchasesFilter <> '' then begin
            Rec.FilterGroup(2);
            Rec.SetRange(Rec."Responsibility Center", UserMgt.GetPurchasesFilter);
            Rec.FilterGroup(0);
        end;

        ActivateFields;

        SetDocNoVisible;
    end;

    var
        CopyPurchDoc: Report "Copy Purchase Document";
        ApplicationAreaMgmtFacade: Codeunit "Application Area Mgmt. Facade";
        DocPrint: Codeunit "Document-Print";
        UserMgt: Codeunit "User Setup Management";
        ArchiveManagement: Codeunit ArchiveManagement;
        PurchCalcDiscByType: Codeunit "Purch - Calc Disc. By Type";
        FormatAddress: Codeunit "Format Address";
        ChangeExchangeRate: Page "Change Exchange Rate";
        ShipToOptions: Option "Default (Company Address)",Location,"Custom Address";
        PayToOptions: Option "Default (Vendor)","Another Vendor";
        HasIncomingDocument: Boolean;
        DocNoVisible: Boolean;
        OpenApprovalEntriesExistForCurrUser: Boolean;
        OpenApprovalEntriesExist: Boolean;
        ShowWorkflowStatus: Boolean;
        CanCancelApprovalForRecord: Boolean;
        ShowShippingOptionsWithLocation: Boolean;
        IsBuyFromCountyVisible: Boolean;
        IsPayToCountyVisible: Boolean;
        IsShipToCountyVisible: Boolean;
        DMSDocuments: Record "DMS Documents";
        DMSManagement: Codeunit "DMS Management";

    local procedure ActivateFields()
    begin
        IsBuyFromCountyVisible := FormatAddress.UseCounty(Rec."Buy-from Country/Region Code");
        IsPayToCountyVisible := FormatAddress.UseCounty(Rec."Pay-to Country/Region Code");
        IsShipToCountyVisible := FormatAddress.UseCounty(Rec."Ship-to Country/Region Code");
    end;

    local procedure ApproveCalcInvDisc()
    begin
        CurrPage.PurchLines.Page.ApproveCalcInvDisc;
    end;

    local procedure SaveInvoiceDiscountAmount()
    var
        DocumentTotals: Codeunit "Document Totals";
    begin
        CurrPage.SaveRecord;
        DocumentTotals.PurchaseRedistributeInvoiceDiscountAmountsOnDocument(Rec);
        CurrPage.Update(false);
    end;

    local procedure PurchaserCodeOnAfterValidate()
    begin
        CurrPage.PurchLines.Page.UpdateForm(true);
    end;

    local procedure ShortcutDimension1CodeOnAfterV()
    begin
        CurrPage.Update;
    end;

    local procedure ShortcutDimension2CodeOnAfterV()
    begin
        CurrPage.Update;
    end;

    local procedure PricesIncludingVATOnAfterValid()
    begin
        CurrPage.Update;
    end;

    local procedure SetDocNoVisible()
    var
        DocumentNoVisibility: Codeunit DocumentNoVisibility;
        DocType: Option Quote,"Order",Invoice,"Credit Memo","Blanket Order","Return Order",Reminder,FinChMemo;
    begin
        DocNoVisible := DocumentNoVisibility.PurchaseDocumentNoIsVisible(Doctype::Quote, Rec."No.");
    end;

    local procedure SetControlAppearance()
    var
        ApprovalsMgmt: Codeunit "Approvals Mgmt.";
    begin
        OpenApprovalEntriesExistForCurrUser := ApprovalsMgmt.HasOpenApprovalEntriesForCurrentUser(Rec.RecordId);
        OpenApprovalEntriesExist := ApprovalsMgmt.HasOpenApprovalEntries(Rec.RecordId);
        CanCancelApprovalForRecord := ApprovalsMgmt.CanCancelApprovalForRecord(Rec.RecordId);
        HasIncomingDocument := Rec."Incoming Document Entry No." <> 0;
    end;

    local procedure ValidateShippingOption()
    begin
        case ShipToOptions of
            Shiptooptions::"Default (Company Address)",
          Shiptooptions::"Custom Address":
                Rec.Validate(Rec."Location Code", '');
            Shiptooptions::Location:
                Rec.Validate(Rec."Location Code");
        end;
    end;

    local procedure CalculateCurrentShippingAndPayToOption()
    begin
        if Rec."Location Code" <> '' then
            ShipToOptions := Shiptooptions::Location
        else
            if Rec.ShipToAddressEqualsCompanyShipToAddress then
                ShipToOptions := Shiptooptions::"Default (Company Address)"
            else
                ShipToOptions := Shiptooptions::"Custom Address";

        if Rec."Pay-to Vendor No." = Rec."Buy-from Vendor No." then
            PayToOptions := Paytooptions::"Default (Vendor)"
        else
            PayToOptions := Paytooptions::"Another Vendor";
    end;
}
