#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Report 70010 "Goods Received Note"
{
    DefaultLayout = RDLC;
    RDLCLayout = './Layouts/Goods Received Note.rdlc';
    UsageCategory = ReportsandAnalysis;

    dataset
    {
        dataitem("Purch. Rcpt. Header"; "Purch. Rcpt. Header")
        {
            RequestFilterFields = "No.";
            column(ReportForNavId_1; 1)
            {
            }
            column(BuyfromVendorNo_PurchRcptHeader; "Purch. Rcpt. Header"."Buy-from Vendor No.")
            {
            }
            column(No_PurchRcptHeader; "Purch. Rcpt. Header"."No.")
            {
            }
            column(PaytoVendorNo_PurchRcptHeader; "Purch. Rcpt. Header"."Pay-to Vendor No.")
            {
            }
            column(PaytoName_PurchRcptHeader; "Purch. Rcpt. Header"."Pay-to Name")
            {
            }
            column(PaytoName2_PurchRcptHeader; "Purch. Rcpt. Header"."Pay-to Name 2")
            {
            }
            column(OrderDate_PurchRcptHeader; "Purch. Rcpt. Header"."Order Date")
            {
            }
            column(PostingDate_PurchRcptHeader; "Purch. Rcpt. Header"."Posting Date")
            {
            }
            column(ExpectedReceiptDate_PurchRcptHeader; "Purch. Rcpt. Header"."Expected Receipt Date")
            {
            }
            column(PostingDescription_PurchRcptHeader; "Purch. Rcpt. Header"."Posting Description")
            {
            }
            column(PaymentTermsCode_PurchRcptHeader; "Purch. Rcpt. Header"."Payment Terms Code")
            {
            }
            column(DueDate_PurchRcptHeader; "Purch. Rcpt. Header"."Due Date")
            {
            }
            column(PaymentDiscount_PurchRcptHeader; "Purch. Rcpt. Header"."Payment Discount %")
            {
            }
            column(PmtDiscountDate_PurchRcptHeader; "Purch. Rcpt. Header"."Pmt. Discount Date")
            {
            }
            column(ShipmentMethodCode_PurchRcptHeader; "Purch. Rcpt. Header"."Shipment Method Code")
            {
            }
            column(LocationCode_PurchRcptHeader; "Purch. Rcpt. Header"."Location Code")
            {
            }
            column(ShortcutDimension1Code_PurchRcptHeader; "Purch. Rcpt. Header"."Shortcut Dimension 1 Code")
            {
            }
            column(ShortcutDimension2Code_PurchRcptHeader; "Purch. Rcpt. Header"."Shortcut Dimension 2 Code")
            {
            }
            column(VendorPostingGroup_PurchRcptHeader; "Purch. Rcpt. Header"."Vendor Posting Group")
            {
            }
            column(CurrencyCode_PurchRcptHeader; "Purch. Rcpt. Header"."Currency Code")
            {
            }
            column(CurrencyFactor_PurchRcptHeader; "Purch. Rcpt. Header"."Currency Factor")
            {
            }
            column(InvoiceDiscCode_PurchRcptHeader; "Purch. Rcpt. Header"."Invoice Disc. Code")
            {
            }
            column(LanguageCode_PurchRcptHeader; "Purch. Rcpt. Header"."Language Code")
            {
            }
            column(PurchaserCode_PurchRcptHeader; "Purch. Rcpt. Header"."Purchaser Code")
            {
            }
            column(OrderNo_PurchRcptHeader; "Purch. Rcpt. Header"."Order No.")
            {
            }
            column(Comment_PurchRcptHeader; "Purch. Rcpt. Header".Comment)
            {
            }
            column(NoPrinted_PurchRcptHeader; "Purch. Rcpt. Header"."No. Printed")
            {
            }
            column(OnHold_PurchRcptHeader; "Purch. Rcpt. Header"."On Hold")
            {
            }
            column(AppliestoDocType_PurchRcptHeader; "Purch. Rcpt. Header"."Applies-to Doc. Type")
            {
            }
            column(AppliestoDocNo_PurchRcptHeader; "Purch. Rcpt. Header"."Applies-to Doc. No.")
            {
            }
            column(BalAccountNo_PurchRcptHeader; "Purch. Rcpt. Header"."Bal. Account No.")
            {
            }
            column(VendorOrderNo_PurchRcptHeader; "Purch. Rcpt. Header"."Vendor Order No.")
            {
            }
            column(VendorShipmentNo_PurchRcptHeader; "Purch. Rcpt. Header"."Vendor Shipment No.")
            {
            }
            column(VATRegistrationNo_PurchRcptHeader; "Purch. Rcpt. Header"."VAT Registration No.")
            {
            }
            column(SelltoCustomerNo_PurchRcptHeader; "Purch. Rcpt. Header"."Sell-to Customer No.")
            {
            }
            column(ReasonCode_PurchRcptHeader; "Purch. Rcpt. Header"."Reason Code")
            {
            }
            column(GenBusPostingGroup_PurchRcptHeader; "Purch. Rcpt. Header"."Gen. Bus. Posting Group")
            {
            }
            column(TransactionType_PurchRcptHeader; "Purch. Rcpt. Header"."Transaction Type")
            {
            }
            column(TransportMethod_PurchRcptHeader; "Purch. Rcpt. Header"."Transport Method")
            {
            }
            column(VATCountryRegionCode_PurchRcptHeader; "Purch. Rcpt. Header"."VAT Country/Region Code")
            {
            }
            column(BuyfromVendorName_PurchRcptHeader; "Purch. Rcpt. Header"."Buy-from Vendor Name")
            {
            }
            column(BuyfromVendorName2_PurchRcptHeader; "Purch. Rcpt. Header"."Buy-from Vendor Name 2")
            {
            }
            column(BuyfromAddress_PurchRcptHeader; "Purch. Rcpt. Header"."Buy-from Address")
            {
            }
            column(BuyfromAddress2_PurchRcptHeader; "Purch. Rcpt. Header"."Buy-from Address 2")
            {
            }
            column(BuyfromCity_PurchRcptHeader; "Purch. Rcpt. Header"."Buy-from City")
            {
            }
            column(BuyfromContact_PurchRcptHeader; "Purch. Rcpt. Header"."Buy-from Contact")
            {
            }
            column(PaytoPostCode_PurchRcptHeader; "Purch. Rcpt. Header"."Pay-to Post Code")
            {
            }
            column(PaytoCounty_PurchRcptHeader; "Purch. Rcpt. Header"."Pay-to County")
            {
            }
            column(PaytoCountryRegionCode_PurchRcptHeader; "Purch. Rcpt. Header"."Pay-to Country/Region Code")
            {
            }
            column(BuyfromPostCode_PurchRcptHeader; "Purch. Rcpt. Header"."Buy-from Post Code")
            {
            }
            column(BuyfromCounty_PurchRcptHeader; "Purch. Rcpt. Header"."Buy-from County")
            {
            }
            column(BuyfromCountryRegionCode_PurchRcptHeader; "Purch. Rcpt. Header"."Buy-from Country/Region Code")
            {
            }
            column(ShiptoPostCode_PurchRcptHeader; "Purch. Rcpt. Header"."Ship-to Post Code")
            {
            }
            column(ShiptoCounty_PurchRcptHeader; "Purch. Rcpt. Header"."Ship-to County")
            {
            }
            column(ShiptoCountryRegionCode_PurchRcptHeader; "Purch. Rcpt. Header"."Ship-to Country/Region Code")
            {
            }
            column(BalAccountType_PurchRcptHeader; "Purch. Rcpt. Header"."Bal. Account Type")
            {
            }
            column(OrderAddressCode_PurchRcptHeader; "Purch. Rcpt. Header"."Order Address Code")
            {
            }
            column(EntryPoint_PurchRcptHeader; "Purch. Rcpt. Header"."Entry Point")
            {
            }
            column(Correction_PurchRcptHeader; "Purch. Rcpt. Header".Correction)
            {
            }
            column(DocumentDate_PurchRcptHeader; "Purch. Rcpt. Header"."Document Date")
            {
            }
            column(Area_PurchRcptHeader; "Purch. Rcpt. Header".Area)
            {
            }
            column(TransactionSpecification_PurchRcptHeader; "Purch. Rcpt. Header"."Transaction Specification")
            {
            }
            column(PaymentMethodCode_PurchRcptHeader; "Purch. Rcpt. Header"."Payment Method Code")
            {
            }
            column(NoSeries_PurchRcptHeader; "Purch. Rcpt. Header"."No. Series")
            {
            }
            column(OrderNoSeries_PurchRcptHeader; "Purch. Rcpt. Header"."Order No. Series")
            {
            }
            column(UserID_PurchRcptHeader; "Purch. Rcpt. Header"."User ID")
            {
            }
            column(SourceCode_PurchRcptHeader; "Purch. Rcpt. Header"."Source Code")
            {
            }
            column(TaxAreaCode_PurchRcptHeader; "Purch. Rcpt. Header"."Tax Area Code")
            {
            }
            column(TaxLiable_PurchRcptHeader; "Purch. Rcpt. Header"."Tax Liable")
            {
            }
            column(VATBusPostingGroup_PurchRcptHeader; "Purch. Rcpt. Header"."VAT Bus. Posting Group")
            {
            }
            column(VATBaseDiscount_PurchRcptHeader; "Purch. Rcpt. Header"."VAT Base Discount %")
            {
            }
            column(QuoteNo_PurchRcptHeader; "Purch. Rcpt. Header"."Quote No.")
            {
            }
            column(DimensionSetID_PurchRcptHeader; "Purch. Rcpt. Header"."Dimension Set ID")
            {
            }
            column(CampaignNo_PurchRcptHeader; "Purch. Rcpt. Header"."Campaign No.")
            {
            }
            column(BuyfromContactNo_PurchRcptHeader; "Purch. Rcpt. Header"."Buy-from Contact No.")
            {
            }
            column(PaytoContactno_PurchRcptHeader; "Purch. Rcpt. Header"."Pay-to Contact no.")
            {
            }
            column(ResponsibilityCenter_PurchRcptHeader; "Purch. Rcpt. Header"."Responsibility Center")
            {
            }
            column(RequestedReceiptDate_PurchRcptHeader; "Purch. Rcpt. Header"."Requested Receipt Date")
            {
            }
            column(PromisedReceiptDate_PurchRcptHeader; "Purch. Rcpt. Header"."Promised Receipt Date")
            {
            }
            column(LeadTimeCalculation_PurchRcptHeader; "Purch. Rcpt. Header"."Lead Time Calculation")
            {
            }
            column(InboundWhseHandlingTime_PurchRcptHeader; "Purch. Rcpt. Header"."Inbound Whse. Handling Time")
            {
            }
            column(RequisitionOfficer; UserSetup."Employee Name")
            {
            }
            column(DateRequisitionOfficer; ApproverDate[1])
            {
            }
            column(RequisitionOfficer_Signature; UserSetup.Picture)
            {
            }
            column(AuthorisingOfficer; UserSetup2."Employee Name")
            {
            }
            column(DateAuthorisingOfficer; ApproverDate[2])
            {
            }
            column(AuthorisingOfficer_Signature; UserSetup2.Picture)
            {
            }
            column(IssuedBy; UserSetup3."Employee Name")
            {
            }
            column(DateIssuedBy; ApproverDate[3])
            {
            }
            column(IssuedBy_Signature; UserSetup3.Picture)
            {
            }
            column(AuthorizedBy; UserSetup4."Employee Name")
            {
            }
            column(DateAuthorizedBy; ApproverDate[4])
            {
            }
            column(AuthorizedBy_Signature; UserSetup4.Picture)
            {
            }
            column(Designation1; Designation1)
            {
            }
            column(Designation2; Designation2)
            {
            }
            column(Designation3; Designation3)
            {
            }
            column(Designation4; Designation4)
            {
            }
            column(CompanyLogo; CompInfo.Picture)
            {
            }
            column(CompName; CompName)
            {
            }
            column(CompName2; CompName2)
            {
            }
            column(DeptName; DeptName)
            {
            }
            column(InvoiceNo; InvoiceNo)
            {
            }
            dataitem("Purch. Rcpt. Line"; "Purch. Rcpt. Line")
            {
                DataItemLink = "Document No." = field("No.");
                column(ReportForNavId_227; 227)
                {
                }
                column(BuyfromVendorNo_PurchRcptLine; "Purch. Rcpt. Line"."Buy-from Vendor No.")
                {
                }
                column(DocumentNo_PurchRcptLine; "Purch. Rcpt. Line"."Document No.")
                {
                }
                column(LineNo_PurchRcptLine; "Purch. Rcpt. Line"."Line No.")
                {
                }
                column(Type_PurchRcptLine; "Purch. Rcpt. Line".Type)
                {
                }
                column(No_PurchRcptLine; "Purch. Rcpt. Line"."No.")
                {
                }
                column(LocationCode_PurchRcptLine; "Purch. Rcpt. Line"."Location Code")
                {
                }
                column(PostingGroup_PurchRcptLine; "Purch. Rcpt. Line"."Posting Group")
                {
                }
                column(ExpectedReceiptDate_PurchRcptLine; "Purch. Rcpt. Line"."Expected Receipt Date")
                {
                }
                column(Description_PurchRcptLine; "Purch. Rcpt. Line".Description)
                {
                }
                column(Description2_PurchRcptLine; "Purch. Rcpt. Line"."Description 2")
                {
                }
                column(UnitofMeasure_PurchRcptLine; "Purch. Rcpt. Line"."Unit of Measure")
                {
                }
                column(Quantity_PurchRcptLine; "Purch. Rcpt. Line".Quantity)
                {
                }
                column(DirectUnitCost_PurchRcptLine; "Purch. Rcpt. Line"."Direct Unit Cost")
                {
                }
                column(UnitCostLCY_PurchRcptLine; "Purch. Rcpt. Line"."Unit Cost (LCY)")
                {
                }
                column(VAT_PurchRcptLine; "Purch. Rcpt. Line"."VAT %")
                {
                }
                column(LineDiscount_PurchRcptLine; "Purch. Rcpt. Line"."Line Discount %")
                {
                }
                column(UnitPriceLCY_PurchRcptLine; "Purch. Rcpt. Line"."Unit Price (LCY)")
                {
                }
                column(AllowInvoiceDisc_PurchRcptLine; "Purch. Rcpt. Line"."Allow Invoice Disc.")
                {
                }
                column(GrossWeight_PurchRcptLine; "Purch. Rcpt. Line"."Gross Weight")
                {
                }
                column(NetWeight_PurchRcptLine; "Purch. Rcpt. Line"."Net Weight")
                {
                }
                column(UnitsperParcel_PurchRcptLine; "Purch. Rcpt. Line"."Units per Parcel")
                {
                }
                column(UnitVolume_PurchRcptLine; "Purch. Rcpt. Line"."Unit Volume")
                {
                }
                column(AppltoItemEntry_PurchRcptLine; "Purch. Rcpt. Line"."Appl.-to Item Entry")
                {
                }
                column(UnitofMeasureCode_PurchRcptLine; "Purch. Rcpt. Line"."Unit of Measure Code")
                {
                }
                column(QuantityBase_PurchRcptLine; "Purch. Rcpt. Line"."Quantity (Base)")
                {
                }
                column(QtyInvoicedBase_PurchRcptLine; "Purch. Rcpt. Line"."Qty. Invoiced (Base)")
                {
                }
                column(CrossReferenceTypeNo_PurchRcptLine; "Purch. Rcpt. Line"."Item Reference Type No.")
                {
                }
                column(ItemCategoryCode_PurchRcptLine; "Purch. Rcpt. Line"."Item Category Code")
                {
                }
                column(Nonstock_PurchRcptLine; "Purch. Rcpt. Line".Nonstock)
                {
                }
                column(PurchasingCode_PurchRcptLine; "Purch. Rcpt. Line"."Purchasing Code")
                {
                }
                column(SpecialOrderSalesNo_PurchRcptLine; "Purch. Rcpt. Line"."Special Order Sales No.")
                {
                }
                column(SpecialOrderSalesLineNo_PurchRcptLine; "Purch. Rcpt. Line"."Special Order Sales Line No.")
                {
                }
                column(RequestedReceiptDate_PurchRcptLine; "Purch. Rcpt. Line"."Requested Receipt Date")
                {
                }
                column(PromisedReceiptDate_PurchRcptLine; "Purch. Rcpt. Line"."Promised Receipt Date")
                {
                }
                column(LeadTimeCalculation_PurchRcptLine; "Purch. Rcpt. Line"."Lead Time Calculation")
                {
                }
                column(InboundWhseHandlingTime_PurchRcptLine; "Purch. Rcpt. Line"."Inbound Whse. Handling Time")
                {
                }
                column(PlannedReceiptDate_PurchRcptLine; "Purch. Rcpt. Line"."Planned Receipt Date")
                {
                }
                column(OrderDate_PurchRcptLine; "Purch. Rcpt. Line"."Order Date")
                {
                }
                column(ItemChargeBaseAmount_PurchRcptLine; "Purch. Rcpt. Line"."Item Charge Base Amount")
                {
                }
                column(Correction_PurchRcptLine; "Purch. Rcpt. Line".Correction)
                {
                }
                column(ReturnReasonCode_PurchRcptLine; "Purch. Rcpt. Line"."Return Reason Code")
                {
                }
                column(QuantityReceived_PurchRcptLine; "Purch. Rcpt. Line"."Quantity Received")
                {
                }
                column(RoutingNo_PurchRcptLine; "Purch. Rcpt. Line"."Routing No.")
                {
                }
                column(OperationNo_PurchRcptLine; "Purch. Rcpt. Line"."Operation No.")
                {
                }
                column(WorkCenterNo_PurchRcptLine; "Purch. Rcpt. Line"."Work Center No.")
                {
                }
                column(ProdOrderLineNo_PurchRcptLine; "Purch. Rcpt. Line"."Prod. Order Line No.")
                {
                }
                column(OverheadRate_PurchRcptLine; "Purch. Rcpt. Line"."Overhead Rate")
                {
                }
                column(RoutingReferenceNo_PurchRcptLine; "Purch. Rcpt. Line"."Routing Reference No.")
                {
                }
                column(VATBaseAmount_PurchRcptLine; "Purch. Rcpt. Line"."VAT Base Amount")
                {
                }
            }

            trigger OnAfterGetRecord()
            begin

                CompInfo.Get;
                CompName2 := CompInfo."Name 2";
                CompName := CompInfo.Name;

                /*DimValues.RESET;
                DimValues.SETRANGE(Code,"Purch. Rcpt. Header"."Shortcut Dimension 1 Code");
                IF DimValues.FINDSET THEN BEGIN
                  DeptName:=DimValues.Name;
                  END;
                  */
                PurchInvoice.Reset;
                PurchInvoice.SetRange("Order No.", "Purch. Rcpt. Header"."Order No.");
                if PurchInvoice.FindSet then begin
                    InvoiceNo := PurchInvoice."No.";
                end;

            end;
        }
    }

    requestpage
    {

        layout
        {
        }

        actions
        {
        }
    }

    labels
    {
    }

    var
        ApprovalEntries: Record "Approval Entry";
        Approver: array[10] of Code[50];
        ApproverDate: array[10] of DateTime;
        UserSetup: Record "User Setup";
        UserSetup1: Record "User Setup";
        UserSetup2: Record "User Setup";
        UserSetup3: Record "User Setup";
        UserSetup4: Record "User Setup";
        i: Integer;
        Emp: Record Employee;
        USetup: Record "User Setup";
        ENo1: Code[10];
        Designation1: Code[50];
        JOBID: Record "Company Jobs";
        DesignationID1: Code[50];
        ENo2: Code[10];
        Designation2: Code[50];
        DesignationID2: Code[50];
        ENo3: Code[10];
        Designation3: Code[50];
        DesignationID3: Code[50];
        ENo4: Code[10];
        Designation4: Code[50];
        DesignationID4: Code[50];
        CompInfo: Record "Company Information";
        CompName: Text[100];
        CompName2: Text[100];
        DimValues: Record "Dimension Value";
        DeptName: Text[100];
        PurchInvoice: Record "Purch. Inv. Header";
        InvoiceNo: Code[50];
}
