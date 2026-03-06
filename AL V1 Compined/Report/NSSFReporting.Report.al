#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Report 69031 "NSSF Reporting"
{
    DefaultLayout = RDLC;
    RDLCLayout = './Layouts/NSSF Reporting.rdlc';
    ApplicationArea = All;

    dataset
    {
        dataitem("Assignment Matrix-X"; "Assignment Matrix-X")
        {
            DataItemTableView = sorting("Employee No", Type, Code, "Payroll Period", "Reference No") order(ascending) where(Type = const(Deduction));
            RequestFilterFields = "Payroll Period", "Code", "Payroll Grouping";
            RequestFilterHeading = 'NSSF';
            column(ReportForNavId_1213; 1213)
            {
            }
            column(FORMAT_TODAY_0_4_; Format(Today, 0, 4))
            {
            }
            column(NATIONAL_SOCIAL_SECURITY_FUND__; 'NATIONAL SOCIAL SECURITY FUND ')
            {
            }
            column(CurrReport_PAGENO; CurrReport.PageNo)
            {
            }
            column(USERID; UserId)
            {
            }
            column(COMPANYNAME; COMPANYNAME)
            {
            }
            column(CoNssf; CoNssf)
            {
            }
            column(UPPERCASE_FORMAT_DateSpecified_0___Month_Text___year4____; UpperCase(Format(DateSpecified, 0, '<Month Text> <year4>')))
            {
            }
            column(NATIONAL_SOCIAL_SECURITY_FUND___Control28; 'NATIONAL SOCIAL SECURITY FUND ')
            {
            }
            column(P_O__BOX_30599__; 'P.O. BOX 30599 ')
            {
            }
            column(NAIROBI__; 'NAIROBI ')
            {
            }
            column(Assignment_Matrix_X__Employee_No_; "Assignment Matrix-X"."Employee No")
            {
            }
            column(Name; Name)
            {
            }
            column(ABS_Amount_; Abs("Assignment Matrix-X".Amount))
            {
            }
            column(ABS__Employer_Amount___; Abs("Assignment Matrix-X"."Employer Amount"))
            {
            }
            column(Emp__Social_Security_No__; Emp."NSSF No.")
            {
            }
            column(ABS__Employer_Amount____ABS_Amount_; Abs("Assignment Matrix-X"."Employer Amount") + Abs("Assignment Matrix-X".Amount))
            {
            }
            column(EmployeeTotal; EmployeeTotal)
            {
            }
            column(EmployerTotal; EmployerTotal)
            {
            }
            column(SumTotal; SumTotal)
            {
            }
            column(CurrReport_PAGENOCaption; CurrReport_PAGENOCaptionLbl)
            {
            }
            column(COMPANY_NSSF_No_Caption; COMPANY_NSSF_No_CaptionLbl)
            {
            }
            column(UserCaption; UserCaptionLbl)
            {
            }
            column(CONTRIBUTIONS_RETURN_FORMCaption; CONTRIBUTIONS_RETURN_FORMCaptionLbl)
            {
            }
            column(PERIODCaption; PERIODCaptionLbl)
            {
            }
            column(No_Caption; No_CaptionLbl)
            {
            }
            column(NameCaption; NameCaptionLbl)
            {
            }
            column(Total_AmountCaption; Total_AmountCaptionLbl)
            {
            }
            column(Employer_AmountCaption; Employer_AmountCaptionLbl)
            {
            }
            column(Employee_AmountCaption; Employee_AmountCaptionLbl)
            {
            }
            column(NSSF_No_Caption; NSSF_No_CaptionLbl)
            {
            }
            column(TotalCaption; TotalCaptionLbl)
            {
            }
            column(Certified_correct_by_Company_Authorised_Officer_Caption; Certified_correct_by_Company_Authorised_Officer_CaptionLbl)
            {
            }
            column(NAME_________________________________________________________________________Caption; NAME_________________________________________________________________________CaptionLbl)
            {
            }
            column(SIGNATURE___________________________________________________________Caption; SIGNATURE___________________________________________________________CaptionLbl)
            {
            }
            column(DESIGNATION____________________________________________________________Caption; DESIGNATION____________________________________________________________CaptionLbl)
            {
            }
            column(DATE_____________________________________________________________________Caption; DATE_____________________________________________________________________CaptionLbl)
            {
            }
            column(Assignment_Matrix_X_Type; "Assignment Matrix-X".Type)
            {
            }
            column(Assignment_Matrix_X_Code; "Assignment Matrix-X".Code)
            {
            }
            column(Assignment_Matrix_X_Payroll_Period; "Assignment Matrix-X"."Payroll Period")
            {
            }
            column(Assignment_Matrix_X_Reference_No; "Assignment Matrix-X"."Reference No")
            {
            }
            column(Picture_CompanyInformation; CompRec.Picture)
            {
            }

            trigger OnAfterGetRecord()
            begin
                Voluntary := 0;//476390
                EmpTotal := 0;

                if Emp.Get("Assignment Matrix-X"."Employee No") then begin
                    Name := Emp."First Name" + ' ' + Emp."Middle Name" + ' ' + Emp."Last Name";
                    Id := Emp."ID Number";
                    Emp.SetRange(Emp."Pay Period Filter", "Assignment Matrix-X"."Payroll Period");
                    Emp.CalcFields(Emp."Cumm. Basic Pay");
                    if BeginDate = DateSpecified then
                        BasicPay := Emp."Basic Pay"
                    else
                        BasicPay := Emp."Cumm. Basic Pay";
                    SSFNo := Emp."Social Security No.";
                end;
                if "Assignment Matrix-X".Type = "Assignment Matrix-X".Type::Payment then begin
                    if Payment.Get("Assignment Matrix-X".Code) then
                        GroupHeader := Payment.Description;
                end;

                if "Assignment Matrix-X".Type = "Assignment Matrix-X".Type::Deduction then begin
                    if Deduction.Get("Assignment Matrix-X".Code) then
                        GroupHeader := Deduction.Description;
                end;
                TotalBasic := TotalBasic + BasicPay;
                EmployerTotal := EmployerTotal + Abs("Assignment Matrix-X"."Employer Amount");
                EmployeeTotal := EmployeeTotal + Abs("Assignment Matrix-X".Amount);

                //Employee No,Type,Code,Payroll Period,Reference No

                if AssMatrix.Get("Assignment Matrix-X"."Employee No", "Assignment Matrix-X".Type::Deduction, 'D031',
                "Assignment Matrix-X"."Payroll Period") then begin
                    Voluntary := Abs(AssMatrix.Amount);
                    TotalVoluntary := TotalVoluntary + Voluntary;
                end;

                EmpTotal := Abs("Assignment Matrix-X"."Employer Amount") + Abs("Assignment Matrix-X".Amount) + Voluntary;
                SumTotal := SumTotal + Abs("Assignment Matrix-X"."Employer Amount") + Abs("Assignment Matrix-X".Amount) + Voluntary;

                Counter := Counter + 1;
                if PrintToExcel then
                    MakeExcelDataBody;

                if Counter > 1 then
                    Clear(CompRec.Picture);
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
                LastFieldNo := "Assignment Matrix-X".FieldNo("Assignment Matrix-X".Code);
                //"Assignment Matrix-X".SETRANGE("Assignment Matrix-X".Retirement,TRUE);
                "Assignment Matrix-X".SetRange("Assignment Matrix-X".Type, "Assignment Matrix-X".Type::Deduction);
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
                group(Options)
                {
                    Caption = 'Options';
                    field(PrintToExcel; PrintToExcel)
                    {
                        ApplicationArea = Basic;
                        Caption = 'Print To Excel';
                    }
                }
            }
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

        CompRec.Get;
        CompRec.CalcFields(Picture);
        //CoNssf:=CompRec."Revenue Authority Name";
        GetPayPeriod;
        DateSpecified := "Assignment Matrix-X".GetRangeMin("Assignment Matrix-X"."Payroll Period");
        if PayPeriod.Get(DateSpecified) then
            PayPeriodText := PayPeriod.Name;
        nssfcode := "Assignment Matrix-X".GetRangeMin("Assignment Matrix-X".Code);
    end;

    var
        LastFieldNo: Integer;
        FooterPrinted: Boolean;
        TotalFor: label 'Total for ';
        Emp: Record Employee;
        Name: Text[250];
        Payment: Record EarningsX;
        Deduction: Record DeductionsX;
        TypeFilter: Text[30];
        GroupHeader: Text[30];
        BasicPay: Decimal;
        SSFNo: Code[30];
        TotalBasic: Decimal;
        PayPeriod: Record "Payroll PeriodX";
        PayPeriodText: Text[30];
        Title: Text[30];
        DateSpecified: Date;
        BeginDate: Date;
        CompRec: Record "Company Information";
        CoNssf: Text[30];
        SumTotal: Decimal;
        EmployeeTotal: Decimal;
        EmployerTotal: Decimal;
        GetGroup: Codeunit Payroll3;
        GroupCode: Code[20];
        CUser: Code[20];
        nssfcode: Code[10];
        ExcelBuf: Record "Excel Buffer" temporary;
        Text002: label 'NSSF';
        Text001: label 'KS';
        Id: Code[20];
        Counter: Integer;
        AssMatrix: Record "Assignment Matrix-X";
        Voluntary: Decimal;
        TotalVoluntary: Decimal;
        EmpTotal: Decimal;
        PrintToExcel: Boolean;
        CurrReport_PAGENOCaptionLbl: label 'Page';
        COMPANY_NSSF_No_CaptionLbl: label 'COMPANY NSSF No.';
        UserCaptionLbl: label 'User';
        CONTRIBUTIONS_RETURN_FORMCaptionLbl: label 'CONTRIBUTIONS RETURN FORM';
        PERIODCaptionLbl: label 'PERIOD';
        No_CaptionLbl: label 'No.';
        NameCaptionLbl: label 'Name';
        Total_AmountCaptionLbl: label 'Total Amount';
        Employer_AmountCaptionLbl: label 'Employer Amount';
        Employee_AmountCaptionLbl: label 'Employee Amount';
        NSSF_No_CaptionLbl: label 'NSSF No.';
        TotalCaptionLbl: label 'Total';
        Certified_correct_by_Company_Authorised_Officer_CaptionLbl: label 'Certified correct by Company Authorised Officer ';
        NAME_________________________________________________________________________CaptionLbl: label 'NAME  .......................................................................';
        SIGNATURE___________________________________________________________CaptionLbl: label 'SIGNATURE ..........................................................';
        DESIGNATION____________________________________________________________CaptionLbl: label 'DESIGNATION ...........................................................';
        DATE_____________________________________________________________________CaptionLbl: label 'DATE ....................................................................';
        Text003: label 'NSSF';


    procedure GetPayPeriod()
    begin
        PayPeriod.SetRange(PayPeriod.Closed, false);
        if PayPeriod.Find('-') then
            BeginDate := PayPeriod."Starting Date";
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
        ExcelBuf.CreateBook;
        ExcelBuf.CreateSheet(Text002,Text001,COMPANYNAME,USERID);
        ExcelBuf.GiveUserControl;
        ERROR('');
        
        */

        //ExcelBuf.CreateBookAndOpenExcel(Text003,Text002,Text001,COMPANYNAME,USERID);
        //ERROR('');
        //ExcelBuf.CreateBookAndOpenExcel(Text002,Text001,COMPANYNAME,USERID);
        //ExcelBuf.CreateBookAndOpenExcel('C:\Payroll\MASTER ROLL.xlsx', Text002, Text001, COMPANYNAME, UserId);
        //ERROR('');
        Error('');

    end;


    procedure MakeExcelDataBody()
    var
        BlankFiller: Text[250];
    begin


        BlankFiller := PadStr(' ', MaxStrLen(BlankFiller), ' ');

        ExcelBuf.NewRow;
        //ExcelBuf.AddColumn(counter,FALSE,'',FALSE,FALSE,FALSE,'@');
        ExcelBuf.AddColumn(Emp."No.", false, '', false, false, false, '@', ExcelBuf."cell type"::Text);
        ExcelBuf.AddColumn(Name, false, '', false, false, false, '@', ExcelBuf."cell type"::Text);
        ExcelBuf.AddColumn(SSFNo, false, '', false, false, false, '@', ExcelBuf."cell type"::Text);
        ExcelBuf.AddColumn(Abs("Assignment Matrix-X".Amount) + Abs("Assignment Matrix-X"."Employer Amount"), false, '', false, false, false, '@', ExcelBuf."cell type"::Text);
        ExcelBuf.AddColumn(Voluntary, false, '', false, false, false, '@', ExcelBuf."cell type"::Text);
        ExcelBuf.AddColumn(EmpTotal, false, '', false, false, false, '@', ExcelBuf."cell type"::Text);


        ExcelBuf.AddColumn(Id, false, '', false, false, false, '@', ExcelBuf."cell type"::Text);
        //ExcelBuf.AddColumn('CONTRIBUTIONS',FALSE,'',FALSE,FALSE,FALSE,'@',ExcelBuf."Cell Type"::Text);
        //ExcelBuf.AddColumn(ABS("Assignment Matrix-X".Amount),FALSE,'',FALSE,FALSE,FALSE,'@');
    end;


    procedure MakeExcelHeader()
    var
        BlankFiller: Text[250];
    begin


        BlankFiller := PadStr(' ', MaxStrLen(BlankFiller), ' ');
        ExcelBuf.NewRow;
        ExcelBuf.AddColumn('NSSF CONTRIBUTIONS', false, '', true, false, false, '@', ExcelBuf."cell type"::Text);

        ExcelBuf.NewRow;
        ExcelBuf.AddColumn('EMPLOYER NUMBER', false, '', true, false, false, '@', ExcelBuf."cell type"::Text);
        ExcelBuf.AddColumn('319686', false, '', true, false, false, '@', ExcelBuf."cell type"::Text);
        ExcelBuf.NewRow;
        //ExcelBuf.AddColumn('EMPLOYER NAME:'+UPPERCASE(COMPANYNAME),FALSE,'',TRUE,FALSE,FALSE,'@',ExcelBuf."Cell Type"::Text);

        ExcelBuf.AddColumn('EMPLOYER NAME', false, '', true, false, false, '@', ExcelBuf."cell type"::Text);
        ExcelBuf.AddColumn('NATIONAL WATER CONSERVATION & PIPELINE CORPORATION', false, '', true, false, false, '', ExcelBuf."cell type"::Text);
        ExcelBuf.NewRow;
        //ExcelBuf.AddColumn('MONTH OF CONTRIBUTION:'+UPPERCASE(FORMAT(DateSpecified,0,'<month text> <year4>')),FALSE,'',TRUE,FALSE,FALSE,'@',ExcelBuf."Cell Type"::Text);
        ExcelBuf.AddColumn('Contributions Period', false, '', true, false, false, '@', ExcelBuf."cell type"::Text);
        ExcelBuf.AddColumn(UpperCase(Format(DateSpecified, 0, '<month text> <year4>')), false, '', true, false, false, '', ExcelBuf."cell type"::Text);
        ExcelBuf.NewRow;
        ExcelBuf.NewRow;
        ExcelBuf.AddColumn('PAYROLL NO', false, '', true, false, false, '@', ExcelBuf."cell type"::Text);
        ExcelBuf.AddColumn('EMPLOYEE''S NAME', false, '', true, false, false, '@', ExcelBuf."cell type"::Text);
        ExcelBuf.AddColumn('NSSF NO', false, '', true, false, false, '@', ExcelBuf."cell type"::Text);
        ExcelBuf.AddColumn('STD AMT', false, '', true, false, false, '@', ExcelBuf."cell type"::Text);
        ExcelBuf.AddColumn('VOL AMT', false, '', true, false, false, '@', ExcelBuf."cell type"::Text);
        ExcelBuf.AddColumn('TOT AMT', false, '', true, false, false, '@', ExcelBuf."cell type"::Text);
        ExcelBuf.AddColumn('I.D NO', false, '', true, false, false, '@', ExcelBuf."cell type"::Text);
        //ExcelBuf.AddColumn('REMARKS',FALSE,'',TRUE,FALSE,FALSE,'@',ExcelBuf."Cell Type"::Text);
    end;


    procedure MakeExcelFooter()
    var
        BlankFiller: Text[250];
    begin


        BlankFiller := PadStr(' ', MaxStrLen(BlankFiller), ' ');

        ExcelBuf.NewRow;
        ExcelBuf.NewRow;
        ExcelBuf.AddColumn('', false, '', false, false, false, '@', ExcelBuf."cell type"::Text);
        ExcelBuf.AddColumn('', false, '', false, false, false, '@', ExcelBuf."cell type"::Text);
        ExcelBuf.AddColumn('Employees :' + Format(Counter), false, '', false, false, false, '@', ExcelBuf."cell type"::Text);
        ExcelBuf.AddColumn(EmployeeTotal + EmployerTotal, false, '', false, false, false, '@', ExcelBuf."cell type"::Text);

        ExcelBuf.AddColumn(TotalVoluntary, false, '', false, false, false, '@', ExcelBuf."cell type"::Text);
        ExcelBuf.AddColumn(EmployeeTotal + EmployerTotal + TotalVoluntary, false, '', false, false, false, '@', ExcelBuf."cell type"::Text);
        //ExcelBuf.AddColumn('',FALSE,'',FALSE,FALSE,FALSE,'@');
        //ExcelBuf.AddColumn(SumTotal,FALSE,'',FALSE,FALSE,FALSE,'');
    end;
}
