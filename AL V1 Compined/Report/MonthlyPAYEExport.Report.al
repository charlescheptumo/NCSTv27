#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Report 69110 "Monthly PAYE Export"
{
    DefaultLayout = RDLC;
    RDLCLayout = './Layouts/Monthly PAYE Export.rdlc';
    UsageCategory = ReportsandAnalysis;
    ApplicationArea = All;

    dataset
    {
        dataitem(Employee; Employee)
        {
            column(ReportForNavId_1000000000; 1000000000)
            {
            }
            column(No_Employee; Employee."No.")
            {
            }
            column(Employee_Name; Employee."First Name" + ' ' + Employee."Middle Name" + ' ' + Employee."Last Name")
            {
            }
            column(PIN_Employee; Employee."P.I.N")
            {
            }
            column(TaxableIncome_Employee; Employee."Taxable Income")
            {
            }
            column(CummPAYE_Employee; Abs(Employee."Cumm. PAYE"))
            {
            }
            column(DateSpecified; UpperCase(Format(DateSpecified, 0, '<Month Text> <year4>')))
            {
            }
            column(CompInfo_Picture; CompInfo.Picture)
            {
            }

            trigger OnAfterGetRecord()
            begin

                CfMpr := 0;


                /*

                 IF EmpBank.GET("Employee's Bank","Bank Branch") THEN              Tax Deductible Amount
                    BankName:=EmpBank.Name;

                */

                Employee.CalcFields("Taxable Allowance", "Tax Deductible Amount", Employee."Cumm. PAYE");
                Employee.CalcFields(Employee."Total Allowances", Employee."Total Deductions", Employee."Taxable Income");
                Employee.CalcFields("Benefits-Non Cash", "Total Savings", "Retirement Contribution", "Basic Salary", "House Allowance1",
                "Transport Allowance");

                //Employee.CALCFIELDS("Leave Allowance","Overtime Allowance","Directors Fees","Lump Sum","Other Allowance",
                //"Non Cash Benefit",MPR,"Insurance Relief","Days Worked per week");


                if Employee."Cumm. PAYE" = 0 then begin

                    CurrReport.Skip
                end;
                TotalPaye := TotalPaye + Employee."Cumm. PAYE";
                TotalTaxable := TotalTaxable + Employee."Taxable Income";
                RecordNo := RecordNo + 1;
                Counter := Counter + 1;
                if PrintToExcel then
                    MakeExcelDataBody;

                if Counter > 1 then
                    Clear(CompInfo.Picture);

            end;

            trigger OnPostDataItem()
            begin

                if PrintToExcel then begin
                    MakeExcelFooter;
                    CreateExcelbook;
                end;
            end;

            trigger OnPreDataItem()
            begin

                CompInfo.Get;
                CoName := CompInfo.Name;
                CompInfo.CalcFields(Picture);
                if BeginDate = DateSpecified then
                    //Employee.SETRANGE(Status,Employee.Status::Active);
                    NoOfRecords := Employee.Count;
                DeptFilter := '';
                ProjFilter := '';
                SecLocFilter := '';
                NoFilter := '';
                if Employee.GetFilter("Global Dimension 1 Code") <> '' then
                    DeptFilter := 'Dept ' + Employee.GetFilter("Global Dimension 1 Code");
                if Employee.GetFilter("No.") <> '' then
                    NoFilter := 'No ' + Employee.GetFilter("No.");
                if Employee.GetFilter("Global Dimension 2 Code") <> '' then
                    ProjFilter := 'Proj ' + Employee.GetFilter("Global Dimension 2 Code");
                if Employee.GetFilter(Branch) <> '' then
                    SecLocFilter := 'Sec/Loc ' + Employee.GetFilter(Branch);

                SortBy := NoFilter + DeptFilter + ProjFilter + SecLocFilter;
                /*CUser:=USERID;
                GetGroup.GetUserGroup(CUser,GroupCode);
                SETRANGE(Employee."Posting Group",GroupCode);*/
                //

                MakeExcelHeader;

            end;
        }
    }

    requestpage
    {

        layout
        {
            area(content)
            {
                field(PrintToExcel; PrintToExcel)
                {
                    ApplicationArea = Basic;
                    Caption = 'Print To Excel?';
                }
            }
        }

        actions
        {
        }
    }

    labels
    {
        MonthlyPaye = 'MONTHLY PAYE REPORT';
        Period = 'PERIOD';
        PageCaption = 'Page';
    }

    trigger OnPreReport()
    begin
        DateSpecified := Employee.GetRangeMin("Pay Period Filter");
    end;

    var
        Addr: array[10, 30] of Text[250];
        NoOfRecords: Integer;
        RecordNo: Integer;
        NoOfColumns: Integer;
        ColumnNo: Integer;
        i: Integer;
        Transactions: Record "Assignment Matrix-X";
        AmountRemaining: Decimal;
        IncomeTax: Decimal;
        PayPeriod: Record "Payroll PeriodX";
        PayPeriodtext: Text[30];
        BeginDate: Date;
        DateSpecified: Date;
        EndDate: Date;
        EmpBank: Record "Employee Bank AccountX";
        BankName: Text[30];
        BasicSalary: Decimal;
        TaxableAmt: Decimal;
        RightBracket: Boolean;
        NetPay: Decimal;
        PayPeriodRec: Record "Employee Bank AccountX";
        PayDeduct: Record "Assignment Matrix-X";
        EmpRec: Record Employee;
        EmpNo: Code[10];
        TaxableAmount: Decimal;
        PAYE: Decimal;
        ArrEarnings: array[10, 50] of Text[250];
        ArrDeductions: array[10, 50] of Text[250];
        Index: Integer;
        Index1: Integer;
        j: Integer;
        ArrEarningsAmt: array[10, 50] of Text[250];
        ArrDeductionsAmt: array[10, 50] of Text[250];
        Year: Integer;
        EmpArray: array[10, 15] of Decimal;
        HoldDate: Date;
        DenomArray: array[3, 11] of Text[50];
        NoOfUnitsArray: array[3, 11] of Integer;
        AmountArray: array[3, 11] of Decimal;
        PayModeArray: array[3] of Text[30];
        HoursArray: array[10, 50] of Decimal;
        CompRec: Record "Human Resources Setup";
        HseLimit: Decimal;
        ExcessRetirement: Decimal;
        CfMpr: Decimal;
        relief: Decimal;
        CompInfo: Record "Company Information";
        CoName: Text[80];
        TotalTaxable: Decimal;
        TotalPaye: Decimal;
        TaxCode: Code[10];
        SortBy: Text[30];
        NoFilter: Text[40];
        DeptFilter: Text[30];
        ProjFilter: Text[30];
        SecLocFilter: Text[30];
        GrossPay: Decimal;
        RetireCont: Decimal;
        retirecontribution: Decimal;
        TotalBenefits: Decimal;
        TaxablePay: Decimal;
        TotalQuarters: Decimal;
        GroupCode: Code[20];
        CUser: Code[20];
        ExcelBuf: Record "Excel Buffer" temporary;
        PrintToExcel: Boolean;
        Counter: Integer;
        Text002: label 'PAYE';
        Text001: label 'GMKH';


    procedure GetTaxBracket(var TaxableAmount: Decimal)
    var
        TaxTable: Record BracketsX;
        TotalTax: Decimal;
        Tax: Decimal;
        EndTax: Boolean;
    begin
        AmountRemaining := TaxableAmount;
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
        TotalTax := PayrollRounding(TotalTax);
        IncomeTax := -TotalTax;
        if not Employee."Pays tax?" then
            IncomeTax := 0;
    end;


    procedure GetPayPeriod()
    begin
        PayPeriod.SetRange(PayPeriod."Close Pay", false);
        if PayPeriod.Find('-') then begin
            PayPeriodtext := PayPeriod.Name;
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


    procedure CreateExcelbook()
    begin
        /*
        ExcelBuf.CreateBook('iTAX',Text002);
        //ExcelBuf.CreateSheet(Text002,Text001,COMPANYNAME,USERID);
        ExcelBuf.GiveUserControl;
        ERROR('');
        */
        //ExcelBuf.CreateBookAndOpenExcel('C:\bd\iTAX.xlsx', Text002, Text001, COMPANYNAME, UserId);
        Error('');

    end;


    procedure MakeExcelDataBody()
    var
        BlankFiller: Text[250];
    begin
        BlankFiller := PadStr(' ', MaxStrLen(BlankFiller), ' ');

        ExcelBuf.NewRow;
        //ExcelBuf.AddColumn(counter,FALSE,'',FALSE,FALSE,FALSE,'@');
        //ExcelBuf.AddColumn(Employee."No.",FALSE,'',FALSE,FALSE,FALSE,'@');
        ExcelBuf.AddColumn(Employee."P.I.N", false, '', false, false, false, '@', 1);
        ExcelBuf.AddColumn(Employee."First Name" + ' ' + Employee."Middle Name" + ' ' + Employee."Last Name", false, '', false, false, false, '@', 1);

        ExcelBuf.AddColumn('Resident', false, '', false, false, false, '@', 1);
        ExcelBuf.AddColumn('Primary Employee', false, '', false, false, false, '@', 1);

        ExcelBuf.AddColumn(Abs(Employee."Basic Salary"), false, '', false, false, false, '@', 1);
        ExcelBuf.AddColumn(Abs(Employee."House Allowance1"), false, '', false, false, false, '@', 1);
        ExcelBuf.AddColumn(Abs(Employee."Transport Allowance"), false, '', false, false, false, '@', 1);
        ExcelBuf.AddColumn(Employee."Leave Allowance", false, '', true, false, false, '@', 1);
        ExcelBuf.AddColumn(Employee."Overtime Allowance", false, '', true, false, false, '@', 1);
        ExcelBuf.AddColumn(Employee."Directors Fees", false, '', true, false, false, '@', 1);
        ExcelBuf.AddColumn(Employee."Lump Sum", false, '', true, false, false, '@', 1);
        ExcelBuf.AddColumn(Employee."Other Allowance", false, '', true, false, false, '@', 1);
        ExcelBuf.AddColumn('', false, '', true, false, false, '@', 1);
        ExcelBuf.AddColumn('', false, '', true, false, false, '@', 1);
        ExcelBuf.AddColumn(Employee."Non Cash Benefit", false, '', true, false, false, '@', 1);
        ExcelBuf.AddColumn('', false, '', true, false, false, '@', 1);
        ExcelBuf.AddColumn('0', false, '', true, false, false, '@', 1);
        ExcelBuf.AddColumn('Benefit not given', false, '', true, false, false, '@', 1);
        ExcelBuf.AddColumn('', false, '', true, false, false, '@', 1);
        ExcelBuf.AddColumn('', false, '', true, false, false, '@', 1);
        ExcelBuf.AddColumn('', false, '', true, false, false, '@', 1);
        ExcelBuf.AddColumn('', false, '', true, false, false, '@', 1);
        ExcelBuf.AddColumn('', false, '', true, false, false, '@', 1);
        ExcelBuf.AddColumn('', false, '', true, false, false, '@', 1);
        //ExcelBuf.AddColumn('',FALSE,'',TRUE,FALSE,FALSE,'@');
        ExcelBuf.AddColumn(Abs(Employee."Days Worked per week"), false, '', true, false, false, '@', 1);
        ExcelBuf.AddColumn('', false, '', true, false, false, '@', 1);
        ExcelBuf.AddColumn('0', false, '', true, false, false, '@', 1);
        ExcelBuf.AddColumn('0', false, '', true, false, false, '@', 1);
        ExcelBuf.AddColumn('', false, '', true, false, false, '@', 1);
        ExcelBuf.AddColumn('', false, '', true, false, false, '@', 1);
        ExcelBuf.AddColumn('', false, '', true, false, false, '@', 1);
        ExcelBuf.AddColumn(Employee.MPR, false, '', true, false, false, '@', 1);
        ExcelBuf.AddColumn(Employee."Insurance Relief", false, '', true, false, false, '@', 1);
        ExcelBuf.AddColumn('', false, '', true, false, false, '@', 1);
        //ExcelBuf.AddColumn('',FALSE,'',TRUE,FALSE,FALSE,'@');

        ExcelBuf.AddColumn(Abs(Employee."Cumm. PAYE"), false, '', false, false, false, '@', 1);
        //ExcelBuf.AddColumn(EmpTotal,FALSE,'',FALSE,FALSE,FALSE,'@');


        //ExcelBuf.AddColumn(Id,FALSE,'',FALSE,FALSE,FALSE,'@');
        //ExcelBuf.AddColumn('CONTRIBUTIONS',FALSE,'',FALSE,FALSE,FALSE,'@');
        //ExcelBuf.AddColumn(ABS("Assignment Matrix-X".Amount),FALSE,'',FALSE,FALSE,FALSE,'@');
    end;


    procedure MakeExcelHeader()
    var
        BlankFiller: Text[250];
    begin
        /*
        BlankFiller := PADSTR(' ',MAXSTRLEN(BlankFiller),' ');
        ExcelBuf.NewRow;
        ExcelBuf.AddColumn('MONTHLY P.A.Y.E ',FALSE,'',TRUE,FALSE,FALSE,'@');
        
        ExcelBuf.NewRow;
        ExcelBuf.AddColumn('EMPLOYER PIN:'+Company."VAT Registration No.",FALSE,'',TRUE,FALSE,FALSE,'@');
        ExcelBuf.NewRow;
        ExcelBuf.AddColumn('EMPLOYER NAME:'+UPPERCASE(COMPANYNAME),FALSE,'',TRUE,FALSE,FALSE,'@');
        ExcelBuf.NewRow;
        ExcelBuf.AddColumn('MONTH:'+
        UPPERCASE(FORMAT(DateSpecified,0,'<month text> <year4>')),FALSE,'',TRUE,FALSE,FALSE,'@');
        ExcelBuf.NewRow;
        
        */

        ExcelBuf.NewRow;
        ExcelBuf.AddColumn('P.I.N NO', false, '', true, false, false, '@', 1);
        ExcelBuf.AddColumn('EMPLOYEE''S NAME', false, '', true, false, false, '@', 1);
        ExcelBuf.AddColumn('RESIDENTIAL STATUS', false, '', true, false, false, '@', 1);
        ExcelBuf.AddColumn('TYPE OF EMPLOYEE', false, '', true, false, false, '@', 1);
        ExcelBuf.AddColumn('BASIC SALARY', false, '', true, false, false, '@', 1);
        ExcelBuf.AddColumn('HOUSE ALLOWANCE', false, '', true, false, false, '@', 1);
        ExcelBuf.AddColumn('TRANSPORT ALLOWANCE', false, '', true, false, false, '@', 1);
        ExcelBuf.AddColumn('LEAVE PAY', false, '', true, false, false, '@', 1);
        ExcelBuf.AddColumn('OVERTIME ALLOWANCE', false, '', true, false, false, '@', 1);
        //ExcelBuf.AddColumn('TRANSPORT ALLOWANCE',FALSE,'',TRUE,FALSE,FALSE,'@');
        ExcelBuf.AddColumn('DIRECTOR''S FEE', false, '', true, false, false, '@', 1);
        //ExcelBuf.AddColumn('TRANSPORT ALLOWANCE',FALSE,'',TRUE,FALSE,FALSE,'@');
        ExcelBuf.AddColumn('LUMPSUM PAYMENT', false, '', true, false, false, '@', 1);
        ExcelBuf.AddColumn('OTHER ALLOWANCE', false, '', true, false, false, '@', 1);
        ExcelBuf.AddColumn('', false, '', true, false, false, '@', 1);
        ExcelBuf.AddColumn('CAR BENEFIT', false, '', true, false, false, '@', 1);
        ExcelBuf.AddColumn('NON CASH BENEFIT', false, '', true, false, false, '@', 1);
        ExcelBuf.AddColumn('', false, '', true, false, false, '@', 1);
        ExcelBuf.AddColumn('', false, '', true, false, false, '@', 1);
        ExcelBuf.AddColumn('', false, '', true, false, false, '@', 1);
        ExcelBuf.AddColumn('', false, '', true, false, false, '@', 1);
        ExcelBuf.AddColumn('', false, '', true, false, false, '@', 1);
        ExcelBuf.AddColumn('', false, '', true, false, false, '@', 1);
        ExcelBuf.AddColumn('', false, '', true, false, false, '@', 1);
        ExcelBuf.AddColumn('', false, '', true, false, false, '@', 1);
        ExcelBuf.AddColumn('', false, '', true, false, false, '@', 1);
        //ExcelBuf.AddColumn('',FALSE,'',TRUE,FALSE,FALSE,'@');
        ExcelBuf.AddColumn('', false, '', true, false, false, '@', 1);
        ExcelBuf.AddColumn('', false, '', true, false, false, '@', 1);
        ExcelBuf.AddColumn('', false, '', true, false, false, '@', 1);
        ExcelBuf.AddColumn('', false, '', true, false, false, '@', 1);
        ExcelBuf.AddColumn('', false, '', true, false, false, '@', 1);
        ExcelBuf.AddColumn('', false, '', true, false, false, '@', 1);
        ExcelBuf.AddColumn('', false, '', true, false, false, '@', 1);
        ExcelBuf.AddColumn('PERSONAL RELIEF', false, '', true, false, false, '@', 1);

        ExcelBuf.AddColumn('INSURANCE RELIEF', false, '', true, false, false, '@', 1);
        ExcelBuf.AddColumn('', false, '', true, false, false, '@', 1);
        ExcelBuf.AddColumn('SELF ASSESSED PAYE TAX', false, '', true, false, false, '@', 1);


        //ExcelBuf.AddColumn('PAYE AMOUNT',FALSE,'',TRUE,FALSE,FALSE,'@');
        //ExcelBuf.AddColumn('I.D NO',FALSE,'',TRUE,FALSE,FALSE,'@');
        //ExcelBuf.AddColumn('REMARKS',FALSE,'',TRUE,FALSE,FALSE,'@');

    end;


    procedure MakeExcelFooter()
    var
        BlankFiller: Text[250];
    begin
        BlankFiller := PadStr(' ', MaxStrLen(BlankFiller), ' ');
        /*
        ExcelBuf.NewRow;
        ExcelBuf.NewRow;
        ExcelBuf.AddColumn('',FALSE,'',FALSE,FALSE,FALSE,'@');
        //ExcelBuf.AddColumn('',FALSE,'',FALSE,FALSE,FALSE,'@');
        ExcelBuf.AddColumn('Employees :'+FORMAT(Counter),FALSE,'',FALSE,FALSE,FALSE,'@');
        //ExcelBuf.AddColumn(EmployeeTotal+EmployerTotal,FALSE,'',FALSE,FALSE,FALSE,'@');
        ExcelBuf.AddColumn('',FALSE,'',FALSE,FALSE,FALSE,'@');
        ExcelBuf.AddColumn('',FALSE,'',FALSE,FALSE,FALSE,'@');
        ExcelBuf.AddColumn(TotalTaxable,FALSE,'',FALSE,FALSE,FALSE,'@');
        ExcelBuf.AddColumn(ABS(TotalPaye),FALSE,'',FALSE,FALSE,FALSE,'@');
        //ExcelBuf.AddColumn(TotalVoluntary,FALSE,'',FALSE,FALSE,FALSE,'@');
        //ExcelBuf.AddColumn(EmployeeTotal+EmployerTotal+TotalVoluntary,FALSE,'',FALSE,FALSE,FALSE,'@');
        //ExcelBuf.AddColumn('',FALSE,'',FALSE,FALSE,FALSE,'@');
        //ExcelBuf.AddColumn(SumTotal,FALSE,'',FALSE,FALSE,FALSE,'');
        */

    end;
}
