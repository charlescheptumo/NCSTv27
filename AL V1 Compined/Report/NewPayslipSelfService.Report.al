#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Report 69138 "New Payslip Self Service"
{
    // ArrEarnings[1,1]
    // ArrEarningsAmt[1,1]
    DefaultLayout = RDLC;
    RDLCLayout = './Layouts/New Payslip Self Service.rdlc';
    ApplicationArea = All;


    dataset
    {
        dataitem(Employee; Employee)
        {
            RequestFilterFields = "Pay Period Filter", "No.", "Global Dimension 1 Code";
            column(ReportForNavId_1000000000; 1000000000)
            {
            }
            column(CoRec_Picture; CoRec.Picture)
            {
            }
            column(CoName; CoName)
            {
            }
            column(UPPERCASE_FORMAT_DateSpecified_0___month_text___year4____; UpperCase(Format(DateSpecified, 0, '<month text> <year4>')))
            {
            }
            column(Addr_1__1_; Addr[1] [1])
            {
            }
            column(Addr_1__2_; Addr[1] [2])
            {
            }
            column(DeptArr_1_1_; DeptArr[1, 1])
            {
            }
            column(Message2_1_1_; Message2[1, 1])
            {
            }
            column(Message1; Message1)
            {
            }
            column(STRSUBSTNO__Date__1__2__TODAY_TIME_; StrSubstNo('Date %1 %2', Today, Time))
            {
            }
            column(USERID; UserId)
            {
            }
            column(CurrReport_PAGENO; CurrReport.PageNo)
            {
            }
            dataitem("Integer"; "Integer")
            {
                DataItemTableView = sorting(Number);
                column(ReportForNavId_1000000001; 1000000001)
                {
                }
                column(ArrEarnings_1_Number_; ArrEarnings[1, Integer.Number])
                {
                }
                column(ArrEarningsAmt_1_Number_; ArrEarningsAmt[1, Integer.Number])
                {
                }
                column(BalanceArray_1_Number_; BalanceArray[1, Integer.Number])
                {
                }
                column(ArrHeadings; ArrHeadings[Integer.Number])
                {
                }

                trigger OnPreDataItem()
                begin
                    Integer.SetRange(Number, 1, i - 1);
                end;
            }

            trigger OnAfterGetRecord()
            begin

                Clear(Addr);
                Clear(DeptArr);
                Clear(BasicPay);
                Clear(EmpArray);
                Clear(ArrEarnings);
                Clear(ArrEarningsAmt);
                Clear(BalanceArray);
                Clear(ArrHeadings);
                GrossPay := 0;
                TotalDeduction := 0;
                Totalcoopshares := 0;
                Totalnssf := 0;
                NetPay := 0;
                i := 1;
                j := 1;

                Addr[1] [1] := Employee."No.";
                Addr[1] [2] := Employee."First Name" + ' ' + Employee."Last Name";
                // get Department Name
                DimVal.Reset;
                DimVal.SetRange(DimVal.Code, Employee."Global Dimension 1 Code");
                DimVal.SetRange("Global Dimension No.", 1);
                if DimVal.Find('-') then
                    DeptArr[1, 1] := DimVal.Name;

                // Get Earnings
                Earn.Reset;
                Earn.SetRange(Earn."Earning Type", Earn."earning type"::"Normal Earning");
                Earn.SetRange(Earn."Non-Cash Benefit", false);
                if Earn.Find('-') then begin
                    repeat
                        AssignMatrix.Reset;
                        AssignMatrix.SetRange(AssignMatrix."Payroll Period", DateSpecified);
                        AssignMatrix.SetRange(Type, AssignMatrix.Type::Payment);
                        AssignMatrix.SetRange(AssignMatrix."Employee No", Employee."No.");
                        AssignMatrix.SetRange(Code, Earn.Code);
                        if AssignMatrix.Find('-') then begin
                            repeat
                                ArrEarnings[1, i] := AssignMatrix.Description;
                                Evaluate(ArrEarningsAmt[1, i], Format(AssignMatrix.Amount));
                                ArrEarningsAmt[1, i] := ChckRound(ArrEarningsAmt[1, i]);

                                GrossPay := GrossPay + AssignMatrix.Amount;
                                i := i + 1;
                            until AssignMatrix.Next = 0;
                        end;
                    until Earn.Next = 0;
                end;

                ArrEarnings[1, i] := 'GROSS PAY';
                Evaluate(ArrEarningsAmt[1, i], Format(GrossPay));
                ArrEarningsAmt[1, i] := ChckRound(ArrEarningsAmt[1, i]);
                j := j + 1;
                ArrHeadings[i] := j;
                i := i + 1;

                ArrEarnings[1, i] := ' ';
                ArrEarningsAmt[1, i] := ' ';
                j := j + 1;
                ArrHeadings[i] := j;


                i := i + 1;
                // Deductions
                ArrEarnings[1, i] := 'Deductions';
                j := j + 1;
                ArrHeadings[i] := j;


                i := i + 1;

                ArrEarnings[1, i] := ' ';
                ArrEarningsAmt[1, i] := ' ';
                j := j + 1;
                ArrHeadings[i] := j;

                i := i + 1;

                AssignMatrix.Reset;
                AssignMatrix.SetRange(AssignMatrix."Payroll Period", DateSpecified);
                AssignMatrix.SetRange(Type, AssignMatrix.Type::Deduction);
                AssignMatrix.SetRange(AssignMatrix."Employee No", Employee."No.");
                AssignMatrix.SetRange(AssignMatrix.Paye, true);
                if AssignMatrix.Find('-') then begin
                    ArrEarnings[1, i] := AssignMatrix.Description;
                    Evaluate(ArrEarningsAmt[1, i], Format(Abs(AssignMatrix.Amount)));
                    ArrEarningsAmt[1, i] := ChckRound(ArrEarningsAmt[1, i]);

                    TotalDeduction := TotalDeduction + Abs(AssignMatrix.Amount);
                end;

                i := i + 1;

                //Loans
                AssignMatrix.Reset;
                AssignMatrix.SetRange(AssignMatrix."Payroll Period", DateSpecified);
                AssignMatrix.SetFilter(Type, '%1|%2', AssignMatrix.Type::Deduction, AssignMatrix.Type::Loan);
                AssignMatrix.SetRange(AssignMatrix."Employee No", Employee."No.");
                AssignMatrix.SetRange(AssignMatrix.Paye, false);
                if AssignMatrix.Find('-') then begin
                    repeat
                        LoanBalances.Reset;
                        LoanBalances.SetRange("Loan No", AssignMatrix."Reference No");
                        LoanBalances.SetRange("Deduction Code", AssignMatrix.Code);
                        if LoanBalances.Find('-') then begin
                            case LoanBalances."Interest Calculation Method" of
                                LoanBalances."interest calculation method"::" ",
                                LoanBalances."interest calculation method"::"Reducing Balance",
                                LoanBalances."interest calculation method"::"Flat Rate":
                                    begin
                                        if Deduct.Get(AssignMatrix.Code) then
                                            if Deduct."Show Balance" then begin
                                                LoanBalances.SetRange(LoanBalances."Date filter", 0D, DateSpecified);

                                                LoanBalances.CalcFields(LoanBalances."Total Repayment", Receipts);
                                                BalanceArray[1, i] := (LoanBalances."Approved Amount" + LoanBalances."Total Repayment" - Abs(LoanBalances.Receipts));
                                            end;
                                        //For Each Loan Show the interest amount separately:
                                        //Principal:
                                        ArrEarnings[1, i] := AssignMatrix.Description;
                                        Evaluate(ArrEarningsAmt[1, i], Format(Abs(AssignMatrix.Amount)));
                                        ArrEarningsAmt[1, i] := ChckRound(ArrEarningsAmt[1, i]);
                                        /*
                                        //Interest:
                                        i:=i+1;
                                        ArrEarnings[1,i]:=AssignMatrix.Description+'-Interest';
                                        EVALUATE(ArrEarningsAmt[1,i],FORMAT(ABS(AssignMatrix."Loan Interest")));
                                        ArrEarningsAmt[1,i]:=ChckRound(ArrEarningsAmt[1,i]);
                                        */
                                    end;
                                else begin

                                    if Deduct.Get(AssignMatrix.Code) then
                                        if Deduct."Show Balance" then begin
                                            LoanBalances.SetRange(LoanBalances."Date filter", 0D, DateSpecified);

                                            LoanBalances.CalcFields(LoanBalances."Total Repayment", Receipts);
                                            BalanceArray[1, i] := (LoanBalances."Approved Amount" + LoanBalances."Total Repayment" - Abs(LoanBalances.Receipts));
                                        end;

                                    //Show Principal only:
                                    ArrEarnings[1, i] := AssignMatrix.Description;
                                    Evaluate(ArrEarningsAmt[1, i], Format(Abs(AssignMatrix.Amount)));
                                    ArrEarningsAmt[1, i] := ChckRound(ArrEarningsAmt[1, i]);
                                end;
                            end;
                        end else begin
                            //ArrEarnings[1,i]:=AssignMatrix.Description+' '+AssignMatrix."Insurance No";
                            ArrEarnings[1, i] := AssignMatrix.Description;
                            Evaluate(ArrEarningsAmt[1, i], Format(Abs(AssignMatrix.Amount)));
                            ArrEarningsAmt[1, i] := ChckRound(ArrEarningsAmt[1, i]);

                        end;
                        TotalDeduction := TotalDeduction + Abs(AssignMatrix.Amount);

                        if Deduct.Get(AssignMatrix.Code) then begin
                            if Deduct."Show Balance" then begin
                                LoanBalances.Reset;
                                LoanBalances.SetRange(LoanBalances."Loan No", AssignMatrix."Reference No");
                                LoanBalances.SetRange(LoanBalances."Deduction Code", AssignMatrix.Code);
                                if LoanBalances.Find('-') then begin

                                    LoanBalances.SetRange(LoanBalances."Date filter", 0D, DateSpecified);

                                    LoanBalances.CalcFields(LoanBalances."Total Repayment", Receipts);
                                    case LoanBalances."Interest Calculation Method" of
                                        LoanBalances."interest calculation method"::"Reducing Balance":
                                            begin
                                                //i:=i-1;
                                                //BalanceArray[1,i]:=(LoanBalances."Approved Amount"+LoanBalances."Total Repayment");
                                                //i:=1+1;
                                            end;
                                        else
                                            BalanceArray[1, i] := (LoanBalances."Approved Amount" + LoanBalances."Total Repayment" - Abs(LoanBalances.Receipts));
                                    end;
                                end
                                else begin
                                    Deduct.SetRange(Deduct."Employee Filter", Employee."No.");
                                    Deduct.SetRange(Deduct."Pay Period Filter", DateSpecified);          //Share Top Up Added Below
                                    Deduct.CalcFields(Deduct."Total Amount", Deduct."Total Amount Employer", "Total Closing Balance", "Total Closing Balance Employer");
                                    BalanceArray[1, i] := Abs(Deduct."Total Closing Balance") + Abs(Deduct."Total Closing Balance Employer");

                                end;
                            end;
                        end;


                        i := i + 1;
                    until AssignMatrix.Next = 0;
                end;


                ArrEarnings[1, i] := 'TOTAL DEDUCTIONS';
                Evaluate(ArrEarningsAmt[1, i], Format(TotalDeduction));
                ArrEarningsAmt[1, i] := ChckRound(ArrEarningsAmt[1, i]);
                j := j + 1;
                ArrHeadings[i] := j;

                i := i + 1;

                ArrEarnings[1, i] := ' ';
                ArrEarningsAmt[1, i] := ' ';
                j := j + 1;
                ArrHeadings[i] := j;

                i := i + 1;
                // Net Pay
                ArrEarnings[1, i] := 'NET PAY';
                NetPay := GrossPay - TotalDeduction;
                Evaluate(ArrEarningsAmt[1, i], Format(NetPay));
                ArrEarningsAmt[1, i] := ChckRound(ArrEarningsAmt[1, i]);
                j := j + 1;
                ArrHeadings[i] := j;

                i := i + 1;

                ArrEarnings[1, i] := ' ';
                ArrEarningsAmt[1, i] := ' ';
                j := j + 1;
                ArrHeadings[i] := j;

                i := i + 1;
                // taxation
                ArrEarnings[1, i] := 'Taxations';
                j := j + 1;
                ArrHeadings[i] := j;

                i := i + 1;

                ArrEarnings[1, i] := ' ';
                ArrEarningsAmt[1, i] := ' ';
                j := j + 1;
                ArrHeadings[i] := j;

                i := i + 1;
                // Non Cash Benefits
                Earn.Reset;
                Earn.SetRange(Earn."Earning Type", Earn."earning type"::"Normal Earning");
                Earn.SetRange(Earn."Non-Cash Benefit", true);
                if Earn.Find('-') then begin
                    repeat
                        AssignMatrix.Reset;
                        AssignMatrix.SetRange(AssignMatrix."Payroll Period", DateSpecified);
                        AssignMatrix.SetRange(Type, AssignMatrix.Type::Payment);
                        AssignMatrix.SetRange(AssignMatrix."Employee No", Employee."No.");
                        AssignMatrix.SetRange(AssignMatrix."Basic Salary Code", false);
                        AssignMatrix.SetRange(Code, Earn.Code);
                        if AssignMatrix.Find('-') then begin
                            repeat
                                ArrEarnings[1, i] := AssignMatrix.Description;
                                Evaluate(ArrEarningsAmt[1, i], Format(AssignMatrix.Amount));
                                ArrEarningsAmt[1, i] := ChckRound(ArrEarningsAmt[1, i]);

                                i := i + 1;
                            until AssignMatrix.Next = 0;
                        end;
                    until Earn.Next = 0;
                end;

                // end of non cash
                AssignMatrix.Reset;
                AssignMatrix.SetRange(AssignMatrix."Payroll Period", DateSpecified);
                AssignMatrix.SetRange(Type, AssignMatrix.Type::Deduction);
                AssignMatrix.SetRange(AssignMatrix."Employee No", Employee."No.");
                AssignMatrix.SetRange(AssignMatrix.Paye, true);
                if AssignMatrix.Find('-') then begin
                    ArrEarnings[1, i] := 'Pension contribution benefit';
                    Evaluate(ArrEarningsAmt[1, i], Format(Abs(AssignMatrix."Less Pension Contribution")));
                    ArrEarningsAmt[1, i] := ChckRound(ArrEarningsAmt[1, i]);


                    TaxableAmt := 0;
                    Employee.PAYE := 0;

                    TaxableAmt := AssignMatrix."Taxable amount";
                    Employee.PAYE := AssignMatrix.Amount;
                    //MESSAGE('%1',PAYE);

                end;

                i := i + 1;
                /*
                 Earn.RESET;
                 Earn.SETRANGE(Earn."Earning Type",Earn."Earning Type"::"Owner Occupier");
                 IF Earn.FIND('-') THEN BEGIN
                  REPEAT
                   AssignMatrix.RESET;
                   AssignMatrix.SETRANGE(AssignMatrix."Payroll Period",DateSpecified);
                   AssignMatrix.SETRANGE(Type,AssignMatrix.Type::Payment);
                   AssignMatrix.SETRANGE(AssignMatrix."Employee No",Employee."No.");
                   AssignMatrix.SETRANGE(AssignMatrix."Basic Salary Code",FALSE);
                   AssignMatrix.SETRANGE(Code,Earn.Code);
                   IF AssignMatrix.FIND('-') THEN BEGIN
                    REPEAT
                     ArrEarnings[1,i]:=AssignMatrix.Description;
                     EVALUATE(ArrEarningsAmt[1,i],FORMAT(AssignMatrix.Amount));
                   ArrEarningsAmt[1,i]:=ChckRound(ArrEarningsAmt[1,i]);

                    i:=i+1;
                  UNTIL AssignMatrix.NEXT=0;
                  END;
                UNTIL Earn.NEXT=0;
               END;
               */
                // Taxable amount
                ArrEarnings[1, i] := 'Taxable Amount';
                Evaluate(ArrEarningsAmt[1, i], Format(Abs(TaxableAmt)));
                ArrEarningsAmt[1, i] := ChckRound(ArrEarningsAmt[1, i]);

                i := i + 1;
                ArrEarnings[1, i] := 'Tax Charged';
                Evaluate(ArrEarningsAmt[1, i], Format(Abs(Employee.PAYE)));
                ArrEarningsAmt[1, i] := ChckRound(ArrEarningsAmt[1, i]);

                i := i + 1;

                // Relief
                Earn.Reset;
                Earn.SetFilter(Earn."Earning Type", '%1|%2|%3', Earn."earning type"::"Tax Relief",
                Earn."earning type"::"Insurance Relief", Earn."earning type"::"Owner Occupier");
                if Earn.Find('-') then begin
                    repeat
                        AssignMatrix.Reset;
                        AssignMatrix.SetRange(AssignMatrix."Payroll Period", DateSpecified);
                        AssignMatrix.SetRange(Type, AssignMatrix.Type::Payment);
                        AssignMatrix.SetRange(AssignMatrix."Employee No", Employee."No.");
                        AssignMatrix.SetRange(AssignMatrix."Basic Salary Code", false);
                        AssignMatrix.SetRange(Code, Earn.Code);
                        if AssignMatrix.Find('-') then begin
                            repeat

                                ArrEarnings[1, i] := AssignMatrix.Description;
                                Evaluate(ArrEarningsAmt[1, i], Format(Abs(AssignMatrix.Amount)));
                                ArrEarningsAmt[1, i] := ChckRound(ArrEarningsAmt[1, i]);
                                i := i + 1;
                            until AssignMatrix.Next = 0;
                        end;
                    until Earn.Next = 0;
                end;

                ArrEarnings[1, i] := ' ';
                ArrEarningsAmt[1, i] := ' ';
                j := j + 1;
                ArrHeadings[i] := j;


                i := i + 1;
                //Information
                ArrEarnings[1, i] := 'Information';
                j := j + 1;
                ArrHeadings[i] := j;

                i := i + 1;

                ArrEarnings[1, i] := ' ';
                ArrEarningsAmt[1, i] := ' ';
                j := j + 1;
                ArrHeadings[i] := j;


                i := i + 1;
                Ded.Reset;
                Ded.SetRange(Ded."Tax deductible", true);
                Ded.SetRange(Ded."Pay Period Filter", DateSpecified);
                Ded.SetRange(Ded."Employee Filter", Employee."No.");
                Ded.SetRange(Ded."Show on Payslip Information", true);
                if Ded.Find('-') then
                    repeat
                        //MESSAGE('fOUND');
                        Ded.CalcFields(Ded."Total Amount", Ded."Total Amount Employer");
                        if Ded."Total Amount Employer" <> 0 then begin
                            ArrEarnings[1, i] := Ded.Description + '(Employer)';
                            Evaluate(ArrEarningsAmt[1, i], Format(Abs(Ded."Total Amount Employer")));
                            ArrEarningsAmt[1, i] := ChckRound(ArrEarningsAmt[1, i]);
                            i := i + 1;
                        end;
                    /* ArrEarnings[1,i]:=Ded.Description;
                     EVALUATE(ArrEarningsAmt[1,i],FORMAT(ABS(Ded."Total Amount")));
                     ArrEarningsAmt[1,i]:=ChckRound(ArrEarningsAmt[1,i]);
                     i:=i+1;*/



                    until Ded.Next = 0;





                ArrEarnings[1, i] := ' ';
                ArrEarningsAmt[1, i] := ' ';
                j := j + 1;
                ArrHeadings[i] := j;






                i := i + 1;
                ArrEarnings[1, i] := 'Employee Details';
                j := j + 1;
                ArrHeadings[i] := j;

                // Employee details
                i := i + 1;

                ArrEarnings[1, i] := ' ';
                ArrEarningsAmt[1, i] := ' ';
                j := j + 1;
                ArrHeadings[i] := j;

                i := i + 1;

                ArrEarnings[1, i] := 'P.I.N';
                ArrEarningsAmt[1, i] := Employee."P.I.N";

                i := i + 1;


                Employee.CalcFields("Bank Name", "Bank Branch Name");
                ArrEarnings[1, i] := 'Employee Bank';
                ArrEarningsAmt[1, i] := Employee."Bank Name";

                i := i + 1;
                ArrEarnings[1, i] := 'Bank Branch';
                ArrEarningsAmt[1, i] := Employee."Bank Branch Name";

                i := i + 1;
                ArrEarnings[1, i] := 'NSSF No';
                ArrEarningsAmt[1, i] := Employee."Social Security No.";
                i := i + 1;
                ArrEarnings[1, i] := 'NHIF No';
                ArrEarningsAmt[1, i] := Employee."N.H.I.F No";
                i := i + 1;
                ArrEarnings[1, i] := '*******End of Payslip********';

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
        Payslip = 'Pay Slip';
        EmpNoCaption = 'Employee No:';
        NameCaption = 'Name:';
        DeptCaption = 'Dept:';
        EarningsCaption = 'Earnings';
        AmountCaption = 'Amount';
        CopyCaption = 'Copy';
    }

    trigger OnPreReport()
    begin
        PayPeriodtext := Employee.GetFilter("Pay Period Filter");
        Evaluate(PayrollMonth, Format(PayPeriodtext));
        PayrollMonthText := Format(PayrollMonth, 1, 4);

        if PayPeriodtext = '' then
            Error('Pay period must be specified for this report');
        CoRec.Get;
        CoName := CoRec.Name;
        CoRec.CalcFields(Picture);
        Evaluate(DateSpecified, Format(PayPeriodtext));

        CompRec.Get;
        Message2[1, 1] := CompRec."General Payslip Message";
    end;

    var
        EMPLOYEE_NO_CaptionLbl: label 'EMPLOYEE NO:';
        N_S_S_F_NO_CaptionLbl: label 'N.S.S.F NO:';
        PAY_SLIPCaptionLbl: label 'PAY SLIP';
        P_I_N_NO_CaptionLbl: label 'P.I.N NO:';
        N_H_I_F_NO_CaptionLbl: label 'N.H.I.F NO:';
        NAME_CaptionLbl: label 'NAME:';
        I_D_NO_CaptionLbl: label 'I.D NO:';
        EARNINGSCaptionLbl: label 'EARNINGS';
        EmptyStringCaptionLbl: label '*********************************************************';
        AMOUNTCaptionLbl: label 'AMOUNT';
        DEPARTMENT_CaptionLbl: label 'DEPARTMENT:';
        BRANCH_CaptionLbl: label 'BRANCH:';
        PAYPOINT_CaptionLbl: label 'PAYPOINT:';
        Addr: array[10, 100] of Text[250];
        NoOfRecords: Integer;
        RecordNo: Integer;
        NoOfColumns: Integer;
        ColumnNo: Integer;
        i: Integer;
        AmountRemaining: Decimal;
        IncomeTax: Decimal;
        PayPeriod: Record "Payroll PeriodX";
        PayPeriodtext: Text[30];
        BeginDate: Date;
        DateSpecified: Date;
        EndDate: Date;
        EmpBank: Record "Employee Bank AccountX";
        BankName: Text[250];
        BasicSalary: Decimal;
        TaxableAmt: Decimal;
        RightBracket: Boolean;
        NetPay: Decimal;
        PayPeriodRec: Record "Payroll PeriodX";
        PayDeduct: Record "Assignment Matrix-X";
        EmpRec: Record Employee;
        EmpNo: Code[10];
        TaxableAmount: Decimal;
        PAYE: Decimal;
        ArrEarnings: array[3, 100] of Text[250];
        ArrDeductions: array[3, 100] of Text[250];
        Index: Integer;
        Index1: Integer;
        j: Integer;
        ArrEarningsAmt: array[3, 100] of Text[250];
        ArrDeductionsAmt: array[3, 100] of Decimal;
        Year: Integer;
        EmpArray: array[10, 15] of Decimal;
        HoldDate: Date;
        DenomArray: array[3, 12] of Text[70];
        NoOfUnitsArray: array[3, 12] of Integer;
        AmountArray: array[3, 12] of Decimal;
        PayModeArray: array[3] of Text[30];
        HoursArray: array[3, 60] of Decimal;
        CompRec: Record "Human Resources Setup";
        HseLimit: Decimal;
        ExcessRetirement: Decimal;
        CfMpr: Decimal;
        relief: Decimal;
        TaxCode: Code[10];
        HoursBal: Decimal;
        Pay: Record EarningsX;
        Ded: Record DeductionsX;
        HoursArrayD: array[3, 60] of Decimal;
        BankBranch: Text[30];
        CoName: Text;
        retirecontribution: Decimal;
        EarngingCount: Integer;
        DeductionCount: Integer;
        EarnAmount: Decimal;
        GrossTaxCharged: Decimal;
        DimVal: Record "Dimension Value";
        Department: Text[60];
        LowInterestBenefits: Decimal;
        SpacePos: Integer;
        NetPayLength: Integer;
        AmountText: Text[30];
        DecimalText: Text[30];
        DecimalAMT: Decimal;
        InsuranceRelief: Decimal;
        InsuranceReliefText: Text[30];
        PayrollCodeunit: Codeunit Payroll3;
        IncometaxNew: Decimal;
        NewRelief: Decimal;
        TaxablePayNew: Decimal;
        InsuranceReliefNew: Decimal;
        TaxChargedNew: Decimal;
        finalTax: Decimal;
        TotalBenefits: Decimal;
        RetireCont: Decimal;
        TotalQuarters: Decimal;
        "Employee Payroll": Record Employee;
        PayMode: Text[30];
        Intex: Integer;
        NetPay1: Decimal;
        Principal: Decimal;
        Interest: Decimal;
        Desc: Text[70];
        dedrec: Record DeductionsX;
        RoundedNetPay: Decimal;
        diff: Decimal;
        CFWD: Decimal;
        Nssfcomptext: Text[30];
        Nssfcomp: Decimal;
        LoanDesc: Text[60];
        LoanDesc1: Text[60];
        Deduct: Record DeductionsX;
        OriginalLoan: Decimal;
        LoanBalance: Decimal;
        Message1: Text[250];
        Message2: array[3, 1] of Text[250];
        DeptArr: array[3, 1] of Text[100];
        BasicPay: array[3, 1] of Text[250];
        InsurEARN: Decimal;
        HasInsurance: Boolean;
        RoundedAmt: Decimal;
        TerminalDues: Decimal;
        Earn: Record EarningsX;
        AssignMatrix: Record "Assignment Matrix-X";
        RoundingDesc: Text[60];
        BasicChecker: Decimal;
        CoRec: Record "Company Information";
        GrossPay: Decimal;
        TotalDeduction: Decimal;
        PayrollMonth: Date;
        PayrollMonthText: Text[30];
        GetPaye: Codeunit Payroll3;
        PayeeTest: Decimal;
        GetGroup: Codeunit Payroll3;
        GroupCode: Code[20];
        CUser: Code[20];
        Totalcoopshares: Decimal;
        LoanBal: Decimal;
        LoanBalances: Record "Loan Application";
        TotalRepayment: Decimal;
        Totalnssf: Decimal;
        Totalpension: Decimal;
        Totalprovid: Decimal;
        BalanceArray: array[3, 100] of Decimal;
        PensionContribution: Decimal;
        ArrHeadings: array[100] of Integer;
        tRelief: Date;


    procedure GetTaxBracket(var TaxableAmount: Decimal)
    var
        TaxTable: Record BracketsX;
        TotalTax: Decimal;
        Tax: Decimal;
        EndTax: Boolean;
    begin
    end;


    procedure GetPayPeriod()
    begin
    end;


    procedure GetTaxBracket1(var TaxableAmount: Decimal)
    var
        TaxTable: Record BracketsX;
        TotalTax: Decimal;
        Tax: Decimal;
        EndTax: Boolean;
    begin
    end;


    procedure CoinageAnalysis(var NetPay: Decimal; var ColNo: Integer)
    var
        Index: Integer;
        Intex: Integer;
    begin
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


    procedure ChckRound(var AmtText: Text[30]) ChckRound: Text[30]
    var
        LenthOfText: Integer;
        DecimalPos: Integer;
        AmtWithoutDec: Text[30];
        DecimalAmt: Text[30];
        Decimalstrlen: Integer;
    begin
        LenthOfText := StrLen(AmtText);
        DecimalPos := StrPos(AmtText, '.');
        if DecimalPos = 0 then begin
            AmtWithoutDec := AmtText;
            DecimalAmt := '.00';
        end else begin
            AmtWithoutDec := CopyStr(AmtText, 1, DecimalPos - 1);
            DecimalAmt := CopyStr(AmtText, DecimalPos + 1, 2);
            Decimalstrlen := StrLen(DecimalAmt);
            if Decimalstrlen < 2 then begin
                DecimalAmt := '.' + DecimalAmt + '0';
            end else
                DecimalAmt := '.' + DecimalAmt
        end;
        ChckRound := AmtWithoutDec + DecimalAmt;
    end;
}
