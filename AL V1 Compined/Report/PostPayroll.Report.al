#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Report 65015 "Post Payroll"
{
    DefaultLayout = RDLC;
    RDLCLayout = './Layouts/Post Payroll.rdlc';
    ApplicationArea = All;

    dataset
    {
        dataitem("Payroll PeriodX"; "Payroll PeriodX")
        {
            column(ReportForNavId_1000000000; 1000000000)
            {
            }
        }
        dataitem("Employee Posting GroupX"; "Employee Posting GroupX")
        {
            RequestFilterFields = "Pay Period Filter", "Code";
            column(ReportForNavId_1; 1)
            {
            }
            dataitem(Employee; Employee)
            {
                DataItemLink = "Posting Group" = field(Code), "Pay Period Filter" = field("Pay Period Filter");
                DataItemTableView = sorting("No.");
                column(ReportForNavId_2; 2)
                {
                }

                trigger OnAfterGetRecord()
                begin
                    Employee.CalcFields("Total Allowances", "Total Deductions", interest, "Total Gratuity Amount");
                    TotalNetPay := TotalNetPay + (Employee."Total Allowances" + Employee."Total Deductions" + Employee.interest);
                    /*
                  //Code for Gratuity per Employee
                  IF (Employee."Employement Terms"=Employee."Employement Terms"::Contract) THEN BEGIN
                    IF Employee."Total Gratuity Amount"<>0 THEN BEGIN
                      PostingGroup.RESET;
                      PostingGroup.SETRANGE(Code,Employee."Posting Group");
                      IF PostingGroup.FIND('-') THEN BEGIN
                           GenJnline.INIT;
                           GenJnline."Journal Template Name":=CompRec."Payroll Journal Template";
                           GenJnline."Journal Batch Name":=CompRec."Payroll Journal Batch";
                           GenJnline."Line No.":=GenJnline."Line No."+10000;
                            PGMapping.RESET;
                            PGMapping.SETRANGE(PGMapping.Code,PostingGroup.Code);
                            PGMapping.SETRANGE(PGMapping.Code,PostingGroup."Gratuity Code");
                           IF PGMapping.FIND('-') THEN BEGIN
                             GenJnline."Account Type":=PGMapping."Account Type";
                             GenJnline."Account No.":=PGMapping."Account No.";
                            END ELSE
                            ERROR('Gratuity Code has not been setup on Employee Posting Group');

                           GenJnline."Posting Date":=PayrollPeriod."Pay Date";
                           GenJnline.Description:='Gratuity Payable'+' '+FORMAT(DateSpecified,0,'<month text> <year4>');
                           GenJnline."Document No.":=Payperiodtext;
                           GenJnline.Amount:=-PayrollRounding(Employee."Total Gratuity Amount");
                           IF GenJnline.Amount<>0 THEN
                           GenJnline.INSERT;
                        END;


                        GenJnline.INIT;
                        LineNumber:=LineNumber+10;
                        GenJnline."Journal Template Name":=CompRec."Payroll Journal Template";
                        GenJnline."Journal Batch Name":=CompRec."Payroll Journal Batch";
                        GenJnline."Line No.":=GenJnline."Line No."+10000;
                        PGMapping.RESET;
                        PGMapping.SETRANGE(PGMapping.Code,PostingGroup.Code);
                        PGMapping.SETRANGE(PGMapping.Code,PostingGroup."Gratuity Code");
                        IF PGMapping.FIND('-') THEN BEGIN
                        GenJnline."Account Type":=GenJnline."Account Type"::"G/L Account";
                        GenJnline."Account No.":=PGMapping."G/L Account";
                        END ELSE
                        ERROR('Gratuity Code has not been setup on Employee Posting Group');
                        GenJnline."Posting Date":=PayrollPeriod."Pay Date";
                        GenJnline.Description:='Basic Salary (Monthly)'+' '+FORMAT(DateSpecified,0,'<month text> <year4>');
                        GenJnline."Document No.":=Payperiodtext;
                        PGMapping.RESET;
                        PGMapping.SETRANGE(PGMapping.Code,PostingGroup.Code);
                        IF PGMapping.FIND('-') THEN BEGIN
                          JobTask.RESET;
                        JobTask.SETRANGE(JobTask."Job Task No.",PGMapping."Account No.");
                        IF JobTask.FIND('-') THEN BEGIN
                        GenJnline."Job No.":=JobTask."Job No.";
                         GenJnline."Job Task No.":=JobTask."Job Task No."
                         END;
                         END;
                        GenJnline."Shortcut Dimension 1 Code":=Employee."Global Dimension 1 Code";
                        GenJnline.Amount:=Employee."Total Gratuity Amount";
                        IF GenJnline.Amount<>0 THEN
                        GenJnline.INSERT
                      END;
                   END;

                    */

                end;

                trigger OnPostDataItem()
                begin
                    TotalCredits := TotalCredits + TotalNetPay;
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

                    EarningsX.CalcFields("Total Amount");
                    //EarningsCopy.COPY(EarningsX);
                    EarningsCopy.SetRange("Pay Period Filter", DateSpecified, CalcDate('1M', DateSpecified) - 1);
                    //EarningsCopy.CALCFIELDS(EarningsCopy."Total Days");

                    TotalDebits := TotalDebits + EarningsX."Total Amount";
                    if EarningsX."Total Amount" = 0 then
                        CurrReport.Skip;

                    //***************Transfer to the General Journal***************


                    //EarningsX.TESTFIELD(EarningsX."G/L Account");

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
                    GenJnline."Posting Date" := PayrollPeriod."Pay Date";
                    GenJnline.Description := EarningsX.Description + ' ' + Format(DateSpecified, 0, '<month text> <year4>');
                    GenJnline."Document No." := Payperiodtext;
                    PGMapping.Reset;
                    PGMapping.SetRange(PGMapping.Code, EarningsX.Code);
                    if PGMapping.Find('-') then begin
                        JobTask.Reset;
                        JobTask.SetRange(JobTask."Job Task No.", PGMapping."Account No.");
                        if JobTask.Find('-') then begin
                            GenJnline."Job No." := JobTask."Job No.";
                            GenJnline."Job Task No." := JobTask."Job Task No."
                        end;
                    end;
                    GenJnline."Shortcut Dimension 1 Code" := Employee."Global Dimension 1 Code";
                    GenJnline.Amount := EarningsX."Total Amount";
                    if GenJnline.Amount <> 0 then
                        GenJnline.Insert
                end;

                trigger OnPreDataItem()
                begin

                    EarningsX.SetRange(EarningsX."Non-Cash Benefit", false);
                end;
            }
            dataitem(Gratuity; EarningsX)
            {
                DataItemLink = "Posting Group Filter" = field(Code), "Pay Period Filter" = field("Pay Period Filter");
                DataItemTableView = sorting(Code) where(Code = const('E0031'));
                column(ReportForNavId_9; 9)
                {
                }

                trigger OnAfterGetRecord()
                begin

                    Gratuity.CalcFields("Total Amount");
                    //EarningsCopy.COPY(EarningsX);
                    GratuityCopy.SetRange("Pay Period Filter", DateSpecified, CalcDate('1M', DateSpecified) - 1);
                    //EarningsCopy.CALCFIELDS(EarningsCopy."Total Days");

                    TotalDebits := TotalDebits + Gratuity."Total Amount";
                    if Gratuity."Total Amount" = 0 then
                        CurrReport.Skip;

                    //***************Transfer to the General Journal***************


                    //EarningsX.TESTFIELD(EarningsX."G/L Account");

                    GenJnline.Init;
                    LineNumber := LineNumber + 10;
                    GenJnline."Journal Template Name" := CompRec."Payroll Journal Template";
                    GenJnline."Journal Batch Name" := CompRec."Payroll Journal Batch";
                    GenJnline."Line No." := GenJnline."Line No." + 10000;
                    if PGMapping.Get("Employee Posting GroupX".Code, Gratuity.Code, 0) then begin
                        GenJnline."Account Type" := PGMapping."Account Type";
                        GenJnline."Account No." := PGMapping."G/L Account";
                    end else
                        Error(Text000, "Employee Posting GroupX".Code, Gratuity.Code, Gratuity.Description);
                    GenJnline."Posting Date" := PayrollPeriod."Pay Date";
                    GenJnline.Description := Gratuity.Description + ' ' + Format(DateSpecified, 0, '<month text> <year4>');
                    GenJnline."Document No." := Payperiodtext;
                    PGMapping.Reset;
                    PGMapping.SetRange(PGMapping.Code, Gratuity.Code);
                    if PGMapping.Find('-') then begin
                        JobTask.Reset;
                        JobTask.SetRange(JobTask."Job Task No.", PGMapping."Account No.");
                        if JobTask.Find('-') then begin
                            GenJnline."Job No." := JobTask."Job No.";
                            GenJnline."Job Task No." := JobTask."Job Task No."
                        end;
                    end;
                    GenJnline."Shortcut Dimension 1 Code" := Employee."Global Dimension 1 Code";
                    GenJnline.Amount := Gratuity."Total Amount" * -1;
                    if GenJnline.Amount <> 0 then
                        GenJnline.Insert;



                    GenJnline.Init;
                    LineNumber := LineNumber + 10;
                    GenJnline."Journal Template Name" := CompRec."Payroll Journal Template";
                    GenJnline."Journal Batch Name" := CompRec."Payroll Journal Batch";
                    GenJnline."Line No." := GenJnline."Line No." + 10000;
                    if PGMapping.Get("Employee Posting GroupX".Code, Gratuity.Code, 0) then begin
                        GenJnline."Account Type" := GenJnline."account type"::"G/L Account";
                        GenJnline."Account No." := PGMapping."GL Account Employer";
                    end else
                        Error(Text000, "Employee Posting GroupX".Code, Gratuity.Code, Gratuity.Description);
                    GenJnline."Posting Date" := PayrollPeriod."Pay Date";
                    GenJnline.Description := Gratuity.Description + ' ' + Format(DateSpecified, 0, '<month text> <year4>');
                    GenJnline."Document No." := Payperiodtext;
                    PGMapping.Reset;
                    PGMapping.SetRange(PGMapping.Code, Gratuity.Code);
                    if PGMapping.Find('-') then begin
                        JobTask.Reset;
                        JobTask.SetRange(JobTask."Job Task No.", PGMapping."Account No.");
                        if JobTask.Find('-') then begin
                            GenJnline."Job No." := JobTask."Job No.";
                            GenJnline."Job Task No." := JobTask."Job Task No."
                        end;
                    end;
                    GenJnline."Shortcut Dimension 1 Code" := Employee."Global Dimension 1 Code";
                    GenJnline.Amount := Gratuity."Total Amount";
                    if GenJnline.Amount <> 0 then
                        GenJnline.Insert
                end;

                trigger OnPreDataItem()
                begin

                    Gratuity.SetRange(Gratuity.Code, 'E0031');
                end;
            }
            dataitem(Employer; DeductionsX)
            {
                DataItemLink = "Posting Group Filter" = field(Code);
                DataItemTableView = sorting(Code);
                column(ReportForNavId_4; 4)
                {
                }

                trigger OnAfterGetRecord()
                begin

                    if PGMapping.Get("Employee Posting GroupX".Code, Employer.Code, PGMapping.Type::Deduction) then begin
                        GenJnline.Init;
                        Employer.CalcFields(Employer."Total Amount Employer");
                        GenJnline."Journal Template Name" := CompRec."Payroll Journal Template";
                        GenJnline."Journal Batch Name" := CompRec."Payroll Journal Batch";
                        GenJnline."Line No." := GenJnline."Line No." + 10000;
                        GenJnline."Account No." := PGMapping."GL Account Employer";
                        GenJnline."Posting Date" := PayrollPeriod."Pay Date";
                        GenJnline.Description := Employer.Description + ' ' + Format(DateSpecified, 0, '<month text> <year4>' + 'Employer Amount Contribution');
                        GenJnline."Document No." := Payperiodtext;
                        PGMapping.Reset;
                        PGMapping.SetRange(PGMapping.Code, EarningsX.Code);
                        if PGMapping.Find('-') then begin
                            JobTask.Reset;
                            JobTask.SetRange(JobTask."Job Task No.", PGMapping."Account No.");
                            if JobTask.Find('-') then begin
                                GenJnline."Job No." := JobTask."Job No.";
                                GenJnline."Job Task No." := JobTask."Job Task No."
                            end;
                        end;
                        GenJnline.Amount := Abs(PayrollRounding(Employer."Total Amount Employer"));
                        if GenJnline.Amount <> 0 then
                            GenJnline.Insert;
                    end;
                end;

                trigger OnPreDataItem()
                begin

                    Employer.SetRange("Pay Period Filter", DateSpecified);
                end;
            }

            trigger OnAfterGetRecord()
            begin
                TotalncomeTax := 0;
                TotalBasic := 0;
                //TotalNetPay:=0;
                Totalgross := 0;
                "Employee Posting GroupX".TestField("Account No.");
                PayablesAcc := "Employee Posting GroupX"."Account No.";
                LineNumber := LineNumber + 10;
            end;
        }
        dataitem(DeductionsX; DeductionsX)
        {
            DataItemTableView = sorting(Code) where(Loan = const(false));
            column(ReportForNavId_5; 5)
            {
            }

            trigger OnAfterGetRecord()
            begin
                DeductionsX.CalcFields(DeductionsX."Total Amount", DeductionsX."Total Amount Employer");

                /*IF DeductionsX."Total Amount"=0 THEN
                CurrReport.SKIP;*/


                if (DeductionsX."Total Amount" <> 0) then begin
                    TotalCredits := Abs(TotalCredits) + Abs(DeductionsX."Total Amount");
                    //*************Transfer DeductionsX************
                    //DeductionsX.TESTFIELD(DeductionsX."G/L Account");
                    if DeductionsX."Total Amount" = 0 then
                        CurrReport.Skip;
                    GenJnline."Journal Template Name" := CompRec."Payroll Journal Template";
                    GenJnline."Journal Batch Name" := CompRec."Payroll Journal Batch";
                    GenJnline."Line No." := GenJnline."Line No." + 10000;
                    if PGMapping.Get("Employee Posting GroupX".Code, DeductionsX.Code, 1) then begin
                        GenJnline."Account Type" := PGMapping."Account Type";
                        GenJnline."Account No." := PGMapping."G/L Account";
                    end else
                        Error(Text000, "Employee Posting GroupX".Code, DeductionsX.Code, DeductionsX.Description);
                    //GenJnline."Account No.":=DeductionsX."G/L Account";
                    GenJnline."Posting Date" := PayrollPeriod."Pay Date";
                    GenJnline.Description := DeductionsX.Description + ' ' + Format(DateSpecified, 0, '<month text> <year4>');
                    GenJnline."Document No." := Payperiodtext;
                    GenJnline.Amount := PayrollRounding(DeductionsX."Total Amount");
                    if TransferLoans = false then
                        GenJnline.Insert;
                    //commit the payable amount1
                    if PGMapping."Account Type" = PGMapping."account type"::Vendor then begin
                        CommitPayrollPayable(PGMapping, PayrollRounding(DeductionsX."Total Amount"));
                    end;

                end;


                if DeductionsX."Total Amount Employer" <> 0 then begin
                    TotalSSF := Abs(DeductionsX."Total Amount Employer");
                    GenJnline.Init;
                    GenJnline."Journal Template Name" := CompRec."Payroll Journal Template";
                    GenJnline."Journal Batch Name" := CompRec."Payroll Journal Batch";
                    GenJnline."Line No." := GenJnline."Line No." + 10000;
                    if PGMapping.Get("Employee Posting GroupX".Code, DeductionsX.Code, 1) then begin
                        GenJnline."Account Type" := PGMapping."Account Type";
                        GenJnline."Account No." := PGMapping."G/L Account";
                    end else
                        Error(Text000, "Employee Posting GroupX".Code, DeductionsX.Code, DeductionsX.Description);
                    //GenJnline."Account No.":=DeductionsX."G/L Account";
                    GenJnline."Posting Date" := PayrollPeriod."Pay Date";
                    GenJnline.Description := DeductionsX.Description + ' ' + Format(DateSpecified, 0, '<month text> <year4>' + ' Employer Contribution');
                    GenJnline."Document No." := Payperiodtext;
                    GenJnline.Amount := -TotalSSF;
                    GenJnline.Insert;
                    TotalDebits := TotalDebits + Abs(DeductionsX."Total Amount Employer");
                    TotalCredits := TotalCredits + TotalSSF;
                end;

            end;

            trigger OnPreDataItem()
            begin
                DeductionsX.SetRange("Pay Period Filter", DateSpecified);
                DeductionsX.SetRange("Posting Group Filter", "Employee Posting GroupX".Code);
            end;
        }
        dataitem(LoansRec; DeductionsX)
        {
            DataItemTableView = sorting(Code) where(Loan = const(true));
            column(ReportForNavId_6; 6)
            {
            }

            trigger OnAfterGetRecord()
            begin

                LoansRec.CalcFields("Total Amount");
                TotalCredits := Abs(TotalCredits) + Abs(LoansRec."Total Amount");

                //Internal Loans
                AssignmentMat.Reset;
                AssignmentMat.SetRange(AssignmentMat.Type, AssignmentMat.Type::Deduction);
                AssignmentMat.SetRange(AssignmentMat.Code, LoansRec.Code);
                AssignmentMat.SetRange(AssignmentMat."Payroll Period", DateSpecified);
                if AssignmentMat.Find('-') then begin

                    repeat
                        LoanApp.Reset;
                        LoanApp.SetRange(LoanApp."Loan No", AssignmentMat."Reference No");
                        if LoanApp.Find('+') then
                            if Loanproduct.Get(LoanApp."Loan Product Type") then
                                if Loanproduct.Internal then begin
                                    GenJnline.Init;
                                    GenJnline."Journal Template Name" := CompRec."Payroll Journal Template";
                                    GenJnline."Journal Batch Name" := CompRec."Payroll Journal Batch";
                                    GenJnline."Line No." := GenJnline."Line No." + 10000;
                                    GenJnline."Account Type" := GenJnline."account type"::Customer;
                                    LoanApp.Reset;
                                    LoanApp.SetRange(LoanApp."Loan No", AssignmentMat."Reference No");
                                    if LoanApp.Find('+') then
                                        if EmpAccMap.Get(AssignmentMat."Employee No", LoanApp."Loan Product Type") then
                                            GenJnline."Account No." := EmpAccMap."Customer A/c";

                                    GenJnline."Posting Date" := PayrollPeriod."Pay Date";
                                    GenJnline.Description := LoansRec.Description + ' ' + Format(DateSpecified, 0, '<month text> <year4>');
                                    GenJnline."Document No." := Payperiodtext;
                                    GenJnline.Amount := AssignmentMat.Amount + AssignmentMat."Interest Amount";
                                    if GenJnline.Amount <> 0 then
                                        GenJnline.Insert;
                                end;
                    until AssignmentMat.Next = 0;
                end;
                //END ELSE BEGIN
                //External Loans
                /*
                GenJnline.INIT;
                GenJnline."Journal Template Name":='GENERAL';
                GenJnline."Journal Batch Name":='SALARIES';
                GenJnline."Line No.":=GenJnline."Line No."+10000;
                GenJnline."Account Type":=GenJnline."Account Type"::"G/L Account";
                GenJnline."Account No.":=LoansRec."G/L Account";
                GenJnline."Posting Date":=PayrollPeriod."Pay Date";
                GenJnline.Description:=LoansRec.Description+' '+FORMAT(DateSpecified,0,'<month text> <year4>');;
                GenJnline."Document No.":=Payperiodtext;
                GenJnline.Amount:=LoansRec."Total Amount";
                IF GenJnline.Amount<>0 THEN
                GenJnline.INSERT;
                */
                //END;
                //UNTIL AssignmentMat.NEXT=0;
                //END;

                TotalDebits := TotalDebits + Abs(LoansRec."Total Amount Employer");
                TotalCredits := TotalCredits + LoansRec."Total Amount";

            end;

            trigger OnPreDataItem()
            begin
                LoansRec.SetRange(LoansRec."Pay Period Filter", DateSpecified);
            end;
        }
        dataitem(ExternalLoans; DeductionsX)
        {
            DataItemTableView = sorting(Code) where(Loan = const(true));
            column(ReportForNavId_7; 7)
            {
            }

            trigger OnAfterGetRecord()
            begin

                ExternalLoans.CalcFields("Total Amount");
                TotalCredits := Abs(TotalCredits) + Abs(ExternalLoans."Total Amount");
                AssignmentMat.Reset;
                AssignmentMat.SetRange(AssignmentMat.Type, AssignmentMat.Type::Deduction);
                AssignmentMat.SetRange(AssignmentMat.Code, ExternalLoans.Code);
                AssignmentMat.SetRange(AssignmentMat."Payroll Period", DateSpecified);
                if AssignmentMat.Find('-') then begin
                    repeat
                        LoanApp.Reset;
                        LoanApp.SetRange(LoanApp."Loan No", AssignmentMat."Reference No");
                        if LoanApp.Find('+') then
                            if Loanproduct.Get(LoanApp."Loan Product Type") then
                                if Loanproduct.Internal = false then begin
                                    //Get Employee Name
                                    if EmpRec.Get(AssignmentMat."Employee No") then begin
                                        EmpName := EmpRec."First Name" + ' ' + EmpRec."Middle Name" + ' ' + EmpRec."Last Name";
                                    end;
                                    //External Loans
                                    GenJnline.Init;
                                    GenJnline."Journal Template Name" := 'GENERAL';
                                    GenJnline."Journal Batch Name" := 'SALARIES';
                                    GenJnline."Line No." := GenJnline."Line No." + 10000;
                                    // GenJnline."Account Type":=GenJnline."Account Type"::"G/L Account";
                                    if PGMapping.Get("Employee Posting GroupX".Code, DeductionsX.Code, 1) then begin
                                        GenJnline."Account Type" := PGMapping."Account Type";
                                        GenJnline."Account No." := PGMapping."G/L Account";
                                    end else
                                        Error(Text000, "Employee Posting GroupX".Code, DeductionsX.Code, DeductionsX.Description);
                                    //GenJnline."Account No.":=ExternalLoans."G/L Account";
                                    GenJnline."Posting Date" := PayrollPeriod."Pay Date";
                                    GenJnline.Description := ExternalLoans.Description + ' ' + Format(DateSpecified, 0, '<month text> <year4>') + '-' + EmpName;
                                    GenJnline."Document No." := Payperiodtext;

                                    GenJnline.Amount := AssignmentMat.Amount + AssignmentMat."Interest Amount";
                                    if GenJnline.Amount <> 0 then
                                        GenJnline.Insert;
                                end;
                    until AssignmentMat.Next = 0;
                end;


                TotalDebits := TotalDebits + Abs(ExternalLoans."Total Amount Employer");
                TotalCredits := TotalCredits + ExternalLoans."Total Amount";
            end;

            trigger OnPreDataItem()
            begin

                ExternalLoans.SetRange(ExternalLoans."Pay Period Filter", DateSpecified);
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

                GenJnline.Init;
                GenJnline."Journal Template Name" := CompRec."Payroll Journal Template";
                GenJnline."Journal Batch Name" := CompRec."Payroll Journal Batch";
                GenJnline."Line No." := GenJnline."Line No." + 10000;
                GenJnline."Account Type" := "Employee Posting GroupX"."Account Type";
                GenJnline."Account No." := "Employee Posting GroupX"."Account No.";
                GenJnline."Account No." := PayablesAcc;
                GenJnline."Posting Date" := PayrollPeriod."Pay Date";
                GenJnline.Description := 'Salary payable Total Net' + ' ' + Format(DateSpecified, 0, '<month text> <year4>');
                GenJnline."Document No." := Payperiodtext;
                GenJnline.Amount := -PayrollRounding(TotalNetPay);
                if GenJnline.Amount <> 0 then
                    GenJnline.Insert;

                //larry
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

    trigger OnPostReport()
    begin

        if JnlTemp.Get(CompRec."Payroll Journal Template", CompRec."Payroll Journal Batch") then
            Found := true
        else begin
            JnlTemp.Init;
            JnlTemp."Journal Template Name" := CompRec."Payroll Journal Template";
            JnlTemp.Name := CompRec."Payroll Journal Batch";
            JnlTemp.Description := 'Salary Journal';
            JnlTemp.Insert;

        end;
        Message('Entries have been transfered to Payroll Journal. Kindly proceed to the Payroll Journal to review and post the JV entries and post');
    end;

    trigger OnPreReport()
    begin

        Payperiodtext := "Employee Posting GroupX".GetFilter("Employee Posting GroupX"."Pay Period Filter");
        Payperiodtext := CopyStr(Payperiodtext, 4, 6);
        GetPeriodFilter := "Employee Posting GroupX".GetRangeMin("Employee Posting GroupX"."Pay Period Filter");
        DateSpecified := "Employee Posting GroupX".GetRangeMin("Employee Posting GroupX"."Pay Period Filter");
        if PayrollPeriod.Get(DateSpecified) then
            Payday := PayrollPeriod."Pay Date";



        if Payday = 0D then
            Error(Text002);
        LineNumber := 0;
        GetCurrentPeriod;
        //ERROR ('%1', PeriodStartDate);
        if PeriodStartDate <> PayrollPeriod."Starting Date" then
            if not Confirm(Text001, false) then
                CurrReport.Quit;
        AdjustPostingGr;

        //Delete Journal Entries
        CompRec.Get;
        CompRec.TestField("Payroll Journal Template");
        CompRec.TestField("Payroll Journal Batch");
        if not JnlTemp.Get(CompRec."Payroll Journal Template", CompRec."Payroll Journal Batch") then begin
            JnlTemp.Init;
            JnlTemp."Journal Template Name" := CompRec."Payroll Journal Template";
            JnlTemp.Name := CompRec."Payroll Journal Batch";
            JnlTemp.Insert;
        end;

        GenJnline.Reset;
        GenJnline.SetRange("Journal Template Name", CompRec."Payroll Journal Template");
        GenJnline.SetRange("Journal Batch Name", CompRec."Payroll Journal Batch");
        GenJnline.DeleteAll;
    end;

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
        EmpAccMap: Record "Employee Account Mapping";
        PGMapping: Record "Employee PGroups";
        Loanproduct: Record "Loan Product Type";
        EmpName: Text[70];
        Text000: label 'There is no G/L Account setup for %1 %2 %3';
        Text001: label 'You are about to transfer the payroll summary for the wrong Period,Continue?';
        Text002: label 'Pay Date must be Specified for the Period';
        JobTask: Record "Job Task";
        PayrollHeader: Record "Payroll Header";
        PeriodStatus: Boolean;
        Text003: label 'You cannot transfer entries for a closed period';
        PostingGroupFilter: Text;
        GratuityCopy: Record EarningsX;


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
        PayPeriodRec.SetRange(PayPeriodRec.Closed, true);
        if PayPeriodRec.FindLast then
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

    local procedure CommitPayrollPayable(PayableAccount: Record "Employee PGroups"; Amount: Decimal)
    var
        BudgetCommitment: Record "Budget Commitment";
        HRSetup: Record "Human Resources Setup";
        EmployeePGroups: Record "Employee PGroups";
        CMtSetup: Record "Cash Management Setup";
        BudgetCommitment1: Record "Budget Commitment";
        Entry: Integer;
    begin
        CMtSetup.Get;
        BudgetCommitment1.Reset;
        if BudgetCommitment1.FindLast then
            Entry := BudgetCommitment1."Entry No.";

        BudgetCommitment.Init;
        BudgetCommitment."Entry No." := Entry + 1;
        BudgetCommitment."Document Type" := BudgetCommitment."document type"::" ";
        BudgetCommitment."Account No." := PayableAccount."Vote Item";
        BudgetCommitment."Committment Amount" := Amount * -1;
        BudgetCommitment."Budget Name" := CMtSetup."Current Budget";
        BudgetCommitment.Validate("Budget Name");
        BudgetCommitment.Insert(true);
    end;
}
