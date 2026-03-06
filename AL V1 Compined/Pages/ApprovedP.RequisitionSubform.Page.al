#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Page 70123 "Approved P.Requisition Subform"
{
    AutoSplitKey = true;
    Caption = 'Lines';
    DelayedInsert = true;
    LinksAllowed = false;
    MultipleNewLines = true;
    PageType = ListPart;
    SourceTable = "Purchase Line";
    SourceTableView = where("Document Type" = filter("Purchase Requisition"));

    layout
    {
        area(content)
        {
            repeater(Control1)
            {
                field("Procurement Plan"; Rec."Procurement Plan")
                {
                    ApplicationArea = Basic;
                    Caption = 'Budget';
                    Visible = false;
                }
                field("Procurement Plan Item"; Rec."Procurement Plan Item")
                {
                    ApplicationArea = Basic;
                    Caption = 'Plan Item';
                    Visible = false;

                    trigger OnValidate()
                    begin
                        QuantityEditable := false;
                        LineAmountEditable := false;
                        AmountEditable := false;
                        DirectAmtEditable := false;
                        Planitems.Reset;
                        Planitems.SetRange("Plan Item No", Rec."Procurement Plan Item");
                        if Planitems.Find('-') then begin
                            if Planitems."Procurement Type" = Planitems."procurement type"::Goods then begin
                                QuantityEditable := true;
                                LineAmountEditable := true;
                                DirectAmtEditable := true;
                                AmountEditable := false;
                            end;
                            if Planitems."Procurement Type" = Planitems."procurement type"::Service then begin
                                QuantityEditable := false;
                                LineAmountEditable := false;
                                DirectAmtEditable := true;
                                AmountEditable := true;
                            end;
                        end;
                    end;
                }
                field("Line No."; Rec."Line No.")
                {
                    ApplicationArea = Basic;
                    Caption = 'No.';
                    Editable = LineNumberEditable;
                }
                field(Category; Rec.Category)
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field("General Item Category"; Rec."General Item Category")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field("Item Category"; Rec."Item Category")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field("Service/Item Code"; Rec."Service/Item Code")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field(Type; Rec.Type)
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ShowMandatory = true;
                    Visible = false;

                    trigger OnValidate()
                    begin
                        FillItem := false;
                        FillService := false;
                        if Rec.Type = Rec.Type::Item then begin
                            Message('one');
                            FillItem := true;
                            FillService := false;
                        end;
                        if Rec.Type = Rec.Type::"G/L Account" then begin
                            Message('two');
                            FillItem := false;
                            FillService := true;
                        end;
                    end;
                }
                field("No."; Rec."No.")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ShowMandatory = true;
                    Visible = false;

                    trigger OnValidate()
                    begin
                        Rec.ShowShortcutDimCode(ShortcutDimCode);
                        NoOnAfterValidate;
                    end;
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = Basic;
                    ShowMandatory = true;
                    Visible = false;
                }
                field("Item Description"; Rec."Item Description")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field(Specifications; Rec.Specifications)
                {
                    ApplicationArea = Basic;
                    MultiLine = true;

                    trigger OnValidate()
                    begin
                        /*CALCFIELDS(Specifications);
                        Specifications.c
                        
                        CALCFIELDS(Objective);
                        Rec.Objective.CREATEINSTREAM(ObjInstr);
                        Obj.READ(ObjInstr);
                        
                        IF ObjText<>FORMAT(Obj) THEN
                        BEGIN
                         CLEAR(Objective);
                         CLEAR(Obj);
                         Obj.ADDTEXT(ObjText);
                         Rec.Objective.CREATEOUTSTREAM(ObjOutStr);
                         Obj.WRITE(ObjOutStr);
                         //MODIFY;
                        END;*/

                    end;
                }
                field("Variant Code"; Rec."Variant Code")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field("Unit of Measure Code"; Rec."Unit of Measure Code")
                {
                    ApplicationArea = Basic;
                    Editable = UOMEditable;
                    Visible = true;
                }
                field("Job No."; Rec."Job No.")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Job Task No."; Rec."Job Task No.")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Qty. Requested"; Rec."Qty. Requested")
                {
                    ApplicationArea = Basic;
                    Editable = QTYRquestedEditable;
                }
                field("Direct Unit Cost Inc. VAT"; Rec."Direct Unit Cost Inc. VAT")
                {
                    ApplicationArea = Basic;
                }
                field("Direct Unit Cost"; Rec."Direct Unit Cost")
                {
                    ApplicationArea = Basic;
                    BlankZero = true;
                   //cc//  OptionCaption = 'Direct Unit Cost Inc. VAT';
                    Visible = false;

                    trigger OnValidate()
                    begin
                        //TESTFIELD(Quantity);
                        //IF "Available Funds"<"Line Amount" THEN
                        //ERROR(Text002,"Available Funds");
                    end;
                }
                field("Unit Cost (LCY)"; Rec."Unit Cost (LCY)")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field(Amount; Rec.Amount)
                {
                    ApplicationArea = Basic;
                    Caption = 'Amount Inc.VAT';
                    Editable = AmountEditable;
                }
                field("VAT Prod. Posting Group"; Rec."VAT Prod. Posting Group")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field("Vote Item"; Rec."Vote Item")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field("Vote Amount"; Rec."Vote Amount")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field("Actual To Date"; Rec."Actual To Date")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field("Approved Unit Cost"; Rec."Approved Unit Cost")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field("Approved Requisition Amount"; Rec."Approved Requisition Amount")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field("Budget Commitments"; Rec."Budget Commitments")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field("Available Funds"; Rec."Available Funds")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field("Quantity In Store"; Rec."Quantity In Store")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field("Qty. on Purch. Order"; Rec."Qty. on Purch. Order")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field("Shortcut Dimension 1 Code"; Rec."Shortcut Dimension 1 Code")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field("Shortcut Dimension 2 Code"; Rec."Shortcut Dimension 2 Code")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field("ShortcutDimCode[3]"; ShortcutDimCode[3])
                {
                    ApplicationArea = Basic;
                    CaptionClass = '1,2,3';
                    Visible = false;

                    trigger OnLookup(var Text: Text): Boolean
                    begin
                        Rec.LookupShortcutDimCode(3, ShortcutDimCode[3]);
                    end;

                    trigger OnValidate()
                    begin
                        Rec.ValidateShortcutDimCode(3, ShortcutDimCode[3]);
                    end;
                }
                field("ShortcutDimCode[4]"; ShortcutDimCode[4])
                {
                    ApplicationArea = Basic;
                    CaptionClass = '1,2,4';
                    Visible = false;

                    trigger OnLookup(var Text: Text): Boolean
                    begin
                        Rec.LookupShortcutDimCode(4, ShortcutDimCode[4]);
                    end;

                    trigger OnValidate()
                    begin
                        Rec.ValidateShortcutDimCode(4, ShortcutDimCode[4]);
                    end;
                }
                field("ShortcutDimCode[5]"; ShortcutDimCode[5])
                {
                    ApplicationArea = Basic;
                    CaptionClass = '1,2,5';
                    Visible = false;

                    trigger OnLookup(var Text: Text): Boolean
                    begin
                        Rec.LookupShortcutDimCode(5, ShortcutDimCode[5]);
                    end;

                    trigger OnValidate()
                    begin
                        Rec.ValidateShortcutDimCode(5, ShortcutDimCode[5]);
                    end;
                }
                field("ShortcutDimCode[6]"; ShortcutDimCode[6])
                {
                    ApplicationArea = Basic;
                    CaptionClass = '1,2,6';
                    Visible = false;

                    trigger OnLookup(var Text: Text): Boolean
                    begin
                        Rec.LookupShortcutDimCode(6, ShortcutDimCode[6]);
                    end;

                    trigger OnValidate()
                    begin
                        Rec.ValidateShortcutDimCode(6, ShortcutDimCode[6]);
                    end;
                }
                field("ShortcutDimCode[7]"; ShortcutDimCode[7])
                {
                    ApplicationArea = Basic;
                    CaptionClass = '1,2,7';
                    Visible = false;

                    trigger OnLookup(var Text: Text): Boolean
                    begin
                        Rec.LookupShortcutDimCode(7, ShortcutDimCode[7]);
                    end;

                    trigger OnValidate()
                    begin
                        Rec.ValidateShortcutDimCode(7, ShortcutDimCode[7]);
                    end;
                }
                field("ShortcutDimCode[8]"; ShortcutDimCode[8])
                {
                    ApplicationArea = Basic;
                    CaptionClass = '1,2,8';
                    Visible = false;

                    trigger OnLookup(var Text: Text): Boolean
                    begin
                        Rec.LookupShortcutDimCode(8, ShortcutDimCode[8]);
                    end;

                    trigger OnValidate()
                    begin
                        Rec.ValidateShortcutDimCode(8, ShortcutDimCode[8]);
                    end;
                }
                field("Gen. Bus. Posting Group"; Rec."Gen. Bus. Posting Group")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field("Line Discount %"; Rec."Line Discount %")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field("Line Discount Amount"; Rec."Line Discount Amount")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
            }
        }
    }

    actions
    {
        area(processing)
        {
            group("&Line")
            {
                Caption = '&Line';
                Image = Line;
                group("Item Availability by")
                {
                    Caption = 'Item Availability by';
                    Image = ItemAvailability;
                }
                action(Dimensions)
                {
                    ApplicationArea = Basic;
                    Caption = 'Dimensions';
                    Image = Dimensions;
                    ShortCutKey = 'Shift+Ctrl+D';

                    trigger OnAction()
                    begin
                        Rec.ShowDimensions;
                    end;
                }
                action("Co&mments")
                {
                    ApplicationArea = Basic;
                    Caption = 'Co&mments';
                    Image = ViewComments;

                    trigger OnAction()
                    begin
                        Rec.ShowLineComments;
                    end;
                }
                action(ItemChargeAssignment)
                {
                    ApplicationArea = Basic;
                    Caption = 'Item Charge &Assignment';

                    trigger OnAction()
                    begin
                        Rec.ShowItemChargeAssgnt;
                    end;
                }
            }
            group("F&unctions")
            {
                Caption = 'F&unctions';
                Image = "Action";
                action("E&xplode BOM")
                {
                    ApplicationArea = Basic;
                    Caption = 'E&xplode BOM';
                    Image = ExplodeBOM;

                    trigger OnAction()
                    begin
                        ExplodeBOM;
                    end;
                }
                action("Insert Ext. Texts")
                {
                    ApplicationArea = Basic;
                    Caption = 'Insert &Ext. Texts';
                    Image = Text;

                    trigger OnAction()
                    begin
                        InsertExtendedText(true);
                    end;
                }
                action(Reserve)
                {
                    ApplicationArea = Basic;
                    Caption = '&Reserve';
                    Ellipsis = true;
                    Image = Reserve;

                    trigger OnAction()
                    begin
                        Rec.Find;
                        Rec.ShowReservation;
                    end;
                }
                action(OrderTracking)
                {
                    ApplicationArea = Basic;
                    Caption = 'Order &Tracking';
                    Image = OrderTracking;

                    trigger OnAction()
                    begin
                        ShowTracking;
                    end;
                }
            }
            group("O&rder")
            {
                Caption = 'O&rder';
                Image = "Order";
                group("Dr&op Shipment")
                {
                    Caption = 'Dr&op Shipment';
                    Image = Delivery;
                    action("Sales &Order")
                    {
                        ApplicationArea = Basic;
                        Caption = 'Sales &Order';
                        Image = Document;

                        trigger OnAction()
                        begin
                            OpenSalesOrderForm;
                        end;
                    }
                }
                group("Speci&al Order")
                {
                    Caption = 'Speci&al Order';
                    Image = SpecialOrder;
                    action(Action1901038504)
                    {
                        ApplicationArea = Basic;
                        Caption = 'Sales &Order';
                        Image = Document;

                        trigger OnAction()
                        begin
                            OpenSpecOrderSalesOrderForm;
                        end;
                    }
                }
            }
        }
    }

    trigger OnAfterGetRecord()
    begin
        Rec.ShowShortcutDimCode(ShortcutDimCode);
    end;

    trigger OnDeleteRecord(): Boolean
    var
        ReservePurchLine: Codeunit "Purch. Line-Reserve";
    begin
    end;

    trigger OnNewRecord(BelowxRec: Boolean)
    begin
        Rec.InitType;
        Clear(ShortcutDimCode);

        LineNumberEditable := false;
        SpecificationEditable := false;
        UOMEditable := false;
        QTYRquestedEditable := false;


        PHeader.Reset;
        PHeader.SetRange("No.", Rec."Document No.");
        if PHeader.Find('-') then begin
            if (PHeader.Status = PHeader.Status::Open) then begin
                LineNumberEditable := true;
                SpecificationEditable := true;
                UOMEditable := true;
                QTYRquestedEditable := true;
            end;

            if (PHeader.Status <> PHeader.Status::Released) then begin
                LineNumberEditable := false;
                SpecificationEditable := false;
                UOMEditable := false;
                QTYRquestedEditable := false;
            end;
        end;
    end;

    trigger OnOpenPage()
    begin
        LineNumberEditable := false;
        SpecificationEditable := false;
        UOMEditable := false;
        QTYRquestedEditable := false;


        PHeader.Reset;
        PHeader.SetRange("No.", Rec."Document No.");
        if PHeader.Find('-') then begin
            if (PHeader.Status = PHeader.Status::Open) then begin
                Message('Testing one');
                LineNumberEditable := true;
                SpecificationEditable := true;
                UOMEditable := true;
                QTYRquestedEditable := true;
            end;

            if (PHeader.Status <> PHeader.Status::Released) then begin
                Message('Testing two');
                LineNumberEditable := false;
                SpecificationEditable := false;
                UOMEditable := false;
                QTYRquestedEditable := false;
            end;
        end;
    end;

    var
        TransferExtendedText: Codeunit "Transfer Extended Text";
        ItemAvailFormsMgt: Codeunit "Item Availability Forms Mgt";
        ShortcutDimCode: array[8] of Code[20];
        UpdateAllowedVar: Boolean;
        Text000: label 'Unable to execute this function while in view only mode.';
        PurchHeader: Record "Purchase Header";
        PurchPriceCalcMgt: Codeunit "Purch. Price Calc. Mgt.";
        Text001: label 'You cannot use the Explode BOM function because a prepayment of the purchase order has been invoiced.';
        Text002: label 'The Amount Requested is more than the available funds.The available funds are Kshs. %1';
        "----------Editable.............................................................": Integer;
        AmountEditable: Boolean;
        LineAmountEditable: Boolean;
        QuantityEditable: Boolean;
        DirectAmtEditable: Boolean;
        FillItem: Boolean;
        FillService: Boolean;
        Planitems: Record "Procurement Plan 1";
        "-------------Added for Approved PRQ------------------------------------": Integer;
        LineNumberEditable: Boolean;
        SpecificationEditable: Boolean;
        UOMEditable: Boolean;
        QTYRquestedEditable: Boolean;
        PHeader: Record "Purchase Header";


    procedure ApproveCalcInvDisc()
    begin
        Codeunit.Run(Codeunit::"Purch.-Disc. (Yes/No)", Rec);
    end;


    procedure CalcInvDisc()
    begin
        Codeunit.Run(Codeunit::"Purch.-Calc.Discount", Rec);
    end;


    procedure ExplodeBOM()
    begin
        if Rec."Prepmt. Amt. Inv." <> 0 then
            Error(Text001);
        Codeunit.Run(Codeunit::"Purch.-Explode BOM", Rec);
    end;


    procedure OpenSalesOrderForm()
    var
        SalesHeader: Record "Sales Header";
        SalesOrder: Page "Sales Order";
    begin
        Rec.TestField(Rec."Sales Order No.");
        SalesHeader.SetRange("No.", Rec."Sales Order No.");
        SalesOrder.SetTableview(SalesHeader);
        SalesOrder.Editable := false;
        SalesOrder.Run;
    end;


    procedure InsertExtendedText(Unconditionally: Boolean)
    begin
    end;


    procedure ShowTracking()
    var
        TrackingForm: Page "Order Tracking";
    begin
    end;


    procedure OpenSpecOrderSalesOrderForm()
    var
        SalesHeader: Record "Sales Header";
        SalesOrder: Page "Sales Order";
    begin
        Rec.TestField(Rec."Special Order Sales No.");
        SalesHeader.SetRange("No.", Rec."Special Order Sales No.");
        SalesOrder.SetTableview(SalesHeader);
        SalesOrder.Editable := false;
        SalesOrder.Run;
    end;


    procedure UpdateForm(SetSaveRecord: Boolean)
    begin
        CurrPage.Update(SetSaveRecord);
    end;


    procedure SetUpdateAllowed(UpdateAllowed: Boolean)
    begin
        UpdateAllowedVar := UpdateAllowed;
    end;


    procedure UpdateAllowed(): Boolean
    begin
        if UpdateAllowedVar = false then begin
            Message(Text000);
            exit(false);
        end;
        exit(true);
    end;


    procedure ShowPrices()
    begin
    end;


    procedure ShowLineDisc()
    begin
    end;

    local procedure NoOnAfterValidate()
    begin
        InsertExtendedText(false);
        if (Rec.Type = Rec.Type::"Charge (Item)") and (Rec."No." <> xRec."No.") and
           (xRec."No." <> '')
        then
            CurrPage.SaveRecord;
    end;

    local procedure CrossReferenceNoOnAfterValidat()
    begin
        InsertExtendedText(false);
    end;
}
