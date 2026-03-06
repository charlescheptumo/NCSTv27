#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Page 70062 "Approved Purchase Req"
{
    Caption = 'Project Purchase Requisition';
    DeleteAllowed = false;
    Editable = true;
    InsertAllowed = false;
    PageType = Document;
    RefreshOnActivate = true;
    SourceTable = "Purchase Header";
    SourceTableView = where("Document Type" = filter("Purchase Requisition"));
    ApplicationArea = All;

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
                    Editable = false;
                }
                field("Request-By No."; Rec."Request-By No.")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Request-By Name"; Rec."Request-By Name")
                {
                    ApplicationArea = Basic;
                }
                field("Location Code"; Rec."Location Code")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field("Order Date"; Rec."Order Date")
                {
                    ApplicationArea = Basic;
                    Caption = 'Request Date';
                    Editable = false;
                }
                field("Due Date"; Rec."Due Date")
                {
                    ApplicationArea = Basic;
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = Basic;
                    Caption = 'Procurement Tittle';
                }
                field("Approved Requisition Amount"; Rec."Approved Requisition Amount")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Process Type"; Rec."Process Type")
                {
                    ApplicationArea = Basic;
                }
                field("Purchase Type"; Rec."Purchase Type")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field("Procurement Officer"; Rec."Assigned User ID")
                {
                    ApplicationArea = Basic;
                    Caption = 'Procurement Officer';
                }
                field(Status; Rec.Status)
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    Visible = true;
                }
                field("Shortcut Dimension 1 Code"; Rec."Shortcut Dimension 1 Code")
                {
                    ApplicationArea = Basic;
                    Editable = false;

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
                    Visible = false;
                }
                field("Project Name"; Rec."Project Name")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    Visible = false;
                }
                field("Shortcut Dimension 3 Code"; Rec."Shortcut Dimension 3 Code")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field("Unit  Name"; Rec."Unit  Name")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field("No. of Archived Versions"; Rec."No. of Archived Versions")
                {
                    ApplicationArea = Basic;
                    Importance = Additional;
                    Visible = false;
                }
                field("Procurement Plan"; Rec."Procurement Plan")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Procurement Plan Item"; Rec."Procurement Plan Item")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    Visible = false;
                }
                field("Procurement Plan Item Descript"; Rec."Procurement Plan Item Descript")
                {
                    ApplicationArea = Basic;
                    Caption = 'Procurement Plan Item Description';
                    Editable = false;
                    Visible = false;
                }
                field("General Item Category"; Rec."General Item Category")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    Visible = false;
                }
                field("Item Category"; Rec."Item Category")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    Visible = false;
                }
                field("Item Category Description"; Rec."Item Category Description")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field(Job; Rec.Job)
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    Visible = false;
                }
                field("Job Name"; Rec."Job Name")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    Visible = false;
                }
                field("Job Task No."; Rec."Job Task No.")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    Visible = false;
                }
            }
            part(PurchLines; "Approved P.Requisition Subform")
            {
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
                    Visible = false;

                    trigger OnAction()
                    var
                        ApprovalsMgmt: Codeunit "Approvals Mgmt.";
                    begin
                        /*//cc//if ApprovalsMgmt.CheckPurchaseApprovalPossible(Rec) THEN
                          //cc//ApprovalsMgmt.OnSendPurchaseDocForApproval(Rec);*/

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
                    Visible = false;

                    trigger OnAction()
                    var
                        ApprovalsMgmt: Codeunit "Approvals Mgmt.";
                    begin
                        ////ApprovalsMgmt.OnCancelPurchaseApprovalRequest(Rec);
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
                        //ReleasePurchDoc.PerformManualRelease(Rec);
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
                        //ReleasePurchDoc.PerformManualReopen(Rec);
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
                action("Initiate Procurement Method")
                {
                    ApplicationArea = Basic;
                    Caption = 'Initiate Procurement Method';
                    Image = CreateSKU;
                    Promoted = true;
                    PromotedCategory = Process;
                    PromotedIsBig = true;
                    Visible = false;

                    trigger OnAction()
                    begin
                        PurchHeader.Reset;
                        PurchHeader.SetRange("No.", Rec."No.");
                        if PurchHeader.FindSet then begin
                            Rec.Status := Rec.Status::"In Progress";
                            Rec.Modify;
                        end;
                    end;
                }
                action("Create Procurement Method")
                {
                    ApplicationArea = Basic;
                    Caption = 'Initiate Procurement Method';
                    Image = CreateSKU;
                    Promoted = true;
                    PromotedCategory = Process;
                    PromotedIsBig = true;

                    trigger OnAction()
                    begin
                        Rec.TestField(Rec."Assigned User ID");
                        Rec.TestField(Rec."Process Type");
                        if not Confirm('Are you sure you want to initiate procurement process for this requisition', true, Rec."Document Type") then
                            Error('Procurement process Aborted');
                        //CALCFIELDS("Process Type");
                        ProcMethod.Reset;
                        ProcMethod.SetRange(ProcMethod.Code, Rec."Process Type");
                        if ProcMethod.FindSet then begin
                            /* PurchLines.RESET;
                            PurchLines.SETRANGE("Document No.","No.");
                            IF PurchLines.FINDSET THEN BEGIN
                           REPEAT
                              IF ProcMethod."Process Type"=ProcMethod."Process Type"::RFQ THEN
                                BEGIN
                                  Procurement.GenerateRFQ(PurchLines);
                                 END;
                                 IF ProcMethod."Process Type"=ProcMethod."Process Type"::RFP THEN
                                BEGIN
                                  Procurement.GenerateRFQ(PurchLines);
                                 END;
                                  IF ProcMethod."Process Type"=ProcMethod."Process Type"::Direct THEN
                                BEGIN
                                  Procurement.GenerateDirect(PurchLines);
                                 END;
                                 UNTIL PurchLines.NEXT=0;
                          END;*/
                            PurchHeader.Reset;
                            PurchHeader.SetRange("No.", Rec."No.");
                            if PurchHeader.FindSet then begin
                                Rec.Status := Rec.Status::"In Progress";
                                Rec.Modify;
                            end;
                            PurchHeader.Reset;
                            PurchHeader.SetRange("No.", Rec."No.");
                            if PurchHeader.FindSet then begin
                                //REPEAT
                                if ProcMethod."Process Type" = ProcMethod."process type"::RFQ then begin
                                    Procurement.GenerateRFQDoc(PurchHeader);
                                end;
                                if ProcMethod."Process Type" = ProcMethod."process type"::RFP then begin
                                    Procurement.GenerateRFQDoc(PurchHeader);
                                end;
                                if ProcMethod."Process Type" = ProcMethod."process type"::Direct then begin

                                    Procurement.GenerateDirectDOC(PurchHeader);
                                end;
                                if ProcMethod."Process Type" = ProcMethod."process type"::Tender then begin

                                    Procurement.GenerateOpenTenderDOC(PurchHeader);
                                end;
                                // UNTIL PurchHeader.NEXT=0
                            end;

                        end;
                        /*
                        //function to send email notification
                        Email2:=CompanyInfo."Administrator Email";
                        Usersetup.RESET;
                        Usersetup.SETRANGE("User ID","Assigned User ID");
                        IF Usersetup.FIND('-') THEN BEGIN
                             Body:= 'You have been assigned a procurement Requisition. Kindly login to Microsoft Dynamics NAV to Action.';
                        
                                    SMTP.CreateMessage('NACOSTI',Email2,
                                    Usersetup."E-Mail",'PRQ '+'No: '+"No.",
                                    'Dear '+Usersetup."User ID"+',<BR><BR>'+
                                     Body
                                    ,TRUE);
                        
                                    SMTP.AppendBody('<BR><BR>Kind Regards,'+'<BR><BR>Procurement Department.<BR>'+'<BR>');
                                    SMTP.Send();
                        END;
                        */
                        Rec."Archive Requisitions" := true;
                        Rec.Modify;

                    end;
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
                action("Notify Procurement Officer")
                {
                    ApplicationArea = Basic;
                    Image = Apply;
                    Promoted = true;
                    PromotedCategory = Process;
                    PromotedIsBig = true;

                    trigger OnAction()
                    var
                        body: Text[150];
                        emailmessage: Codeunit "Email Message";
                        emailsend: Codeunit "Email";
                        Usersetup: Record "User Setup";
                    begin
                        PurchHeader.Reset;

                        Email2 := CompanyInfo."Administrator Email";
                        Usersetup.Reset;
                        Usersetup.SetRange("User ID", Rec."Assigned User ID");
                        if Usersetup.Find('-') then begin
                            Body := Body + 'Dear ' + Usersetup."User ID" + ',<BR><BR>';
                            Body := Body + '<BR><BR>Document No: ' + Rec."No." + '<BR>Requestor: ' + Rec."Request-By Name" + '<BR>Request Date: ' + Format(Rec."Order Date") + '<BR>Procurement Title: ' + Rec.Description;
                            Body := 'You have been assigned a procurement Requisition. Kindly login to Microsoft Dynamics NAV to Action.';
                            Body := Body + '<BR><BR>Kind Regards,' + '<BR><BR>Supply Chain Department.<BR>' + '<BR>';
                            emailmessage.Create(Usersetup."E-Mail", 'NACOSTI', body);
                            emailsend.Send(emailmessage, Enum::"Email Scenario"::Default);
                        end;

                        Message('Notified Successfully');
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
        /*
        //KUGUN-Calc Avaliable Budget
        SETRANGE("Date Filter",0D,"Order Date");
        CALCFIELDS("Budgeted Amount","Actual Budget Costs","Budget Commitments");
        
        "Remaining Budget":="Budgeted Amount"-("Actual Budget Costs"+"Budget Commitments");
        //End KUGUN-Calc Avaliable Budget
        */

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
        OpenApprovalEntriesExist: Boolean;
        ShowWorkflowStatus: Boolean;
        AvailableBudget: Decimal;
        Text001: label 'You can only print a fully approved purchase requisition.';
        Procurement: Codeunit "Procurement Processing";
        ProcMethod: Record "Procurement Method";
        PurchLines: Record "Purchase Line";
        PurchHeader: Record "Purchase Header";
        Usersetup: Record "User Setup";
        Body: Code[150];
        //cc// SMTP: Codeunit "SMTP Mail";
        CompanyInfo: Record "Company Information";
        Email2: Code[50];
        ProcRequest: Record "Procurement Request";

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
