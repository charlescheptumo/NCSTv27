#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Page 75066 "Projects Works PRNs"
{
    Caption = 'Project Purchase Requisition';
    DeleteAllowed = false;
    PageType = Document;
    RefreshOnActivate = true;
    SourceTable = "Purchase Header";
    SourceTableView = where("Document Type" = filter("Purchase Requisition"));

    layout
    {
        area(content)
        {
            group(General)
            {
                Caption = 'General';
                field("No."; Rec."No.")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("PRN Type"; Rec."PRN Type")
                {
                    ApplicationArea = Basic;
                }
                field("Document Date"; Rec."Document Date")
                {
                    ApplicationArea = Basic;
                }
                field("Responsibility Center"; Rec."Responsibility Center")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field("Location Code"; Rec."Location Code")
                {
                    ApplicationArea = Basic;
                    Visible = true;
                }
                field("Requisition Product Group"; Rec."Requisition Product Group")
                {
                    ApplicationArea = Basic;
                }
                field("Requisition Template ID"; Rec."Requisition Template ID")
                {
                    ApplicationArea = Basic;
                    Visible = true;
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = Basic;
                    Editable = not OpenApprovalEntriesExist;
                    NotBlank = true;
                    ShowMandatory = true;
                }
                field("Currency Code"; Rec."Currency Code")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field("Job Task Budget"; Rec."Job Task Budget")
                {
                    ApplicationArea = Basic;
                }
                field("Requester ID"; Rec."Requester ID")
                {
                    ApplicationArea = Basic;
                    Editable = true;
                }
                field("Request-By No."; Rec."Request-By No.")
                {
                    ApplicationArea = Basic;
                    Editable = true;
                }
                field("Request-By Name"; Rec."Request-By Name")
                {
                    ApplicationArea = Basic;
                    Editable = true;
                }
                field("Shortcut Dimension 1 Code"; Rec."Shortcut Dimension 1 Code")
                {
                    ApplicationArea = Basic;
                }
                field("Shortcut Dimension 2 Code"; Rec."Shortcut Dimension 2 Code")
                {
                    ApplicationArea = Basic;
                }
                field("Directorate Code"; Rec."Directorate Code")
                {
                    ApplicationArea = Basic;
                }
                field("Department Code"; Rec."Department Code")
                {
                    ApplicationArea = Basic;
                    Caption = 'Department/Center Code';
                }
                field(Region; Rec.Region)
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field("Procurement Plan ID"; Rec."Procurement Plan ID")
                {
                    ApplicationArea = Basic;
                }
                field("Procurement Plan Entry No"; Rec."Procurement Plan Entry No")
                {
                    ApplicationArea = Basic;
                }
                field("Purchaser Code"; Rec."Purchaser Code")
                {
                    ApplicationArea = Basic;
                    Caption = 'Assigned Procurement Officer';
                    Visible = PurchaseCode;
                }
                field(Job; Rec.Job)
                {
                    ApplicationArea = Basic;
                    Caption = 'Project ID';
                    ShowMandatory = true;
                }
                field("Job Task No."; Rec."Job Task No.")
                {
                    ApplicationArea = Basic;
                    ShowMandatory = true;
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
                field("PP Solicitation Type"; Rec."PP Solicitation Type")
                {
                    ApplicationArea = Basic;
                }
                field("PP Bid Selection Method"; Rec."PP Bid Selection Method")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field("PP Procurement Method"; Rec."PP Procurement Method")
                {
                    ApplicationArea = Basic;
                }
                field("PP  Invitation Notice Type"; Rec."PP  Invitation Notice Type")
                {
                    ApplicationArea = Basic;
                }
                field("PP Preference/Reservation Code"; Rec."PP Preference/Reservation Code")
                {
                    ApplicationArea = Basic;
                }
                field("PRN Conversion Procedure"; Rec."PRN Conversion Procedure")
                {
                    ApplicationArea = Basic;
                }
                field("Ordered PRN"; Rec."Ordered PRN")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field("Linked IFS No."; Rec."Linked IFS No.")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field("Linked LPO No."; Rec."Linked LPO No.")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field(Status; Rec.Status)
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    Visible = true;
                }
            }
            group("Project Details")
            {
                Caption = 'Project Details';
                Editable = not OpenApprovalEntriesExist;
                field("Project Staffing Template ID"; Rec."Project Staffing Template ID")
                {
                    ApplicationArea = Basic;
                }
                field("Works Equipment Template ID"; Rec."Works Equipment Template ID")
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
                field("Works Length (Km)"; Rec."Works Length (Km)")
                {
                    ApplicationArea = Basic;
                }
                field("Commitments."; Rec."Commitments.")
                {
                    ApplicationArea = Basic;
                }
            }
            part(Specifications; "BoQ Specifications")
            {
                SubPageLink = "Document No." = field("No.");
            }
            group(PurchLines)
            {
                Caption = 'Project Details';
                Editable = not OpenApprovalEntriesExist;
            }
        }
        area(factboxes)
        {
            part("Attached Documents"; "Document Attachment Factbox")
            {
                ApplicationArea = All;
                Caption = 'Attachments';
                SubPageLink = "Table ID" = const(39),
                              "No." = field("No.");
            }
            part(ApprovalFactBox; "Approval FactBox")
            {
                ApplicationArea = Suite;
                Visible = true;
            }
            part(IncomingDocAttachFactBox; "Incoming Doc. Attach. FactBox")
            {
                ApplicationArea = Suite;
                ShowFilter = false;
                Visible = true;
            }
            part(WorkflowStatus; "Workflow Status FactBox")
            {
                ApplicationArea = Suite;
                Editable = true;
                Enabled = true;
                ShowFilter = false;
                Visible = ShowWorkflowStatus;
            }
            systempart(Control11; Links)
            {
                ApplicationArea = RecordLinks;
                Visible = false;
            }
            systempart(Control10; Notes)
            {
                ApplicationArea = Notes;
            }
            systempart(Control8; Outlook)
            {
            }
            systempart(Control7; Notes)
            {
            }
            systempart(Control6; MyNotes)
            {
            }
            systempart(Control3; Links)
            {
            }
            // chartpart("Q5402-01"; "Q5402-01")
            // {
            // }
        }
    }

    actions
    {
        area(navigation)
        {
            group("Purchase Requisition")
            {
                Caption = 'Purchase Requisition';
                Image = "Order";
                action(Dimensions)
                {
                    AccessByPermission = TableData Dimension = R;
                    ApplicationArea = Dimensions;
                    Caption = 'Dimensions';
                    Enabled = Rec."No." <> '';
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
                        ApprovalEntries: Page "Approval Entries";
                    begin
                        //  //cc// WorkflowsEntriesBuffer.RunWorkflowEntriesPage(RECORDID,DATABASE::"Purchase Header","Document Type","No.");
                        ApprovalEntries.SetRecordfilters(Database::"Purchase Header", Rec."Document Type", Rec."No.");
                        ApprovalEntries.SetRecordfilters(Database::"Purchase Header", 14, Rec."No.");
                        ApprovalEntries.Run;
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
                    RunPageLink = "Document Type" = field("Document Type"),
                                  "No." = field("No."),
                                  "Document Line No." = const(0);
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
            group(ActionGroup71)
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
                        ReleasePurchDoc: Codeunit "Release Purchase Document";
                    begin
                        //check Budget Control
                        ProcSetup.Get;
                        if ProcSetup."Enforce Strict Proc Budget che" = true then begin
                            if Rec."Total PRN Amount (LCY)" >= Rec."PP Total Available Budget" then
                                Error('There is no enough Budget for No %1 Line No %2 Budget Available %3', Rec."Procurement Plan ID", Rec."Procurement Plan Entry No", Rec."PP Total Available Budget");
                        end;


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
                    PromotedCategory = Category5;
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
                action(CopyDocument)
                {
                    ApplicationArea = Suite;
                    Caption = 'Copy Document';
                    Ellipsis = true;
                    Enabled = Rec."No." <> '';
                    Image = CopyDocument;
                    Promoted = true;
                    PromotedCategory = Process;
                    ToolTip = 'Copy document lines and header information from another purchase document to this document. You can copy a posted purchase invoice into a new purchase invoice to quickly create a similar document.';

                    trigger OnAction()
                    begin
                        CopyPurchDoc.SetPurchHeader(Rec);
                        CopyPurchDoc.RunModal;
                        Clear(CopyPurchDoc);
                        if Rec.Get(Rec."Document Type", Rec."No.") then;
                    end;
                }
                action("Suggest Lines")
                {
                    ApplicationArea = Suite;
                    Caption = 'Suggest Lines From Requisition Template';
                    Ellipsis = true;
                    Enabled = Rec."No." <> '';
                    Image = SuggestCapacity;
                    Promoted = true;
                    PromotedCategory = Process;
                    ToolTip = 'Copy document lines and header information from another purchase document to this document. You can copy a posted purchase invoice into a new purchase invoice to quickly create a similar document.';

                    trigger OnAction()
                    begin

                        Procurement.SuggestLinesFromRequisitionWorksTemplate(Rec);
                    end;
                }
                action("Suggest Personnel")
                {
                    ApplicationArea = Suite;
                    Caption = 'Suggest Personnel/Equipment Specification';
                    Ellipsis = true;
                    Enabled = Rec."No." <> '';
                    Image = SuggestCapacity;
                    Promoted = true;
                    PromotedCategory = Process;
                    ToolTip = 'Copy document lines and header information from another purchase document to this document. You can copy a posted purchase invoice into a new purchase invoice to quickly create a similar document.';

                    trigger OnAction()
                    begin

                        Procurement.SuggestPRNPersonnel_equipmentSpecification(Rec);
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
                        ////DMSManagement.UploadDocument(DMSDocuments."document type"::"Imprest Memo", Rec."No.", 'Imprest Memo', Rec.RecordId);
                    end;
                }
                action("Create Invitation Notice")
                {
                    ApplicationArea = Basic;
                    Image = CreateForm;
                    Promoted = true;
                    PromotedCategory = Process;
                    Visible = Rec.status = Rec.status::Released;

                    trigger OnAction()
                    begin
                        Procurement.CreateInvitationNotice(Rec);
                    end;
                }
            }
            group("Request Approval")
            {
                Caption = 'Request Approval';
                action(SendApprovalRequest)
                {
                    ApplicationArea = Basic, Suite;
                    Caption = 'Send A&pproval Request';
                    Enabled = not OpenApprovalEntriesExist and CanRequestApprovalForFlow;
                    Image = SendApprovalRequest;
                    Promoted = true;
                    PromotedCategory = Category9;
                    PromotedIsBig = true;
                    ToolTip = 'Request approval of the document.';

                    trigger OnAction()
                    var
                        ApprovalsMgmt: Codeunit "Approvals Mgmt.";
                    begin
                        Rec.TestField(Rec."Shortcut Dimension 1 Code");
                        Rec.TestField(Rec."Shortcut Dimension 2 Code");
                        Rec.TestField(Rec.Description);
                        //TESTFIELD("Requisition Amount");
                        ProcSetup.Get;
                        if ProcSetup."Enforce Strict Proc Budget che" = true then begin
                            if Rec."Total PRN Amount (LCY)" >= Rec."PP Total Available Budget" then
                                Error('There is no enough Budget for No %1 Line No %2 Budget Available %3', Rec."Procurement Plan ID", Rec."Procurement Plan Entry No", Rec."PP Total Available Budget");
                        end;

                        //cc//if ApprovalsMgmt.CheckPurchaseApprovalPossible(Rec) then
                        //cc//ApprovalsMgmt.OnSendPurchaseDocForApproval(Rec);
                    end;
                }
                action(CancelApprovalRequest)
                {
                    ApplicationArea = Basic, Suite;
                    Caption = 'Cancel Approval Re&quest';
                    Enabled = CanCancelApprovalForRecord or CanCancelApprovalForFlow;
                    Image = CancelApprovalRequest;
                    Promoted = true;
                    PromotedCategory = Category9;
                    ToolTip = 'Cancel the approval request.';

                    trigger OnAction()
                    var
                        ApprovalsMgmt: Codeunit "Approvals Mgmt.";
                        WorkflowWebhookMgt: Codeunit "Workflow Webhook Management";
                    begin
                        //ApprovalsMgmt.OnCancelPurchaseApprovalRequest(Rec);
                        WorkflowWebhookMgt.FindAndCancel(Rec.RecordId);
                    end;
                }
                action("Personnel Specification")
                {
                    ApplicationArea = Basic;
                    Image = Employee;
                    Promoted = true;
                    PromotedCategory = Category9;
                    PromotedIsBig = true;
                    RunObject = Page "PRN Personnel Specification";
                    RunPageLink = "Document No." = field("No."),
                                  "Document Type" = field("Document Type");
                }
                action("Equipment Specification")
                {
                    ApplicationArea = Basic;
                    Image = Giro;
                    Promoted = true;
                    PromotedCategory = Category9;
                    PromotedIsBig = true;
                    RunObject = Page "PRN Equipment Specification";
                    RunPageLink = "Document Type" = field("Document Type"),
                                  "Document No." = field("No.");
                }
            }
            group(Print)
            {
                Caption = 'Print';
                Image = Print;
                action("Check Budget Availability")
                {
                    ApplicationArea = Basic;
                    Caption = 'Check Budget Availability';
                    Image = Balance;
                    Promoted = true;
                    PromotedCategory = Process;
                    PromotedIsBig = true;
                    Visible = false;

                    trigger OnAction()
                    begin

                        /*BCSetup.GET;
                        IF NOT BCSetup.Mandatory THEN
                           EXIT;*/

                        /*F NOT CheckforRequiredFields THEN
                           ERROR('There might be some lines missing the key fields: [TYPE, NO.,AMOUNT] Please recheck your document lines');*/

                        if Rec.Status = Rec.Status::Released then
                            Error('This document has already been released. This functionality is available for open documents only');
                        /*IF SomeLinesCommitted THEN BEGIN
                           IF NOT CONFIRM( 'Some or All the Lines Are already Committed do you want to continue',TRUE, "Document Type") THEN
                                ERROR('Budget Availability Check and Commitment Aborted');
                          DeleteCommitment.RESET;
                          DeleteCommitment.SETRANGE(DeleteCommitment."Document Type",DeleteCommitment."Document Type"::LPO);
                          DeleteCommitment.SETRANGE(DeleteCommitment."Document No.","No.");
                          DeleteCommitment.DELETEALL;
                        END;*/
                        Commitment.CheckLPOCommittment(Rec);

                        //MESSAGE('Commitments done Successfully for Doc. No %1',"No.");

                    end;
                }
                action("Cancel Budget Commitment")
                {
                    ApplicationArea = Basic;
                    Caption = 'Cancel Budget Commitment';
                    Image = CancelAllLines;
                    Promoted = true;
                    PromotedCategory = Process;
                    PromotedIsBig = true;
                    Visible = false;

                    trigger OnAction()
                    begin
                        Rec.TestField(Rec.Status, Rec.Status::Open);

                        if not Confirm('Are you sure you want to Cancel All Commitments Done for this document', true, Rec."Document Type") then
                            Error('Budget Availability Check and Commitment Aborted');

                        DeleteCommitment.Reset;
                        DeleteCommitment.SetRange(DeleteCommitment."Commitment Type", DeleteCommitment."commitment type"::LPO);
                        DeleteCommitment.SetRange(DeleteCommitment."Document No.", Rec."No.");
                        DeleteCommitment.DeleteAll;
                        //Tag all the Purchase Line entries as Uncommitted
                        /*PurchLine.RESET;
                        PurchLine.SETRANGE(PurchLine."Document Type","Document Type");
                        PurchLine.SETRANGE(PurchLine."Document No.","No.");
                        IF PurchLine.FIND('-') THEN BEGIN
                           REPEAT
                              PurchLine.Committed:=FALSE;
                              PurchLine.MODIFY;
                           UNTIL PurchLine.NEXT=0;
                        END;*/

                        Message('Commitments Cancelled Successfully for Doc. No %1', Rec."No.");

                    end;
                }
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
                        /*IF Status<>Status::Released THEN
                        ERROR(Text001);
                        IF Status=Status::Released THEN BEGIN
                        DocPrint.PrintPurchHeader(Rec);
                          END;*/

                        Rec.SetRange(Rec."No.", Rec."No.");
                        Report.Run(50097, true, true, Rec)

                    end;
                }
            }
        }
    }

    trigger OnAfterGetCurrRecord()
    begin
        //CurrPage.IncomingDocAttachFactBox.PAGE.LoadDataFromRecord(Rec);
        ShowWorkflowStatus := CurrPage.WorkflowStatus.Page.SetFilterOnWorkflowRecord(Rec.RecordId);
    end;

    trigger OnAfterGetRecord()
    begin
        JobQueueVisible := Rec."Job Queue Status" = Rec."job queue status"::"Scheduled for Posting";
        SetControlAppearance;

        Rec."Document Type" := Rec."document type"::"Purchase Requisition";
        Rec."Procurement Type" := 'WORKS';

        if (Rec.Status = Rec.Status::"Pending Approval") then begin
            CurrPage.Editable := false;
        end;
    end;

    trigger OnDeleteRecord(): Boolean
    begin
        CurrPage.SaveRecord;
        exit(Rec.ConfirmDeletion);
    end;

    trigger OnInsertRecord(BelowxRec: Boolean): Boolean
    begin
        Rec."Requisition Type" := Rec."requisition type"::Project;
        Rec."Document Type" := Rec."document type"::"Purchase Requisition";
        Rec."PRN Type" := Rec."prn type"::"Project Works";
        Rec."Requisition Product Group" := Rec."requisition product group"::Works;
        Rec."Procurement Type" := 'WORKS';
        Rec."Procurement Plan ID" := ProcSetup."Effective Procurement Plan";
    end;

    trigger OnNewRecord(BelowxRec: Boolean)
    begin
        //"Responsibility Center" := UserMgt.GetPurchasesFilter;
        Rec."Requisition Type" := Rec."requisition type"::Project;
        Rec."Document Type" := Rec."document type"::"Purchase Requisition";
        Rec."PRN Type" := Rec."prn type"::"Project Works";
        Rec."Requisition Product Group" := Rec."requisition product group"::Works;
        Rec."Procurement Type" := 'WORKS';
        Rec."Procurement Plan ID" := ProcSetup."Effective Procurement Plan";
    end;

    trigger OnNextRecord(Steps: Integer): Integer
    begin
        PurchaseCode := false;
        if (Rec.Status = Rec.Status::Released) then begin
            PurchaseCode := true;
        end;
    end;

    trigger OnOpenPage()
    begin
        SetControlAppearance;
        // IF UserMgt.GetPurchasesFilter <> '' THEN BEGIN
        //  FILTERGROUP(2);
        //  SETRANGE("Responsibility Center",UserMgt.GetPurchasesFilter);
        //  FILTERGROUP(0);
        // END;
        PurchaseCode := false;
        if (Rec.Status = Rec.Status::Released) then begin
            PurchaseCode := true;
        end;
        if (Rec.Status = Rec.Status::"Pending Approval") then begin
            CurrPage.Editable := false;
        end;
    end;

    var
        ChangeExchangeRate: Page "Change Exchange Rate";
        CopyPurchDoc: Report "Copy Purchase Document";
        MoveNegPurchLines: Report "Move Negative Purchase Lines";
        ReportPrint: Codeunit "Test Report-Print";
        DocPrint: Codeunit "Document-Print";
        UserMgt: Codeunit "User Setup Management";
        ArchiveManagement: Codeunit ArchiveManagement;
        [InDataSet]
        JobQueueVisible: Boolean;
        PurchSetupRec: Record "Purchases & Payables Setup";
        ItemJnlTemplate: Record "Item Journal Template";
        ItemJnlBatch: Record "Item Journal Batch";
        ItemJnlLine: Record "Item Journal Line";
        StoreReqHeader: Record "Purchase Header";
        StoreReqLine: Record "Purchase Line";
        ItemGnl: Record "Item Journal Line";
        RequisitionLine: Record "Purchase Line";
        Linenumber: Integer;
        Req: Record "Purchase Header";
        AvailableBudget: Decimal;
        Commitment: Codeunit "Procurement Processing";
        DeleteCommitment: Record "Commitment Entries1";
        s: Boolean;
        OpenApprovalEntriesExist: Boolean;
        OpenApprovalEntriesExistForCurrUser: Boolean;
        CanCancelApprovalForRecord: Boolean;
        CanRequestApprovalForFlow: Boolean;
        CanCancelApprovalForFlow: Boolean;
        Procurement: Codeunit "Procurement Processing";
        ShowWorkflowStatus: Boolean;
        ApprovalsMgmt: Codeunit "Approvals Mgmt.";
        ProcSetup: Record "Procurement Setup";
        PurchaseCode: Boolean;
        DMSDocuments: Record "DMS Documents";
        DMSManagement: Codeunit "DMS Management";

    local procedure SetControlAppearance()
    var
        ApprovalsMgmt: Codeunit "Approvals Mgmt.";
        WorkflowWebhookMgt: Codeunit "Workflow Webhook Management";
    begin
        //JobQueueVisible := "Job Queue Status" = "Job Queue Status"::"Scheduled for Posting";
        //HasIncomingDocument := "Incoming Document Entry No." <> 0;
        //SetExtDocNoMandatoryCondition;
        //OpenApprovalEntriesExistForCurrUser := ApprovalsMgmt.HasOpenApprovalEntriesForCurrentUser(RECORDID);


        OpenApprovalEntriesExistForCurrUser := ApprovalsMgmt.HasOpenApprovalEntriesForCurrentUser(Rec.RecordId);
        OpenApprovalEntriesExist := ApprovalsMgmt.HasOpenApprovalEntries(Rec.RecordId);
        CanCancelApprovalForRecord := ApprovalsMgmt.CanCancelApprovalForRecord(Rec.RecordId);

        WorkflowWebhookMgt.GetCanRequestAndCanCancel(Rec.RecordId, CanRequestApprovalForFlow, CanCancelApprovalForFlow);
    end;
}
