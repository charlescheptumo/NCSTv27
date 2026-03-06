#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Report 69059 "Post Project Payroll"
{
    DefaultLayout = RDLC;
    RDLCLayout = './Layouts/Post Project Payroll.rdlc';

    dataset
    {
        dataitem("Payroll PeriodX"; "Payroll PeriodX")
        {
            RequestFilterFields = "Starting Date";
            column(ReportForNavId_1000000000; 1000000000)
            {
            }
        }
        dataitem("Employee Posting GroupX"; "Employee Posting GroupX")
        {
            RequestFilterFields = "Pay Period Filter", "Code";
            column(ReportForNavId_2; 2)
            {
            }
            dataitem(Employee; Employee)
            {
                DataItemLink = "Posting Group" = field(Code), "Pay Period Filter" = field("Pay Period Filter");
                RequestFilterFields = "Date Filter";
                column(ReportForNavId_1; 1)
                {
                }

                trigger OnAfterGetRecord()
                begin
                    AssignmentMatrix.Reset;
                    AssignmentMatrix.SetRange("Employee No", Employee."No.");
                    AssignmentMatrix.SetRange("Payroll Period", DateSpecified);
                    if AssignmentMatrix.Find('-') then begin
                        repeat
                            AssignmentMatrix."Job No" := Employee."Job No";
                            AssignmentMatrix."Job Task No" := Employee."Job Task No";
                            AssignmentMatrix.Validate(AssignmentMatrix."Job No");
                            AssignmentMatrix.Validate(AssignmentMatrix."Job Task No");
                            AssignmentMatrix.Modify;
                        until AssignmentMatrix.Next = 0;
                    end;
                end;

                trigger OnPreDataItem()
                begin
                    DateSpecified := Employee.GetRangeMin(Employee."Pay Period Filter");

                    PayrollPeriod.Reset;
                    PayrollPeriod.SetRange("Starting Date", DateSpecified);
                    if PayrollPeriod.Find('-') then begin
                        PayDate := PayrollPeriod."Starting Date";
                        Payperiodtext := PayrollPeriod.Name + '_' + 'Payroll';
                    end;




                    CompRec.Get;
                    GenJnline.Reset;
                    GenJnline.SetRange("Journal Template Name", CompRec."Payroll Journal Template");
                    GenJnline.SetRange("Journal Batch Name", CompRec."Payroll Journal Batch");
                    GenJnline.DeleteAll;
                end;
            }
            dataitem(Projects; Job)
            {
                DataItemLink = "No."= field(Code);
                DataItemTableView = where(exchequer = const(false));
                RequestFilterFields = "No.";
                column(ReportForNavId_3; 3)
                {
                }

                trigger OnAfterGetRecord()
                begin


                    EarningsX.Reset;
                    EarningsX.SetRange("Non-Cash Benefit", false);
                    //EarningsX.SETRANGE("Posting Group Filter","Employee Posting GroupX".Code);
                    if EarningsX.Find('-') then begin
                        repeat
                            exchequerAmount := 0;
                            AssignmentMatrix.Reset;
                            AssignmentMatrix.SetRange(Code, EarningsX.Code);
                            AssignmentMatrix.SetRange("Non-Cash Benefit", false);
                            AssignmentMatrix.SetRange(Type, AssignmentMatrix.Type::Payment);
                            AssignmentMatrix.SetRange("Job No", Projects."No.");
                            AssignmentMatrix.SetRange("Payroll Period", DateSpecified);
                            AssignmentMatrix.SetRange("Posting Group Filter", "Employee Posting GroupX".Code);
                            if AssignmentMatrix.FindSet then begin
                                AssignmentMatrix.CalcSums(Amount);
                                exchequerAmount := AssignmentMatrix.Amount;
                                if (exchequerAmount <> 0) then begin
                                    GenJnline.Init;
                                    LineNumber := LineNumber + 10;
                                    GenJnline."Journal Template Name" := CompRec."Payroll Journal Template";
                                    GenJnline."Journal Batch Name" := CompRec."Payroll Journal Batch";
                                    GenJnline."Line No." := GenJnline."Line No." + 10000;
                                    if PGMapping.Get("Employee Posting GroupX".Code, AssignmentMatrix.Code, 0) then begin
                                        GenJnline."Account Type" := PGMapping."Account Type";
                                        GenJnline."Account No." := PGMapping."G/L Account";
                                    end else
                                        Error(Text000, "Employee Posting GroupX".Code, AssignmentMatrix.Code, AssignmentMatrix.Description);
                                    GenJnline."Posting Date" := CalcDate('CM', PayDate);
                                    GenJnline.Description :=
                                    AssignmentMatrix.Description + ' ' + Format(DateSpecified, 0, '<month text> <year4>');
                                    GenJnline."Document No." := Payperiodtext;
                                    GenJnline."External Document No." := AssignmentMatrix.Code + '_' + AssignmentMatrix."Job No";
                                    GenJnline."Shortcut Dimension 1 Code" := Employee."Global Dimension 1 Code";
                                    GenJnline.Amount := exchequerAmount;

                                    if PGMapping."Account Type" = PGMapping."account type"::"G/L Account" then begin
                                        GenJnline."Job No." := Projects."No.";
                                        GenJnline."Job Task No." := AssignmentMatrix."Job Task No";
                                        GenJnline."Job Quantity" := 1;
                                        GenJnline.Validate(GenJnline."Job No.");
                                        GenJnline.Validate(GenJnline."Job Task No.");
                                    end;
                                    if GenJnline.Amount <> 0 then begin
                                        GenJnline.Insert;
                                        TotalCredits := TotalCredits + exchequerAmount;

                                    end;

                                end;
                            end;
                        until EarningsX.Next = 0;
                    end;


                    DeductionX.Reset;
                    DeductionX.SetRange("Posting Group Filter", "Employee Posting GroupX".Code);
                    if DeductionX.Find('-') then begin
                        repeat
                            exchequerAmountb := 0;
                            AssignmentMatrix.Reset;
                            AssignmentMatrix.SetRange(Code, DeductionX.Code);
                            AssignmentMatrix.SetRange("Job No", Projects."No.");
                            AssignmentMatrix.SetRange("Payroll Period", DateSpecified);
                            AssignmentMatrix.SetRange("Posting Group Filter", "Employee Posting GroupX".Code);
                            AssignmentMatrix.SetRange(Type, AssignmentMatrix.Type::Deduction);
                            if AssignmentMatrix.FindSet then begin
                                AssignmentMatrix.CalcSums(Amount);
                                exchequerAmountb := AssignmentMatrix.Amount;
                                if (exchequerAmountb <> 0) then begin
                                    GenJnline.Init;
                                    LineNumber := LineNumber + 10;
                                    GenJnline."Journal Template Name" := CompRec."Payroll Journal Template";
                                    GenJnline."Journal Batch Name" := CompRec."Payroll Journal Batch";
                                    GenJnline."Line No." := GenJnline."Line No." + 10000;
                                    if PGMapping.Get("Employee Posting GroupX".Code, AssignmentMatrix.Code, 1) then begin
                                        GenJnline."Account Type" := PGMapping."Account Type";
                                        GenJnline."Account No." := PGMapping."G/L Account";
                                    end else
                                        Error(Text000, "Employee Posting GroupX".Code, AssignmentMatrix.Code, AssignmentMatrix.Description);
                                    GenJnline."Posting Date" := CalcDate('CM', PayDate);
                                    GenJnline.Description :=
                                    AssignmentMatrix.Description + ' ' + Format(DateSpecified, 0, '<month text> <year4>');
                                    GenJnline."Document No." := Payperiodtext;
                                    GenJnline."External Document No." := AssignmentMatrix.Code + '_' + AssignmentMatrix."Job No";
                                    GenJnline."Shortcut Dimension 1 Code" := Employee."Global Dimension 1 Code";
                                    GenJnline.Amount := exchequerAmountb;

                                    if PGMapping."Account Type" = PGMapping."account type"::"G/L Account" then begin
                                        GenJnline."Job No." := Projects."No.";
                                        GenJnline."Job Task No." := AssignmentMatrix."Job Task No";
                                        GenJnline."Job Quantity" := 1;
                                        GenJnline.Validate(GenJnline."Job No.");
                                        GenJnline.Validate(GenJnline."Job Task No.");
                                    end;
                                    if GenJnline.Amount <> 0 then begin
                                        GenJnline.Insert;
                                        TotalDebits := TotalDebits + exchequerAmountb;

                                    end;

                                end;
                            end;
                        until DeductionX.Next = 0;
                    end;



                    //Employer deductions
                    DeductionX.Reset;
                    DeductionX.SetRange("Posting Group Filter", "Employee Posting GroupX".Code);
                    DeductionX.SetRange("Pension Scheme", true);
                    DeductionX.SetRange("Employer Pension", true);

                    if DeductionX.FindSet then begin
                        repeat
                            EmployerAmount := 0;
                            AssignmentMatrix.Reset;
                            AssignmentMatrix.SetRange(Code, DeductionX.Code);
                            AssignmentMatrix.SetRange("Job No", Projects."No.");
                            AssignmentMatrix.SetRange("Payroll Period", DateSpecified);
                            AssignmentMatrix.SetRange("Posting Group Filter", "Employee Posting GroupX".Code);
                            if AssignmentMatrix.FindSet then begin
                                AssignmentMatrix.CalcSums("Employer Amount");
                                AssignmentMatrix.CalcSums(Amount);
                                EmployerAmount := AssignmentMatrix."Employer Amount" + AssignmentMatrix.Amount;
                                if (EmployerAmount <> 0) then begin
                                    GenJnline.Init;
                                    LineNumber := LineNumber + 10;
                                    GenJnline."Journal Template Name" := CompRec."Payroll Journal Template";
                                    GenJnline."Journal Batch Name" := CompRec."Payroll Journal Batch";
                                    GenJnline."Line No." := GenJnline."Line No." + 10000;
                                    if PGMapping.Get("Employee Posting GroupX".Code, AssignmentMatrix.Code, 1) then begin
                                        GenJnline."Account Type" := GenJnline."account type"::"G/L Account";
                                        GenJnline."Account No." := PGMapping."GL Account Employer";
                                    end else
                                        Error(Text000, "Employee Posting GroupX".Code, AssignmentMatrix.Code, AssignmentMatrix.Description);
                                    GenJnline."Posting Date" := CalcDate('CM', PayDate);
                                    GenJnline.Description :=
                                    AssignmentMatrix.Description + ' ' + Format(DateSpecified, 0, '<month text> <year4>');
                                    GenJnline."Document No." := Payperiodtext;
                                    GenJnline."External Document No." := AssignmentMatrix.Code + '_' + AssignmentMatrix."Job No";
                                    GenJnline."Shortcut Dimension 1 Code" := Employee."Global Dimension 1 Code";
                                    GenJnline.Amount := EmployerAmount;

                                    if PGMapping."Account Type" = PGMapping."account type"::"G/L Account" then begin
                                        GenJnline."Job No." := Projects."No.";
                                        GenJnline."Job Task No." := AssignmentMatrix."Job Task No";
                                        GenJnline."Job Quantity" := 1;
                                        GenJnline.Validate(GenJnline."Job No.");
                                        GenJnline.Validate(GenJnline."Job Task No.");
                                    end;
                                    if GenJnline.Amount <> 0 then begin
                                        GenJnline.Insert;
                                        TotalEmpDeductions := TotalEmpDeductions + EmployerAmount;

                                    end;
                                end;
                            end;
                        until DeductionX.Next = 0;
                    end;
                end;

                trigger OnPreDataItem()
                begin
                    TotalCredits := 0;
                    TotalDebits := 0;
                end;
            }

            trigger OnAfterGetRecord()
            begin

                TotalncomeTax := 0;
                TotalBasic := 0;
                TotalNetPay := 0;
                Totalgross := 0;
                EmployerAmount := 0;


                "Employee Posting GroupX".TestField("Account No.");
                PayablesAcc := "Employee Posting GroupX"."Account No.";
                LineNumber := LineNumber + 10;
            end;
        }
        dataitem(Summary; "Integer")
        {
            DataItemTableView = sorting(Number) where(Number = const(1));
            column(ReportForNavId_8; 8)
            {
            }

            trigger OnAfterGetRecord()
            begin

                TotalNetPay := TotalCredits + TotalDebits;
                //MESSAGE('TotalNetPay is %1 and TotalCredits%2 andTotalDebits%3 ',TotalNetPay,TotalCredits,TotalDebits);

                CompRec.Get;
                GenJnline.Init;
                GenJnline."Journal Template Name" := CompRec."Payroll Journal Template";
                GenJnline."Journal Batch Name" := CompRec."Payroll Journal Batch";
                GenJnline."Line No." := GenJnline."Line No." + 10000;
                GenJnline."Account Type" := "Employee Posting GroupX"."Account Type";
                GenJnline."Account No." := "Employee Posting GroupX"."Account No.";
                GenJnline."Account No." := PayablesAcc;
                GenJnline."Posting Date" := CalcDate('CM', PayDate);
                GenJnline.Description := 'Salary payable' + ' ' + Format(DateSpecified, 0, '<month text> <year4>');
                GenJnline."Document No." := Payperiodtext;
                GenJnline.Amount := -PayrollRounding(TotalNetPay);
                if GenJnline.Amount <> 0 then
                    GenJnline.Insert;


                //CODEUNIT.RUN(CODEUNIT::"Gen. Jnl.-Post Batch",GenJnline);
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
        LastFieldNo: Integer;
        FooterPrinted: Boolean;
        TaxableAmount: Decimal;
        IncomeTax: Decimal;
        NetPay: Decimal;
        RightBracket: Boolean;
        AmountRemaining: Decimal;
        Company: Record "Company Information";
        Companyz: Code[10];
        "Posting Date": Date;
        BatchName: Text[30];
        DocumentNo: Code[10];
        Description: Text[30];
        Amount: Decimal;
        "G/LAccount": Code[10];
        TotalncomeTax: Decimal;
        GrossPay: Decimal;
        Totalgross: Decimal;
        TotalNetPay: Decimal;
        Payday: Date;
        GenJnline: Record "Gen. Journal Line";
        LineNumber: Integer;
        TotalBasic: Decimal;
        PayrollPeriod: Record "Payroll PeriodX";
        PostingGroup: Record "Employee Posting GroupX";
        TaxAccount: Code[10];
        SalariesAcc: Code[10];
        PayablesAcc: Code[20];
        First: Code[10];
        Last: Code[10];
        EmployeeTemp: Record Employee temporary;
        TotalDebits: Decimal;
        TotalCredits: Decimal;
        AssignmentMat: Record "Assignment Matrix-X";
        JnlTemp: Record "Gen. Journal Batch";
        Found: Boolean;
        TotalSSF: Decimal;
        PeriodStartDate: Date;
        EmpRec: Record Employee;
        DateSpecified: Date;
        Payperiodtext: Text[30];
        TransferLoans: Boolean;
        TaxCode: Code[10];
        BasicSalary: Decimal;
        PAYE: Decimal;
        CompRec: Record "Human Resources Setup";
        HseLimit: Decimal;
        ExcessRetirement: Decimal;
        CfMpr: Decimal;
        relief: Decimal;
        GetPeriodFilter: Date;
        ActivityRec: Record "Dimension Value";
        EarningsCopy: Record EarningsX;
        LoanApp: Record "Loan Application";
        PGMapping: Record "Employee PGroups";
        Loanproduct: Record "Loan Product Type";
        EmpName: Text[70];
        JobTask: Record "Job Task";
        PayrollHeader: Record "Payroll Header";
        Text000: label 'There is no G/L Account setup for %1 %2 %3';
        Text001: label 'You are about to transfer the payroll summary for the wrong Period,Continue?';
        Text002: label 'Pay Date must be Specified for the Period';
        PayDate: Date;
        EmployeePosting: Record "Employee Posting GroupX";
        PayrollPeriodFilter: Date;
        AssignmentMatrix: Record "Assignment Matrix-X";
        exchequerAmount: Decimal;
        ProjectAmount: Decimal;
        TotalProjectCredits: Decimal;
        EmployerAmount: Decimal;
        exchequerAmountb: Decimal;
        EarningsX: Record EarningsX;
        DeductionX: Record DeductionsX;
        TotalEmpDeductions: Decimal;


    procedure GetTaxBracket(var TaxableAmount: Decimal)
    var
        TaxTable: Record BracketsX;
        TotalTax: Decimal;
        Tax: Decimal;
        EndTax: Boolean;
    begin
        AmountRemaining := TaxableAmount;
        AmountRemaining := AmountRemaining;
        AmountRemaining := PayrollRounding(AmountRemaining);
        EndTax := false;

        TaxTable.SetRange("Table Code", TaxCode);

        if TaxTable.Find('-') then begin
            repeat
                if AmountRemaining <= 0 then
                    EndTax := true
                else begin
                    if (TaxableAmount) > TaxTable."Upper Limit" then
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
        TotalTax := PayrollRounding(TotalTax);
        IncomeTax := -TotalTax;
        if not Employee."Pays tax?" then
            IncomeTax := 0;
    end;


    procedure GetPayPeriod(var PayPeriods: Record "Payroll PeriodX")
    begin
        PayrollPeriod := PayPeriods;
    end;


    procedure GetCurrentPeriod()
    var
        PayPeriodRec: Record "Payroll PeriodX";
    begin
        PayPeriodRec.SetRange(PayPeriodRec.Closed, false);
        if PayPeriodRec.Find('-') then
            PeriodStartDate := PayPeriodRec."Starting Date";
    end;


    procedure AdjustPostingGr()
    begin
        AssignmentMat.Reset;
        AssignmentMat.SetRange("Payroll Period", DateSpecified);
        if AssignmentMat.Find('-') then begin
            repeat
                if EmpRec.Get(AssignmentMat."Employee No") then
                    AssignmentMat."Posting Group Filter" := EmpRec."Posting Group";
                AssignmentMat.Modify;
            until AssignmentMat.Next = 0;
        end;
    end;


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
