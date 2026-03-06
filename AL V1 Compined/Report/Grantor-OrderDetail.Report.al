#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Report 65006 "Grantor - Order Detail"
{
    DefaultLayout = RDLC;
    RDLCLayout = './Layouts/Grantor - Order Detail.rdlc';
    ApplicationArea = Basic, Suite;
    Caption = 'Grantor - Order Detail';
    PreviewMode = PrintLayout;
    UsageCategory = ReportsAndAnalysis;

    dataset
    {
        dataitem(Customer; Customer)
        {
            PrintOnlyIfDetail = true;
            RequestFilterFields = "No.", "Search Name", Priority;
            column(ReportForNavId_6836; 6836)
            {
            }
            column(ShipmentPeriodDate; StrSubstNo(Text000, PeriodText))
            {
            }
            column(CompanyName; CompanyProperty.DisplayName)
            {
            }
            column(PrintAmountsInLCY; PrintAmountsInLCY)
            {
            }
            column(CustTableCapCustFilter; Customer.TableCaption + ': ' + CustFilter)
            {
            }
            column(CustFilter; CustFilter)
            {
            }
            column(SalesOrderLineFilter; StrSubstNo(Text001, SalesLineFilter))
            {
            }
            column(SalesLineFilter; SalesLineFilter)
            {
            }
            column(No_Customer; Customer."No.")
            {
                IncludeCaption = true;
            }
            column(Name_Customer; Customer.Name)
            {
            }
            column(PageGroupNo; PageGroupNo)
            {
            }
            column(CustOrderDetailCaption; CustOrderDetailCaptionLbl)
            {
            }
            column(PageCaption; PageCaptionLbl)
            {
            }
            column(AllAmtAreInLCYCaption; AllAmtAreInLCYCaptionLbl)
            {
            }
            column(ShipmentDateCaption; ShipmentDateCaptionLbl)
            {
            }
            column(QtyOnBackOrderCaption; QtyOnBackOrderCaptionLbl)
            {
            }
            column(OutstandingOrdersCaption; OutstandingOrdersCaptionLbl)
            {
            }
            dataitem("Sales Line"; "Sales Line")
            {
                DataItemLink = "Bill-to Customer No." = field("No."), "Shortcut Dimension 1 Code" = field("Global Dimension 1 Filter"), "Shortcut Dimension 2 Code" = field("Global Dimension 2 Filter");
                DataItemTableView = sorting("Document Type", "Bill-to Customer No.", "Currency Code") where("Document Type" = const(Order), "Outstanding Quantity" = filter(<> 0));
                RequestFilterFields = "Shipment Date";
                RequestFilterHeading = 'Sales Order Line';
                column(ReportForNavId_2844; 2844)
                {
                }
                column(SalesHeaderNo; SalesHeader."No.")
                {
                }
                column(SalesHeaderOrderDate; SalesHeader."Order Date")
                {
                }
                column(Description_SalesLine; "Sales Line".Description)
                {
                    IncludeCaption = true;
                }
                column(No_SalesLine; "Sales Line"."No.")
                {
                    IncludeCaption = true;
                }
                column(Type_SalesLine; "Sales Line".Type)
                {
                    IncludeCaption = true;
                }
                column(ShipmentDate_SalesLine; Format("Sales Line"."Shipment Date"))
                {
                }
                column(Quantity_SalesLine; "Sales Line".Quantity)
                {
                    IncludeCaption = true;
                }
                column(OutStandingQty_SalesLine; "Sales Line"."Outstanding Quantity")
                {
                    IncludeCaption = true;
                }
                column(BackOrderQty; BackOrderQty)
                {
                    DecimalPlaces = 0 : 5;
                }
                column(UnitPrice_SalesLine; "Sales Line"."Unit Price")
                {
                    AutoFormatExpression = "Currency Code";
                    AutoFormatType = 2;
                    IncludeCaption = true;
                }
                column(LineDiscAmt_SalesLine; "Sales Line"."Line Discount Amount")
                {
                    IncludeCaption = true;
                }
                column(InvDiscAmt_SalesLine; "Sales Line"."Inv. Discount Amount")
                {
                    AutoFormatExpression = "Currency Code";
                    AutoFormatType = 2;
                    IncludeCaption = true;
                }
                column(SalesOrderAmount; SalesOrderAmount)
                {
                    AutoFormatExpression = "Currency Code";
                    AutoFormatType = 1;
                }
                column(SalesHeaderCurrCode; SalesHeader."Currency Code")
                {
                }

                trigger OnAfterGetRecord()
                begin
                    NewOrder := "Sales Line"."Document No." <> SalesHeader."No.";
                    if NewOrder then
                        SalesHeader.Get(1, "Sales Line"."Document No.");
                    if "Sales Line"."Shipment Date" <= WorkDate then
                        BackOrderQty := "Sales Line"."Outstanding Quantity"
                    else
                        BackOrderQty := 0;
                    Currency.InitRoundingPrecision;
                    if "Sales Line"."VAT Calculation Type" in ["Sales Line"."vat calculation type"::"Normal VAT", "Sales Line"."vat calculation type"::"Reverse Charge VAT"] then
                        SalesOrderAmount :=
                          ROUND(
                            ("Sales Line".Amount + "Sales Line"."VAT Base Amount" * "Sales Line"."VAT %" / 100) * "Sales Line"."Outstanding Quantity" / "Sales Line".Quantity / (1 + "Sales Line"."VAT %" / 100),
                            Currency."Amount Rounding Precision")
                    else
                        SalesOrderAmount :=
                          ROUND(
                            "Sales Line"."Outstanding Amount" / (1 + "Sales Line"."VAT %" / 100),
                            Currency."Amount Rounding Precision");
                    SalesOrderAmountLCY := SalesOrderAmount;
                    if SalesHeader."Currency Code" <> '' then begin
                        if SalesHeader."Currency Factor" <> 0 then
                            SalesOrderAmountLCY :=
                              ROUND(
                                CurrExchRate.ExchangeAmtFCYToLCY(
                                  WorkDate, SalesHeader."Currency Code",
                                  SalesOrderAmountLCY, SalesHeader."Currency Factor"));
                        if PrintAmountsInLCY then begin
                            "Sales Line"."Unit Price" :=
                              ROUND(
                                CurrExchRate.ExchangeAmtFCYToLCY(
                                  WorkDate, SalesHeader."Currency Code",
                                  "Sales Line"."Unit Price", SalesHeader."Currency Factor"));
                            SalesOrderAmount := SalesOrderAmountLCY;
                        end;
                    end;
                    if SalesHeader."Prices Including VAT" then begin
                        "Sales Line"."Unit Price" := "Sales Line"."Unit Price" / (1 + "Sales Line"."VAT %" / 100);
                        "Sales Line"."Inv. Discount Amount" := "Sales Line"."Inv. Discount Amount" / (1 + "Sales Line"."VAT %" / 100);
                    end;
                    "Sales Line"."Inv. Discount Amount" := "Sales Line"."Inv. Discount Amount" * "Sales Line"."Outstanding Quantity" / "Sales Line".Quantity;
                    CurrencyCode2 := SalesHeader."Currency Code";
                    if PrintAmountsInLCY then
                        CurrencyCode2 := '';
                    CurrencyTotalBuffer.UpdateTotal(
                      CurrencyCode2,
                      SalesOrderAmount,
                      Counter1,
                      Counter1);
                end;
            }
            dataitem("Integer"; "Integer")
            {
                DataItemTableView = sorting(Number) where(Number = filter(1 ..));
                column(ReportForNavId_5444; 5444)
                {
                }
                column(TotalAmt_CurrTotalBuff; CurrencyTotalBuffer."Total Amount")
                {
                    AutoFormatExpression = CurrencyTotalBuffer."Currency Code";
                    AutoFormatType = 1;
                }
                column(CurrCode_CurrTotalBuff; CurrencyTotalBuffer."Currency Code")
                {
                }

                trigger OnAfterGetRecord()
                begin
                    if Integer.Number = 1 then
                        OK := CurrencyTotalBuffer.Find('-')
                    else
                        OK := CurrencyTotalBuffer.Next <> 0;
                    if not OK then
                        CurrReport.Break;

                    CurrencyTotalBuffer2.UpdateTotal(
                      CurrencyTotalBuffer."Currency Code",
                      CurrencyTotalBuffer."Total Amount",
                      Counter1,
                      Counter1);
                end;

                trigger OnPostDataItem()
                begin
                    CurrencyTotalBuffer.DeleteAll;
                end;
            }

            trigger OnAfterGetRecord()
            begin
                if PrintOnlyOnePerPage then
                    PageGroupNo := PageGroupNo + 1;
            end;

            trigger OnPreDataItem()
            begin
                PageGroupNo := 1;
                CurrReport.NewPagePerRecord := PrintOnlyOnePerPage;
            end;
        }
        dataitem(Integer2; "Integer")
        {
            DataItemTableView = sorting(Number) where(Number = filter(1 ..));
            column(ReportForNavId_4152; 4152)
            {
            }
            column(TotalAmt_CurrTotalBuff2; CurrencyTotalBuffer2."Total Amount")
            {
                AutoFormatExpression = CurrencyTotalBuffer2."Currency Code";
                AutoFormatType = 1;
            }
            column(CurrCode_CurrTotalBuff2; CurrencyTotalBuffer2."Currency Code")
            {
            }
            column(TotalCaption; TotalCaptionLbl)
            {
            }

            trigger OnAfterGetRecord()
            begin
                if Integer2.Number = 1 then
                    OK := CurrencyTotalBuffer2.Find('-')
                else
                    OK := CurrencyTotalBuffer2.Next <> 0;
                if not OK then
                    CurrReport.Break;
            end;

            trigger OnPostDataItem()
            begin
                CurrencyTotalBuffer2.DeleteAll;
            end;
        }
    }

    requestpage
    {
        SaveValues = true;

        layout
        {
            area(content)
            {
                group(Options)
                {
                    Caption = 'Options';
                    field(ShowAmountsInLCY; PrintAmountsInLCY)
                    {
                        ApplicationArea = Basic, Suite;
                        Caption = 'Show Amounts in LCY';
                        ToolTip = 'Specifies if the reported amounts are shown in the local currency.';
                    }
                    field(NewPagePerCustomer; PrintOnlyOnePerPage)
                    {
                        ApplicationArea = Basic, Suite;
                        Caption = 'New Page per Customer';
                        ToolTip = 'Specifies if each customer''s information is printed on a new page if you have chosen two or more customers to be included in the report.';
                    }
                }
            }
        }

        actions
        {
        }
    }

    labels
    {
        OrderNoCaption = 'Order No.';
    }

    trigger OnPreReport()
    var
        CaptionManagement: Codeunit "Caption Class";
    begin
        // CustFilter := CaptionManagement.GetRecordFiltersWithCaptions(Customer);
        SalesLineFilter := "Sales Line".GetFilters;
        PeriodText := "Sales Line".GetFilter("Shipment Date");
    end;

    var
        Text000: label 'Shipment Date: %1';
        Text001: label 'Sales Order Line: %1';
        CurrExchRate: Record "Currency Exchange Rate";
        CurrencyTotalBuffer: Record "Currency Total Buffer" temporary;
        CurrencyTotalBuffer2: Record "Currency Total Buffer" temporary;
        SalesHeader: Record "Sales Header";
        Currency: Record Currency;
        CustFilter: Text;
        SalesLineFilter: Text;
        SalesOrderAmount: Decimal;
        SalesOrderAmountLCY: Decimal;
        PrintAmountsInLCY: Boolean;
        PeriodText: Text;
        PrintOnlyOnePerPage: Boolean;
        BackOrderQty: Decimal;
        NewOrder: Boolean;
        OK: Boolean;
        Counter1: Integer;
        CurrencyCode2: Code[10];
        PageGroupNo: Integer;
        CustOrderDetailCaptionLbl: label 'Customer - Order Detail';
        PageCaptionLbl: label 'Page';
        AllAmtAreInLCYCaptionLbl: label 'All amounts are in LCY';
        ShipmentDateCaptionLbl: label 'Shipment Date';
        QtyOnBackOrderCaptionLbl: label 'Quantity on Back Order';
        OutstandingOrdersCaptionLbl: label 'Outstanding Orders';
        TotalCaptionLbl: label 'Total';

    procedure InitializeRequest(ShowAmountInLCY: Boolean; NewPagePerCustomer: Boolean)
    begin
        PrintAmountsInLCY := ShowAmountInLCY;
        PrintOnlyOnePerPage := NewPagePerCustomer;
    end;
}
