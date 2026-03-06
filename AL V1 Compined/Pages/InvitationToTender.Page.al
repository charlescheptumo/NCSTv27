#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Page 75078 "Invitation To Tender"
{
    Editable = true;
    PageType = Document;
    PromotedActionCategories = 'New,Process,Report,Approve,Release,Posting,Prepare,Order,Request Approval,Print/Send,Navigate';
    SourceTable = "Standard Purchase Code";
    ApplicationArea = All;

    layout
    {
        area(content)
        {
            group(General)
            {
                field("Code"; Rec.Code)
                {
                    ApplicationArea = Basic;
                    Importance = Promoted;
                }
                field("Invitation Notice Type"; Rec."Invitation Notice Type")
                {
                    ApplicationArea = Basic;
                    Importance = Promoted;
                }
                field("Document Date"; Rec."Document Date")
                {
                    ApplicationArea = Basic;
                    Importance = Promoted;
                }
                field("Tender Name"; Rec."Tender Name")
                {
                    ApplicationArea = Basic;
                }
                field("Tender Summary"; Rec."Tender Summary")
                {
                    ApplicationArea = Basic;
                }
                field("External Document No"; Rec."External Document No")
                {
                    ApplicationArea = Basic;
                    Importance = Promoted;
                }
                field("Stage 1 EOI Invitation"; Rec."Stage 1 EOI Invitation")
                {
                    ApplicationArea = Basic;
                    Importance = Promoted;
                    Visible = false;
                }
                field("PRN No."; Rec."PRN No.")
                {
                    ApplicationArea = Basic;
                    Importance = Promoted;
                    Visible = false;
                }
                field("Responsibility Center"; Rec."Responsibility Center")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Location Code"; Rec."Location Code")
                {
                    ApplicationArea = Basic;
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field("Procurement Type"; Rec."Procurement Type")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Requisition Product Group"; Rec."Requisition Product Group")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Procurement Category ID"; Rec."Procurement Category ID")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Lot No."; Rec."Lot No.")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field("Target Bidder Group"; Rec."Target Bidder Group")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Solicitation Type"; Rec."Solicitation Type")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Bid Selection Method"; Rec."Bid Selection Method")
                {
                    ApplicationArea = Basic;
                }
                field("Requisition Template ID"; Rec."Requisition Template ID")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field("Bid Scoring Template"; Rec."Bid Scoring Template")
                {
                    ApplicationArea = Basic;
                    Caption = 'Evaluation Criteria';
                }
                field("Bid Opening Committe"; Rec."Bid Opening Committe")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field("Bid Evaluation Committe"; Rec."Bid Evaluation Committe")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field("Procurement Method"; Rec."Procurement Method")
                {
                    ApplicationArea = Basic;
                }
                field("Enforce Mandatory Pre-bid Visi"; Rec."Enforce Mandatory Pre-bid Visi")
                {
                    ApplicationArea = Basic;
                }
                field("Mandatory Pre-bid Visit Date"; Rec."Mandatory Pre-bid Visit Date")
                {
                    ApplicationArea = Basic;
                }
                field("Prebid Meeting Address"; Rec."Prebid Meeting Address")
                {
                    ApplicationArea = Basic;
                }
                field("Prebid Meeting Register ID"; Rec."Prebid Meeting Register ID")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field("Bid Envelop Type"; Rec."Bid Envelop Type")
                {
                    ApplicationArea = Basic;
                }
                field("Sealed Bids"; Rec."Sealed Bids")
                {
                    ApplicationArea = Basic;
                }
                field("Tender Validity Duration"; Rec."Tender Validity Duration")
                {
                    ApplicationArea = Basic;
                }
                field("Tender Validity Expiry Date"; Rec."Tender Validity Expiry Date")
                {
                    ApplicationArea = Basic;
                }
                field("Purchaser Code"; Rec."Purchaser Code")
                {
                    ApplicationArea = Basic;
                    Caption = 'Procurement Officer';
                }
                field("Language Code"; Rec."Language Code")
                {
                    ApplicationArea = Basic;
                }
                field("Mandatory Special Group Reserv"; Rec."Mandatory Special Group Reserv")
                {
                    ApplicationArea = Basic;
                }
                field("Bid/Tender Security Required"; Rec."Bid/Tender Security Required")
                {
                    ApplicationArea = Basic;
                    Importance = Additional;
                }
                field("Bid Security %"; Rec."Bid Security %")
                {
                    ApplicationArea = Basic;
                    Importance = Additional;
                }
                field("Bid Security Amount (LCY)"; Rec."Bid Security Amount (LCY)")
                {
                    ApplicationArea = Basic;
                    Importance = Additional;
                    Visible = false;
                }
                field("Bid Security Validity Duration"; Rec."Bid Security Validity Duration")
                {
                    ApplicationArea = Basic;
                    Importance = Additional;
                }
                field("Bid Security Expiry Date"; Rec."Bid Security Expiry Date")
                {
                    ApplicationArea = Basic;
                    Importance = Additional;
                }
                field("Insurance Cover Required"; Rec."Insurance Cover Required")
                {
                    ApplicationArea = Basic;
                    Importance = Additional;
                }
                field("Performance Security Required"; Rec."Performance Security Required")
                {
                    ApplicationArea = Basic;
                    Importance = Additional;
                }
                field("Performance Security %"; Rec."Performance Security %")
                {
                    ApplicationArea = Basic;
                    Importance = Additional;
                }
                field("Advance Payment Security Req"; Rec."Advance Payment Security Req")
                {
                    ApplicationArea = Basic;
                    Importance = Additional;
                }
                field("Advance Payment Security %"; Rec."Advance Payment Security %")
                {
                    ApplicationArea = Basic;
                    Importance = Additional;
                }
                field("Advance Amount Limit %"; Rec."Advance Amount Limit %")
                {
                    ApplicationArea = Basic;
                    Importance = Additional;
                }
                field("Appointer of Bid Arbitrator"; Rec."Appointer of Bid Arbitrator")
                {
                    ApplicationArea = Basic;
                    Importance = Additional;
                }
                field(Status; Rec.Status)
                {
                    ApplicationArea = Basic;
                    Importance = Additional;
                }
                field("Bid Submission Method"; Rec."Bid Submission Method")
                {
                    ApplicationArea = Basic;
                    Importance = Additional;
                }
                field("Cancel Reason Code"; Rec."Cancel Reason Code")
                {
                    ApplicationArea = Basic;
                    Importance = Additional;
                }
                field("Cancellation Date"; Rec."Cancellation Date")
                {
                    ApplicationArea = Basic;
                }
                field("Cancellation Secret Code"; Rec."Cancellation Secret Code")
                {
                    ApplicationArea = Basic;
                }
                field("No. of Submission"; Rec."No. of Submission")
                {
                    ApplicationArea = Basic;
                    Importance = Additional;
                    Visible = false;
                }
                field("Created Date/Time"; Rec."Created Date/Time")
                {
                    ApplicationArea = Basic;
                    Importance = Additional;
                }
                field("Created by"; Rec."Created by")
                {
                    ApplicationArea = Basic;
                    Importance = Additional;
                }
            }
            group("Submission Details")
            {
                field("Submission Start Date"; Rec."Submission Start Date")
                {
                    ApplicationArea = Basic;
                }
                field("Submission Start Time"; Rec."Submission Start Time")
                {
                    ApplicationArea = Basic;
                }
                field("Submission End Date"; Rec."Submission End Date")
                {
                    ApplicationArea = Basic;
                }
                field("Submission End Time"; Rec."Submission End Time")
                {
                    ApplicationArea = Basic;
                }
                field("Bid Opening Date"; Rec."Bid Opening Date")
                {
                    ApplicationArea = Basic;
                }
                field("Bid Opening Time"; Rec."Bid Opening Time")
                {
                    ApplicationArea = Basic;
                }
                field("Bid Opening Venue"; Rec."Bid Opening Venue")
                {
                    ApplicationArea = Basic;
                }
                field("Procuring Entity Name/Contact"; Rec."Procuring Entity Name/Contact")
                {
                    ApplicationArea = Basic;
                }
                field(Address; Rec.Address)
                {
                    ApplicationArea = Basic;
                }
                field("Address 2"; Rec."Address 2")
                {
                    ApplicationArea = Basic;
                }
                field("Post Code"; Rec."Post Code")
                {
                    ApplicationArea = Basic;
                }
                field(City; Rec.City)
                {
                    ApplicationArea = Basic;
                }
                field("Country/Region Code"; Rec."Country/Region Code")
                {
                    ApplicationArea = Basic;
                }
                field("Phone No."; Rec."Phone No.")
                {
                    ApplicationArea = Basic;
                }
                field("E-Mail"; Rec."E-Mail")
                {
                    ApplicationArea = Basic;
                }
                field("Tender Box Location Code"; Rec."Tender Box Location Code")
                {
                    ApplicationArea = Basic;
                }
                field("Primary Tender Submission"; Rec."Primary Tender Submission")
                {
                    ApplicationArea = Basic;
                }
                field("Primary Engineer Contact"; Rec."Primary Engineer Contact")
                {
                    ApplicationArea = Basic;
                }
            }
            group("Bid Processing Fee")
            {
                field("Bid Charge Code"; Rec."Bid Charge Code")
                {
                    ApplicationArea = Basic;
                }
                field("Bid Charge (LCY)"; Rec."Bid Charge (LCY)")
                {
                    ApplicationArea = Basic;
                }
                field("Bid Charge Bank Code"; Rec."Bid Charge Bank Code")
                {
                    ApplicationArea = Basic;
                }
                field("Bank Name"; Rec."Bank Name")
                {
                    ApplicationArea = Basic;
                }
                field("Bank Account Name"; Rec."Bank Account Name")
                {
                    ApplicationArea = Basic;
                }
                field("Bid Charge Bank Branch"; Rec."Bid Charge Bank Branch")
                {
                    ApplicationArea = Basic;
                }
                field("Bid Charge Bank A/C No"; Rec."Bid Charge Bank A/C No")
                {
                    ApplicationArea = Basic;
                }
            }
            group("Budget Control Checks")
            {
                field("Requesting Region"; Rec."Requesting Region")
                {
                    ApplicationArea = Basic;
                }
                field("Requesting Directorate"; Rec."Requesting Directorate")
                {
                    ApplicationArea = Basic;
                }
                field("Requesting Department"; Rec."Requesting Department")
                {
                    ApplicationArea = Basic;
                }
                field("Procurement Plan ID"; Rec."Procurement Plan ID")
                {
                    ApplicationArea = Basic;
                }
                field("Procurement Plan Entry No"; Rec."Procurement Plan Entry No")
                {
                    ApplicationArea = Basic;
                }
                field(Job; Rec.Job)
                {
                    ApplicationArea = Basic;
                    Caption = 'PP Job No.';
                }
                field("Job Task No."; Rec."Job Task No.")
                {
                    ApplicationArea = Basic;
                    Caption = 'PP Job Task No.';
                }
                field("PP Planning Category"; Rec."PP Planning Category")
                {
                    ApplicationArea = Basic;
                }
                field("PP Funding Source ID"; Rec."PP Funding Source ID")
                {
                    ApplicationArea = Basic;
                }
                field("PP Total Budget"; Rec."PP Total Budget")
                {
                    ApplicationArea = Basic;
                }
                field("PP Total Actual Costs"; Rec."PP Total Actual Costs")
                {
                    ApplicationArea = Basic;
                }
                field("PP Total Commitments"; Rec."PP Total Commitments")
                {
                    ApplicationArea = Basic;
                }
                field("PP Total Available Budget"; Rec."PP Total Available Budget")
                {
                    ApplicationArea = Basic;
                }
                field("PP Preference/Reservation Code"; Rec."PP Preference/Reservation Code")
                {
                    ApplicationArea = Basic;
                }
                field("Financial Year Code"; Rec."Financial Year Code")
                {
                    ApplicationArea = Basic;
                }
            }
            group("Project Details")
            {
                field("Project ID"; Rec."Project ID")
                {
                    ApplicationArea = Basic;
                }
                field("Works Category"; Rec."Works Category")
                {
                    ApplicationArea = Basic;
                }
                field("Road Code"; Rec."Road Code")
                {
                    ApplicationArea = Basic;
                }
                field("Road Link Name"; Rec."Road Link Name")
                {
                    ApplicationArea = Basic;
                }
                field("Constituency ID"; Rec."Constituency ID")
                {
                    ApplicationArea = Basic;
                }
                field("Publish Engineers Estimate"; Rec."Publish Engineers Estimate")
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
        }
        area(factboxes)
        {
            part(Control116; "Approval FactBox")
            {
                SubPageLink = "Table ID" = filter(173),
                              "Document No." = field(Code);
                Visible = true;
            }
            part(WorkflowStatus; "Workflow Status FactBox")
            {
                Editable = false;
                Enabled = false;
                ShowFilter = false;
                Visible = ShowWorkflowStatus;
            }
            systempart(Control113; Links)
            {
                Visible = false;
            }
            systempart(Control112; Notes)
            {
                Visible = true;
            }
            systempart(Control108; Outlook)
            {
            }
            systempart(Control109; Notes)
            {
            }
            systempart(Control110; MyNotes)
            {
            }
            systempart(Control111; Links)
            {
            }
        }
    }

    actions
    {
        area(navigation)
        {
            group(IFP)
            {
                Caption = 'IFP';
                Image = "Order";
                action(Dimensions)
                {
                    AccessByPermission = TableData Dimension = R;
                    ApplicationArea = Dimensions;
                    Caption = 'Dimensions';
                    Enabled = Rec."Code" <> '';
                    Image = Dimensions;
                    Promoted = true;
                    PromotedCategory = Category8;
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
                    PromotedCategory = Category8;
                    ToolTip = 'View a list of the records that are waiting to be approved. For example, you can see who requested the record to be approved, when it was sent, and when it is due to be approved.';

                    trigger OnAction()
                    var
                        WorkflowsEntriesBuffer: Record "Workflows Entries Buffer";
                    begin
                        ApprovalsMgmt.OpenApprovalEntriesPage(Rec.RecordId);
                    end;
                }
                action("Co&mments")
                {
                    ApplicationArea = Comments;
                    Caption = 'Co&mments';
                    Image = ViewComments;
                    Promoted = true;
                    PromotedCategory = Category8;
                    RunObject = Page "Purch. Comment Sheet";
                    RunPageLink = "No." = field(Code);
                    ToolTip = 'View or add comments for the record.';
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
                        RecRef.GetTable(Rec);
                        DocumentAttachmentDetails.OpenForRecRef(RecRef);
                        DocumentAttachmentDetails.RunModal;
                    end;
                }
                action(Print)
                {
                    ApplicationArea = Basic;
                    Image = Print;
                    Promoted = true;
                    PromotedCategory = "Report";
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
            }
            group(ActionGroup135)
            {
                Caption = 'Release';
                Image = ReleaseDoc;
                action(Release)
                {
                    ApplicationArea = Suite;
                    Caption = 'Re&lease';
                    Enabled = Rec.Status = Rec.Status::open;
                    Image = ReleaseDoc;
                    Promoted = true;
                    PromotedCategory = Category5;
                    PromotedIsBig = true;
                    PromotedOnly = true;
                    ShortCutKey = 'Ctrl+F9';
                    ToolTip = 'Release the document to the next stage of processing. When a document is released, it will be included in all availability calculations from the expected receipt date of the items. You must reopen the document before you can make changes to it.';

                    trigger OnAction()
                    var
                        ReleasePurchDoc: Codeunit "Release Approval Document";
                    begin
                        ReleasePurchDoc.ReleaseITT(Rec);
                    end;
                }
                action(Reopen)
                {
                    ApplicationArea = Suite;
                    Caption = 'Re&open';
                    Enabled = Rec.Status <> Rec.Status::Open;
                    Image = ReOpen;
                    Promoted = true;
                    PromotedCategory = Category5;
                    PromotedOnly = true;
                    ToolTip = 'Reopen the document to change it after it has been approved. Approved documents have the Released status and must be opened before they can be changed';

                    trigger OnAction()
                    var
                        ReleasePurchDoc: Codeunit "Release Approval Document";
                    begin
                        ReleasePurchDoc.ReopenITT(Rec);
                    end;
                }
            }
            group("F&unctions")
            {
                Caption = 'F&unctions';
                Image = "Action";
                action(CopyDocument)
                {
                    ApplicationArea = Suite;
                    Caption = 'Copy PRN Details';
                    Ellipsis = true;
                    Enabled = Rec."code" <> '';
                    Image = CopyDocument;
                    Promoted = true;
                    PromotedCategory = Process;
                    ToolTip = 'Copy document lines and header information from another purchase document to this document. You can copy a posted purchase invoice into a new purchase invoice to quickly create a similar document.';

                    trigger OnAction()
                    begin
                        /*CopyPurchDoc.SetPurchHeader(Rec);
                        CopyPurchDoc.RUNMODAL;
                        CLEAR(CopyPurchDoc);
                        IF GET("Document Type","No.") THEN;*/
                        PRN.Reset;
                        PRN.SetRange("No.", Rec."PRN No.");
                        if PRN.FindSet then
                            Procurement.CopyPRNDetails(PRN, Rec);

                    end;
                }
                action("Purchase Lines")
                {
                    ApplicationArea = Suite;
                    Caption = 'Purchase Lines';
                    Ellipsis = true;
                    Enabled = Rec."Code" <> '';
                    Image = PutawayLines;
                    Promoted = true;
                    PromotedCategory = Process;
                    RunObject = Page "IFS Purchase Lines";
                    RunPageLink = "Standard Purchase Code" = field(Code);

                    trigger OnAction()
                    begin
                        /*CopyPurchDoc.SetPurchHeader(Rec);
                        CopyPurchDoc.RUNMODAL;
                        CLEAR(CopyPurchDoc);
                        IF GET("Document Type","No.") THEN;*/
                        //Procurement.SuggestProcurementCategories(Rec);

                    end;
                }
                action("Suggest Required Documents")
                {
                    ApplicationArea = Suite;
                    Caption = 'Suggest Required Documents';
                    Ellipsis = true;
                    Enabled = Rec."Code" <> '';
                    Image = Suggest;
                    Promoted = true;
                    PromotedCategory = Process;
                    ToolTip = 'Copy document lines and header information from another purchase document to this document. You can copy a posted purchase invoice into a new purchase invoice to quickly create a similar document.';

                    trigger OnAction()
                    begin
                        /*CopyPurchDoc.SetPurchHeader(Rec);
                        CopyPurchDoc.RUNMODAL;
                        CLEAR(CopyPurchDoc);
                        IF GET("Document Type","No.") THEN;*/
                        Procurement.SuggestRequiredDocITT(Rec);

                    end;
                }
                action("Suggest Tender Documents")
                {
                    ApplicationArea = Suite;
                    Caption = 'Suggest Tender Documents';
                    Ellipsis = true;
                    Enabled = Rec."Code" <> '';
                    Image = Suggest;
                    Promoted = true;
                    PromotedCategory = Process;
                    ToolTip = 'Copy document lines and header information from another purchase document to this document. You can copy a posted purchase invoice into a new purchase invoice to quickly create a similar document.';

                    trigger OnAction()
                    begin
                        /*CopyPurchDoc.SetPurchHeader(Rec);
                        CopyPurchDoc.RUNMODAL;
                        CLEAR(CopyPurchDoc);
                        IF GET("Document Type","No.") THEN;*/
                        Procurement.SuggestTenderSourceDoc(Rec);

                    end;
                }
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
                        ////DMSManagement.UploadDocument(DMSDocuments."document type"::"Imprest Memo", Rec.Code, 'Imprest Memo', Rec.RecordId);
                    end;
                }
                action("Publish Invitations")
                {
                    ApplicationArea = Basic;
                    Enabled = Rec.Published = false;
                    Image = PrintCover;
                    Promoted = true;
                    PromotedCategory = Category5;
                    Visible = Rec.status = Rec.status::Released;

                    trigger OnAction()
                    begin
                        Procurement.PublishITT(Rec);
                    end;
                }
                action("Intention To Bid")
                {
                    ApplicationArea = Basic;
                    Image = Interaction;
                    Promoted = true;
                    PromotedCategory = Category4;
                    RunObject = Page "IFS Intention To Bid";
                    RunPageLink = Code = field(Code);
                }
                action("Activate Evaluations")
                {
                    ApplicationArea = Basic;
                    Enabled = Rec.Published = true;
                    Image = ActivateDiscounts;
                    Promoted = true;
                    PromotedCategory = Category5;
                    Visible = Rec.status = Rec.status::Released;

                    trigger OnAction()
                    begin
                        //Procurement.ActivateEvaluationsIFP(Rec);
                    end;
                }
                action("Close IFP")
                {
                    ApplicationArea = Suite;
                    Caption = 'Close IFP';
                    Enabled = Rec."code" <> '';
                    Image = Close;
                    Promoted = true;
                    PromotedCategory = Category5;
                    Visible = Rec.status = Rec.status::Released;

                    trigger OnAction()
                    begin
                        //Procurement.CloseIFP(Rec);
                    end;
                }
                action("Cancel Invitation")
                {
                    ApplicationArea = Suite;
                    Image = CancelAllLines;
                    Promoted = true;
                    PromotedCategory = Category5;
                    Visible = Rec.status = Rec.status::Released;

                    trigger OnAction()
                    begin
                        Procurement.CancelIFSInvitation(Rec);
                    end;
                }
                action("IFP Response")
                {
                    ApplicationArea = Basic;
                    Caption = 'IFP Response';
                    Image = ReturnRelated;
                    Promoted = true;
                    PromotedCategory = Category4;
                    PromotedIsBig = true;
                    RunObject = Page "RFI Response List";
                    RunPageLink = "RFI Document No." = field(Code);
                    Visible = false;
                }
                action("IFP Evaluations")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                action("Required Documents")
                {
                    ApplicationArea = Basic;
                    Image = Filed;
                    Promoted = true;
                    PromotedCategory = Category4;
                    RunObject = Page "IFS Required Document";
                    RunPageLink = "Document No" = field(Code);
                }
                action("Create Addendum Notice")
                {
                    ApplicationArea = Suite;
                    Caption = 'Create Addendum Notice';
                    Ellipsis = true;
                    Enabled = Rec."code" <> '';
                    Image = CreateForm;
                    Promoted = true;
                    PromotedCategory = Process;
                    ToolTip = 'Copy document lines and header information from another purchase document to this document. You can copy a posted purchase invoice into a new purchase invoice to quickly create a similar document.';

                    trigger OnAction()
                    begin
                        Procurement.CreateAddendumNoticeITT(Rec);
                    end;
                }
                action(Send)
                {
                    ApplicationArea = Basic;
                    Image = SendMail;
                    Promoted = true;
                    PromotedCategory = Category4;
                }
                action("Tender Securities")
                {
                    ApplicationArea = Basic;
                    Image = SocialSecurity;
                    Promoted = true;
                    PromotedCategory = Category4;
                    RunObject = Page "IFS Securities";
                    RunPageLink = "IFS Code" = field(Code);
                }
                action("Tender Document Sources")
                {
                    ApplicationArea = Basic;
                    Image = SourceDocLine;
                    Promoted = true;
                    PromotedCategory = Category4;
                    RunObject = Page "IFS Tender Document Source";
                    RunPageLink = "Document No." = field(Code);
                }
            }
            group("Request Approval")
            {
                Caption = 'Request Approval';
                action(SendApprovalRequest)
                {
                    ApplicationArea = Basic, Suite;
                    Caption = 'Send A&pproval Request';
                    Image = SendApprovalRequest;
                    Promoted = true;
                    PromotedCategory = Category9;
                    PromotedIsBig = true;
                    ToolTip = 'Request approval of the document.';

                    trigger OnAction()
                    var
                        ApprovalsMgmt: Codeunit "Approvals Mgmt.";
                    begin
                        //cc//if ApprovalsMgmt.CheckIFSApprovalPossible(Rec) then
                        //cc//ApprovalsMgmt.OnSendIFSForApproval(Rec);

                    end;
                }
                action(CancelApprovalRequest)
                {
                    ApplicationArea = Basic, Suite;
                    Caption = 'Cancel Approval Re&quest';
                    Image = CancelApprovalRequest;
                    Promoted = true;
                    PromotedCategory = Category9;
                    ToolTip = 'Cancel the approval request.';

                    trigger OnAction()
                    var
                        ApprovalsMgmt: Codeunit "Approvals Mgmt.";
                        WorkflowWebhookMgt: Codeunit "Workflow Webhook Management";
                    begin
                        //ApprovalsMgmt.OnCancelIFSApprovalRequest(Rec);
                        WorkflowWebhookMgt.FindAndCancel(Rec.RecordId);
                    end;
                }
                action("Activity Schedules")
                {
                    ApplicationArea = Basic;
                    Image = ElectronicRegister;
                    Promoted = true;
                    PromotedCategory = Category8;
                    PromotedIsBig = true;
                    RunObject = Page "IFS Purchase Activity Schedule";
                    RunPageLink = "Document No" = field(Code);
                }
                action("Preference and Reservations")
                {
                    ApplicationArea = Basic;
                    Image = Reserve;
                    Promoted = true;
                    PromotedCategory = Category4;
                    RunObject = Page "IFS Restricted Vendor Category";
                    RunPageLink = "Document No" = field(Code);
                }
                action("Addendum Notices")
                {
                    ApplicationArea = Basic;
                    Image = Change;
                    Promoted = true;
                    PromotedCategory = Category4;
                    RunObject = Page "Tender Addendum Notice";
                    RunPageLink = "Invitation Notice No." = field(Code);
                }
                action("Appointed Committees")
                {
                    ApplicationArea = Basic;
                    Image = Agreement;
                    Promoted = true;
                    PromotedCategory = Category4;
                    RunObject = Page "IFS Tender Committee";
                    RunPageLink = "IFS Code" = field(Code);
                }
                action("Personnel Specifications")
                {
                    ApplicationArea = Basic;
                    Image = PlanningWorksheet;
                    Promoted = true;
                    PromotedCategory = Category4;
                    RunObject = Page "IFS Key Staff";
                    RunPageLink = "IFS Code" = field(Code);
                }
                action("Equipment Specifications")
                {
                    ApplicationArea = Basic;
                    Image = LiFo;
                    Promoted = true;
                    PromotedCategory = Category4;
                    RunObject = Page "IFS Required Equipment";
                    RunPageLink = "Document No" = field(Code);
                }
                action("Major Deliverables")
                {
                    ApplicationArea = Basic;
                    Image = Delivery;
                    Promoted = true;
                    PromotedCategory = Category4;
                    RunObject = Page "IFS Major Work_Deliverable";
                    RunPageLink = "Document No" = field(Code);
                }
                action("Related Invitation Notices")
                {
                    ApplicationArea = Basic;
                    Image = WorkCenter;
                    Promoted = true;
                    PromotedCategory = Category4;
                    RunObject = Page "Draft Invitation For Supply";
                    RunPageLink = "Parent Invitation No" = field(Code);
                }
            }
        }
    }

    var
        OpenApprovalEntriesExistCurrUser: Boolean;
        OpenApprovalEntriesExist: Boolean;
        OpenApprovalEntriesExistForCurrUser: Boolean;
        CanCancelApprovalForRecord: Boolean;
        CanRequestApprovalForFlow: Boolean;
        CanCancelApprovalForFlow: Boolean;
        Procurement: Codeunit "Procurement Processing";
        ShowWorkflowStatus: Boolean;
        ApprovalsMgmt: Codeunit "Approvals Mgmt.";
        PRN: Record "Purchase Header";
        DMSDocuments: Record "DMS Documents";
        DMSManagement: Codeunit "DMS Management";

    local procedure SetControlAppearance()
    var
        ApprovalsMgmt: Codeunit "Approvals Mgmt.";
        WorkflowWebhookMgt: Codeunit "Workflow Webhook Management";
    begin



        OpenApprovalEntriesExistForCurrUser := ApprovalsMgmt.HasOpenApprovalEntriesForCurrentUser(Rec.RecordId);
        OpenApprovalEntriesExist := ApprovalsMgmt.HasOpenApprovalEntries(Rec.RecordId);
        CanCancelApprovalForRecord := ApprovalsMgmt.CanCancelApprovalForRecord(Rec.RecordId);

        WorkflowWebhookMgt.GetCanRequestAndCanCancel(Rec.RecordId, CanRequestApprovalForFlow, CanCancelApprovalForFlow);
    end;
}
