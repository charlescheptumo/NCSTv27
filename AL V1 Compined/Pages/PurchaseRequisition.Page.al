#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Page 50071 "Purchase Requisition"
{
    Caption = 'Project Purchase Requisition';
    DeleteAllowed = false;
    PageType = Document;
    RefreshOnActivate = true;
    SourceTable = "Purchase Header";
    SourceTableView = where("Document Type" = filter("Purchase Requisition"),
                            "Requisition Type" = const(Project));

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
                field("Location Code"; Rec."Location Code")
                {
                    ApplicationArea = Basic;
                    Editable = not OpenApprovalEntriesExist;
                    ShowMandatory = true;
                    Visible = true;
                }
                field("Order Date"; Rec."Order Date")
                {
                    ApplicationArea = Basic;
                    Caption = 'Request Date';
                    Editable = not OpenApprovalEntriesExist;
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = Basic;
                    Editable = not OpenApprovalEntriesExist;
                    NotBlank = true;
                    ShowMandatory = true;
                }
                field("Requisition Type"; Rec."Requisition Type")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field(Status; Rec.Status)
                {
                    ApplicationArea = Basic;
                    Editable = true;
                    Visible = true;
                }
                field("Shortcut Dimension 1 Code"; Rec."Shortcut Dimension 1 Code")
                {
                    ApplicationArea = Basic;
                    Editable = not OpenApprovalEntriesExist;
                    ShowMandatory = true;

                    trigger OnValidate()
                    begin
                        ShortcutDimension2CodeOnAfterV;
                    end;
                }
                field("Department Name"; Rec."Department Name")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Shortcut Dimension 2 Code"; Rec."Shortcut Dimension 2 Code")
                {
                    ApplicationArea = Basic;
                    Editable = not OpenApprovalEntriesExist;
                    ShowMandatory = true;
                }
                field("Project Name"; Rec."Project Name")
                {
                    ApplicationArea = Basic;
                    Caption = 'Program Name';
                    Editable = false;
                }
                field("Shortcut Dimension 3 Code"; Rec."Shortcut Dimension 3 Code")
                {
                    ApplicationArea = Basic;
                    Editable = not OpenApprovalEntriesExist;
                    ShowMandatory = true;
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
                field(Division; Rec.Division)
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Unit  Name"; Rec."Unit  Name")
                {
                    ApplicationArea = Basic;
                    Caption = 'Section Name';
                }
                field("Requisition Amount"; Rec."Requisition Amount")
                {
                    ApplicationArea = Basic;
                    Style = Favorable;
                    StyleExpr = true;
                }
                field("No. of Archived Versions"; Rec."No. of Archived Versions")
                {
                    ApplicationArea = Basic;
                    Importance = Additional;
                }
            }
            part(PurchLines; "PR Subform")
            {
                Editable = not OpenApprovalEntriesExist;
                SubPageLink = "Document No." = field("No.");
            }
        }
        area(factboxes)
        {
            part(Control1903326807; "Item Replenishment FactBox")
            {
                Provider = PurchLines;
                SubPageLink = "No." = field("No.");
                Visible = false;
            }
            part(Control1906354007; "Approval FactBox")
            {
                SubPageLink = "Table ID" = const(38),
                              "Document Type" = field("Document Type"),
                              "Document No." = field("No.");
                Visible = false;
            }
            part(Control3; "Purchase Line FactBox")
            {
                Provider = PurchLines;
                SubPageLink = "Document Type" = field("Document Type"),
                              "No." = field("No."),
                              "Line No." = field("Line No.");
            }
            part(WorkflowStatus; "Workflow Status FactBox")
            {
                Editable = false;
                Enabled = false;
                ShowFilter = false;
                Visible = ShowWorkflowStatus;
            }
            systempart(Control1900383207; Links)
            {
                Visible = false;
            }
            systempart(Control1905767507; Notes)
            {
                Visible = true;
            }
        }
    }

    actions
    {
        area(navigation)
        {
            group("O&rder")
            {
                Caption = 'O&rder';
                Image = "Order";
                action(Dimensions)
                {
                    ApplicationArea = Basic;
                    Caption = 'Dimensions';
                    Image = Dimensions;
                    Promoted = true;
                    PromotedIsBig = true;
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
                    PromotedIsBig = false;

                    trigger OnAction()
                    var
                        ApprovalEntries: Page "Approval Entries";
                    begin
                        ApprovalEntries.SetRecordfilters(Database::"Purchase Header", Rec."Document Type", Rec."No.");
                        ApprovalEntries.SetRecordfilters(Database::"Purchase Header", 14, Rec."No.");
                        ApprovalEntries.Run;
                    end;
                }
                action("Co&mments")
                {
                    ApplicationArea = Basic;
                    Caption = 'Co&mments';
                    Image = ViewComments;
                    RunObject = Page "Purch. Comment Sheet";
                    RunPageLink = "Document Type" = field("Document Type"),
                                  "No." = field("No."),
                                  "Document Line No." = const(0);
                }
                action(DocAttach)
                {
                    ApplicationArea = All;
                    Caption = 'Attachments';
                    Image = Attach;
                    Promoted = true;
                    PromotedCategory = Category5;
                    PromotedIsBig = true;
                    PromotedOnly = true;
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
            group("Request Approval")
            {
                Caption = 'Request Approval';
                action(SendApprovalRequest)
                {
                    ApplicationArea = Basic;
                    Caption = 'Send A&pproval Request';
                    Enabled = not OpenApprovalEntriesExist;
                    Image = SendApprovalRequest;
                    Promoted = true;
                    PromotedCategory = Category9;

                    trigger OnAction()
                    var
                        ApprovalsMgmt: Codeunit "Approvals Mgmt.";
                    begin
                        //TESTFIELD("Shortcut Dimension 1 Code");
                        //TESTFIELD("Shortcut Dimension 2 Code");
                        Rec.TestField(Rec.Description);
                        //TESTFIELD("Requester ID",USERID);
                        Rec.TestField(Rec."Requisition Amount");
                        //cc//if ApprovalsMgmt.CheckPurchaseApprovalPossible(Rec) then
                        //cc//ApprovalsMgmt.OnSendPurchaseDocForApproval(Rec);
                    end;
                }
                action(CancelApprovalRequest)
                {
                    ApplicationArea = Basic;
                    Caption = 'Cancel Approval Re&quest';
                    Enabled = OpenApprovalEntriesExist;
                    Image = Cancel;
                    Promoted = true;
                    PromotedCategory = Category9;

                    trigger OnAction()
                    var
                        ApprovalsMgmt: Codeunit "Approvals Mgmt.";
                    begin
                        Rec.TestField(Rec."Requester ID", UserId);
                        //ApprovalsMgmt.OnCancelPurchaseApprovalRequest(Rec);
                    end;
                }
            }
            group(ActionGroup13)
            {
                Caption = 'Release';
                Image = ReleaseDoc;
                separator(Action73)
                {
                }
                action(Release)
                {
                    ApplicationArea = Basic;
                    Caption = 'Re&lease';
                    Enabled = false;
                    Image = ReleaseDoc;
                    Promoted = true;
                    PromotedCategory = Process;
                    ShortCutKey = 'Ctrl+F9';

                    trigger OnAction()
                    var
                        ReleasePurchDoc: Codeunit "Release Purchase Document";
                    begin
                        ReleasePurchDoc.PerformManualRelease(Rec);
                    end;
                }
                action("Re&open")
                {
                    ApplicationArea = Basic;
                    Caption = 'Re&open';
                    Enabled = false;
                    Image = ReOpen;

                    trigger OnAction()
                    var
                        ReleasePurchDoc: Codeunit "Release Purchase Document";
                    begin
                        ReleasePurchDoc.PerformManualReopen(Rec);
                    end;
                }
                separator(Action611)
                {
                }
            }
            group(Approval)
            {
                Caption = 'Approval';
                Image = Approval;
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
                    var
                        PurchaseHeader: Record "Purchase Header";
                    begin
                        PurchaseHeader := Rec;
                        CurrPage.SetSelectionFilter(PurchaseHeader);
                        PurchaseHeader.PrintRecords(true);
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
    end;

    trigger OnDeleteRecord(): Boolean
    begin
        CurrPage.SaveRecord;
        exit(Rec.ConfirmDeletion);
    end;

    trigger OnNewRecord(BelowxRec: Boolean)
    begin
        Rec."Responsibility Center" := UserMgt.GetPurchasesFilter;
        Rec."Requisition Type" := Rec."requisition type"::Project;
        Rec."Document Type" := Rec."document type"::"Purchase Requisition";
    end;

    trigger OnOpenPage()
    begin
        SetControlAppearance;
        if UserMgt.GetPurchasesFilter <> '' then begin
            Rec.FilterGroup(2);
            Rec.SetRange(Rec."Responsibility Center", UserMgt.GetPurchasesFilter);
            Rec.FilterGroup(0);
        end;


        Rec."Document Type" := Rec."document type"::"Purchase Requisition";
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
        OpenApprovalEntriesExist: Boolean;
        ShowWorkflowStatus: Boolean;
        AvailableBudget: Decimal;

    local procedure Post(PostingCodeunitID: Integer)
    begin
        Rec.SendToPosting(PostingCodeunitID);
        if Rec."Job Queue Status" = Rec."job queue status"::"Scheduled for Posting" then
            CurrPage.Close;
        CurrPage.Update(false);
    end;

    local procedure ApproveCalcInvDisc()
    begin
        CurrPage.PurchLines.Page.ApproveCalcInvDisc;
    end;

    local procedure BuyfromVendorNoOnAfterValidate()
    begin
        if Rec.GetFilter(Rec."Buy-from Vendor No.") = xRec."Buy-from Vendor No." then
            if Rec."Buy-from Vendor No." <> xRec."Buy-from Vendor No." then
                Rec.SetRange(Rec."Buy-from Vendor No.");
        CurrPage.Update;
    end;

    local procedure PurchaserCodeOnAfterValidate()
    begin
        CurrPage.PurchLines.Page.UpdateForm(true);
    end;

    local procedure PaytoVendorNoOnAfterValidate()
    begin
        CurrPage.Update;
    end;

    local procedure ShortcutDimension1CodeOnAfterV()
    begin
        CurrPage.PurchLines.Page.UpdateForm(true);
    end;

    local procedure ShortcutDimension2CodeOnAfterV()
    begin
        CurrPage.PurchLines.Page.UpdateForm(true);
    end;

    local procedure PricesIncludingVATOnAfterValid()
    begin
        CurrPage.Update;
    end;

    local procedure CurrencyCodeOnAfterValidate()
    begin
        CurrPage.PurchLines.Page.UpdateForm(true);
    end;

    local procedure Prepayment37OnAfterValidate()
    begin
        CurrPage.Update;
    end;

    local procedure SetControlAppearance()
    var
        ApprovalsMgmt: Codeunit "Approvals Mgmt.";
    begin
        //JobQueueVisible := "Job Queue Status" = "Job Queue Status"::"Scheduled for Posting";
        //HasIncomingDocument := "Incoming Document Entry No." <> 0;
        //SetExtDocNoMandatoryCondition;
        //OpenApprovalEntriesExistForCurrUser := ApprovalsMgmt.HasOpenApprovalEntriesForCurrentUser(RECORDID);
        OpenApprovalEntriesExist := ApprovalsMgmt.HasOpenApprovalEntries(Rec.RecordId);
    end;
}
