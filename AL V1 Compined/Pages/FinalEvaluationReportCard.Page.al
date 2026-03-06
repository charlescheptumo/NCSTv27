#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Page 75275 "Final Evaluation Report Card"
{
    PageType = Card;
    SourceTable = "Bid Tabulation Header";
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
                }
                field("Document Date"; Rec."Document Date")
                {
                    ApplicationArea = Basic;
                }
                field("Financial Evaluation ID"; Rec."Financial Evaluation ID")
                {
                    ApplicationArea = Basic;
                }
                field("IFS Code"; Rec."IFS Code")
                {
                    ApplicationArea = Basic;
                }
                field("Tender Name"; Rec."Tender Name")
                {
                    ApplicationArea = Basic;
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = Basic;
                }
                field("Raised By"; Rec."Raised By")
                {
                    ApplicationArea = Basic;
                }
                field(Name; Rec.Name)
                {
                    ApplicationArea = Basic;
                }
                field("Procurement Officer License No"; Rec."Procurement Officer License No")
                {
                    ApplicationArea = Basic;
                }
                field("General Procurement Remarks"; Rec."General Procurement Remarks")
                {
                    ApplicationArea = Basic;
                }
                field("Tender Committee Role"; Rec."Tender Committee Role")
                {
                    ApplicationArea = Basic;
                }
                field("Designation/Title"; Rec."Designation/Title")
                {
                    ApplicationArea = Basic;
                }
                field("Primary Region"; Rec."Primary Region")
                {
                    ApplicationArea = Basic;
                }
                field("Bid Opening Date"; Rec."Bid Opening Date")
                {
                    ApplicationArea = Basic;
                }
                field("Evaluation Completion Date"; Rec."Evaluation Completion Date")
                {
                    ApplicationArea = Basic;
                }
                field("Appointed Bid Opening Comm"; Rec."Appointed Bid Opening Comm")
                {
                    ApplicationArea = Basic;
                }
                field("Appointed Bid Evaluation Com"; Rec."Appointed Bid Evaluation Com")
                {
                    ApplicationArea = Basic;
                }
                group("Key Statistics")
                {
                    Caption = 'Key Statistics';
                    field("No of submitted bids"; Rec."No of submitted bids")
                    {
                        ApplicationArea = Basic;
                    }
                    field("No of Opened Bids(Tech)"; Rec."No of Opened Bids(Tech)")
                    {
                        ApplicationArea = Basic;
                    }
                    field("No of Opened Bids(Finance)"; Rec."No of Opened Bids(Finance)")
                    {
                        ApplicationArea = Basic;
                    }
                    field("No of Responsive(Tech)"; Rec."No of Responsive(Tech)")
                    {
                        ApplicationArea = Basic;
                    }
                    field("No of non- Responsive(Tech)"; Rec."No of non- Responsive(Tech)")
                    {
                        ApplicationArea = Basic;
                    }
                    field("No of Responsive(Finance)"; Rec."No of Responsive(Finance)")
                    {
                        ApplicationArea = Basic;
                    }
                    field("No of non- Responsive(Finance)"; Rec."No of non- Responsive(Finance)")
                    {
                        ApplicationArea = Basic;
                    }
                }
                field("Approval Status"; Rec."Approval Status")
                {
                    ApplicationArea = Basic;
                }
                field("Document Status"; Rec."Document Status")
                {
                    ApplicationArea = Basic;
                }
            }
            part(Control20; "Final Evaluation Report Line")
            {
                SubPageLink = "Tabulation ID" = field(Code);
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
                    Enabled = Rec."code" <> '';
                    Image = Dimensions;
                    Promoted = true;
                    PromotedCategory = Category8;
                    PromotedIsBig = true;
                    ShortCutKey = 'Shift+Ctrl+D';
                    ToolTip = 'View or edit dimensions, such as area, project, or department, that you can assign to sales and purchase documents to distribute costs and analyze transaction history.';

                    trigger OnAction()
                    begin
                        //ShowDocDim;
                        //CurrPage.SAVERECORD;
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
                action(Print)
                {
                    ApplicationArea = Basic;
                    Image = PrintAttachment;
                    Promoted = true;
                    PromotedCategory = "Report";

                    trigger OnAction()
                    begin
                        Rec.Reset;
                        Rec.SetRange(Rec.Code, Rec.Code);
                        Report.Run(70043, true, true, Rec);
                    end;
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
            group(ActionGroup30)
            {
                Caption = 'Release';
                Image = ReleaseDoc;
                action(Release)
                {
                    ApplicationArea = Suite;
                    Caption = 'Re&lease';
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
                        //ReleasePurchDoc.ReleaseVendDebarment(Rec);
                        //Procurement.ReleaseSupplierRatingTemplate(Rec)
                    end;
                }
                action(Reopen)
                {
                    ApplicationArea = Suite;
                    Caption = 'Re&open';
                    Image = ReOpen;
                    Promoted = true;
                    PromotedCategory = Category5;
                    PromotedOnly = true;
                    ToolTip = 'Reopen the document to change it after it has been approved. Approved documents have the Released status and must be opened before they can be changed';

                    trigger OnAction()
                    var
                        ReleasePurchDoc: Codeunit "Release Approval Document";
                    begin
                        //ReleasePurchDoc.ReopenVendDebarment(Rec);
                        /*IF Released=FALSE THEN
                          ERROR('Document must be Released');
                        Released:=FALSE;
                        MODIFY;
                        MESSAGE('Supplier Rating Template %1 has been opened successfuly',Code);*/

                    end;
                }
            }
            group("F&unctions")
            {
                Caption = 'F&unctions';
                Image = "Action";
                Visible = false;
                action("Opening Committee Members")
                {
                    ApplicationArea = Basic;
                    Image = TeamSales;
                    Promoted = true;
                    PromotedCategory = Category4;
                    RunObject = Page "Bid Evaluation Committee";
                    RunPageLink = "Document No." = field(Code),
                                  Type = const("Bid Opening");
                }
                action("Evaluation Committee Members")
                {
                    ApplicationArea = Basic;
                    Image = TeamSales;
                    Promoted = true;
                    PromotedCategory = Category4;
                    RunObject = Page "Bid Evaluation Committee";
                    RunPageLink = "Document No." = field(Code),
                                  Type = const(Evaluation);
                }
                action("Suggest E-bids")
                {
                    ApplicationArea = Suite;
                    Caption = 'Suggest E-bids';
                    Ellipsis = true;
                    Image = Suggest;
                    Promoted = true;
                    PromotedCategory = Process;
                    ToolTip = 'Copy document lines and header information from another purchase document to this document. You can copy a posted purchase invoice into a new purchase invoice to quickly create a similar document.';

                    trigger OnAction()
                    begin

                        Procurement.SuggestFinalEvalReport(Rec);
                    end;
                }
                action("Import Manual Bids")
                {
                    ApplicationArea = Basic;
                    Image = Import;
                    Promoted = true;
                    PromotedCategory = Process;
                    RunObject = XMLport "Import Manual Bids";
                }
                action("Proceed To Proffesional Opinion")
                {
                    ApplicationArea = Suite;
                    Caption = 'Proceed To Proffesional Opinion';
                    Ellipsis = true;
                    Image = PostDocument;
                    Promoted = true;
                    PromotedCategory = Process;
                    ToolTip = 'Copy document lines and header information from another purchase document to this document. You can copy a posted purchase invoice into a new purchase invoice to quickly create a similar document.';

                    trigger OnAction()
                    begin
                        Rec.TestField(Rec."Procurement Officer License No");
                        Procurement.PostFinalEvaluationReport(Rec);
                    end;
                }
            }
            group("Request Approval")
            {
                Caption = 'Request Approval';
                Visible = false;
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
                        //cc//if ApprovalsMgmt.CheckBidTabulationApprovalPossible(Rec) then
                        //cc//ApprovalsMgmt.OnSendBidTabulationForApproval(Rec);

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
                        //ApprovalsMgmt.OnCancelBidTabulationApprovalRequest(Rec);
                        WorkflowWebhookMgt.FindAndCancel(Rec.RecordId);
                    end;
                }
            }
        }
    }

    trigger OnNewRecord(BelowxRec: Boolean)
    begin
        Rec."Document Type" := Rec."document type"::"Evaluation Report";
    end;

    var
        ApprovalsMgmt: Codeunit "Approvals Mgmt.";
        OpenApprovalEntriesExistCurrUser: Boolean;
        OpenApprovalEntriesExist: Boolean;
        OpenApprovalEntriesExistForCurrUser: Boolean;
        CanCancelApprovalForRecord: Boolean;
        CanRequestApprovalForFlow: Boolean;
        CanCancelApprovalForFlow: Boolean;
        ShowWorkflowStatus: Boolean;
        Procurement: Codeunit "Procurement Processing";
        DMSDocuments: Record "DMS Documents";
        DMSManagement: Codeunit "DMS Management";
}
