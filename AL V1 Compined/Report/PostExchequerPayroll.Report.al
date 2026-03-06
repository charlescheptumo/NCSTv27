#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Report 69057 "Post Exchequer Payroll"
{
    DefaultLayout = RDLC;
    RDLCLayout = './Layouts/Post Exchequer Payroll.rdlc';
    ApplicationArea = All;

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
                DataItemTableView = where("Job No" = filter(<> 'PROJ0001'));
                RequestFilterFields = "Date Filter";
                column(ReportForNavId_1; 1)
                {
                }

                trigger OnAfterGetRecord()
                begin

                    //IF Employee.interest<>0 THEN


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



                    CompRec.Get;
                    AssignmentMatrix.Reset;
                    AssignmentMatrix.SetRange("Employee No", Employee."No.");
                    AssignmentMatrix.SetRange("Payroll Period", DateSpecified);
                    AssignmentMatrix.SetRange("Posting Group Filter", Employee."Posting Group");
                    AssignmentMatrix.SetRange(Honoraria, true);
                    AssignmentMatrix.SetRange("Non-Cash Benefit", false);
                    if AssignmentMatrix.Find('-') then begin
                        repeat

                            GenJnline.Init;
                            LineNumber := LineNumber + 10;
                            GenJnline."Journal Template Name" := CompRec."Payroll Journal Template";
                            GenJnline."Journal Batch Name" := CompRec."Payroll Journal Batch";
                            GenJnline."Line No." := GenJnline."Line No." + 10000;
                            GenJnline."Account Type" := GenJnline."account type"::"G/L Account";
                            GenJnline."Account No." := '3000090';
                            GenJnline."Posting Date" := CalcDate('CM', PayDate);
                            GenJnline.Description :=
                            AssignmentMatrix.Description + ' ' + Format(DateSpecified, 0, '<month text> <year4>');
                            GenJnline."Document No." := Payperiodtext;
                            GenJnline."External Document No." := AssignmentMatrix.Code;
                            GenJnline."Shortcut Dimension 1 Code" := Employee."Global Dimension 1 Code";
                            GenJnline.Amount := AssignmentMatrix.Amount;

                            if GenJnline.Amount <> 0 then begin
                                GenJnline.Insert;
                                TotalProjectCredits := TotalProjectCredits + AssignmentMatrix.Amount;
                            end;
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
            dataitem(EarningsX; EarningsX)
            {
                DataItemLink = "Posting Group Filter" = field(Code), "Pay Period Filter" = field("Pay Period Filter");
                DataItemTableView = sorting(Code);
                column(ReportForNavId_3; 3)
                {
                }

                trigger OnAfterGetRecord()
                begin
                    exchequerAmount := 0;
                    CompRec.Get;
                    AssignmentMatrix.Reset;
                    AssignmentMatrix.SetRange("Payroll Period", DateSpecified);
                    AssignmentMatrix.SetRange(Code, EarningsX.Code);
                    AssignmentMatrix.SetRange(Honoraria, false);
                    AssignmentMatrix.SetRange("Non-Cash Benefit", false);
                    AssignmentMatrix.SetRange("Job No", Employee."Job No");
                    AssignmentMatrix.SetRange("Posting Group Filter", Employee."Posting Group");
                    AssignmentMatrix.CalcSums(Amount);
                    exchequerAmount := AssignmentMatrix.Amount;
                    if exchequerAmount <> 0 then begin
                        GenJnline.Init;
                        LineNumber := LineNumber + 10;
                        GenJnline."Journal Template Name" := CompRec."Payroll Journal Template";
                        GenJnline."Journal Batch Name" := CompRec."Payroll Journal Batch";
                        GenJnline."Line No." := GenJnline."Line No." + 10000;
                        if PGMapping.Get("Employee Posting GroupX".Code, EarningsX.Code, 0) then begin
                            GenJnline."Account Type" := PGMapping."Account Type";
                            GenJnline."Account No." := PGMapping."G/L Account";
                        end else
                            Error(Text000, "Employee Posting GroupX".Code, EarningsX.Code, EarningsX.Description);
                        GenJnline."Posting Date" := CalcDate('CM', PayDate);
                        GenJnline.Description :=
                        AssignmentMatrix.Description + ' ' + Format(DateSpecified, 0, '<month text> <year4>');
                        GenJnline."Document No." := Payperiodtext;
                        GenJnline."External Document No." := EarningsX.Code;
                        GenJnline."Shortcut Dimension 1 Code" := Employee."Global Dimension 1 Code";
                        GenJnline.Amount := exchequerAmount;

                        //cc//   GenJnline."Job No." := CompRec."NSSF Amount";
                        GenJnline."Job Task No." := '10000';
                        GenJnline."Job Quantity" := 1;
                        GenJnline.Validate(GenJnline."Job No.");
                        GenJnline.Validate(GenJnline."Job Task No.");

                        if GenJnline.Amount <> 0 then begin
                            GenJnline.Insert;
                            TotalCredits := TotalCredits + exchequerAmount;
                        end;
                    end;
                end;

                trigger OnPreDataItem()
                begin

                    EarningsX.SetRange(EarningsX."Non-Cash Benefit", false);
                end;
            }
            dataitem(DeductionsX; DeductionsX)
            {
                DataItemLink = "Posting Group Filter" = field(Code), "Pay Period Filter" = field("Pay Period Filter");
                DataItemTableView = sorting(Code);
                column(ReportForNavId_5; 5)
                {
                }

                trigger OnAfterGetRecord()
                begin

                    exchequerAmountb := 0;
                    CompRec.Get;
                    AssignmentMatrix.Reset;
                    AssignmentMatrix.SetRange("Payroll Period", DateSpecified);
                    AssignmentMatrix.SetRange(Code, DeductionsX.Code);
                    AssignmentMatrix.SetRange("Job No", Employee."Job No");
                    AssignmentMatrix.SetRange(Honoraria, false);
                    AssignmentMatrix.SetRange("Posting Group Filter", Employee."Posting Group");
                    AssignmentMatrix.CalcSums(Amount);
                    exchequerAmountb := AssignmentMatrix.Amount;
                    if exchequerAmountb <> 0 then begin
                        GenJnline.Init;
                        LineNumber := LineNumber + 10;
                        GenJnline."Journal Template Name" := CompRec."Payroll Journal Template";
                        GenJnline."Journal Batch Name" := CompRec."Payroll Journal Batch";
                        GenJnline."Line No." := GenJnline."Line No." + 10000;
                        if PGMapping.Get("Employee Posting GroupX".Code, DeductionsX.Code, 1) then begin
                            GenJnline."Account Type" := PGMapping."Account Type";
                            GenJnline."Account No." := PGMapping."G/L Account";
                        end else
                            Error(Text000, "Employee Posting GroupX".Code, DeductionsX.Code, DeductionsX.Description);
                        GenJnline."Posting Date" := CalcDate('CM', PayDate);
                        GenJnline.Description :=
                        AssignmentMatrix.Description + ' ' + Format(DateSpecified, 0, '<month text> <year4>');
                        GenJnline."Document No." := Payperiodtext;
                        GenJnline."External Document No." := DeductionsX.Code;
                        GenJnline."Shortcut Dimension 1 Code" := Employee."Global Dimension 1 Code";
                        GenJnline.Amount := exchequerAmountb;

                        if PGMapping."Account Type" = PGMapping."account type"::"G/L Account" then begin
                            //cc//  GenJnline."Job No." := CompRec."NSSF Amount";
                            GenJnline."Job Task No." := '10000';
                            GenJnline."Job Quantity" := 1;
                            GenJnline.Validate(GenJnline."Job No.");
                            GenJnline.Validate(GenJnline."Job Task No.");
                        end;
                        if GenJnline.Amount <> 0 then begin
                            GenJnline.Insert;
                            TotalDebits := TotalDebits + exchequerAmountb;

                        end;
                    end;


                    //Employer Amount NssF
                    EmployerAmount := 0;
                    CompRec.Get;
                    AssignmentMatrix.Reset;
                    AssignmentMatrix.SetRange("Payroll Period", DateSpecified);
                    AssignmentMatrix.SetRange(Code, DeductionsX.Code);
                    AssignmentMatrix.SetRange(Honoraria, false);
                    AssignmentMatrix.SetRange("Job No", Employee."Job No");
                    AssignmentMatrix.SetRange("Posting Group Filter", Employee."Posting Group");
                    if AssignmentMatrix.FindFirst then begin
                        AssignmentMatrix.CalcSums("Employer Amount");
                        EmployerAmount := AssignmentMatrix."Employer Amount";
                        if EmployerAmount <> 0 then begin
                            GenJnline.Init;
                            LineNumber := LineNumber + 10;
                            GenJnline."Journal Template Name" := CompRec."Payroll Journal Template";
                            GenJnline."Journal Batch Name" := CompRec."Payroll Journal Batch";
                            GenJnline."Line No." := GenJnline."Line No." + 10000;
                            if PGMapping.Get("Employee Posting GroupX".Code, DeductionsX.Code, 1) then begin
                                GenJnline."Account Type" := PGMapping."Account Type";
                                GenJnline."Account No." := PGMapping."G/L Account";
                            end else
                                Error(Text000, "Employee Posting GroupX".Code, DeductionsX.Code, DeductionsX.Description);
                            GenJnline."Posting Date" := CalcDate('CM', PayDate);
                            GenJnline.Description :=
                            AssignmentMatrix.Description + ' ' + Format(DateSpecified, 0, '<month text> <year4>' + 'Employer');
                            GenJnline."Document No." := Payperiodtext;
                            GenJnline."External Document No." := DeductionsX.Code;
                            GenJnline."Shortcut Dimension 1 Code" := Employee."Global Dimension 1 Code";
                            GenJnline.Amount := EmployerAmount * -1;

                            if PGMapping."Account Type" = PGMapping."account type"::"G/L Account" then begin
                                //cc//     GenJnline."Job No." := CompRec."NSSF Amount";
                                GenJnline."Job Task No." := '10000';
                                GenJnline."Job Quantity" := 1;
                                GenJnline.Validate(GenJnline."Job No.");
                                GenJnline.Validate(GenJnline."Job Task No.");
                            end;
                            if GenJnline.Amount <> 0 then
                                GenJnline.Insert
                        end;
                    end;
                end;

                trigger OnPreDataItem()
                begin
                    //DeductionsX.SETRANGE(DeductionsX."Pay Period Filter",DateSpecified);
                end;
            }
            dataitem(Employer; DeductionsX)
            {
                DataItemLink = "Posting Group Filter" = field(Code), "Pay Period Filter" = field("Pay Period Filter");
                DataItemTableView = sorting(Code);
                column(ReportForNavId_4; 4)
                {
                }

                trigger OnAfterGetRecord()
                begin



                    CompRec.Get;
                    EmployerAmount := 0;
                    CompRec.Get;
                    AssignmentMatrix.Reset;
                    AssignmentMatrix.SetRange("Payroll Period", DateSpecified);
                    AssignmentMatrix.SetRange(Code, Employer.Code);
                    AssignmentMatrix.SetRange(Honoraria, false);
                    AssignmentMatrix.SetRange("Job No", Employee."Job No");
                    AssignmentMatrix.SetRange("Posting Group Filter", Employee."Posting Group");
                    if AssignmentMatrix.FindFirst then begin
                        AssignmentMatrix.CalcSums("Employer Amount");
                        EmployerAmount := AssignmentMatrix."Employer Amount";

                        GenJnline.Init;
                        GenJnline."Journal Template Name" := CompRec."Payroll Journal Template";
                        GenJnline."Journal Batch Name" := CompRec."Payroll Journal Batch";
                        GenJnline."Line No." := GenJnline."Line No." + 10000;
                        if PGMapping.Get("Employee Posting GroupX".Code, Employer.Code, 1) then begin
                            GenJnline."Account Type" := GenJnline."account type"::"G/L Account";
                            GenJnline."Account No." := PGMapping."GL Account Employer";
                        end;
                        GenJnline."Posting Date" := CalcDate('CM', PayDate);
                        GenJnline.Description := Employer.Description + ' ' + Format(DateSpecified, 0, '<month text> <year4>' + 'Employer');
                        GenJnline."Document No." := Payperiodtext;


                        EmployeePosting.Reset;
                        //cc//    EmployeePosting.SetRange(Exchequer, true);
                        if EmployeePosting.Find('-') then begin
                            EmployeePosting.TestField("Gratuity Code");
                            //cc//   EmployeePosting.TestField("Job Task No");
                            GenJnline."Job No." := JobTask."Job No.";
                            GenJnline."Job Task No." := JobTask."Job Task No.";
                            GenJnline."Job Quantity" := 1;
                            GenJnline.Validate(GenJnline."Job No.");
                            GenJnline.Validate(GenJnline."Job Task No.");
                        end;
                        GenJnline.Amount := Abs(PayrollRounding(EmployerAmount));
                        if GenJnline.Amount <> 0 then
                            GenJnline.Insert;
                    end;
                end;

                trigger OnPreDataItem()
                begin

                    Employer.SetRange(Employer."Pay Period Filter", DateSpecified);
                end;
            }

            trigger OnAfterGetRecord()
            begin

                TotalncomeTax := 0;
                TotalBasic := 0;
                TotalNetPay := 0;
                Totalgross := 0;
                TotalCredits := 0;
                TotalDebits := 0;
                TotalProjectCredits := 0;
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

                TotalNetPay := TotalProjectCredits + TotalCredits + TotalDebits;


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
