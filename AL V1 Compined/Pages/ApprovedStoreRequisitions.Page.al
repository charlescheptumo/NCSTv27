#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Page 50053 "Approved Store Requisitions"
{
    ApplicationArea = Basic;
    Caption = 'Approved Store Requisitions';
    CardPageID = "Approved Store Requisition";
    DeleteAllowed = false;
    Editable = false;
    InsertAllowed = false;
    PageType = List;
    SourceTable = "Purchase Header";
    SourceTableView = sorting("Document Type", "No.")
                      order(ascending)
                      where("Document Type" = filter("Store Requisition"),
                            Status = const(Released),
                            Replenishment = const(false),
                            "Fully Issued" = const(false),
                            "Requisition Type" = filter(<> "Stock Return"));
    UsageCategory = Lists;

    layout
    {
        area(content)
        {
            repeater(Control1)
            {
                field("No."; Rec."No.")
                {
                    ApplicationArea = Basic;
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
                field("Shortcut Dimension 2 Code"; Rec."Shortcut Dimension 2 Code")
                {
                    ApplicationArea = Basic;
                    Visible = false;

                    trigger OnLookup(var Text: Text): Boolean
                    begin
                        DimMgt.LookupDimValueCodeNoUpdate(2);
                    end;
                }
                field("Department Name"; Rec."Department Name")
                {
                    ApplicationArea = Basic;
                }
                field("Project Name"; Rec."Project Name")
                {
                    ApplicationArea = Basic;
                    Visible = false;
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
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = Basic;
                }
                field("Requisition Type"; Rec."Requisition Type")
                {
                    ApplicationArea = Basic;
                }
                field("Currency Code"; Rec."Currency Code")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field(Status; Rec.Status)
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field("Budget Item"; Rec."Budget Item")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field("Taken By"; Rec."Taken By")
                {
                    ApplicationArea = Basic;
                    Caption = 'Issue To';
                    Visible = false;
                }
                field("Job Task No."; Rec."Job Task No.")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
            }
        }
        area(factboxes)
        {
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
                    Promoted = false;
                    //The property 'PromotedIsBig' can only be set if the property 'Promoted' is set to 'true'
                    //PromotedIsBig = false;
                    ShortCutKey = 'Shift+Ctrl+D';

                    trigger OnAction()
                    begin
                        Rec.ShowDocDim;
                    end;
                }
                action(Statistics)
                {
                    ApplicationArea = Basic;
                    Caption = 'Statistics';
                    Image = Statistics;
                    Promoted = true;
                    PromotedCategory = Process;
                    PromotedIsBig = true;
                    ShortCutKey = 'F7';

                    trigger OnAction()
                    begin
                        Rec.CalcInvDiscForHeader;
                        Commit;
                        Page.RunModal(Page::"Purchase Order Statistics", Rec);
                    end;
                }
                action(Approvals)
                {
                    ApplicationArea = Basic;
                    Caption = 'Approvals';
                    Image = Approvals;
                    Promoted = false;
                    //The property 'PromotedIsBig' can only be set if the property 'Promoted' is set to 'true'
                    //PromotedIsBig = false;

                    trigger OnAction()
                    var
                        ApprovalEntries: Page "Approval Entries";
                    begin
                        //ApprovalEntries.SetRecordfilters(DATABASE::"Purchase Header","Document Type","No.");
                        ApprovalEntries.SetRecordfilters(Database::"Purchase Header", 12, Rec."No.");
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
            group(Documents)
            {
                Caption = 'Documents';
                Image = Documents;
                action(Receipts)
                {
                    ApplicationArea = Basic;
                    Caption = 'Receipts';
                    Image = PostedReceipts;
                    Promoted = false;
                    //The property 'PromotedIsBig' can only be set if the property 'Promoted' is set to 'true'
                    //PromotedIsBig = false;
                    RunObject = Page "Posted Purchase Receipts";
                    RunPageLink = "Order No." = field("No.");
                    RunPageView = sorting("Order No.");
                }
                action(Invoices)
                {
                    ApplicationArea = Basic;
                    Caption = 'Invoices';
                    Image = Invoice;
                    Promoted = false;
                    //The property 'PromotedIsBig' can only be set if the property 'Promoted' is set to 'true'
                    //PromotedIsBig = false;
                    RunObject = Page "Posted Purchase Invoices";
                    RunPageLink = "Order No." = field("No.");
                    RunPageView = sorting("Order No.");
                }
                action("Prepa&yment Invoices")
                {
                    ApplicationArea = Basic;
                    Caption = 'Prepa&yment Invoices';
                    Image = PrepaymentInvoice;
                    RunObject = Page "Posted Purchase Invoices";
                    RunPageLink = "Prepayment Order No." = field("No.");
                    RunPageView = sorting("Prepayment Order No.");
                }
                action("Prepayment Credi&t Memos")
                {
                    ApplicationArea = Basic;
                    Caption = 'Prepayment Credi&t Memos';
                    Image = PrepaymentCreditMemo;
                    RunObject = Page "Posted Purchase Credit Memos";
                    RunPageLink = "Prepayment Order No." = field("No.");
                    RunPageView = sorting("Prepayment Order No.");
                }
                separator(Action1102601037)
                {
                }
            }
            group(Warehouse)
            {
                Caption = 'Warehouse';
                Image = Warehouse;
                action("In&vt. Put-away/Pick Lines")
                {
                    ApplicationArea = Basic;
                    Caption = 'In&vt. Put-away/Pick Lines';
                    Image = PickLines;
                    RunObject = Page "Warehouse Activity List";
                    RunPageLink = "Source Document" = const("Purchase Order"),
                                  "Source No." = field("No.");
                    RunPageView = sorting("Source Document", "Source No.", "Location Code");
                }
                action("Whse. Receipt Lines")
                {
                    ApplicationArea = Basic;
                    Caption = 'Whse. Receipt Lines';
                    Image = ReceiptLines;
                    RunObject = Page "Whse. Receipt Lines";
                    RunPageLink = "Source Type" = const(39),
                                  "Source Subtype" = field("Document Type"),
                                  "Source No." = field("No.");
                    RunPageView = sorting("Source Type", "Source Subtype", "Source No.", "Source Line No.");
                }
                separator(Action1102601040)
                {
                }
            }
        }
        area(processing)
        {
            group(General)
            {
                Caption = 'General';
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
                        Rec.SetRange(Rec."No.", Rec."No.");
                        Report.Run(70009, true, true, Rec);
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
                    Enabled = false;
                    Image = ReleaseDoc;
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
                    Image = ReOpen;

                    trigger OnAction()
                    var
                        ReleasePurchDoc: Codeunit "Release Purchase Document";
                    begin
                        /*
                 //Ushindi-Restrict users to reopen IR
                   User.GET(USERID);
                   IF User."Reopen Internal Requisition"=FALSE THEN
                   ERROR('You do not have have permission to Re-open IRs.Please contact your system administrator');
                 //Ushindi-end

                     */
                        ReleasePurchDoc.PerformManualReopen(Rec);

                    end;
                }
                separator(Action1102601023)
                {
                }
            }
            group("F&unctions")
            {
                Caption = 'F&unctions';
                Image = "Action";
                separator(Action1102601020)
                {
                }
                action("Send IC Purchase Order")
                {
                    ApplicationArea = Basic;
                    Caption = 'Send IC Purchase Order';
                    Image = IntercompanyOrder;

                    trigger OnAction()
                    var
                        ICInOutboxMgt: Codeunit ICInboxOutboxMgt;
                        SalesHeader: Record "Sales Header";
                    begin
                        /*IF ApprovalMgt.PrePostApprovalCheck(SalesHeader,Rec) THEN
                          ICInOutboxMgt.SendPurchDoc(Rec,FALSE);
                        
                        */

                    end;
                }
            }
            group(ActionGroup12)
            {
                Caption = 'Warehouse';
                Image = Warehouse;
                action("Create &Whse. Receipt")
                {
                    ApplicationArea = Basic;
                    Caption = 'Create &Whse. Receipt';
                    Image = NewReceipt;

                    trigger OnAction()
                    var
                        GetSourceDocInbound: Codeunit "Get Source Doc. Inbound";
                    begin
                        GetSourceDocInbound.CreateFromPurchOrder(Rec);

                        if not Rec.Find('=><') then
                            Rec.Init;
                    end;
                }
                action("Create Inventor&y Put-away/Pick")
                {
                    ApplicationArea = Basic;
                    Caption = 'Create Inventor&y Put-away/Pick';
                    Ellipsis = true;
                    Image = CreatePutawayPick;

                    trigger OnAction()
                    begin
                        Rec.CreateInvtPutAwayPick;

                        if not Rec.Find('=><') then
                            Rec.Init;
                    end;
                }
                separator(Action1102601017)
                {
                }
            }
            group("P&osting")
            {
                Caption = 'P&osting';
                Image = Post;
                action("Test Report")
                {
                    ApplicationArea = Basic;
                    Caption = 'Test Report';
                    Ellipsis = true;
                    Image = TestReport;

                    trigger OnAction()
                    begin
                        ReportPrint.PrintPurchHeader(Rec);
                    end;
                }
                action("P&ost")
                {
                    ApplicationArea = Basic;
                    Caption = 'P&ost';
                    Ellipsis = true;
                    Image = PostOrder;
                    Promoted = true;
                    PromotedCategory = Process;
                    PromotedIsBig = true;
                    ShortCutKey = 'F9';

                    trigger OnAction()
                    begin
                        //SendToPosting(CODEUNIT::"Purch.-Post (Yes/No)");







                        if Confirm('Are you sure you would like to issue this requisition?', false) = true then begin

                            if Rec."Requisition Type" = Rec."requisition type"::"Stock Replenishment" then
                                Error('YOU CANNOT ISSUE A STOCK REPLENISHMENT IR.PLEASE CHECK!!');


                            //TESTFIELD("Taken By");
                            Rec.TestField(Rec."Posting Date");
                            //if
                            ItemGnl.Reset;
                            ItemGnl.SetRange(ItemGnl."Journal Template Name", 'ITEM');
                            ItemGnl.SetRange(ItemGnl."Journal Batch Name", 'REQ');
                            ItemGnl.DeleteAll(true);

                            /*

                            JLDim.RESET;
                            JLDim.SETRANGE(JLDim."Table ID",83);
                            JLDim.SETRANGE(JLDim."Journal Template Name",'ITEM');
                            JLDim.SETRANGE(JLDim."Journal Batch Name",'REQ');
                            JLDim.DELETEALL(TRUE);
                            */


                            ItemGnl.Reset;
                            ItemGnl.SetRange(ItemGnl."Journal Template Name", 'ITEM');
                            ItemGnl.SetRange(ItemGnl."Journal Batch Name", 'REQ');
                            if ItemGnl.FindLast then
                                Linenumber := ItemGnl."Line No."
                            else
                                Linenumber := 10000;
                            //MESSAGE('%1',Linenumber);

                            RequisitionLine.Reset;

                            RequisitionLine.SetRange(RequisitionLine."Document No.", Rec."No.");
                            RequisitionLine.SetRange(RequisitionLine."Document Type", Rec."Document Type");
                            RequisitionLine.SetRange(RequisitionLine.Type, RequisitionLine.Type::Item);

                            RequisitionLine.SetRange(RequisitionLine.Select, true);
                            //RequisitionLine.SETRANGE(RequisitionLine."HOD Action",RequisitionLine."HOD Action"::Approved);
                            //RequisitionLine.GET(RequisitionLine."Journal Batch Name");
                            if RequisitionLine.Find('-') then begin
                                repeat
                                    //MESSAGE('RERE');
                                    //MESSAGE("Requisition No.");

                                    if RequisitionLine."Quantity To  Issue" = 0 then
                                        Error('YOU CANNOT ISSUE ZERO QUANTITIES.PLEASE CHECK!!');

                                    ItemGnl.Init;

                                    ItemGnl."Journal Template Name" := 'ITEM';
                                    ItemGnl."Journal Batch Name" := 'REQ';
                                    ItemGnl."Document No." := Rec."No.";
                                    //ItemGnl."Quantity Requested":=RequisitionLine.Quantity;
                                    //ItemGnl."Posting Date":=20070201D;
                                    //ItemGnl."Posting Date":=RequisitionLine."Order Date";
                                    ItemGnl."Posting Date" := Rec."Posting Date";
                                    ItemGnl."Entry Type" := ItemGnl."entry type"::"Negative Adjmt.";
                                    ItemGnl."Item No." := RequisitionLine."No.";
                                    ItemGnl.Validate("Item No.");
                                    ItemGnl.Description := RequisitionLine.Description;
                                    ItemGnl."Job No." := RequisitionLine."Job No.";
                                    ItemGnl."Location Code" := RequisitionLine."Location Code";
                                    ItemGnl.Validate(ItemGnl."Job No.");
                                    ItemGnl."Job Task No." := RequisitionLine."Job Task No.";
                                    ItemGnl.Validate(ItemGnl."Job Task No.");

                                    ItemGnl.Quantity := RequisitionLine."Quantity To  Issue";
                                    ItemGnl.Validate(Quantity);
                                    ItemGnl."Unit of Measure Code" := RequisitionLine."Unit of Measure Code";
                                    ItemGnl.Validate("Unit of Measure Code");

                                    //ItemGnl."Taken By":="Taken By";


                                    ItemGnl."Line No." := Linenumber;
                                    ItemGnl."Job No." := Rec."Budget Item";//Ruth
                                    Rec.Validate(Rec."Budget Item");
                                    ItemGnl."Job Task No." := Rec."Job Task No.";
                                    Rec.Validate(Rec."Job Task No.");
                                    //MESSAGE('%1',RequisitionLine."Dimension Set ID");
                                    ItemGnl.CopyDim(RequisitionLine."Dimension Set ID");
                                    //ItemGnl."Dimension Set ID":=RequisitionLine."Dimension Set ID";
                                    //ItemGnl."Dimension Set ID":= DimMgt.GetDimensionSetID(RequisitionLine."Dimension Set ID");

                                    //ItemGnl.VALIDATE(ItemGnl."Dimension Set ID");

                                    ItemGnl.Insert(true);


                                    Linenumber := Linenumber + 10000;
                                until RequisitionLine.Next = 0;





                                //post journal.
                                ItemGnl.Reset;
                                ItemGnl.SetRange(ItemGnl."Journal Template Name", 'ITEM');
                                ItemGnl.SetRange(ItemGnl."Journal Batch Name", 'REQ');
                                //ItemGnl.SETRANGE(ItemGnl."Document No.","Requisition No.");
                                Codeunit.Run(Codeunit::"Item Jnl.-Post", ItemGnl);


                            end else begin
                                //ERROR('YOU HAVE NOT SELECTED ANY LINE.PLEASE CHECK!!');
                            end;

                            //END;

                            /*
                            FIND('=');

                            "Store keeper":=USERID;
                            "Issue Date":=TODAY;

                            "Issued?":=TRUE;
                            MODIFY;

                            RequisitionLine.RESET;
                            RequisitionLine.SETRANGE(RequisitionLine."Requistion No.","Requisition No.");
                            IF RequisitionLine.FIND('-') THEN BEGIN
                            REPEAT
                            RequisitionLine.Issued:=TRUE;
                            RequisitionLine.MODIFY;
                            UNTIL RequisitionLine.NEXT=0;
                            END;
                            */





                            /*

                            ItemGnl.RESET;
                            ItemGnl.SETRANGE(ItemGnl."Journal Template Name",'ITEM');
                            ItemGnl.SETRANGE(ItemGnl."Journal Batch Name",'REQ');
                            //ItemGnl.SETRANGE(ItemGnl."Document No.","Requisition No.");
                            IF ItemGnl.FIND('-') THEN
                            EXIT;

                            */


                            Rec."Taken By" := '';
                            Rec.Modify;
                            RequisitionLine.Reset;
                            RequisitionLine.SetRange(RequisitionLine."Document No.", Rec."No.");
                            RequisitionLine.SetRange(RequisitionLine."Document Type", Rec."Document Type");
                            RequisitionLine.SetRange(RequisitionLine.Select, true);
                            if RequisitionLine.Find('-') then begin
                                repeat
                                    RequisitionLine."Last Issued By" := UserId;
                                    RequisitionLine."Last Issue date" := Today;
                                    RequisitionLine."Last Issue Time" := Time;
                                    RequisitionLine."Quantity  issued" := RequisitionLine."Quantity  issued" + RequisitionLine."Quantity To  Issue";
                                    RequisitionLine."Quantity To  Issue" := 0;
                                    RequisitionLine.Select := false;
                                    if RequisitionLine."Quantity  issued" = RequisitionLine."Qty. Requested" then begin
                                        RequisitionLine."Fully Issued" := true;
                                    end;
                                    RequisitionLine.Modify;
                                until RequisitionLine.Next = 0;

                            end;


                            RequisitionLine.Reset;
                            RequisitionLine.SetRange(RequisitionLine."Document No.", Rec."No.");
                            RequisitionLine.SetRange(RequisitionLine."Document Type", Rec."Document Type");
                            RequisitionLine.SetRange(RequisitionLine."Fully Issued", false);

                            if RequisitionLine.Count > 0 then begin
                                //"Fully Issued":=TRUE;
                                //MODIFY;
                            end else begin
                                Rec."Fully Issued" := true;
                                Rec.Modify;

                            end;


                        end;

                        /*
                        
                        Req.RESET;
                        Req.SETRANGE(Req."Requisition No.","Requisition No.");
                        
                        REPORT.RUN(51061,TRUE,TRUE,Req);
                        END;
                        
                        */

                    end;
                }
                action("Post and &Print")
                {
                    ApplicationArea = Basic;
                    Caption = 'Post and &Print';
                    Ellipsis = true;
                    Image = PostPrint;
                    Promoted = true;
                    PromotedCategory = Process;
                    PromotedIsBig = true;
                    ShortCutKey = 'Shift+F9';

                    trigger OnAction()
                    begin
                        //SendToPosting(CODEUNIT::"Purch.-Post + Print");
                    end;
                }
                action("Post &Batch")
                {
                    ApplicationArea = Basic;
                    Caption = 'Post &Batch';
                    Ellipsis = true;
                    Image = PostBatch;
                    Promoted = true;
                    PromotedCategory = Process;

                    trigger OnAction()
                    begin
                        Report.RunModal(Report::"Batch Post Purchase Orders", true, true, Rec);
                        CurrPage.Update(false);
                    end;
                }
                action("Remove From Job Queue")
                {
                    ApplicationArea = Basic;
                    Caption = 'Remove From Job Queue';
                    Image = RemoveLine;
                    Visible = JobQueueActive;

                    trigger OnAction()
                    begin
                        Rec.CancelBackgroundPosting;
                    end;
                }
            }
        }
    }

    trigger OnOpenPage()
    var
        PurchasesPayablesSetup: Record "Purchases & Payables Setup";
    begin
        if User.Get(UserId) then begin
            if User."Procurement Manager" = false then begin
                if User."Procurement officer" = false then begin
                    Rec.SetRange(Rec."Requester ID", UserId);
                end else begin
                    Rec.FilterGroup(2);
                    Rec.SetRange(Rec."Assigned User ID", UserId);
                    Rec.FilterGroup(0)
                end;
            end;
        end;



        Rec.SetSecurityFilterOnRespCenter;

        JobQueueActive := PurchasesPayablesSetup.JobQueueActive;
    end;

    var
        DimMgt: Codeunit DimensionManagement;
        ReportPrint: Codeunit "Test Report-Print";
        DocPrint: Codeunit "Document-Print";
        [InDataSet]
        JobQueueActive: Boolean;
        User: Record "User Setup";
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
        Dim: Record "Dimension Set Entry";
}
