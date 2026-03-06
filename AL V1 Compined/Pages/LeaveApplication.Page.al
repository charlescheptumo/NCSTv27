#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Page 69075 "Leave Application"
{
    Caption = 'Leave Application';
    PageType = Document;
    RefreshOnActivate = true;
    SourceTable = "Hr Leave";
    SourceTableView = where(Status = filter(Open | "Pending Approval"));

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
                }
                field("Request-By No."; Rec."Request-By No.")
                {
                    ApplicationArea = Basic;
                }
                field("Request-By Name"; Rec."Request-By Name")
                {
                    ApplicationArea = Basic;
                }
                field(Date; Rec.Date)
                {
                    ApplicationArea = Basic;
                    Caption = 'Request Date';
                }
                field("Leave Type"; Rec."Leave Type")
                {
                    ApplicationArea = Basic;
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = Basic;
                }
                field("Balance Brought Foward"; Rec."Balance Brought Foward")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("No. Of Days"; Rec."No. Of Days")
                {
                    ApplicationArea = Basic;
                }
                field("Balance Carried Foward"; Rec."Balance Carried Foward")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("From Date"; Rec."From Date")
                {
                    ApplicationArea = Basic;
                }
                field("To Date"; Rec."To Date")
                {
                    ApplicationArea = Basic;
                }
                field("Responsibility Center"; Rec."Responsibility Center")
                {
                    ApplicationArea = Basic;
                }
                field(Status; Rec.Status)
                {
                    ApplicationArea = Basic;
                    Editable = true;
                    Visible = true;
                }
                field("Shortcut Dimension 2 Code"; Rec."Shortcut Dimension 2 Code")
                {
                    ApplicationArea = Basic;
                    Caption = 'Profit Center';
                    Editable = false;

                    trigger OnValidate()
                    begin
                        ShortcutDimension2CodeOnAfterV;
                    end;
                }
            }
        }
        area(factboxes)
        {
            part(Control1906354007; "Approval FactBox")
            {
                SubPageLink = "Table ID" = const(38),
                              "Document Type" = field("Document Type"),
                              "Document No." = field("No.");
                Visible = false;
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
            group("Leave Application")
            {
                Caption = 'Leave Application';
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
                        //ApprovalEntries.SetRecordfilters(DATABASE::"Purchase Header","Document Type","No.");
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
                    Image = ReleaseDoc;
                    Promoted = true;
                    PromotedCategory = Process;
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
                    end;
                }
                separator(Action611)
                {
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
                        /*//cc//if ApprovalsMgmt.CheckPurchaseApprovalPossible(Rec) THEN
                          //cc//ApprovalsMgmt.OnSendPurchaseDocForApproval(Rec);
                          */

                    end;
                }
                action(CancelApprovalRequest)
                {
                    ApplicationArea = Basic;
                    Caption = 'Cancel Approval Re&quest';
                    Enabled = true;
                    Image = Cancel;
                    Promoted = true;
                    PromotedCategory = Category9;

                    trigger OnAction()
                    var
                        ApprovalsMgmt: Codeunit "Approvals Mgmt.";
                    begin
                        ////ApprovalsMgmt.OnCancelPurchaseApprovalRequest(Rec);
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
                    end;
                }
            }
        }
    }

    trigger OnAfterGetRecord()
    begin
        //JobQueueVisible := "Job Queue Status" = "Job Queue Status"::"Scheduled for Posting";
    end;

    trigger OnDeleteRecord(): Boolean
    begin
        CurrPage.SaveRecord;
        //EXIT(ConfirmDeletion);
    end;

    trigger OnNewRecord(BelowxRec: Boolean)
    begin
        Rec."Responsibility Center" := UserMgt.GetPurchasesFilter;
    end;

    trigger OnOpenPage()
    begin
        if UserMgt.GetPurchasesFilter <> '' then begin
            Rec.FilterGroup(2);
            Rec.SetRange(Rec."Responsibility Center", UserMgt.GetPurchasesFilter);
            Rec.FilterGroup(0);
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
        OpenApprovalEntriesExistForCurrUser: Boolean;
        OpenApprovalEntriesExist: Boolean;
        ShowWorkflowStatus: Boolean;

    local procedure Post(PostingCodeunitID: Integer)
    begin
        //SendToPosting(PostingCodeunitID);
        //IF "Job Queue Status" = "Job Queue Status"::"Scheduled for Posting" THEN
        // CurrPage.CLOSE;
        //CurrPage.UPDATE(FALSE);
    end;

    local procedure ApproveCalcInvDisc()
    begin
        ///CurrPage.PurchLines.PAGE.ApproveCalcInvDisc;
    end;

    local procedure BuyfromVendorNoOnAfterValidate()
    begin
        /*IF GETFILTER("Buy-from Vendor No.") = xRec."Buy-from Vendor No." THEN
          IF "Buy-from Vendor No." <> xRec."Buy-from Vendor No." THEN
            SETRANGE("Buy-from Vendor No.");
        CurrPage.UPDATE;
        */

    end;

    local procedure PurchaserCodeOnAfterValidate()
    begin
        //CurrPage.PurchLines.PAGE.UpdateForm(TRUE);
    end;

    local procedure PaytoVendorNoOnAfterValidate()
    begin
        //CurrPage.UPDATE;
    end;

    local procedure ShortcutDimension1CodeOnAfterV()
    begin
        //CurrPage.PurchLines.PAGE.UpdateForm(TRUE);
    end;

    local procedure ShortcutDimension2CodeOnAfterV()
    begin
        //CurrPage.PurchLines.PAGE.UpdateForm(TRUE);
    end;

    local procedure PricesIncludingVATOnAfterValid()
    begin
        //CurrPage.UPDATE;
    end;

    local procedure CurrencyCodeOnAfterValidate()
    begin
        //CurrPage.PurchLines.PAGE.UpdateForm(TRUE);
    end;

    local procedure Prepayment37OnAfterValidate()
    begin
        //CurrPage.UPDATE;
    end;

    local procedure SetControlAppearance()
    var
        ApprovalsMgmt: Codeunit "Approvals Mgmt.";
    begin
        //JobQueueVisible := "Job Queue Status" = "Job Queue Status"::"Scheduled for Posting";
        //HasIncomingDocument := "Incoming Document Entry No." <> 0;
        //SetExtDocNoMandatoryCondition;
        OpenApprovalEntriesExistForCurrUser := ApprovalsMgmt.HasOpenApprovalEntriesForCurrentUser(Rec.RecordId);
        OpenApprovalEntriesExist := ApprovalsMgmt.HasOpenApprovalEntries(Rec.RecordId);
    end;
}
