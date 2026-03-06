#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Report 69013 "Close Directors Pay period"
{
    ProcessingOnly = true;
    UseRequestPage = false;
    ApplicationArea = All;

    dataset
    {
        dataitem("Directorsl PeriodX"; "Directorsl PeriodX")
        {
            column(ReportForNavId_1213; 1213)
            {
            }

            trigger OnPostDataItem()
            begin

                if PayperiodStart <> StartingDate then
                    Error('Cannot Close this Pay period Without Closing the preceding ones')
                else begin
                    if PayPeriod.Get(StartingDate) then begin
                        PayPeriod."Close Pay" := true;
                        PayPeriod.Closed := true;
                        PayPeriod.Modify;
                        Message('The period has been closed');
                    end;
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

    trigger OnPreReport()
    begin
        if not Confirm('Please backup up before closing current period! OK to Proceed?') then
            Error('The period has not been closed');

        PayrollRun.Run;

        DeducePayPeriod;
        ClosePeriodTrans;
    end;

    var
        Proceed: Boolean;
        CurrentPeriodEnd: Date;
        DaysAdded: Code[10];
        PayPeriod: Record "Directorsl PeriodX";
        StartingDate: Date;
        PayperiodStart: Date;
        LoansUpdate: Boolean;
        PayHistory: Record "Employee Ledger EntryX";
        EmpRec: Record Vendor;
        TaxableAmount: Decimal;
        RightBracket: Boolean;
        AmountRemaining: Decimal;
        IncomeTax: Decimal;
        NetPay: Decimal;
        Loan: Record "Loans transactionsX";
        ReducedBal: Decimal;
        InterestAmt: Decimal;
        CompRec: Record "Human Resources Setup";
        HseLimit: Decimal;
        ExcessRetirement: Decimal;
        relief: Decimal;
        Outstanding: Decimal;
        CreateRec: Boolean;
        benefits: Record "Directors Earnings";
        deductions: Record "Director Deductions";
        InterestDiff: Decimal;
        Rounding: Boolean;
        PD: Record "Assignment Matrix-X";
        Pay: Record "Directors Earnings";
        Ded: Record "Director Deductions";
        TaxCode: Code[10];
        CfAmount: Decimal;
        TempAmount: Decimal;
        EmpRec1: Record Vendor;
        Emprec2: Record Vendor;
        NewPeriod: Date;
        AssMatrix: Record "Directorsl PeriodX";
        PayrollRun: Report "Directors Payroll Run";
        Schedule: Record "Repayment Schedule";
        Window: Dialog;
        EmployeeName: Text[200];
        GetGroup: Codeunit Payroll3;
        GroupCode: Code[20];
        CUser: Code[20];
        LoanApplicationForm: Record "Loan Application";
        Discontinue: Boolean;
        directorLedger: Record "Director Ledger Entry";


    procedure GetCurrentPeriod(var Payperiod: Record "Directorsl PeriodX")
    begin
        CurrentPeriodEnd := Payperiod."Starting Date";
        StartingDate := CurrentPeriodEnd;
        CurrentPeriodEnd := CalcDate('1M', CurrentPeriodEnd - 1);
    end;


    procedure DeducePayPeriod()
    var
        PayPeriodRec: Record "Directorsl PeriodX";
    begin
        PayPeriodRec.Reset;
        PayPeriodRec.SetRange(PayPeriodRec."Close Pay", false);
        if PayPeriodRec.Find('-') then
            PayperiodStart := PayPeriodRec."Starting Date";
    end;


    procedure ClosePeriodTrans()
    var
        EarnDeduct: Record "Director Ledger Entry";
    begin
        EarnDeduct.Reset;
        EarnDeduct.SetRange(EarnDeduct."Payroll Period", PayperiodStart);
        if EarnDeduct.Find('-') then
            repeat
                EarnDeduct.Closed := true;
                EarnDeduct."Payroll Period" := PayperiodStart;
                EarnDeduct.Modify;
            until EarnDeduct.Next = 0;
    end;


    procedure Initialize()
    var
        InitEarnDeduct: Record "Director Ledger Entry";
    begin

        InitEarnDeduct.SetRange(InitEarnDeduct.Closed, false);

        repeat
            InitEarnDeduct."Payroll Period" := PayperiodStart;
            InitEarnDeduct.Modify;
        until InitEarnDeduct.Next = 0;
    end;


    procedure GetTaxBracket(var TaxableAmount: Decimal)
    var
        TaxTable: Record BracketsX;
        TotalTax: Decimal;
        Tax: Decimal;
        EndTax: Boolean;
    begin
        AmountRemaining := TaxableAmount;
        AmountRemaining := AmountRemaining;
        AmountRemaining := ROUND(AmountRemaining, 0.01);
        EndTax := false;

        TaxTable.SetRange("Table Code", TaxCode);

        if TaxTable.Find('-') then begin
            repeat
                if AmountRemaining <= 0 then
                    EndTax := true
                else begin
                    if ROUND((TaxableAmount), 0.01) > TaxTable."Upper Limit" then
                        Tax := TaxTable."Taxable Amount" * TaxTable.Percentage / 100
                    else begin
                        Tax := AmountRemaining * TaxTable.Percentage / 100;
                        TotalTax := TotalTax + Tax;
                        EndTax := true;
                    end;
                    if not EndTax then begin
                        AmountRemaining := AmountRemaining - TaxTable."Taxable Amount";
                        TotalTax := TotalTax + Tax;
                    end;
                end;
            until (TaxTable.Next = 0) or EndTax = true;
        end;
        TotalTax := TotalTax;
        IncomeTax := -TotalTax;
    end;


    procedure CreateLIBenefit(var Employee: Code[10]; var BenefitCode: Code[10]; var ReducedBalance: Decimal)
    var
        PaymentDeduction: Record "Director Ledger Entry";
        Payrollmonths: Record "Directorsl PeriodX";
        allowances: Record "Directors Earnings";
    begin
        PaymentDeduction.Init;
        PaymentDeduction."Director No" := Employee;
        PaymentDeduction.Code := BenefitCode;
        PaymentDeduction.Type := PaymentDeduction.Type::Payment;
        PaymentDeduction."Payroll Period" := CalcDate('1M', PayperiodStart);
        PaymentDeduction.Amount := ReducedBalance * InterestDiff;
        PaymentDeduction."Non-Cash Benefit" := true;
        PaymentDeduction.Taxable := true;
        //PaymentDeduction."Next Period Entry":=TRUE;
        if allowances.Get(BenefitCode) then
            PaymentDeduction.Description := allowances.Description;
        PaymentDeduction.Insert;
    end;


    procedure CoinageAnalysis(var NetPay: Decimal) NetPay1: Decimal
    var
        Index: Integer;
        Intex: Integer;
        AmountArray: array[15] of Decimal;
        NoOfUnitsArray: array[15] of Integer;
        MinAmount: Decimal;
    begin
    end;
}
