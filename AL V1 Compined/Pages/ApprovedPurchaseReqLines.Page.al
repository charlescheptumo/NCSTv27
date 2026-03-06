#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Page 50091 "Approved Purchase Req Lines"
{
    SourceTable = "Purchase Line";
    SourceTableView = where("Document Type" = filter("Purchase Requisition"),
                            Ordered = const(false),
                            Status = const(Released),
                            "Fully Issued" = const(false));

    layout
    {
        area(content)
        {
            group(Control2)
            {
                field(Select2; Rec.Select2)
                {
                    ApplicationArea = Basic;
                }
                field("Dimension Set ID"; Rec."Dimension Set ID")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field("Document Type"; Rec."Document Type")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field(Ordered; Rec.Ordered)
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field(Decision; Rec.Decision)
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field("PO Type"; Rec."PO Type")
                {
                    ApplicationArea = Basic;
                }
                field("Vote Item"; Rec."Vote Item")
                {
                    ApplicationArea = Basic;
                }
                field("Buy-from Vendor No."; Rec."Buy-from Vendor No.")
                {
                    ApplicationArea = Basic;
                }
                field("PO Number"; Rec."PO Number")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field("Selected By"; Rec."Selected By")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Document No."; Rec."Document No.")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Requestor ID"; Rec."Requestor ID")
                {
                    ApplicationArea = Basic;
                }
                field(Category; Rec.Category)
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Service/Item Code"; Rec."Service/Item Code")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field(Type; Rec.Type)
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("No."; Rec."No.")
                {
                    ApplicationArea = Basic;
                    Editable = false;

                    trigger OnValidate()
                    begin
                        Rec.ShowShortcutDimCode(ShortcutDimCode);
                        NoOnAfterValidate;
                    end;
                }
                field("Type of Vehicle"; Rec."Type of Vehicle")
                {
                    ApplicationArea = Basic;
                }
                field("Vehicle Description"; Rec."Vehicle Description")
                {
                    ApplicationArea = Basic;
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Direct Unit Cost"; Rec."Direct Unit Cost")
                {
                    ApplicationArea = Basic;
                    BlankZero = true;
                    Editable = false;
                }
                field("Unit Cost (LCY)"; Rec."Unit Cost (LCY)")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    Visible = false;
                }
                field("VAT %"; Rec."VAT %")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Gen. Bus. Posting Group"; Rec."Gen. Bus. Posting Group")
                {
                    ApplicationArea = Basic;
                }
                field("Gen. Prod. Posting Group"; Rec."Gen. Prod. Posting Group")
                {
                    ApplicationArea = Basic;
                }
                field("VAT Prod. Posting Group"; Rec."VAT Prod. Posting Group")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Line Amount"; Rec."Line Amount")
                {
                    ApplicationArea = Basic;
                    BlankZero = true;
                    Editable = false;
                }
                field(Amount; Rec.Amount)
                {
                    ApplicationArea = Basic;
                }
                field("Amount Including VAT"; Rec."Amount Including VAT")
                {
                    ApplicationArea = Basic;
                }
            }
        }
    }

    actions
    {
    }

    var
        TransferExtendedText: Codeunit "Transfer Extended Text";
        ItemAvailFormsMgt: Codeunit "Item Availability Forms Mgt";
        ShortcutDimCode: array[8] of Code[20];
        UpdateAllowedVar: Boolean;
        PurchHeader: Record "Purchase Header";
        PurchPriceCalcMgt: Codeunit "Purch. Price Calc. Mgt.";
        PO: Record "Purchase Header";
        PURCHLINE: Record "Purchase Line";
        ReqLine: Record "Purchase Line";
        ReqLine2: Record "Purchase Line";
        LineNo: Integer;
        Acct: Record "G/L Account";
        DocDim: Record "Dimension Set Entry";
        DocDim2: Record "Dimension Set Entry";
        GLSetup: Record "Purchases & Payables Setup";
        NoSeriesMgt: Codeunit "No. Series";
        LineNo2: Code[20];
        gCuNoSeriesMngmnt: Codeunit "No. Series";
        PurchaseHeader: Record "Purchase Header";
        purchaseLine: Record "Purchase Line";
        RequsitionManager: Codeunit "Requisition Management";
        UserSetup: Record "User Setup";
        Text000: label 'Unable to execute this function while in view only mode.';
        Text001: label 'You cannot use the Explode BOM function because a prepayment of the purchase order has been invoiced.';
        Text002: label 'The seleceted lines will be assigned to the specified LPO/LSO. Are you sure this is what you want?';
        Text003: label 'The seleceted lines will be used to create LPO/LSO. Are you sure this is what you want?';
        Text004: label 'Do you want to proceed and perform the selected action on the purchase requisition lines?';
        Text005: label 'Purchase Review process completed';
        Text006: label 'Access to approved purchase Lines is denied!';


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
        if TransferExtendedText.PurchCheckIfAnyExtText(Rec, Unconditionally) then begin
            CurrPage.SaveRecord;
            TransferExtendedText.InsertPurchExtText(Rec);
        end;
        if TransferExtendedText.MakeUpdate then
            UpdateForm(true);
    end;


    procedure ShowTracking()
    var
        TrackingForm: Page "Order Tracking";
    begin
        TrackingForm.SetPurchLine(Rec);
        TrackingForm.RunModal;
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
        PurchHeader.Get(Rec."Document Type", Rec."Document No.");
        Clear(PurchPriceCalcMgt);
        PurchPriceCalcMgt.GetPurchLinePrice(PurchHeader, Rec);
    end;


    procedure ShowLineDisc()
    begin
        PurchHeader.Get(Rec."Document Type", Rec."Document No.");
        Clear(PurchPriceCalcMgt);
        PurchPriceCalcMgt.GetPurchLineLineDisc(PurchHeader, Rec);
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
