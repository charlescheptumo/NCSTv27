#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Report 69050 "Process Gratuity"
{
    ProcessingOnly = true;
    ApplicationArea = All;

    dataset
    {
        dataitem(Employee; Employee)
        {
            DataItemTableView = sorting("No.") where(Status = const(Active));
            RequestFilterFields = "No.", "Posting Group", "Pay Period Filter";
            column(ReportForNavId_7528; 7528)
            {
            }

            trigger OnAfterGetRecord()
            var
                GratuityTax: Decimal;
            begin
                //GET gratuity payable from hrsetup CompRec
                CompRec.Get;
                if CompRec."Graduity Paid Code" = '' then
                    Error(TXT001);
                Earnings.Reset;
                Earnings.SetRange("Earning Type", Earnings."earning type"::Gratuity);
                if Earnings.FindFirst then begin
                    TotalGratuity := 0.0;
                    Assignmatrix.Reset;
                    Assignmatrix.SetRange("Employee No", Employee."No.");
                    Assignmatrix.SetRange(Code, Earnings.Code);
                    if Assignmatrix.FindSet then begin
                        repeat
                            TotalGratuity := TotalGratuity + Assignmatrix.Amount;
                        until Assignmatrix.Next = 0;
                    end;
                    Employee.CalcFields(Employee.Branch, Employee.Paypoint, Employee."Staffing Group", Employee.Department, Insurance);
                    Assignmatrix.Init;
                    Assignmatrix."Employee No" := Employee."No.";
                    Assignmatrix.Type := Assignmatrix.Type::Payment;
                    Assignmatrix.Code := CompRec."Graduity Paid Code";
                    Assignmatrix.Validate(Code);
                    Assignmatrix."Payroll Period" := Month;
                    Assignmatrix."Department Code" := Employee."Global Dimension 1 Code";
                    Assignmatrix."Posting Group Filter" := Employee."Posting Group";
                    Assignmatrix."Profit Centre" := Employee."Global Dimension 2 Code";
                    Assignmatrix."Salary Pointer" := Employee."Salary Scale";
                    Assignmatrix.Branch := Employee.Branch;
                    Assignmatrix."Pay Point" := Employee.Paypoint;
                    Assignmatrix."Staffing Group" := Employee."Staffing Group";
                    Assignmatrix."Department Code" := Employee.Department;
                    Assignmatrix.Amount := TotalGratuity;
                    if Assignmatrix.Amount <> 0 then
                        Assignmatrix.Insert;
                end;
                Message(TXT002, TotalGratuity);

                if CompRec."Gratuity PAYE graduated" = false then begin
                    //calculate tax for gatuity
                    BasicSalary := 0;
                    IncomeTax := GetTaxBracket(TotalGratuity, CompRec."Tax Table");
                    //INSERT THE PAYE Amountto the total PAYE for the emaployee
                    Message('%1', IncomeTax);
                    Assignmatrix.Reset;
                    Assignmatrix.SetRange("Employee No", Employee."No.");
                    Assignmatrix.SetRange(Closed, false);
                    Assignmatrix.SetRange(Type, Assignmatrix.Type::Deduction);
                    Assignmatrix.SetRange(Paye, true);
                    if Assignmatrix.FindFirst then begin
                        Assignmatrix.Amount := Assignmatrix.Amount - IncomeTax;
                        Assignmatrix.Modify(true);

                    end;
                end
                else begin
                    //calculate tax for gatuity
                    BasicSalary := 0;
                    //find the brackets table active
                    BracketsX.Reset;
                    BracketsX.SetRange(Gratuity, true);
                    if BracketsX.FindSet then begin
                        repeat
                            Earnings.Reset;
                            Earnings.SetRange("Earning Type", Earnings."earning type"::Gratuity);
                            if Earnings.FindSet then begin
                                TotalGratuity := 0.0;

                                Assignmatrix.Reset;
                                Assignmatrix.SetRange("Employee No", Employee."No.");
                                Assignmatrix.SetRange(Code, Earnings.Code);
                                Assignmatrix.SetFilter("Payroll Period", '%1..%2', BracketsX."Effective Starting Date", BracketsX."Effective End Date");
                                if Assignmatrix.FindSet then begin
                                    repeat
                                        TotalGratuity := TotalGratuity + Assignmatrix.Amount;
                                    until Assignmatrix.Next = 0;
                                end;
                                Message('Tax for the period %1 to %2,-is,:%3', BracketsX."Effective Starting Date", BracketsX."Effective End Date", GetTaxBracket(TotalGratuity, BracketsX."Bracket Code"));
                                GratuityTax := GratuityTax + GetTaxBracket(TotalGratuity, BracketsX."Bracket Code");


                            end;

                        until BracketsX.Next = 0;
                        Assignmatrix.Reset;
                        Assignmatrix.SetRange("Employee No", Employee."No.");
                        Assignmatrix.SetRange(Closed, false);
                        Assignmatrix.SetRange(Type, Assignmatrix.Type::Deduction);
                        Assignmatrix.SetRange(Paye, true);
                        if Assignmatrix.FindFirst then begin
                            Assignmatrix.Amount := Assignmatrix.Amount - GratuityTax;
                            Assignmatrix.Modify(true);

                        end
                    end;

                end
                //Window.UPDATE(1,Employee."First Name"+' '+Employee."Middle Name"+ ' '+Employee."Last Name");
            end;

            trigger OnPostDataItem()
            begin
                Window.Close;
            end;

            trigger OnPreDataItem()
            begin
                Window.Open('Calculating Gratuity For ##############################1', EmployeeName);
                PayrollPeriod.SetRange(Closed, false);
                if PayrollPeriod.Find('-') then
                    Month := PayrollPeriod."Starting Date";
                LastMonth := CalcDate('-1M', Month);
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
        GetPayPeriod;
        DateSpecified := BeginDate;
        if PayPeriod.Get(DateSpecified) then
            PayPeriodtext := PayPeriod.Name;
        EndDate := CalcDate('1M', DateSpecified - 1);
        CompRec.Get;
        TaxCode := CompRec."Tax Table";
    end;

    var
        NextInt: Integer;
        ScaleBenefits: Record "Scale Benefits";
        SalaryPointers: Record "Salary Pointers";
        SalaryPointers1: Record "Salary Pointers";
        Assignmatrix: Record "Assignment Matrix-X";
        BeginDate: Date;
        DateSpecified: Date;
        BasicSalary: Decimal;
        TaxableAmount: Decimal;
        CompRec: Record "Human Resources Setup";
        HseLimit: Decimal;
        TaxCode: Code[10];
        retirecontribution: Decimal;
        ExcessRetirement: Decimal;
        GrossPay: Decimal;
        TotalBenefits: Decimal;
        TaxablePay: Decimal;
        RetireCont: Decimal;
        TotalQuarters: Decimal;
        IncomeTax: Decimal;
        relief: Decimal;
        EmpRec: Record Employee;
        NetPay: Decimal;
        NetPay1: Decimal;
        Index: Integer;
        Intex: Integer;
        AmountRemaining: Decimal;
        PayPeriod: Record "Payroll PeriodX";
        DenomArray: array[1, 12] of Text[50];
        NoOfUnitsArray: array[1, 12] of Integer;
        AmountArray: array[1, 60] of Decimal;
        PayMode: Text[30];
        PayPeriodtext: Text[30];
        EndDate: Date;
        DaysinAmonth: Decimal;
        HoursInamonth: Decimal;
        Earnings: Record EarningsX;
        CfMpr: Decimal;
        Deductions: Record DeductionsX;
        NormalOvertimeHours: Decimal;
        WeekendOvertime: Decimal;
        PayrollPeriod: Record "Payroll PeriodX";
        Window: Dialog;
        EmployeeName: Text[230];
        NoOfDays: Integer;
        Month: Date;
        GetPaye: Codeunit Payroll3;
        GetGroup: Codeunit Payroll3;
        GroupCode: Code[20];
        CUser: Code[20];
        ScalePointer: Record "Salary Pointers2";
        SalaryScale: Record "Salary Scales2";
        CurrentMonth: Integer;
        CurrentMonthtext: Text[30];
        HseAllow: Record "House Allowance Matrix2";
        Ded: Record DeductionsX;
        Assmatrix: Record "Assignment Matrix-X";
        LoanType: Record "Loan Product Type";
        LoanApplication: Record "Loan Application";
        LoanBalance: Decimal;
        InterestAmt: Decimal;
        RefNo: Code[20];
        LastMonth: Date;
        NextPointer: Code[10];
        UserRole: Record "Access Control";
        NETPAY3: Decimal;
        Assignmatrix2: Record "Assignment Matrix-X";
        InsuranceAmount: Decimal;
        TotalGratuity: Decimal;
        TXT001: label 'The gratuity paid code should be set up under Human Resource setup';
        TXT002: label 'Gratuity Kshs. %1,has been assigned';
        BracketsX: Record "Bracket Tablesx";
        TaxTableDate: Date;
        AssignmatrixTAX: Record "Assignment Matrix-X";


    procedure GetPayPeriod()
    begin
        PayPeriod.SetRange(PayPeriod."Close Pay", false);
        if PayPeriod.Find('-') then begin
            //PayPeriodtext:=PayPeriod.Name;
            BeginDate := PayPeriod."Starting Date";
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


    procedure GetTaxBracket(var TaxableAmount: Decimal; var BracketTaxCode: Code[30]) GratuityTax: Decimal
    var
        TaxTable: Record BracketsX;
        TotalTax: Decimal;
        Tax: Decimal;
        EndTax: Boolean;
    begin
        CompRec.Get;
        TaxCode := BracketTaxCode;
        //MESSAGE('%1',TaxCode);

        AmountRemaining := TaxableAmount;
        // AmountRemaining:=ROUND(AmountRemaining,0.01);
        EndTax := false;
        TaxTable.Reset;
        TaxTable.SetRange("Table Code", TaxCode);


        if TaxTable.Find('-') then begin
            repeat


                if AmountRemaining <= 0 then
                    EndTax := true


                else begin

                    // IF ROUND((TaxableAmount),1)>=TaxTable."Upper Limit" THEN
                    if TaxableAmount >= TaxTable."Upper Limit" then begin

                        Tax := (TaxTable."Taxable Amount" * TaxTable.Percentage / 100);
                        //  MESSAGE('%1',Tax);
                        //Tax:=ROUND((TaxTable."Taxable Amount"*TaxTable.Percentage/100),1);
                        // MESSAGE('Percent %1 %2',TaxTable.Percentage,Tax);
                        TotalTax := TotalTax + Tax;
                        //
                    end
                    else begin
                        //Deducted 1 here and got the xact figures just chek incase this may have issues
                        //Only the amount in the last Tax band had issues.
                        AmountRemaining := AmountRemaining - TaxTable."Lower Limit";
                        // MESSAGE('last bracket =%1 and Tax amt=%2',AmountRemaining,Tax);
                        Tax := AmountRemaining * (TaxTable.Percentage / 100);
                        // MESSAGE('%1',Tax);
                        //Tax:=AmountRemaining*TaxTable.Percentage/100;
                        //MESSAGE('last bracket =%1 and Tax amt=%2',AmountRemaining,Tax);
                        EndTax := true;
                        TotalTax := TotalTax + Tax;
                    end;
                end;
            until (TaxTable.Next = 0) or EndTax = true;
        end;
        TotalTax := TotalTax;
        // MESSAGE('%1',TotalTax);
        TotalTax := PayrollRounding(TotalTax);
        IncomeTax := -TotalTax;

        //GetTaxBracket:=ROUND(TotalTax,1,'<');
        GratuityTax := TotalTax;
        exit(GratuityTax);
    end;
}
