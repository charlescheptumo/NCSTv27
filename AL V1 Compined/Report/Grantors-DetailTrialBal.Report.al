#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Report 65002 "Grantors - Detail Trial Bal."
{
    DefaultLayout = RDLC;
    RDLCLayout = './Layouts/Grantors - Detail Trial Bal..rdlc';
    ApplicationArea = Basic, Suite;
    Caption = 'Grantors - Detail Trial Bal.';
    UsageCategory = ReportsAndAnalysis;

    dataset
    {
        dataitem(Customer; Customer)
        {
            DataItemTableView = sorting("No.");
            PrintOnlyIfDetail = true;
            RequestFilterFields = "No.", "Search Name", "Customer Posting Group", "Date Filter";
            column(ReportForNavId_6836; 6836)
            {
            }
            column(TodayFormatted; Format(Today))
            {
            }
            column(PeriodCustDatetFilter; StrSubstNo(Text000, CustDateFilter))
            {
            }
            column(CompanyName; CompanyProperty.DisplayName)
            {
            }
            column(PrintAmountsInLCY; PrintAmountsInLCY)
            {
            }
            column(ExcludeBalanceOnly; ExcludeBalanceOnly)
            {
            }
            column(PrintDebitCredit; PrintDebitCredit)
            {
            }
            column(CustFilterCaption; Customer.TableCaption + ': ' + CustFilter)
            {
            }
            column(CustFilter; CustFilter)
            {
            }
            column(AmountCaption; AmountCaption)
            {
            }
            column(DebitAmountCaption; DebitLbl)
            {
            }
            column(CreditAmountCaption; CreditLbl)
            {
            }
            column(RemainingAmtCaption; RemainingAmtCaption)
            {
            }
            column(No_Cust; Customer."No.")
            {
            }
            column(Name_Cust; Customer.Name)
            {
            }
            column(PageGroupNo; PageGroupNo)
            {
            }
            column(StartBalanceLCY; StartBalanceLCY)
            {
                AutoFormatType = 1;
            }
            column(CustBalanceLCY; CustBalanceLCY)
            {
                AutoFormatType = 1;
            }
            column(CustLedgerEntryAmtLCY; "Cust. Ledger Entry"."Amount (LCY)")
            {
                AutoFormatType = 1;
            }
            column(CustDetailTrialBalCaption; CustDetailTrialBalCaptionLbl)
            {
            }
            column(PageNoCaption; PageNoCaptionLbl)
            {
            }
            column(AllAmtsLCYCaption; AllAmtsLCYCaptionLbl)
            {
            }
            column(RepInclCustsBalCptn; RepInclCustsBalCptnLbl)
            {
            }
            column(PostingDateCaption; PostingDateCaptionLbl)
            {
            }
            column(DueDateCaption; DueDateCaptionLbl)
            {
            }
            column(BalanceLCYCaption; BalanceLCYCaptionLbl)
            {
            }
            column(AdjOpeningBalCaption; AdjOpeningBalCaptionLbl)
            {
            }
            column(BeforePeriodCaption; BeforePeriodCaptionLbl)
            {
            }
            column(TotalCaption; TotalCaptionLbl)
            {
            }
            column(OpeningBalCaption; OpeningBalCaptionLbl)
            {
            }
            column(ExternalDocNoCaption; ExternalDocNoCaptionLbl)
            {
            }
            dataitem("Cust. Ledger Entry"; "Cust. Ledger Entry")
            {
                DataItemLink = "Customer No." = field("No."), "Posting Date" = field("Date Filter"), "Global Dimension 2 Code" = field("Global Dimension 2 Filter"), "Global Dimension 1 Code" = field("Global Dimension 1 Filter"), "Date Filter" = field("Date Filter");
                DataItemTableView = sorting("Customer No.", "Posting Date");
                column(ReportForNavId_8503; 8503)
                {
                }
                column(PostDate_CustLedgEntry; Format("Cust. Ledger Entry"."Posting Date"))
                {
                }
                column(DocType_CustLedgEntry; "Cust. Ledger Entry"."Document Type")
                {
                    IncludeCaption = true;
                }
                column(DocNo_CustLedgEntry; "Cust. Ledger Entry"."Document No.")
                {
                    IncludeCaption = true;
                }
                column(ExtDocNo_CustLedgEntry; "Cust. Ledger Entry"."External Document No.")
                {
                }
                column(Desc_CustLedgEntry; "Cust. Ledger Entry".Description)
                {
                    IncludeCaption = true;
                }
                column(CustAmount; CustAmount)
                {
                    AutoFormatExpression = CustCurrencyCode;
                    AutoFormatType = 1;
                }
                column(CustDebitAmount; CustDebitAmount)
                {
                    AutoFormatExpression = CustCurrencyCode;
                    AutoFormatType = 1;
                }
                column(CustCreditAmount; CustCreditAmount)
                {
                    AutoFormatExpression = CustCurrencyCode;
                    AutoFormatType = 1;
                }
                column(CustRemainAmount; CustRemainAmount)
                {
                    AutoFormatExpression = CustCurrencyCode;
                    AutoFormatType = 1;
                }
                column(CustEntryDueDate; Format(CustEntryDueDate))
                {
                }
                column(EntryNo_CustLedgEntry; "Cust. Ledger Entry"."Entry No.")
                {
                    IncludeCaption = true;
                }
                column(CustCurrencyCode; CustCurrencyCode)
                {
                }
                column(CustBalanceLCY1; CustBalanceLCY)
                {
                    AutoFormatType = 1;
                }

                trigger OnAfterGetRecord()
                begin
                    CustLedgEntryExists := true;
                    if PrintAmountsInLCY then begin
                        CustAmount := "Cust. Ledger Entry"."Amount (LCY)";
                        CustRemainAmount := "Cust. Ledger Entry"."Remaining Amt. (LCY)";
                        CustCurrencyCode := '';
                    end else begin
                        CustAmount := "Cust. Ledger Entry".Amount;
                        CustRemainAmount := "Cust. Ledger Entry"."Remaining Amount";
                        CustCurrencyCode := "Cust. Ledger Entry"."Currency Code";
                    end;
                    CustDebitAmount := 0;
                    CustCreditAmount := 0;
                    if CustAmount > 0 then
                        CustDebitAmount := CustAmount
                    else
                        CustCreditAmount := -CustAmount;
                    CustTotalDebitAmount += CustDebitAmount;
                    CustTotalCreditAmount += CustCreditAmount;

                    CustBalanceLCY := CustBalanceLCY + "Cust. Ledger Entry"."Amount (LCY)";
                    if ("Cust. Ledger Entry"."Document Type" = "Cust. Ledger Entry"."document type"::Payment) or ("Cust. Ledger Entry"."Document Type" = "Cust. Ledger Entry"."document type"::Refund) then
                        CustEntryDueDate := 0D
                    else
                        CustEntryDueDate := "Cust. Ledger Entry"."Due Date";
                end;

                trigger OnPreDataItem()
                begin
                    CustLedgEntryExists := false;
                    CustTotalDebitAmount := 0;
                    CustTotalCreditAmount := 0;

                    "Cust. Ledger Entry".SetAutocalcFields("Cust. Ledger Entry".Amount, "Cust. Ledger Entry"."Remaining Amount", "Cust. Ledger Entry"."Amount (LCY)", "Cust. Ledger Entry"."Remaining Amt. (LCY)");
                end;
            }
            dataitem("Integer"; "Integer")
            {
                DataItemTableView = sorting(Number) where(Number = const(1));
                column(ReportForNavId_5444; 5444)
                {
                }
                column(Name1_Cust; Customer.Name)
                {
                }
                column(CustBalanceLCY4; CustBalanceLCY)
                {
                    AutoFormatType = 1;
                }
                column(StartBalanceLCY2; StartBalanceLCY)
                {
                }
                column(CustTotalDebitAmount; CustTotalDebitAmount)
                {
                }
                column(CustTotalCreditAmount; CustTotalCreditAmount)
                {
                }

                trigger OnAfterGetRecord()
                begin
                    if not CustLedgEntryExists and ((StartBalanceLCY = 0) or ExcludeBalanceOnly) then begin
                        StartBalanceLCY := 0;
                        CurrReport.Skip;
                    end;
                end;
            }

            trigger OnAfterGetRecord()
            begin
                if PrintOnlyOnePerPage then
                    PageGroupNo := PageGroupNo + 1;

                StartBalanceLCY := 0;
                if CustDateFilter <> '' then begin
                    if Customer.GetRangeMin(Customer."Date Filter") <> 0D then begin
                        Customer.SetRange(Customer."Date Filter", 0D, Customer.GetRangeMin(Customer."Date Filter") - 1);
                        Customer.CalcFields(Customer."Net Change (LCY)");
                        StartBalanceLCY := Customer."Net Change (LCY)";
                    end;
                    Customer.SetFilter(Customer."Date Filter", CustDateFilter);
                end;
                CurrReport.PrintonlyIfDetail := ExcludeBalanceOnly or (StartBalanceLCY = 0);
                CustBalanceLCY := StartBalanceLCY;
            end;

            trigger OnPreDataItem()
            begin
                PageGroupNo := 1;
                CurrReport.NewPagePerRecord := PrintOnlyOnePerPage;
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
                    field(NewPageperCustomer; PrintOnlyOnePerPage)
                    {
                        ApplicationArea = Basic, Suite;
                        Caption = 'New Page per Customer';
                        ToolTip = 'Specifies if each customer''s information is printed on a new page if you have chosen two or more customers to be included in the report.';
                    }
                    field(ExcludeCustHaveaBalanceOnly; ExcludeBalanceOnly)
                    {
                        ApplicationArea = Basic, Suite;
                        Caption = 'Exclude Customers That Have a Balance Only';
                        MultiLine = true;
                        ToolTip = 'Specifies if you do not want the report to include entries for customers that have a balance but do not have a net change during the selected time period.';
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
        GeneralLedgerSetup.Get;
        PrintDebitCredit := GeneralLedgerSetup."Show Amounts" = GeneralLedgerSetup."show amounts"::"Debit/Credit Only";
        // CustFilter := CaptionManagement.GetRecordFiltersWithCaptions(Customer);
        CustDateFilter := Customer.GetFilter("Date Filter");
        if PrintAmountsInLCY then begin
            AmountCaption := "Cust. Ledger Entry".FieldCaption("Cust. Ledger Entry"."Amount (LCY)");
            RemainingAmtCaption := "Cust. Ledger Entry".FieldCaption("Cust. Ledger Entry"."Remaining Amt. (LCY)");
        end else begin
            AmountCaption := "Cust. Ledger Entry".FieldCaption("Cust. Ledger Entry".Amount);
            RemainingAmtCaption := "Cust. Ledger Entry".FieldCaption("Cust. Ledger Entry"."Remaining Amount");
        end;
    end;

    var
        Text000: label 'Period: %1';
        GeneralLedgerSetup: Record "General Ledger Setup";
        PrintDebitCredit: Boolean;
        PrintAmountsInLCY: Boolean;
        PrintOnlyOnePerPage: Boolean;
        ExcludeBalanceOnly: Boolean;
        CustFilter: Text;
        CustDateFilter: Text;
        AmountCaption: Text[80];
        RemainingAmtCaption: Text[30];
        CustAmount: Decimal;
        CustDebitAmount: Decimal;
        CustCreditAmount: Decimal;
        CustTotalDebitAmount: Decimal;
        CustTotalCreditAmount: Decimal;
        CustRemainAmount: Decimal;
        CustBalanceLCY: Decimal;
        CustCurrencyCode: Code[10];
        CustEntryDueDate: Date;
        StartBalanceLCY: Decimal;
        CustLedgEntryExists: Boolean;
        PageGroupNo: Integer;
        CustDetailTrialBalCaptionLbl: label 'Customer - Detail Trial Bal.';
        PageNoCaptionLbl: label 'Page';
        AllAmtsLCYCaptionLbl: label 'All amounts are in LCY';
        RepInclCustsBalCptnLbl: label 'This report also includes customers that only have balances.';
        PostingDateCaptionLbl: label 'Posting Date';
        DueDateCaptionLbl: label 'Due Date';
        BalanceLCYCaptionLbl: label 'Balance (LCY)';
        AdjOpeningBalCaptionLbl: label 'Adj. of Opening Balance';
        BeforePeriodCaptionLbl: label 'Total (LCY) Before Period';
        TotalCaptionLbl: label 'Total (LCY)';
        OpeningBalCaptionLbl: label 'Total Adj. of Opening Balance';
        DebitLbl: label 'Debit Amount';
        CreditLbl: label 'Credit Amount';
        ExternalDocNoCaptionLbl: label 'External Doc. No.';


    procedure InitializeRequest(ShowAmountInLCY: Boolean; SetPrintOnlyOnePerPage: Boolean; SetExcludeBalanceOnly: Boolean)
    begin
        PrintOnlyOnePerPage := SetPrintOnlyOnePerPage;
        PrintAmountsInLCY := ShowAmountInLCY;
        ExcludeBalanceOnly := SetExcludeBalanceOnly;
    end;
}
