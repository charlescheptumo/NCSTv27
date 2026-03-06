#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Page 50064 "Fully Issued Stock Returns"
{
    Caption = 'Purchase Order';
    Editable = false;
    PageType = Document;
    RefreshOnActivate = true;
    SourceTable = "Purchase Header";
    SourceTableView = where("Document Type" = filter("Store Requisition"),
                            Status = const(Released),
                            "Fully Issued" = const(true),
                            "Requisition Type" = const("Stock Return"));
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
                    Visible = true;
                }
                field("Order Date"; Rec."Order Date")
                {
                    ApplicationArea = Basic;
                    Caption = 'Request Date';
                    Editable = false;
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Requisition Type"; Rec."Requisition Type")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Currency Code"; Rec."Currency Code")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    Visible = false;
                }
                field("Shortcut Dimension 2 Code"; Rec."Shortcut Dimension 2 Code")
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
                }
                field("Project Name"; Rec."Project Name")
                {
                    ApplicationArea = Basic;
                }
                field(Status; Rec.Status)
                {
                    ApplicationArea = Basic;
                    Visible = true;
                }
                field("No. of Archived Versions"; Rec."No. of Archived Versions")
                {
                    ApplicationArea = Basic;
                    Importance = Additional;
                }
                field("Taken By"; Rec."Taken By")
                {
                    ApplicationArea = Basic;
                }
                field("Posting Date"; Rec."Posting Date")
                {
                    ApplicationArea = Basic;
                }
            }
            part(PurchLines; "Approved SR Subform")
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
                        ApprovalEntries.Run;
                    end;
                }
                action("Posted Entries")
                {
                    ApplicationArea = Basic;
                    Caption = 'Posted Entries';
                    Image = ViewPostedOrder;
                    RunObject = Page "Value Entries";
                    RunPageLink = "Document No." = field("No.");
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
            group("P&osting")
            {
                Caption = 'P&osting';
                Image = Post;
                action(Postings)
                {
                    ApplicationArea = Basic;
                    Caption = 'P&ost';
                    Ellipsis = true;
                    Enabled = false;
                    Image = PostOrder;
                    Promoted = true;
                    PromotedCategory = Process;
                    PromotedIsBig = true;
                    ShortCutKey = 'F9';

                    trigger OnAction()
                    begin
                        //Post(CODEUNIT::"Purch.-Post (Yes/No)");


                        if Confirm('Are you sure you would like to Post this requisition?', false) = true then begin
                            Rec.TestField(Rec."Taken By");

                            //if
                            ItemGnl.Reset;
                            ItemGnl.SetRange(ItemGnl."Journal Template Name", 'ITEM');
                            ItemGnl.SetRange(ItemGnl."Journal Batch Name", 'REQ');
                            ItemGnl.DeleteAll;
                            /*
                           JLDim.RESET;
                           JLDim.SETRANGE(JLDim."Table ID",83);
                           JLDim.SETRANGE(JLDim."Journal Template Name",'ITEM');
                           JLDim.SETRANGE(JLDim."Journal Batch Name",'REQ');
                            JLDim.DELETEALL;
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
                                        Error('YOU CANNOT POST ZERO QUANTITIES.PLEASE CHECK!!');

                                    ItemGnl.Init;

                                    ItemGnl."Journal Template Name" := 'ITEM';
                                    ItemGnl."Journal Batch Name" := 'REQ';
                                    ItemGnl."Document No." := Rec."No.";
                                    //ItemGnl."Quantity Requested":=RequisitionLine.Quantity;
                                    //ItemGnl."Posting Date":=20070201D;
                                    ItemGnl."Posting Date" := RequisitionLine."Order Date";
                                    ItemGnl."Entry Type" := ItemGnl."entry type"::"Positive Adjmt.";
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
                                    ItemGnl."Dimension Set ID" := RequisitionLine."Dimension Set ID";


                                    //ItemGnl."ISBN No.":="Taken By";//Commented by Morris During Upgrade
                                    ItemGnl."Line No." := Linenumber + 10000;
                                    ItemGnl.Insert;



                                    Linenumber := Linenumber + 10000;
                                until RequisitionLine.Next = 0;


                                /*
                                ItemGnl.RESET;
                                ItemGnl.SETRANGE(ItemGnl."Journal Template Name",'ITEM');
                                ItemGnl.SETRANGE(ItemGnl."Journal Batch Name",'REQ');

                                IF ItemJnlLine.FIND('-') THEN BEGIN
                                REPEAT
                                //i:=0;
                                DocDimen.RESET;
                                DocDimen.SETRANGE(DocDimen."Table ID",38);
                                DocDimen.SETRANGE(DocDimen."Document Type",DocDimen."Document Type"::"Store Requisition");
                                DocDimen.SETRANGE(DocDimen."Document No.",ItemJnlLine."Document No.");
                                //DocDimen.SETRANGE(DocDimen."Line No.",RequisitionLine."Line No.");

                                IF DocDimen.FIND('-') THEN BEGIN
                                REPEAT

                                JLDim.INIT;
                                JLDim."Table ID":=83;
                                JLDim.VALIDATE("Table ID");
                                JLDim."Journal Template Name":='ITEM';
                                JLDim.VALIDATE("Journal Template Name");
                                JLDim."Journal Batch Name":='REQ';
                                JLDim.VALIDATE("Journal Batch Name");
                                JLDim."Journal Line No.":=ItemJnlLine."Line No.";
                                JLDim.VALIDATE("Journal Line No.");

                                JLDim."Allocation Line No.":=0;
                                JLDim.VALIDATE(JLDim."Allocation Line No.");

                                JLDim."Dimension Code":=DocDimen."Dimension Code";
                                JLDim.VALIDATE("Dimension Code");
                                JLDim."Dimension Value Code":=DocDimen."Dimension Value Code";
                                JLDim.VALIDATE("Dimension Value Code");
                                JLDim."New Dimension Value Code":='';
                                JLDim.VALIDATE(JLDim."New Dimension Value Code");
                                JLDim.INSERT(TRUE);
                                //JLDim.VALIDATE("Dimension Value Code");
                                //MESSAGE('%1',Linenumber);

                                //i:=i+1;
                                UNTIL DocDimen.NEXT=0;
                                END;

                                UNTIL ItemJnlLine.NEXT=0;
                                END;
                                */



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
                separator(Action611)
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
                        DocPrint.PrintPurchHeader(Rec);
                    end;
                }
            }
        }
    }

    trigger OnAfterGetRecord()
    begin
        JobQueueVisible := Rec."Job Queue Status" = Rec."job queue status"::"Scheduled for Posting";
    end;

    trigger OnDeleteRecord(): Boolean
    begin
        CurrPage.SaveRecord;
        exit(Rec.ConfirmDeletion);
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
        Dim: Record "Dimension Set Entry";

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
}
