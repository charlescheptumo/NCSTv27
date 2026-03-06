#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Page 50078 "Posted Store Requisition"
{
    Caption = 'Approved Store Requisition';
    DeleteAllowed = false;
    Editable = true;
    InsertAllowed = false;
    ModifyAllowed = false;
    PageType = Document;
    RefreshOnActivate = true;
    SourceTable = "Purchase Header";
    SourceTableView = where("Document Type" = filter("Store Requisition"),
                            Status = const(Released),
                            Replenishment = const(false),
                            "Fully Issued" = const(true));

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
                    Visible = false;
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = Basic;
                }
                field("Requisition Type"; Rec."Requisition Type")
                {
                    ApplicationArea = Basic;
                    Editable = true;
                }
                field("Currency Code"; Rec."Currency Code")
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
                field("Shortcut Dimension 1 Code"; Rec."Shortcut Dimension 1 Code")
                {
                    ApplicationArea = Basic;
                    Editable = true;

                    trigger OnValidate()
                    begin
                        ShortcutDimension2CodeOnAfterV;
                    end;
                }
                field("Department Name"; Rec."Department Name")
                {
                    ApplicationArea = Basic;
                }
                field("Shortcut Dimension 2 Code"; Rec."Shortcut Dimension 2 Code")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field("Project Name"; Rec."Project Name")
                {
                    ApplicationArea = Basic;
                    Caption = 'Program Name';
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
                    Caption = 'Section Name';
                    Visible = false;
                }
                field("Requisition Amount"; Rec."Requisition Amount")
                {
                    ApplicationArea = Basic;
                    Style = Favorable;
                    StyleExpr = true;
                    Visible = false;
                }
                field("No. of Archived Versions"; Rec."No. of Archived Versions")
                {
                    ApplicationArea = Basic;
                    Importance = Additional;
                    Visible = false;
                }
            }
            part(PurchLines; "Posted SR Subform")
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
                        ApprovalEntries.SetRecordfilters(Database::"Purchase Header", 13, Rec."No.");
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
            }
            group("P&osting")
            {
                Caption = 'P&osting';
                Image = Post;
                action(Posti)
                {
                    ApplicationArea = Basic;
                    Caption = 'P&ost';
                    Ellipsis = true;
                    Image = PostOrder;
                    Promoted = true;
                    PromotedCategory = Process;
                    PromotedIsBig = true;
                    ShortCutKey = 'F9';
                    Visible = false;

                    trigger OnAction()
                    begin
                        //Post(CODEUNIT::"Purch.-Post (Yes/No)");


                        if Confirm('Are you sure you would like to issue this requisition?', false) = true then begin

                            if Rec."Requisition Type" = Rec."requisition type"::"Stock Replenishment" then
                                Error('YOU CANNOT ISSUE A STOCK REPLENISHMENT IR.PLEASE CHECK!!');



                            if Rec."Requisition Type" = Rec."requisition type"::Project then begin
                                //TESTFIELD("Taken By");
                                Rec.TestField(Rec."Posting Date");
                                //if


                                JobJnlLine.Reset;
                                JobJnlLine.SetRange(JobJnlLine."Journal Template Name", 'JOB');
                                JobJnlLine.SetRange(JobJnlLine."Journal Batch Name", 'SREQ');
                                JobJnlLine.DeleteAll(true);

                                JobJnlLine.Reset;
                                JobJnlLine.SetRange(JobJnlLine."Journal Template Name", 'JOB');
                                JobJnlLine.SetRange(JobJnlLine."Journal Batch Name", 'SREQ');
                                if JobJnlLine.FindLast then
                                    Linenumber := ItemGnl."Line No."
                                else
                                    Linenumber := 10000;

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


                                        JobJnlLine.Init;

                                        JobJnlLine."Journal Template Name" := 'JOB';
                                        JobJnlLine."Journal Batch Name" := 'SREQ';
                                        JobJnlLine."Line No." := Linenumber;
                                        //ItemGnl."Quantity Requested":=RequisitionLine.Quantity;
                                        //ItemGnl."Posting Date":=20070201D;
                                        //ItemGnl."Posting Date":=RequisitionLine."Order Date";
                                        JobJnlLine."Posting Date" := Rec."Posting Date";
                                        JobJnlLine.Validate(JobJnlLine."Posting Date");
                                        JobJnlLine."Document No." := Rec."No.";
                                        JobJnlLine.Validate("Document No.");
                                        JobJnlLine."Job No." := RequisitionLine."Job No.";
                                        JobJnlLine.Validate(JobJnlLine."Job No.");
                                        JobJnlLine."Job Task No." := RequisitionLine."Job Task No.";
                                        JobJnlLine.Validate(JobJnlLine."Job Task No.");
                                        JobJnlLine.Type := JobJnlLine.Type::Item;
                                        JobJnlLine.Validate(JobJnlLine.Type);
                                        JobJnlLine."No." := RequisitionLine."No.";
                                        JobJnlLine.Validate(JobJnlLine."No.");
                                        JobJnlLine.Description := RequisitionLine.Description;

                                        JobJnlLine."Location Code" := RequisitionLine."Location Code";
                                        JobJnlLine.Validate(JobJnlLine."Location Code");
                                        JobJnlLine.Quantity := RequisitionLine."Quantity To  Issue";
                                        JobJnlLine.Validate(JobJnlLine.Quantity);
                                        JobJnlLine."Unit of Measure Code" := RequisitionLine."Unit of Measure Code";

                                        JobJnlLine.Validate(JobJnlLine."Unit of Measure Code");
                                        JobJnlLine."Unit Cost" := RequisitionLine."Direct Unit Cost";
                                        JobJnlLine."Total Cost" := RequisitionLine."Line Amount";
                                        //MESSAGE('%1',RequisitionLine."Dimension Set ID");
                                        //JobJnlLine."Dimension Set ID":=RequisitionLine."Dimension Set ID";
                                        //JobJnlLine.VALIDATE(JobJnlLine."Dimension Set ID");
                                        JobJnlLine.Insert(true);

                                        JobJnlLine."Dimension Set ID" := RequisitionLine."Dimension Set ID";
                                        //JobJnlLine.VALIDATE(JobJnlLine."Dimension Set ID");
                                        JobJnlLine.Modify(true);
                                        /*,
                                        //ItemGnl."Entry Type":=ItemGnl."Entry Type"::"Negative Adjmt.";
                                        ItemGnl."Item No.":=RequisitionLine."No.";
                                        ItemGnl.VALIDATE("Item No.");
                                        ItemGnl.Description:=RequisitionLine.Description;
                                        ItemGnl."Job No.":=RequisitionLine."Job No.";
                                        ItemGnl."Location Code":=RequisitionLine."Location Code";
                                        ItemGnl.VALIDATE(ItemGnl."Job No.");
                                        ItemGnl."Job Task No.":=RequisitionLine."Job Task No.";
                                        ItemGnl.VALIDATE(ItemGnl."Job Task No.");

                                        ItemGnl.Quantity:=RequisitionLine."Quantity To  Issue";
                                        ItemGnl.VALIDATE(Quantity);
                                        ItemGnl."Unit of Measure Code":=RequisitionLine."Unit of Measure Code";
                                        ItemGnl.VALIDATE("Unit of Measure Code");

                                        //ItemGnl."ISBN No.":="Taken By";
                                          //Ushindi.....
                                            ItemGnl."Gen. Bus. Posting Group":=RequisitionLine."Gen. Bus. Posting Group";
                                            ItemGnl."External Document No.":= RequisitionLine."IR Line Reference";
                                          //Ushindi

                                        ItemGnl."Line No.":=Linenumber;
                                        //MESSAGE('%1',RequisitionLine."Dimension Set ID");
                                        ItemGnl.CopyDim(RequisitionLine."Dimension Set ID");
                                        //ItemGnl."Dimension Set ID":=RequisitionLine."Dimension Set ID";
                                        //ItemGnl."Dimension Set ID":= DimMgt.GetDimensionSetID(RequisitionLine."Dimension Set ID");

                                        //ItemGnl.VALIDATE(ItemGnl."Dimension Set ID");

                                        ItemGnl.INSERT(TRUE);
                                        */

                                        Linenumber := Linenumber + 10000;
                                    until RequisitionLine.Next = 0;


                                    //post journal.
                                    JobJnlLine.Reset;
                                    JobJnlLine.SetRange(JobJnlLine."Journal Template Name", 'JOB');
                                    JobJnlLine.SetRange(JobJnlLine."Journal Batch Name", 'SREQ');
                                    //ItemGnl.SETRANGE(ItemGnl."Document No.","Requisition No.");
                                    Codeunit.Run(Codeunit::"Job Jnl.-Post", JobJnlLine);



                                    //END ELSE BEGIN
                                    //ERROR('YOU HAVE NOT SELECTED ANY LINE.PLEASE CHECK!!');
                                end;


                            end else begin

                                //TESTFIELD("Taken By");
                                Rec.TestField(Rec."Posting Date");
                                //if
                                ItemGnl.Reset;
                                ItemGnl.SetRange(ItemGnl."Journal Template Name", 'ITEM');
                                ItemGnl.SetRange(ItemGnl."Journal Batch Name", 'REQ');
                                ItemGnl.DeleteAll(true);


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
                                        Message('RERE');
                                        Message(Rec."No.");

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

                                        //ItemGnl."ISBN No.":="Taken By";
                                        //Ushindi.....
                                        ItemGnl."Gen. Bus. Posting Group" := RequisitionLine."Gen. Bus. Posting Group";
                                        ItemGnl."External Document No." := RequisitionLine."IR Line Reference";
                                        //Ushindi

                                        ItemGnl."Line No." := Linenumber;
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

                            end;

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
                        //DocPrint.PrintPurchHeader(Rec);

                        Rec.SetRange(Rec."No.", Rec."No.");
                        Report.Run(70009, true, true, Rec);
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
        DimMgt: Codeunit DimensionManagement;
        JobJnlBatch: Record "Job Journal Template";
        JobJnlLine: Record "Job Journal Line";
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
}
