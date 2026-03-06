#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Report 65007 "Grantor - Balance to Date"
{
    DefaultLayout = RDLC;
    RDLCLayout = './Layouts/Grantor - Balance to Date.rdlc';
    ApplicationArea = Basic, Suite;
    Caption = 'Grantor - Balance to Date';
    UsageCategory = ReportsAndAnalysis;

    dataset
    {
        dataitem(Customer; Customer)
        {
            DataItemTableView = sorting("No.");
            PrintOnlyIfDetail = true;
            RequestFilterFields = "No.", "Date Filter", Blocked;
            column(ReportForNavId_6836; 6836)
            {
            }
            column(TodayFormatted; Format(Today, 0, 4))
            {
            }
            column(TxtCustGeTranmaxDtFilter; StrSubstNo(Text000, Format(Customer.GetRangemax(Customer."Date Filter"))))
            {
            }
            column(CompanyName; CompanyProperty.DisplayName)
            {
            }
            column(PrintOnePrPage; PrintOnePrPage)
            {
            }
            column(CustFilter; CustFilter)
            {
            }
            column(PrintAmountInLCY; PrintAmountInLCY)
            {
            }
            column(CustTableCaptCustFilter; Customer.TableCaption + ': ' + CustFilter)
            {
            }
            column(No_Customer; Customer."No.")
            {
            }
            column(Name_Customer; Customer.Name)
            {
            }
            column(PhoneNo_Customer; Customer."Phone No.")
            {
                IncludeCaption = true;
            }
            column(CustBalancetoDateCaption; CustBalancetoDateCaptionLbl)
            {
            }
            column(CurrReportPageNoCaption; CurrReportPageNoCaptionLbl)
            {
            }
            column(AllamtsareinLCYCaption; AllamtsareinLCYCaptionLbl)
            {
            }
            column(CustLedgEntryPostingDtCaption; CustLedgEntryPostingDtCaptionLbl)
            {
            }
            column(OriginalAmtCaption; OriginalAmtCaptionLbl)
            {
            }
            dataitem(CustLedgEntry3; "Cust. Ledger Entry")
            {
                DataItemTableView = sorting("Entry No.");
                column(ReportForNavId_5082; 5082)
                {
                }
                column(PostingDt_CustLedgEntry; Format(CustLedgEntry3."Posting Date"))
                {
                    IncludeCaption = false;
                }
                column(DocType_CustLedgEntry; CustLedgEntry3."Document Type")
                {
                    IncludeCaption = true;
                }
                column(DocNo_CustLedgEntry; CustLedgEntry3."Document No.")
                {
                    IncludeCaption = true;
                }
                column(Desc_CustLedgEntry; CustLedgEntry3.Description)
                {
                    IncludeCaption = true;
                }
                column(OriginalAmt; OriginalAmt)
                {
                    AutoFormatExpression = CurrencyCode;
                    AutoFormatType = 1;
                }
                column(EntryNo_CustLedgEntry; CustLedgEntry3."Entry No.")
                {
                    IncludeCaption = true;
                }
                column(CurrencyCode; CurrencyCode)
                {
                }
                dataitem("Detailed Cust. Ledg. Entry"; "Detailed Cust. Ledg. Entry")
                {
                    DataItemLink = "Cust. Ledger Entry No." = field("Entry No."), "Posting Date" = field("Date Filter");
                    DataItemTableView = sorting("Cust. Ledger Entry No.", "Posting Date") where("Entry Type" = filter(<> "Initial Entry"));
                    column(ReportForNavId_6942; 6942)
                    {
                    }
                    column(EntType_DtldCustLedgEnt; "Detailed Cust. Ledg. Entry"."Entry Type")
                    {
                    }
                    column(postDt_DtldCustLedgEntry; Format("Detailed Cust. Ledg. Entry"."Posting Date"))
                    {
                    }
                    column(DocType_DtldCustLedgEntry; "Detailed Cust. Ledg. Entry"."Document Type")
                    {
                    }
                    column(DocNo_DtldCustLedgEntry; "Detailed Cust. Ledg. Entry"."Document No.")
                    {
                    }
                    column(Amt; Amt)
                    {
                        AutoFormatExpression = CurrencyCode;
                        AutoFormatType = 1;
                    }
                    column(CurrencyCodeDtldCustLedgEntry; CurrencyCode)
                    {
                    }
                    column(EntNo_DtldCustLedgEntry; DtldCustLedgEntryNum)
                    {
                    }
                    column(RemainingAmt; RemainingAmt)
                    {
                        AutoFormatExpression = CurrencyCode;
                        AutoFormatType = 1;
                    }

                    trigger OnAfterGetRecord()
                    begin
                        if not PrintUnappliedEntries then
                            if "Detailed Cust. Ledg. Entry".Unapplied then
                                CurrReport.Skip;

                        if PrintAmountInLCY then begin
                            Amt := "Detailed Cust. Ledg. Entry"."Amount (LCY)";
                            CurrencyCode := '';
                        end else begin
                            Amt := "Detailed Cust. Ledg. Entry".Amount;
                            CurrencyCode := "Detailed Cust. Ledg. Entry"."Currency Code";
                        end;
                        if Amt = 0 then
                            CurrReport.Skip;

                        DtldCustLedgEntryNum := DtldCustLedgEntryNum + 1;
                    end;

                    trigger OnPreDataItem()
                    begin
                        DtldCustLedgEntryNum := 0;
                        CustLedgEntry3.Copyfilter("Posting Date", "Detailed Cust. Ledg. Entry"."Posting Date");
                    end;
                }

                trigger OnAfterGetRecord()
                begin
                    if PrintAmountInLCY then begin
                        CustLedgEntry3.CalcFields(CustLedgEntry3."Original Amt. (LCY)", CustLedgEntry3."Remaining Amt. (LCY)");
                        OriginalAmt := CustLedgEntry3."Original Amt. (LCY)";
                        RemainingAmt := CustLedgEntry3."Remaining Amt. (LCY)";
                        CurrencyCode := '';
                    end else begin
                        CustLedgEntry3.CalcFields(CustLedgEntry3."Original Amount", CustLedgEntry3."Remaining Amount");
                        OriginalAmt := CustLedgEntry3."Original Amount";
                        RemainingAmt := CustLedgEntry3."Remaining Amount";
                        CurrencyCode := CustLedgEntry3."Currency Code";
                    end;
                end;

                trigger OnPreDataItem()
                var
                    TempCustLedgerEntry: Record "Cust. Ledger Entry" temporary;
                    ClosedEntryIncluded: Boolean;
                begin
                    CustLedgEntry3.Reset;
                    FilterCustLedgerEntry(CustLedgEntry3);
                    if CustLedgEntry3.FindSet then
                        repeat
                            if not CustLedgEntry3.Open then
                                ClosedEntryIncluded := CheckCustEntryIncluded(CustLedgEntry3."Entry No.");
                            if CustLedgEntry3.Open or ClosedEntryIncluded then begin
                                CustLedgEntry3.Mark(true);
                                TempCustLedgerEntry := CustLedgEntry3;
                                TempCustLedgerEntry.Insert;
                            end;
                        until CustLedgEntry3.Next = 0;

                    CustLedgEntry3.SetCurrentkey(CustLedgEntry3."Entry No.");
                    CustLedgEntry3.MarkedOnly(true);

                    AddCustomerDimensionFilter(CustLedgEntry3);

                    CalcCustomerTotalAmount(TempCustLedgerEntry);
                end;
            }
            dataitem(Integer2; "Integer")
            {
                DataItemTableView = sorting(Number) where(Number = filter(1 ..));
                column(ReportForNavId_4152; 4152)
                {
                }
                column(CustName; Customer.Name)
                {
                }
                column(TtlAmtCurrencyTtlBuff; CurrencyTotalBuffer."Total Amount")
                {
                    AutoFormatExpression = CurrencyTotalBuffer."Currency Code";
                    AutoFormatType = 1;
                }
                column(CurryCode_CurrencyTtBuff; CurrencyTotalBuffer."Currency Code")
                {
                }

                trigger OnAfterGetRecord()
                begin
                    if Integer2.Number = 1 then
                        OK := CurrencyTotalBuffer.Find('-')
                    else
                        OK := CurrencyTotalBuffer.Next <> 0;
                    if not OK then
                        CurrReport.Break;

                    CurrencyTotalBuffer2.UpdateTotal(
                      CurrencyTotalBuffer."Currency Code",
                      CurrencyTotalBuffer."Total Amount",
                      0,
                      Counter1);
                end;

                trigger OnPostDataItem()
                begin
                    CurrencyTotalBuffer.DeleteAll;
                end;

                trigger OnPreDataItem()
                begin
                    if not ShowEntriesWithZeroBalance then
                        CurrencyTotalBuffer.SetFilter("Total Amount", '<>0');
                end;
            }

            trigger OnAfterGetRecord()
            begin
                if MaxDate = 0D then
                    Error(BlankMaxDateErr);

                Customer.SetRange(Customer."Date Filter", 0D, MaxDate);
                Customer.CalcFields(Customer."Net Change (LCY)", Customer."Net Change");

                if (PrintAmountInLCY and (Customer."Net Change (LCY)" = 0) or
                    (not PrintAmountInLCY) and (Customer."Net Change" = 0)) and
                   (not ShowEntriesWithZeroBalance)
                then
                    CurrReport.Skip;
            end;

            trigger OnPreDataItem()
            begin
                CurrReport.NewPagePerRecord := PrintOnePrPage;
            end;
        }
        dataitem(Integer3; "Integer")
        {
            DataItemTableView = sorting(Number) where(Number = filter(1 ..));
            column(ReportForNavId_7913; 7913)
            {
            }
            column(CurryCode_CurrencyTtBuff2; CurrencyTotalBuffer2."Currency Code")
            {
            }
            column(TtlAmtCurrencyTtlBuff2; CurrencyTotalBuffer2."Total Amount")
            {
                AutoFormatExpression = CurrencyTotalBuffer2."Currency Code";
                AutoFormatType = 1;
            }
            column(TotalCaption; TotalCaptionLbl)
            {
            }

            trigger OnAfterGetRecord()
            begin
                if Integer3.Number = 1 then
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

            trigger OnPreDataItem()
            begin
                CurrencyTotalBuffer2.SetFilter("Total Amount", '<>0');
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
                    field("Ending Date"; MaxDate)
                    {
                        ApplicationArea = Suite;
                        Caption = 'Ending Date';
                        ToolTip = 'Specifies the last date until which information in the report is shown. If left blank, the report shows information until the present time.';
                    }
                    field(PrintAmountInLCY; PrintAmountInLCY)
                    {
                        ApplicationArea = Suite;
                        Caption = 'Show Amounts in LCY';
                        ToolTip = 'Specifies if amounts in the report are displayed in LCY. If you leave the check box blank, amounts are shown in foreign currencies.';
                    }
                    field(PrintOnePrPage; PrintOnePrPage)
                    {
                        ApplicationArea = Suite;
                        Caption = 'New Page per Customer';
                        ToolTip = 'Specifies if each customer balance is printed on a separate page, in case two or more customers are included in the report.';
                    }
                    field(PrintUnappliedEntries; PrintUnappliedEntries)
                    {
                        ApplicationArea = Suite;
                        Caption = 'Include Unapplied Entries';
                        ToolTip = 'Specifies if unapplied entries are included in the report.';
                    }
                    field(ShowEntriesWithZeroBalance; ShowEntriesWithZeroBalance)
                    {
                        ApplicationArea = Suite;
                        Caption = 'Show Entries with Zero Balance';
                        ToolTip = 'Specifies if the report must include entries with a balance of 0. By default, the report only includes entries with a positive or negative balance.';
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
    }

    trigger OnPreReport()
    var
        CaptionManagement: Codeunit "Caption Class";
    begin
        // CustFilter := CaptionManagement.GetRecordFiltersWithCaptions(Customer);
    end;

    var
        Text000: label 'Balance on %1';
        CurrencyTotalBuffer: Record "Currency Total Buffer" temporary;
        CurrencyTotalBuffer2: Record "Currency Total Buffer" temporary;
        PrintAmountInLCY: Boolean;
        PrintOnePrPage: Boolean;
        ShowEntriesWithZeroBalance: Boolean;
        CustFilter: Text;
        MaxDate: Date;
        OriginalAmt: Decimal;
        Amt: Decimal;
        RemainingAmt: Decimal;
        Counter1: Integer;
        DtldCustLedgEntryNum: Integer;
        OK: Boolean;
        CurrencyCode: Code[10];
        PrintUnappliedEntries: Boolean;
        CustBalancetoDateCaptionLbl: label 'Customer - Balance to Date';
        CurrReportPageNoCaptionLbl: label 'Page';
        AllamtsareinLCYCaptionLbl: label 'All amounts are in LCY.';
        CustLedgEntryPostingDtCaptionLbl: label 'Posting Date';
        OriginalAmtCaptionLbl: label 'Amount';
        TotalCaptionLbl: label 'Total';
        BlankMaxDateErr: label 'Ending Date must have a value.';


    procedure InitializeRequest(NewPrintAmountInLCY: Boolean; NewPrintOnePrPage: Boolean; NewPrintUnappliedEntries: Boolean; NewEndingDate: Date)
    begin
        PrintAmountInLCY := NewPrintAmountInLCY;
        PrintOnePrPage := NewPrintOnePrPage;
        PrintUnappliedEntries := NewPrintUnappliedEntries;
        MaxDate := NewEndingDate;
    end;

    local procedure FilterCustLedgerEntry(var CustLedgerEntry: Record "Cust. Ledger Entry")
    begin
        begin
            CustLedgerEntry.SetCurrentkey(CustLedgerEntry."Customer No.", CustLedgerEntry."Posting Date");
            CustLedgerEntry.SetRange(CustLedgerEntry."Customer No.", Customer."No.");
            CustLedgerEntry.SetRange(CustLedgerEntry."Posting Date", 0D, MaxDate);
        end;
    end;

    local procedure AddCustomerDimensionFilter(var CustLedgerEntry: Record "Cust. Ledger Entry")
    begin
        begin
            if Customer.GetFilter("Global Dimension 1 Filter") <> '' then
                CustLedgerEntry.SetFilter(CustLedgerEntry."Global Dimension 1 Code", Customer.GetFilter("Global Dimension 1 Filter"));
            if Customer.GetFilter("Global Dimension 2 Filter") <> '' then
                CustLedgerEntry.SetFilter(CustLedgerEntry."Global Dimension 2 Code", Customer.GetFilter("Global Dimension 2 Filter"));
            if Customer.GetFilter("Currency Filter") <> '' then
                CustLedgerEntry.SetFilter(CustLedgerEntry."Currency Code", Customer.GetFilter("Currency Filter"));
        end;
    end;

    local procedure CalcCustomerTotalAmount(var TempCustLedgerEntry: Record "Cust. Ledger Entry" temporary)
    begin
        begin
            TempCustLedgerEntry.SetCurrentkey(TempCustLedgerEntry."Entry No.");
            TempCustLedgerEntry.SetRange(TempCustLedgerEntry."Date Filter", 0D, MaxDate);
            AddCustomerDimensionFilter(TempCustLedgerEntry);
            if TempCustLedgerEntry.FindSet then
                repeat
                    if PrintAmountInLCY then begin
                        TempCustLedgerEntry.CalcFields(TempCustLedgerEntry."Remaining Amt. (LCY)");
                        RemainingAmt := TempCustLedgerEntry."Remaining Amt. (LCY)";
                        CurrencyCode := '';
                    end else begin
                        TempCustLedgerEntry.CalcFields(TempCustLedgerEntry."Remaining Amount");
                        RemainingAmt := TempCustLedgerEntry."Remaining Amount";
                        CurrencyCode := TempCustLedgerEntry."Currency Code";
                    end;
                    if RemainingAmt <> 0 then
                        CurrencyTotalBuffer.UpdateTotal(
                          CurrencyCode,
                          RemainingAmt,
                          0,
                          Counter1);
                until TempCustLedgerEntry.Next = 0;
        end;
    end;

    local procedure CheckCustEntryIncluded(EntryNo: Integer): Boolean
    var
        CustLedgerEntry: Record "Cust. Ledger Entry";
    begin
        if CustLedgerEntry.Get(EntryNo) and (CustLedgerEntry."Posting Date" <= MaxDate) then begin
            CustLedgerEntry.SetRange("Date Filter", 0D, MaxDate);
            CustLedgerEntry.CalcFields("Remaining Amount");
            if CustLedgerEntry."Remaining Amount" <> 0 then
                exit(true);
            if PrintUnappliedEntries then
                exit(CheckUnappliedEntryExists(EntryNo));
        end;
        exit(false);
    end;

    local procedure CheckUnappliedEntryExists(EntryNo: Integer): Boolean
    var
        DetailedCustLedgEntry: Record "Detailed Cust. Ledg. Entry";
    begin
        begin
            DetailedCustLedgEntry.SetCurrentkey(DetailedCustLedgEntry."Cust. Ledger Entry No.", DetailedCustLedgEntry."Entry Type", DetailedCustLedgEntry."Posting Date");
            DetailedCustLedgEntry.SetRange(DetailedCustLedgEntry."Cust. Ledger Entry No.", EntryNo);
            DetailedCustLedgEntry.SetRange(DetailedCustLedgEntry."Entry Type", DetailedCustLedgEntry."entry type"::Application);
            DetailedCustLedgEntry.SetFilter(DetailedCustLedgEntry."Posting Date", '>%1', MaxDate);
            DetailedCustLedgEntry.SetRange(DetailedCustLedgEntry.Unapplied, true);
            exit(not DetailedCustLedgEntry.IsEmpty);
        end;
    end;
}
