#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Report 69004 "Payroll Run"
{
    ProcessingOnly = true;
    UsageCategory = Tasks;
    ApplicationArea = All;

    dataset
    {
        dataitem(Employee; Employee)
        {
            DataItemTableView = sorting("No.") where(Status = const(Active));
            RequestFilterFields = "No.", "Posting Group", Status;
            column(ReportForNavId_7528; 7528)
            {
            }

            trigger OnAfterGetRecord()
            begin
                if Employee."Incremental Month" <> 0D then begin
                    if Employee."Incremental Month" = DateSpecified then begin
                        SalaryPointers.Reset;
                        SalaryPointers.SetRange(SalaryPointers."Salary Scale", Employee."Salary Scale");
                        SalaryPointers.SetRange(SalaryPointers."Salary Pointer", Employee.Present);
                        if SalaryPointers.FindFirst then begin
                            //MESSAGE('Here %1',Employee.Present);
                            NextInt := SalaryPointers."Pointer Int" + 1;
                            SalaryPointers1.Reset;
                            SalaryPointers1.SetRange(SalaryPointers1."Pointer Int", NextInt);
                            SalaryPointers1.SetRange(SalaryPointers1."Salary Scale", SalaryPointers."Salary Scale");
                            if SalaryPointers1.FindSet then begin
                                Employee.Present := SalaryPointers1."Salary Pointer";
                                Employee.Validate(Employee.Present);
                                Employee.Previous := SalaryPointers."Salary Pointer";
                                Employee."Incremental Month" := CalcDate('<+1Y>', Employee."Incremental Month");
                                Employee.Modify;
                            end;
                        end;
                    end;
                end;
                NETPAY3 := 0;
                CompRec.Get;
                CompRec.TestField(CompRec."Tax Relief Code");
                Employee.SetRange("Pay Period Filter", Month);
                Employee.CalcFields(Employee.Branch, Basic, Employee.Paypoint, Employee."Staffing Group", Employee.Department, Insurance);
                /*
                 IF Deductions."Calculation Method"=Deductions."Calculation Method"::"% of Basic Pay" THEN BEGIN

                      //Empl.CALCFIELDS(Empl."Total Allowances1",Employee.Basic);
                      Amount:=((Deductions.Percentage/100)* Employee.Basic);
                      "Employer Amount":=((Deductions.Percentage/100)*Employee.Basic);
                       Amount:=PayrollRounding(Amount);
                      "Employer Amount":=PayrollRounding("Employer Amount");

                  END;*/

                //NSSF 2 Deduction
                // Zerorize all passed effective date
                Assignmatrix.Reset;
                Assignmatrix.SetRange(Assignmatrix."Employee No", Employee."No.");
                Assignmatrix.SetRange(Assignmatrix.Closed, false);
                Assignmatrix.SetFilter(Assignmatrix."Effective End Date", '<>%1 & <%2', 0D, Month);
                if Assignmatrix.Find('-') then begin
                    repeat
                        Assignmatrix.Amount := 0;
                        Assignmatrix.Modify;
                    until Assignmatrix.Next = 0;
                end;

                Deductions.Reset;
                Deductions.SetRange(Deductions.Code, CompRec."NSSF Tier II Code");

                if Deductions.Find('-') then begin

                    Assignmatrix.Reset;
                    Assignmatrix.SetRange(Assignmatrix.Code, Deductions.Code);
                    Assignmatrix.SetRange(Assignmatrix.Type, Assignmatrix.Type::Deduction);
                    Assignmatrix.SetRange(Assignmatrix."Employee No", Employee."No.");
                    Assignmatrix.SetRange(Assignmatrix."Payroll Period", Month);

                    if Assignmatrix.Find('-') then begin
                        //MESSAGE('%1',Assignmatrix.Code);
                        repeat

                            //IF Employee."Skip NHIF Update"=FALSE THEN BEGIN
                            Assignmatrix.Validate(Assignmatrix.Code);
                            Assignmatrix.Modify;

                        //END;
                        until Assignmatrix.Next = 0;

                    end else begin

                        Assignmatrix.Init;
                        Assignmatrix."Employee No" := Employee."No.";
                        Assignmatrix.Type := Assignmatrix.Type::Deduction;
                        Assignmatrix.Code := Deductions.Code;
                        Assignmatrix.Validate(Code);
                        Assignmatrix."Payroll Period" := Month;
                        Assignmatrix."Department Code" := Employee."Global Dimension 1 Code";
                        //Assignmatrix.Amount:=0;
                        //MESSAGE('Incometax=%1',IncomeTax);
                        //Assignmatrix.Paye:=TRUE;
                        //Assignmatrix."Taxable amount":=TaxableAmount;
                        //Assignmatrix."Less Pension Contribution":=RetireCont;
                        //Assignmatrix.Paye:=TRUE;
                        Assignmatrix."Posting Group Filter" := Employee."Posting Group";
                        Assignmatrix."Profit Centre" := Employee."Global Dimension 2 Code";
                        Assignmatrix."Salary Pointer" := Employee."Salary Scale";
                        Assignmatrix.Branch := Employee.Branch;
                        Assignmatrix."Pay Point" := Employee.Paypoint;
                        Assignmatrix."Staffing Group" := Employee."Staffing Group";
                        Assignmatrix."Department Code" := Employee.Department;
                        Assignmatrix.Validate(Amount);
                        if Assignmatrix.Amount <> 0 then
                            Assignmatrix.Insert;


                    end;
                    // end of deletion
                end;

                if Assignmatrix2.Get(Employee."No.", Assignmatrix2.Type::Payment
                , CompRec."Tax Relief Code", Month) = true then begin
                    Assignmatrix2.Validate(Assignmatrix2.Code);
                    Assignmatrix2.Modify
                end else begin

                    Assignmatrix.Init;
                    Assignmatrix.SetRange(Assignmatrix.Status, Employee.Status::Active);
                    Assignmatrix."Employee No" := Employee."No.";
                    Assignmatrix.Validate("Employee No");
                    Assignmatrix."Payroll Period" := Month;
                    Assignmatrix.Validate("Payroll Period");
                    Assignmatrix.Type := Assignmatrix.Type::Payment;
                    Assignmatrix.Code := CompRec."Tax Relief Code";
                    Assignmatrix.Validate(Code);
                    //Assignmatrix.Amount:=-NETPAY3;
                    Assignmatrix.Validate(Amount);
                    Assignmatrix."Posting Group Filter" := Employee."Posting Group";
                    Assignmatrix."Profit Centre" := Employee."Global Dimension 2 Code";
                    Assignmatrix.Branch := Employee.Branch;
                    Assignmatrix."Pay Point" := Employee.Paypoint;
                    Assignmatrix."Staffing Group" := Employee."Staffing Group";
                    Assignmatrix."Department Code" := Employee."Department Name";
                    Assignmatrix."Salary Pointer" := Employee."Salary Scale";
                    Assignmatrix.Insert;

                end;



                Deductions.Reset;
                Deductions.SetRange(Deductions."PAYE Code", true);
                if Deductions.Find('-') then begin
                    // Delete all Previous PAYE
                    Assignmatrix.Reset;
                    Assignmatrix.SetRange(Assignmatrix.Code, Deductions.Code);
                    Assignmatrix.SetRange(Assignmatrix.Type, Assignmatrix.Type::Deduction);
                    Assignmatrix.SetRange(Assignmatrix."Employee No", Employee."No.");
                    Assignmatrix.SetRange(Assignmatrix."Payroll Period", Month);
                    Assignmatrix.DeleteAll;
                    // end of deletion
                end;

                // validate assigment matrix code incase basic salary change and update calculation based on basic salary
                Assignmatrix.Reset;
                Assignmatrix.SetRange(Assignmatrix."Employee No", Employee."No.");
                Assignmatrix.SetRange(Assignmatrix."Payroll Period", Month);
                if Assignmatrix.Find('-') then begin
                    repeat
                        if Assignmatrix.Type = Assignmatrix.Type::Payment then begin
                            if Earnings.Get(Assignmatrix.Code) then begin
                                ///IF (Earnings."Calculation Method"=Earnings."Calculation Method"::"% of Basic pay") OR AULERIAH
                                if (Earnings."Calculation Method" = Earnings."calculation method"::"% of Basic after tax") or
                                   (Earnings."Calculation Method" = Earnings."calculation method"::"Based on Hourly Rate") then begin

                                    Assignmatrix.Validate(Code);
                                    Assignmatrix.Validate(Assignmatrix."Employee Voluntary");
                                    //Assignmatrix.Amount:=ROUND(Assignmatrix.Amount,1);

                                    Assignmatrix.Modify;
                                end;
                            end;
                        end;
                        if Assignmatrix.Retirement = false then begin
                            if Assignmatrix.Type = Assignmatrix.Type::Deduction then begin
                                if Deductions.Get(Assignmatrix.Code) then begin
                                    if (Deductions."Calculation Method" = Deductions."calculation method"::"% of Basic Pay") or
                                       (Deductions."Calculation Method" = Deductions."calculation method"::"Based on Hourly Rate") or
                                       (Deductions."Calculation Method" = Deductions."calculation method"::"Based on Daily Rate ") then begin

                                        Assignmatrix.Validate(Code);
                                        Assignmatrix.Validate(Assignmatrix."Employee Voluntary");
                                        // Assignmatrix.Amount:=ROUND(Assignmatrix.Amount,1);

                                        Assignmatrix.Modify;
                                    end;
                                end;
                            end;
                        end;
                        if Assignmatrix.Type = Assignmatrix.Type::Deduction then begin
                            if Deductions.Get(Assignmatrix.Code) then begin
                                if (Deductions."Calculation Method" = Deductions."calculation method"::"Based on Table") then begin

                                    Assignmatrix.Validate(Code);
                                    Assignmatrix.Amount := ROUND(Assignmatrix.Amount, 1);

                                    Assignmatrix.Modify;
                                end;
                            end;
                        end;
                    until Assignmatrix.Next = 0;
                end;



                //Assign Insurance Relief Daudi
                if Employee.Insurance <> 0 then begin
                    Earnings.Reset;
                    Earnings.SetCurrentkey("Earning Type");
                    Earnings.SetRange("Earning Type", Earnings."earning type"::"Insurance Relief");
                    if Earnings.Find('-') then begin
                        InsuranceAmount := 0;
                        InsuranceAmount := Abs(Employee.Insurance * (Earnings.Percentage / 100));
                        if InsuranceAmount > 5000 then
                            InsuranceAmount := Earnings."Maximum Limit";
                        Assignmatrix.Init;
                        Assignmatrix."Employee No" := Employee."No.";
                        Assignmatrix.Type := Assignmatrix.Type::Payment;
                        Assignmatrix.Code := Earnings.Code;
                        Assignmatrix.Validate(Code);
                        Assignmatrix."Payroll Period" := Month;
                        Assignmatrix."Department Code" := Employee."Global Dimension 1 Code";
                        Assignmatrix.Amount := InsuranceAmount;
                        Assignmatrix."Posting Group Filter" := Employee."Posting Group";
                        Assignmatrix."Profit Centre" := Employee."Global Dimension 2 Code";
                        Assignmatrix.Branch := Employee.Branch;
                        Assignmatrix."Salary Pointer" := Employee."Salary Scale";
                        Assignmatrix."Pay Point" := Employee.Paypoint;
                        Assignmatrix."Staffing Group" := Employee."Staffing Group";
                        Assignmatrix."Department Code" := Employee.Department;
                        Assignmatrix.Validate(Amount);
                        if (Assignmatrix.Amount <> 0) and
                           (not Assignmatrix.Get(Assignmatrix."Employee No", Assignmatrix.Type,
                                Assignmatrix.Code, Assignmatrix."Payroll Period", Assignmatrix."Reference No")) then
                            Assignmatrix.Insert
                        else begin
                            InsuranceAmount := Abs(Employee.Insurance * (Earnings.Percentage / 100));
                            if InsuranceAmount > 5000 then
                                InsuranceAmount := Earnings."Maximum Limit";
                            Assignmatrix.Init;
                            Assignmatrix."Employee No" := Employee."No.";
                            Assignmatrix.Type := Assignmatrix.Type::Payment;
                            Assignmatrix.Code := Earnings.Code;
                            Assignmatrix.Validate(Code);
                            Assignmatrix."Payroll Period" := Month;
                            Assignmatrix."Department Code" := Employee."Global Dimension 1 Code";
                            Assignmatrix.Amount := InsuranceAmount;
                            Assignmatrix."Posting Group Filter" := Employee."Posting Group";
                            Assignmatrix."Profit Centre" := Employee."Global Dimension 2 Code";
                            Assignmatrix."Salary Pointer" := Employee."Salary Scale";
                            Assignmatrix.Branch := Employee.Branch;
                            Assignmatrix."Pay Point" := Employee.Paypoint;
                            Assignmatrix."Staffing Group" := Employee."Staffing Group";
                            Assignmatrix."Department Code" := Employee.Department;
                            Assignmatrix.Validate(Amount);
                            if not Assignmatrix.Insert(true) then
                                Assignmatrix.Modify;
                        end;
                    end;
                end;
                //
                //Delete Tax Relief for Project Employees
                if Employee."Employee Type" = Employee."employee type"::Project then begin
                    Assignmatrix.Reset;
                    Assignmatrix.SetRange(Assignmatrix.Code, 'E0011');
                    Assignmatrix.SetRange(Assignmatrix.Type, Assignmatrix.Type::Payment);
                    Assignmatrix.SetRange(Assignmatrix."Employee No", Employee."No.");
                    Assignmatrix.SetRange(Assignmatrix."Payroll Period", Month);
                    Assignmatrix.DeleteAll;

                end;
                //End Delete Tax Relief for Project Employees

                Deductions.Reset;
                Deductions.SetRange(Deductions."PAYE Code", true);
                //filter based on employee type..Normal,Project

                if Deductions.Find('-') then begin

                    if Employee."Employee Type" = Employee."employee type"::Normal then
                        GetPaye.CalculateTaxableAmount(Employee."No.", Month, IncomeTax, TaxableAmount, RetireCont)
                    else
                        GetPaye.CalculateTaxableAmountPro(Employee."No.", Month, IncomeTax, TaxableAmount, RetireCont);

                    // Create PAYE
                    Assignmatrix.Init;
                    Assignmatrix."Employee No" := Employee."No.";
                    Assignmatrix.Type := Assignmatrix.Type::Deduction;
                    Assignmatrix.Code := Deductions.Code;
                    Assignmatrix.Validate(Code);
                    Assignmatrix."Payroll Period" := Month;
                    Assignmatrix."Department Code" := Employee."Global Dimension 1 Code";
                    if IncomeTax > 0 then
                        IncomeTax := -IncomeTax;
                    Assignmatrix.Amount := IncomeTax;
                    //MESSAGE('Incometax=%1',IncomeTax);
                    Assignmatrix.Paye := true;
                    //MESSAGE('TaxableAmount=%1',TaxableAmount);
                    Assignmatrix."Taxable amount" := TaxableAmount;
                    Assignmatrix."Less Pension Contribution" := RetireCont;
                    Assignmatrix.Paye := true;
                    Assignmatrix."Posting Group Filter" := Employee."Posting Group";
                    Assignmatrix."Profit Centre" := Employee."Global Dimension 2 Code";
                    Assignmatrix.Branch := Employee.Branch;
                    Assignmatrix."Pay Point" := Employee.Paypoint;
                    Assignmatrix."Staffing Group" := Employee."Staffing Group";
                    Assignmatrix."Department Code" := Employee.Department;
                    Assignmatrix."Salary Pointer" := Employee."Salary Scale";
                    Assignmatrix.Validate(Amount);
                    if Assignmatrix.Amount <> 0 then
                        Assignmatrix.Insert;
                end else
                    Error('Must specify Paye Code under deductions');

                //Update Pay Mode
                Assignmatrix.Reset;
                Assignmatrix.SetRange(Assignmatrix."Employee No", Employee."No.");
                Assignmatrix.SetRange(Assignmatrix."Payroll Period", Month);
                if Assignmatrix.Find('-') then
                    repeat
                        if Employee."Payroll Pay Mode" <> Assignmatrix."Pay Mode" then begin
                            Assignmatrix."Pay Mode" := Employee."Payroll Pay Mode";
                            Assignmatrix.Modify;
                        end;
                    until Assignmatrix.Next = 0;
                //

                if ((Employee."Terminal Dues" = true) and (Employee."Pays tax?" = true)) then begin
                    Employee.SetRange(Employee."Pay Period Filter", Month);
                    Employee.CalcFields(Employee."Total Allowances", Employee."Total Deductions");

                    //NHIF deduction
                    Deductions.Reset;
                    Deductions.SetRange(Deductions.Code, CompRec."NHIF Code");

                    if Deductions.Find('-') then begin

                        Assignmatrix.Reset;
                        Assignmatrix.SetRange(Assignmatrix.Code, Deductions.Code);
                        Assignmatrix.SetRange(Assignmatrix.Type, Assignmatrix.Type::Deduction);
                        Assignmatrix.SetRange(Assignmatrix."Employee No", Employee."No.");
                        Assignmatrix.SetRange(Assignmatrix."Payroll Period", Month);

                        if Assignmatrix.Find('-') then begin
                            repeat
                                Assignmatrix.Validate(Assignmatrix.Code);
                                Assignmatrix.Modify;
                            until Assignmatrix.Next = 0;

                        end;
                        // end of deletion
                    end;

                    NETPAY3 := Employee."Total Allowances" + Employee."Total Deductions";

                    if NETPAY3 <> 0 then begin


                        Assignmatrix.Init;
                        Assignmatrix."Employee No" := Employee."No.";
                        Assignmatrix.Validate("Employee No");
                        Assignmatrix."Payroll Period" := Month;
                        Assignmatrix.Validate("Payroll Period");
                        Assignmatrix.Type := Assignmatrix.Type::Deduction;
                        Assignmatrix.Code := CompRec."Net Pay Advance Code";
                        Assignmatrix.Validate(Code);
                        Assignmatrix.Amount := -NETPAY3;
                        Assignmatrix.Validate(Amount);
                        Assignmatrix."Posting Group Filter" := Employee."Posting Group";
                        Assignmatrix."Profit Centre" := Employee."Global Dimension 2 Code";
                        Assignmatrix.Branch := Employee.Branch;
                        Assignmatrix."Pay Point" := Employee.Paypoint;
                        Assignmatrix."Salary Pointer" := Employee."Salary Scale";
                        Assignmatrix."Staffing Group" := Employee."Staffing Group";
                        Assignmatrix."Department Code" := Employee.Department;


                        if Assignmatrix2.Get(Assignmatrix."Employee No", Assignmatrix.Type::Deduction
                        , Assignmatrix.Code, Assignmatrix."Payroll Period") = true then
                            Assignmatrix.Modify
                        else
                            Assignmatrix.Insert;
                    end;

                    //MESSAGE('%1',NETPAY3);
                    //CurrReport.SKIP;
                end;

                Assignmatrix.Reset;
                Assignmatrix.SetRange(Assignmatrix.Code, '869');
                Assignmatrix.SetRange(Assignmatrix.Type, Assignmatrix.Type::Deduction);
                Assignmatrix.SetRange(Assignmatrix."Employee No", Employee."No.");
                Assignmatrix.SetRange(Assignmatrix."Payroll Period", Month);
                Assignmatrix.DeleteAll;


                LoanBalance := 0;
                LoanApplication.Reset;
                LoanApplication.SetRange(LoanApplication."Employee No", Employee."No.");
                if LoanApplication.Find('-') then
                    repeat
                        if LoanType.Get(LoanApplication."Loan Product Type") then begin
                            LoanApplication.SetRange(LoanApplication."Date filter", 0D, LastMonth);
                            LoanApplication.CalcFields(LoanApplication."Total Repayment");
                            LoanBalance := LoanApplication."Approved Amount" + LoanApplication."Total Repayment";
                            //MESSAGE('%1 Balance =%2',LoanApplication."Loan No",LoanBalance);


                            if LoanBalance < LoanApplication.Repayment then begin
                                Assignmatrix.Reset;
                                Assignmatrix.SetRange(Assignmatrix."Payroll Period", DateSpecified);
                                Assignmatrix.SetRange(Assignmatrix.Type, Assignmatrix.Type::Deduction);
                                Assignmatrix.SetRange(Assignmatrix."Employee No", Employee."No.");
                                Assignmatrix.SetRange(Assignmatrix.Code, LoanType."Deduction Code");
                                Assignmatrix.SetRange("Reference No", LoanApplication."Loan No");
                                if Assignmatrix.Find('+') then begin
                                    if LoanBalance > 0 then
                                        Assignmatrix.Amount := -LoanBalance
                                    else begin
                                        Assignmatrix.Amount := 0;

                                    end;
                                    Assignmatrix."Next Period Entry" := false;

                                    Assignmatrix.Modify;
                                end;


                            end;


                            if LoanType."Calculate Interest" then begin

                                LoanApplication.SetRange(LoanApplication."Date filter", 0D, LastMonth);
                                LoanApplication.CalcFields(LoanApplication."Total Repayment");
                                LoanBalance := LoanApplication."Approved Amount" + LoanApplication."Total Repayment";
                                InterestAmt := (LoanType."Interest Rate" / 100) * LoanBalance;



                                if InterestAmt <> 0 then begin
                                    Assignmatrix.Init;
                                    Assignmatrix."Employee No" := Employee."No.";
                                    Assignmatrix.Type := Assignmatrix.Type::Deduction;
                                    Assignmatrix.Code := LoanType."Interest Deduction Code";
                                    Assignmatrix.Validate(Code);
                                    Assignmatrix."Payroll Period" := Month;
                                    Assignmatrix."Department Code" := Employee."Global Dimension 1 Code";
                                    Assignmatrix.Amount := -InterestAmt;

                                    Assignmatrix."Reference No" := LoanApplication."Loan No";
                                    Assignmatrix."Posting Group Filter" := Employee."Posting Group";

                                    if not Assignmatrix.Get(Assignmatrix."Employee No", Assignmatrix.Type, Assignmatrix.Code, Assignmatrix."Payroll Period",
                                    Assignmatrix."Reference No") then
                                        Assignmatrix.Insert
                                    else begin
                                        Assignmatrix.Reset;
                                        Assignmatrix.SetRange(Assignmatrix."Payroll Period", DateSpecified);
                                        Assignmatrix.SetRange(Assignmatrix.Type, Assignmatrix.Type::Deduction);
                                        Assignmatrix.SetRange(Assignmatrix."Employee No", Employee."No.");
                                        Assignmatrix.SetRange(Assignmatrix.Code, LoanType."Interest Deduction Code");
                                        Assignmatrix.SetRange(Assignmatrix."Reference No", LoanApplication."Loan No");
                                        if Assignmatrix.Find('-') then begin
                                            Assignmatrix.Amount := -InterestAmt;
                                            Assignmatrix.Modify;
                                        end;
                                    end;


                                end;
                            end;

                            if LoanApplication."Stop Loan" then begin
                                Assignmatrix.Reset;
                                Assignmatrix.SetRange(Assignmatrix."Payroll Period", DateSpecified);
                                Assignmatrix.SetRange(Assignmatrix.Type, Assignmatrix.Type::Deduction);
                                Assignmatrix.SetRange(Assignmatrix."Employee No", Employee."No.");
                                Assignmatrix.SetRange(Assignmatrix.Code, LoanType."Deduction Code");
                                Assignmatrix.SetRange(Assignmatrix."Reference No", LoanApplication."Loan No");
                                Assignmatrix.DeleteAll;

                                Assignmatrix.Reset;
                                Assignmatrix.SetRange(Assignmatrix."Payroll Period", DateSpecified);
                                Assignmatrix.SetRange(Assignmatrix.Type, Assignmatrix.Type::Deduction);
                                Assignmatrix.SetRange(Assignmatrix."Employee No", Employee."No.");
                                Assignmatrix.SetRange(Assignmatrix.Code, LoanType."Interest Deduction Code");
                                Assignmatrix.SetRange(Assignmatrix."Reference No", LoanApplication."Loan No");
                                Assignmatrix.DeleteAll;


                            end;


                        end;



                    until LoanApplication.Next = 0;

                //calculate Gratuity for contract employees

                if Employee."Employement Terms" = Employee."employement terms"::Contract then begin

                    Assignmatrix.Reset;
                    Assignmatrix.SetRange(Assignmatrix."Basic Salary Code", true);
                    Assignmatrix.SetRange(Assignmatrix.Type, Assignmatrix.Type::Payment);
                    Assignmatrix.SetRange(Assignmatrix."Employee No", Employee."No.");
                    Assignmatrix.SetRange(Assignmatrix."Payroll Period", Month);

                    if Assignmatrix.Find('-') then begin
                        //MESSAGE('%1',Assignmatrix.Code);
                        repeat

                            //IF Employee."Skip NHIF Update"=FALSE THEN BEGIN
                            CompRec.Get;
                            Assignmatrix."Gratuity Amount" := CompRec."Gratuity Percentage" / 100 * Assignmatrix.Amount;
                            //Assignmatrix.VALIDATE(Assignmatrix.Code);
                            Assignmatrix.Modify;

                        //END;
                        until Assignmatrix.Next = 0;

                    end;
                end;


                Window.Update(1, Employee."First Name" + ' ' + Employee."Middle Name" + ' ' + Employee."Last Name");

            end;

            trigger OnPostDataItem()
            begin
                Window.Close;
            end;

            trigger OnPreDataItem()
            begin
                Window.Open('Calculating Payroll To ##############################1', EmployeeName);
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
        //PayPeriodtext:="Employee PayrollX".GETFILTER("Pay Period Filter");
        // IF PayPeriodtext='' THEN
        // ERROR('Pay period must be specified for this report');

        //DateSpecified:="Employee PayrollX".GETRANGEMIN("Employee PayrollX"."Pay Period Filter");
        DateSpecified := BeginDate;
        if PayPeriod.Get(DateSpecified) then
            PayPeriodtext := PayPeriod.Name;
        EndDate := CalcDate('1M', DateSpecified - 1);
        CompRec.Get;
        TaxCode := CompRec."Tax Table";
    end;

    var
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
        SalaryPointers: Record "Salary Pointers";
        NextInt: Integer;
        ScaleBenefits: Record "Scale Benefits";
        SalaryPointers1: Record "Salary Pointers";


    procedure GetTaxBracket(var TaxableAmount: Decimal)
    var
        TaxTable: Record BracketsX;
        TotalTax: Decimal;
        Tax: Decimal;
        EndTax: Boolean;
    begin
        AmountRemaining := TaxableAmount;
        //AmountRemaining:=ROUND(AmountRemaining,0.01);
        EndTax := false;
        TaxTable.SetRange("Table Code", TaxCode);


        if TaxTable.Find('-') then begin
            repeat

                if AmountRemaining <= 0 then
                    EndTax := true
                else begin
                    //IF ROUND((TaxableAmount),0.01)>TaxTable."Upper Limit" THEN
                    if TaxableAmount > TaxTable."Upper Limit" then
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


    procedure DefaultAssignment(EmployeeRec: Record Employee)
    var
        ScaleBenefits: Record "Scale Benefits";
    begin
        GetPayPeriod;
        if BeginDate <> 0D then begin
            Assmatrix.Init;
            Assmatrix."Employee No" := EmployeeRec."No.";
            Assmatrix.Type := Assmatrix.Type::Payment;
            Assmatrix."Payroll Period" := BeginDate;
            Assmatrix."Department Code" := EmployeeRec."Global Dimension 1 Code";
            ScaleBenefits.Reset;
            ScaleBenefits.SetRange("Salary Scale", EmployeeRec."Salary Scale");
            ScaleBenefits.SetRange("Salary Pointer", EmployeeRec.Present);
            if ScaleBenefits.Find('-') then begin
                repeat
                    Assmatrix.Code := ScaleBenefits."ED Code";
                    Assmatrix.Validate(Code);
                    Assmatrix.Amount := ScaleBenefits.Amount;
                    Assmatrix.Validate(Amount);
                    if not Assmatrix.Get(Assmatrix."Employee No", Assmatrix.Type, Assmatrix.Code, Assmatrix."Payroll Period") then
                        Assmatrix.Insert
                    else begin
                        Assmatrix.Code := ScaleBenefits."ED Code";
                        Assmatrix.Validate(Code);
                        Assmatrix.Amount := ScaleBenefits.Amount;
                        Assmatrix.Validate(Amount);
                        Assmatrix.Modify;
                    end;
                until ScaleBenefits.Next = 0;
            end;


            // Insert Deductions assigned to every employee
            Ded.Reset;
            Ded.SetRange("Applies to All", true);
            if Ded.Find('-') then begin
                repeat
                    Assmatrix.Init;
                    Assmatrix."Employee No" := EmployeeRec."No.";
                    Assmatrix.Type := Assmatrix.Type::Deduction;
                    Assmatrix."Payroll Period" := BeginDate;
                    Assmatrix."Department Code" := EmployeeRec."Global Dimension 1 Code";
                    Assmatrix.Code := Ded.Code;
                    Assmatrix.Validate(Code);
                    if not Assmatrix.Get(Assmatrix."Employee No", Assmatrix.Type, Assmatrix.Code, Assmatrix."Payroll Period") then
                        Assmatrix.Insert
                    else begin
                        Assmatrix.Code := Ded.Code;
                        Assmatrix.Validate(Code);
                    end;
                until Ded.Next = 0;
            end;

        end;
    end;
}
