#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Report 69029 "Payroll Reconciliation1"
{
    DefaultLayout = RDLC;
    RDLCLayout = './Layouts/Payroll Reconciliation1.rdlc';

    dataset
    {
        dataitem(EarningsX; EarningsX)
        {
            DataItemTableView = sorting(Code);
            PrintOnlyIfDetail = true;
            RequestFilterFields = "Pay Period Filter", "Posting Group Filter";
            column(ReportForNavId_2229; 2229)
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
            column(STRSUBSTNO__PERIOD___1__UPPERCASE_FORMAT_Thismonth_0___month_text___year4_____; StrSubstNo('PERIOD: %1', UpperCase(Format(Thismonth, 0, '<month text> <year4>'))))
            {
            }
            column(EarningsX_Code; EarningsX.Code)
            {
            }
            column(EarningsX_Description; EarningsX.Description)
            {
            }
            column(PAYROLL_RECONCILIATIONCaption; PAYROLL_RECONCILIATIONCaptionLbl)
            {
            }
            column(CurrReport_PAGENOCaption; CurrReport_PAGENOCaptionLbl)
            {
            }
            column(EmployeeCaption; EmployeeCaptionLbl)
            {
            }
            column(Current_PeriodCaption; Current_PeriodCaptionLbl)
            {
            }
            column(Last_PeriodCaption; Last_PeriodCaptionLbl)
            {
            }
            column(DifferenceCaption; DifferenceCaptionLbl)
            {
            }
            dataitem(Employee; Employee)
            {
                DataItemTableView = sorting("No.") order(ascending);
                column(ReportForNavId_7528; 7528)
                {
                }
                column(Employee_Employee__No__; Employee."No.")
                {
                }
                column(ThisMonthVal; ThisMonthVal)
                {
                }
                column(EmpName; EmpName)
                {
                }
                column(LastMonthVal; LastMonthVal)
                {
                }
                column(Difference; Difference)
                {
                }
                column(ThisMonthVal_Control1000000015; ThisMonthVal)
                {
                }
                column(LastMonthVal_Control1000000016; LastMonthVal)
                {
                }
                column(Difference_Control1000000017; Difference)
                {
                }

                trigger OnAfterGetRecord()
                begin
                    // IF Emp.GET("Assignment Matrix-X"."Employee No") THEN
                    // BEGIN
                    EmpName := Employee."First Name" + ' ' + Employee."Middle Name" + ' ' + Employee."Last Name";
                    // END;
                    ThisMonthVal := 0;
                    LastMonthVal := 0;
                    Difference := 0;

                    Assignmat.Reset;
                    Assignmat.SetRange(Assignmat."Employee No", Employee."No.");
                    Assignmat.SetRange(Assignmat.Type, Assignmat.Type::Payment);
                    Assignmat.SetRange(Assignmat.Code, EarningsX.Code);
                    Assignmat.SetRange(Assignmat."Payroll Period", Thismonth);
                    Assignmat.SetRange(Assignmat."Posting Group Filter", PostingGrp);
                    if Assignmat.FindFirst then
                        ThisMonthVal := Assignmat.Amount;
                    /*
                    
                       ELSE
                       BEGIN
                       Assignmat.RESET;
                       Assignmat.SETRANGE(Assignmat."Employee No","Assignment Matrix-X"."Employee No");
                       Assignmat.SETRANGE(Assignmat.Type,"Assignment Matrix-X".Type);
                       Assignmat.SETRANGE(Assignmat.Code,"Assignment Matrix-X".Code);
                       Assignmat.SETRANGE(Assignmat."Payroll Period",Lastmonth);
                       IF Assignmat.FIND('+') THEN
                       LastMonthVal:=Assignmat.Amount;
                    
                       END;
                    
                    */
                    Assignmat.Reset;
                    Assignmat.SetRange(Assignmat."Employee No", Employee."No.");
                    Assignmat.SetRange(Assignmat.Type, Assignmat.Type::Payment);
                    Assignmat.SetRange(Assignmat.Code, EarningsX.Code);
                    Assignmat.SetRange(Assignmat."Payroll Period", Lastmonth);
                    Assignmat.SetRange(Assignmat."Posting Group Filter", PostingGrp);
                    if Assignmat.FindFirst then
                        LastMonthVal := Assignmat.Amount;

                    Difference := ThisMonthVal - LastMonthVal;
                    if Difference = 0 then
                        CurrReport.Skip;

                end;

                trigger OnPreDataItem()
                begin
                    CurrReport.CreateTotals(Difference, LastMonthVal, ThisMonthVal);
                end;
            }
        }
        dataitem(DeductionsX; DeductionsX)
        {
            DataItemTableView = sorting(Code);
            PrintOnlyIfDetail = true;
            column(ReportForNavId_3377; 3377)
            {
            }
            column(DeductionsX_Code; DeductionsX.Code)
            {
            }
            column(DeductionsX_Description; DeductionsX.Description)
            {
            }
            dataitem(Employee1; Employee)
            {
                DataItemTableView = sorting("No.") order(ascending);
                column(ReportForNavId_6228; 6228)
                {
                }
                column(Employee1_Employee1__No__; Employee1."No.")
                {
                }
                column(EmpName_Control1000000026; EmpName)
                {
                }
                column(ThisMonthVal_Control1000000027; ThisMonthVal)
                {
                }
                column(LastMonthVal_Control1000000028; LastMonthVal)
                {
                }
                column(Difference_Control1000000029; Difference)
                {
                }
                column(ThisMonthVal_Control1000000031; ThisMonthVal)
                {
                }
                column(LastMonthVal_Control1000000032; LastMonthVal)
                {
                }
                column(Difference_Control1000000033; Difference)
                {
                }

                trigger OnAfterGetRecord()
                begin
                    EmpName := Employee1."First Name" + ' ' + Employee1."Middle Name" + ' ' + Employee1."Last Name";
                    // END;
                    ThisMonthVal := 0;
                    LastMonthVal := 0;
                    Difference := 0;

                    Assignmat.Reset;
                    Assignmat.SetRange(Assignmat."Employee No", Employee1."No.");
                    Assignmat.SetRange(Assignmat.Type, Assignmat.Type::Deduction);
                    Assignmat.SetRange(Assignmat.Code, EarningsX.Code);
                    Assignmat.SetRange(Assignmat."Payroll Period", Thismonth);
                    Assignmat.SetRange(Assignmat."Posting Group Filter", PostingGrp);
                    if Assignmat.Find('-') then
                        ThisMonthVal := Assignmat.Amount;
                    /*
                    
                       ELSE
                       BEGIN
                       Assignmat.RESET;
                       Assignmat.SETRANGE(Assignmat."Employee No","Assignment Matrix-X"."Employee No");
                       Assignmat.SETRANGE(Assignmat.Type,"Assignment Matrix-X".Type);
                       Assignmat.SETRANGE(Assignmat.Code,"Assignment Matrix-X".Code);
                       Assignmat.SETRANGE(Assignmat."Payroll Period",Lastmonth);
                       IF Assignmat.FIND('+') THEN
                       LastMonthVal:=Assignmat.Amount;
                    
                       END;
                    
                    */
                    Assignmat.Reset;
                    Assignmat.SetRange(Assignmat."Employee No", Employee1."No.");
                    Assignmat.SetRange(Assignmat.Type, Assignmat.Type::Deduction);
                    Assignmat.SetRange(Assignmat.Code, EarningsX.Code);
                    Assignmat.SetRange(Assignmat."Payroll Period", Lastmonth);
                    Assignmat.SetRange(Assignmat."Posting Group Filter", PostingGrp);
                    if Assignmat.Find('-') then
                        LastMonthVal := Assignmat.Amount;

                    Difference := ThisMonthVal - LastMonthVal;
                    if Difference = 0 then
                        CurrReport.Skip;

                end;

                trigger OnPreDataItem()
                begin
                    //DetailedDeductions.SETRANGE(DetailedDeductions."Payroll Period",Thismonth);
                    //DetailedDeductions.SETRANGE(DetailedDeductions."Posting Group Filter",PostingGrp);
                    CurrReport.CreateTotals(Difference, LastMonthVal, ThisMonthVal);
                end;
            }
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
        Thismonth := EarningsX.GetRangeMin(EarningsX."Pay Period Filter");
        Lastmonth := CalcDate('-1M', Thismonth);
        PostingGrp := EarningsX.GetRangeMin(EarningsX."Posting Group Filter");
        /*
        IF UserRole.GET(USERID,'PAYROLLVIEW',' ')=FALSE THEN
        ERROR('You do not have permissions to view this form');
        */

    end;

    var
        EmpName: Text[230];
        Emp: Record Employee;
        Assignmat: Record "Assignment Matrix-X";
        Thismonth: Date;
        Lastmonth: Date;
        LastMonthVal: Decimal;
        Difference: Decimal;
        PostingGrp: Code[100];
        ThisMonthVal: Decimal;
        PAYROLL_RECONCILIATIONCaptionLbl: label 'PAYROLL RECONCILIATION';
        CurrReport_PAGENOCaptionLbl: label 'Page';
        EmployeeCaptionLbl: label 'Employee';
        Current_PeriodCaptionLbl: label 'Current Period';
        Last_PeriodCaptionLbl: label 'Last Period';
        DifferenceCaptionLbl: label 'Difference';
}
