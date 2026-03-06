#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Report 69022 P10B
{
    DefaultLayout = RDLC;
    RDLCLayout = './Layouts/P10B.rdlc';
    UsageCategory = ReportsandAnalysis;

    dataset
    {
        dataitem("Loans transactionsX"; "Loans transactionsX")
        {
            RequestFilterFields = "Code";
            column(ReportForNavId_8172; 8172)
            {
            }
            column(FORMAT_TODAY_0_4_; Format(Today, 0, 4))
            {
            }
            column(COMPANYNAME; COMPANYNAME)
            {
            }
            column(CurrReport_PAGENO; CurrReport.PageNo)
            {
            }
            column(USERID; UserId)
            {
            }
            column(Year; Year)
            {
            }
            column(Loans_transactionsX_Code; "Loans transactionsX".Code)
            {
            }
            column(Loans_transactionsX_Name; "Loans transactionsX".Name)
            {
            }
            column(Loans_transactionsX_Employee; "Loans transactionsX".Employee)
            {
            }
            column(Loans_transactionsX__Loan_Amount_; "Loans transactionsX"."Loan Amount")
            {
            }
            column(Loans_transactionsX__Interest_Rate_; "Loans transactionsX"."Interest Rate")
            {
            }
            column(FRINGE_BENEFIT_TAX_REPORT_P10BCaption; FRINGE_BENEFIT_TAX_REPORT_P10BCaptionLbl)
            {
            }
            column(CurrReport_PAGENOCaption; CurrReport_PAGENOCaptionLbl)
            {
            }
            column(PERIODCaption; PERIODCaptionLbl)
            {
            }
            column(UserCaption; UserCaptionLbl)
            {
            }
            column(Loans_transactionsX_EmployeeCaption; "Loans transactionsX".FieldCaption("Loans transactionsX".Employee))
            {
            }
            column(Loans_transactionsX__Loan_Amount_Caption; "Loans transactionsX".FieldCaption("Loans transactionsX"."Loan Amount"))
            {
            }
            column(Interest_Rate__Caption; Interest_Rate__CaptionLbl)
            {
            }
            column(Tax_PayableCaption; Tax_PayableCaptionLbl)
            {
            }
            column(Loan_BalanceCaption; Loan_BalanceCaptionLbl)
            {
            }
            column(Loans_transactionsX_CodeCaption; "Loans transactionsX".FieldCaption("Loans transactionsX".Code))
            {
            }
            column(Loans_transactionsX_NameCaption; "Loans transactionsX".FieldCaption("Loans transactionsX".Name))
            {
            }
            column(Market_Interest_Rate__Caption; Market_Interest_Rate__CaptionLbl)
            {
            }
            dataitem("Payroll PeriodX"; "Payroll PeriodX")
            {
                RequestFilterFields = "Starting Date";
                column(ReportForNavId_4862; 4862)
                {
                }
                column(Payroll_PeriodX_Name; "Payroll PeriodX".Name)
                {
                }
                column(Payroll_PeriodX__Market_Interest_Rate___; "Payroll PeriodX"."Market Interest Rate %")
                {
                }
                column(Loans_transactionsX___Interest_Rate_; "Loans transactionsX"."Interest Rate")
                {
                }
                column(TaxPayable; TaxPayable)
                {
                }
                column(Outstanding; Outstanding)
                {
                }
                column(TotTaxpayable; TotTaxpayable)
                {
                }
                column(Payroll_PeriodX_Starting_Date; "Payroll PeriodX"."Starting Date")
                {
                }

                trigger OnAfterGetRecord()
                begin
                    "Loans transactionsX".SetRange("Loans transactionsX"."Date Filter", 0D, "Payroll PeriodX"."Starting Date");
                    "Loans transactionsX".CalcFields("Loans transactionsX"."Amount Paid");
                    Outstanding := "Loans transactionsX"."Loan Amount" + "Loans transactionsX"."Amount Paid";
                    TaxPayable := Outstanding * (("Payroll PeriodX"."Market Interest Rate %" - "Loans transactionsX"."Interest Rate") *
                    HRSetup."Holiday overtime rate" / 12000);
                    TaxPayable := PayrollRounding(TaxPayable);
                    TotTaxpayable := TotTaxpayable + TaxPayable;
                end;

                trigger OnPreDataItem()
                begin
                    "Payroll PeriodX".SetRange("Payroll PeriodX"."Close Pay", true);
                end;
            }

            trigger OnAfterGetRecord()
            begin
                TotTaxpayable := 0;
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

    trigger OnPreReport()
    begin
        BeginDate := "Payroll PeriodX".GetRangeMin("Payroll PeriodX"."Starting Date");
        Year := Date2dmy(BeginDate, 3);
        HRSetup.Get;
    end;

    var
        TaxPayable: Decimal;
        Outstanding: Decimal;
        HRSetup: Record "Human Resources Setup";
        TotTaxpayable: Decimal;
        BeginDate: Date;
        Year: Integer;
        FRINGE_BENEFIT_TAX_REPORT_P10BCaptionLbl: label 'FRINGE BENEFIT TAX REPORT P10B';
        CurrReport_PAGENOCaptionLbl: label 'Page';
        PERIODCaptionLbl: label 'PERIOD';
        UserCaptionLbl: label 'User';
        Interest_Rate__CaptionLbl: label 'Interest Rate %';
        Tax_PayableCaptionLbl: label 'Tax Payable';
        Loan_BalanceCaptionLbl: label 'Loan Balance';
        Market_Interest_Rate__CaptionLbl: label 'Market Interest Rate %';


    procedure PayrollRounding(var Amount: Decimal) PayrollRounding: Decimal
    var
        HRsetup: Record "Human Resources Setup";
    begin

        HRsetup.Get;
        if HRsetup."Payroll Rounding Precision" = 0 then
            Error('You must specify the rounding precision under HR setup');

        if HRsetup."Payroll Rounding Type" = HRsetup."payroll rounding type"::Nearest then
            PayrollRounding := ROUND(Amount, HRsetup."Payroll Rounding Precision", '=');

        if HRsetup."Payroll Rounding Type" = HRsetup."payroll rounding type"::Up then
            PayrollRounding := ROUND(Amount, HRsetup."Payroll Rounding Precision", '>');

        if HRsetup."Payroll Rounding Type" = HRsetup."payroll rounding type"::Down then
            PayrollRounding := ROUND(Amount, HRsetup."Payroll Rounding Precision", '<');
    end;
}
