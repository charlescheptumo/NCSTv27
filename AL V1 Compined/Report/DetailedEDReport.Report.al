#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Report 69084 "Detailed E/D Report"
{
    DefaultLayout = RDLC;
    RDLCLayout = './Layouts/Detailed ED Report.rdlc';
    ApplicationArea = All;

    dataset
    {
        dataitem("Assignment Matrix-X"; "Assignment Matrix-X")
        {
            DataItemTableView = sorting(Type, Code);
            RequestFilterFields = "Payroll Period", Type, "Code", "Posting Group Filter";
            RequestFilterHeading = 'Detailed Earnings and Deductions';
            column(ReportForNavId_1213; 1213)
            {
            }
            column(FORMAT_TODAY_0_4_; Format(Today, 0, 4))
            {
            }
            column(COMPANYNAME; COMPANYNAME)
            {
            }
            column(USERID; UserId)
            {
            }
            column(UPPERCASE_FORMAT_DateSpecified_0___month_text___year4____; UpperCase(Format(DateSpecified, 0, '<month text> <year4>')))
            {
            }
            column(CurrReport_PAGENO; CurrReport.PageNo)
            {
            }
            column(ReportCaption; ReportCaption)
            {
            }
            column(GroupHeader; GroupHeader)
            {
            }
            column(Assignment_Matrix_X_Code; "Assignment Matrix-X".Code)
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
            column(Assignment_Matrix_X__Employer_Amount_; "Assignment Matrix-X"."Employer Amount")
            {
            }
            column(GroupHeader______Total_; GroupHeader + '  Total')
            {
            }
            column(ABS_Amount__Control20; Abs("Assignment Matrix-X".Amount))
            {
            }
            column(Assignment_Matrix_X__Employer_Amount__Control1000000002; "Assignment Matrix-X"."Employer Amount")
            {
            }
            column(Page_Caption; Page_CaptionLbl)
            {
            }
            column(PERIODCaption; PERIODCaptionLbl)
            {
            }
            column(UserCaption; UserCaptionLbl)
            {
            }
            column(No_Caption; No_CaptionLbl)
            {
            }
            column(NameCaption; NameCaptionLbl)
            {
            }
            column(AmountCaption; AmountCaptionLbl)
            {
            }
            column(Assignment_Matrix_X__Employer_Amount_Caption; "Assignment Matrix-X".FieldCaption("Assignment Matrix-X"."Employer Amount"))
            {
            }
            column(Assignment_Matrix_X_Type; "Assignment Matrix-X".Type)
            {
            }
            column(Assignment_Matrix_X_Payroll_Period; "Assignment Matrix-X"."Payroll Period")
            {
            }
            column(Assignment_Matrix_X_Reference_No; "Assignment Matrix-X"."Reference No")
            {
            }

            trigger OnAfterGetRecord()
            begin
                // IF ("Assignment Matrix-X".Amount =0) AND ("Assignment Matrix-X"."Outstanding Amount" =0) THEN
                // CurrReport.SKIP;

                if Emp.Get("Assignment Matrix-X"."Employee No") then begin
                    Name := Emp."First Name" + ' ' + Emp."Middle Name" + ' ' + Emp."Last Name";
                    IDNo := Emp."ID Number";
                end;

                if "Assignment Matrix-X".Type = "Assignment Matrix-X".Type::Payment then begin
                    if Payment.Get("Assignment Matrix-X".Code) then begin
                        GroupHeader := Payment.Description;
                        Payment.SetRange(Payment."Employee Filter", "Assignment Matrix-X"."Employee No");
                        Payment.CalcFields(Payment."Total Amount");
                        Cumulative := Payment."Total Amount";
                    end;
                end;

                if "Assignment Matrix-X".Type = "Assignment Matrix-X".Type::Deduction then begin
                    if Deduction.Get("Assignment Matrix-X".Code) then begin
                        GroupHeader := Deduction.Description;
                        Deduction.SetRange(Deduction."Employee Filter", "Assignment Matrix-X"."Employee No");
                        Deduction.CalcFields(Deduction."Total Amount");
                        Cumulative := Deduction."Total Amount";
                    end;

                end;
                CodeHolder := "Assignment Matrix-X".Code;
                TotalEmployee := TotalEmployee + "Assignment Matrix-X".Amount;
                TotalEmployer := TotalEmployer + "Assignment Matrix-X"."Employer Amount";
                TotalBalance := TotalBalance + "Assignment Matrix-X"."Closing Balance";
                Counter := Counter + 1;
                if PrintToExcel = true then
                    MakeExcelDataBody;
            end;

            trigger OnPostDataItem()
            begin

                if PrintToExcel = true then begin
                    MakeExcelFooter;
                    CreateExcelbook;
                end;
            end;

            trigger OnPreDataItem()
            begin
                LastFieldNo := "Assignment Matrix-X".FieldNo("Assignment Matrix-X".Code);
                TotalCum := 0;
                CurrReport.CreateTotals(Cumulative);
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
        ReportCaption := '';
        TypeFilter := "Assignment Matrix-X".GetFilter("Assignment Matrix-X".Type);

        if TypeFilter = 'Payment' then
            ReportCaption := 'ALLOWANCES REPORT';
        if TypeFilter = 'Deduction' then
            ReportCaption := 'DEDUCTIONS REPORT';
        if TypeFilter = '' then
            ReportCaption := 'ALLOWANCES AND DEDUCTIONS';
        if TypeFilter = 'Saving Scheme' then
            ReportCaption := 'DEDUCTIONS REPORT';

        DateSpecified := "Assignment Matrix-X".GetRangeMin("Assignment Matrix-X"."Payroll Period");
        if PayPeriod.Get(DateSpecified) then
            PayPeriodText := PayPeriod.Name;
        /*
       IF UserRole.GET(USERID,'PAYROLLVIEW',' ')=FALSE THEN
       ERROR('You do not have permissions to view this form');

       */

    end;

    var
        LastFieldNo: Integer;
        FooterPrinted: Boolean;
        TotalFor: label 'Total for ';
        Emp: Record Employee;
        Name: Text[50];
        Payment: Record EarningsX;
        Deduction: Record DeductionsX;
        TypeFilter: Text[80];
        GroupHeader: Text[80];
        PayPeriod: Record "Payroll PeriodX";
        PayPeriodText: Text[80];
        ReportCaption: Text[80];
        DateSpecified: Date;
        PdCode: Code[10];
        Cumulative: Decimal;
        TotalCum: Decimal;
        CodeHolder: Code[10];
        GetGroup: Codeunit Payroll1;
        GroupCode: Code[20];
        CUser: Code[20];
        ExcelBuf: Record "Excel Buffer" temporary;
        Text002: label 'DEDUCTION';
        Text001: label 'KS';
        Counter: Decimal;
        TotalEmployee: Decimal;
        TotalEmployer: Decimal;
        TotalBalance: Decimal;
        PrintToExcel: Boolean;
        Page_CaptionLbl: label 'Page ';
        PERIODCaptionLbl: label 'PERIOD';
        UserCaptionLbl: label 'User';
        No_CaptionLbl: label 'No.';
        NameCaptionLbl: label 'Name';
        AmountCaptionLbl: label 'Amount';
        IDNo: Code[20];


    procedure GetPayperiod()
    begin
        PayPeriod.SetRange(PayPeriod.Closed, false);
        if PayPeriod.Find('-') then
            PayPeriodText := PayPeriod.Name;
    end;


    procedure CreateExcelbook()
    begin
        /*
        ExcelBuf.CreateBook;
        ExcelBuf.CreateSheet(Text002,Text001,COMPANYNAME,USERID);
        ExcelBuf.GiveUserControl;
        ERROR('');
        */

        //cc// ExcelBuf.CreateBookAndOpenExcel('Earn/Ded', Text002, Text001, COMPANYNAME, UserId);
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
        //ExcelBuf.AddColumn(Employee."Last Name",FALSE,'',FALSE,FALSE,FALSE,'@');
        ExcelBuf.AddColumn(Name, false, '', false, false, false, '@', ExcelBuf."cell type"::Text);
        ExcelBuf.AddColumn(IDNo, false, '', false, false, false, '@', ExcelBuf."cell type"::Text);
        ExcelBuf.AddColumn("Assignment Matrix-X".Code, false, '', false, false, false, '@', ExcelBuf."cell type"::Text);
        ExcelBuf.AddColumn("Assignment Matrix-X".Description, false, '', false, false, false, '@', ExcelBuf."cell type"::Text);
        //ExcelBuf.AddColumn(NhifNo,FALSE,'',FALSE,FALSE,FALSE,'@');
        ExcelBuf.AddColumn(Abs("Assignment Matrix-X".Amount), false, '', false, false, false, '@', ExcelBuf."cell type"::Text);
        ExcelBuf.AddColumn(Abs("Assignment Matrix-X"."Employer Amount"), false, '', false, false, false, '@', ExcelBuf."cell type"::Text);
        ExcelBuf.AddColumn(Abs("Assignment Matrix-X"."Closing Balance"), false, '', false, false, false, '@', ExcelBuf."cell type"::Text);
    end;


    procedure MakeExcelHeader()
    var
        BlankFiller: Text[250];
    begin


        BlankFiller := PadStr(' ', MaxStrLen(BlankFiller), ' ');
        //ExcelBuf.NewRow;
        //ExcelBuf.AddColumn('EMPLOYER CODE: 16437',FALSE,'',TRUE,FALSE,FALSE,'@');
        ExcelBuf.NewRow;
        ExcelBuf.AddColumn('EMPLOYER NAME:' + UpperCase(COMPANYNAME), false, '', true, false, false, '@', ExcelBuf."cell type"::Text);
        ExcelBuf.NewRow;
        ExcelBuf.AddColumn('DEDUCTION:' +
        UpperCase(Format(DateSpecified, 0, '<month text> <year4>')), false, '', true, false, false, '@', ExcelBuf."cell type"::Text);
        ExcelBuf.NewRow;
        ExcelBuf.NewRow;
        ExcelBuf.AddColumn('PAYROLL NO', false, '', true, false, false, '@', ExcelBuf."cell type"::Text);
        ExcelBuf.AddColumn('EMPLOYEE NAME', false, '', true, false, false, '@', ExcelBuf."cell type"::Text);
        ExcelBuf.AddColumn('ID NUMBER', false, '', true, false, false, '@', ExcelBuf."cell type"::Text);
        ExcelBuf.AddColumn('CODE', false, '', true, false, false, '@', ExcelBuf."cell type"::Text);
        ExcelBuf.AddColumn('DESCRIPTION', false, '', true, false, false, '@', ExcelBuf."cell type"::Text);
        //ExcelBuf.AddColumn('FIRST NAMES',FALSE,'',TRUE,FALSE,FALSE,'@');
        //ExcelBuf.AddColumn('I.D NO',FALSE,'',TRUE,FALSE,FALSE,'@');
        //ExcelBuf.AddColumn('N.H.I.F NO.',FALSE,'',TRUE,FALSE,FALSE,'@');
        ExcelBuf.AddColumn('AMOUNT', false, '', true, false, false, '@', ExcelBuf."cell type"::Text);
        ExcelBuf.AddColumn('COMPANY', false, '', true, false, false, '@', ExcelBuf."cell type"::Text);
        ExcelBuf.AddColumn('BALANCE', false, '', true, false, false, '@', ExcelBuf."cell type"::Text);
        //ExcelBuf.NewRow;
    end;


    procedure MakeExcelFooter()
    var
        BlankFiller: Text[250];
    begin

        BlankFiller := PadStr(' ', MaxStrLen(BlankFiller), ' ');

        //ExcelBuf.NewRow;
        ExcelBuf.NewRow;
        ExcelBuf.AddColumn('', false, '', false, false, false, '@', ExcelBuf."cell type"::Text);
        //ExcelBuf.AddColumn('',FALSE,'',FALSE,FALSE,FALSE,'@');
        ExcelBuf.AddColumn('Employees :' + Format(Counter), false, '', false, false, false, '@', ExcelBuf."cell type"::Text);
        ExcelBuf.AddColumn('', false, '', false, false, false, '@', ExcelBuf."cell type"::Text);
        ExcelBuf.AddColumn('', false, '', false, false, false, '@', ExcelBuf."cell type"::Text);
        ExcelBuf.AddColumn('', false, '', false, false, false, '@', ExcelBuf."cell type"::Text);

        ExcelBuf.AddColumn(Abs(TotalEmployee), false, '', false, false, false, '@', ExcelBuf."cell type"::Text);
        //ExcelBuf.AddColumn('',FALSE,'',FALSE,FALSE,FALSE,'@',ExcelBuf."Cell Type"::Text);
        //ExcelBuf.AddColumn('',FALSE,'',FALSE,FALSE,FALSE,'@',ExcelBuf."Cell Type"::Text);
        ExcelBuf.AddColumn(TotalEmployer, false, '', false, false, false, '@', ExcelBuf."cell type"::Text);
        //ExcelBuf.AddColumn('',FALSE,'',FALSE,FALSE,FALSE,'@');
        ExcelBuf.AddColumn(TotalBalance, false, '', false, false, false, '', ExcelBuf."cell type"::Text);
    end;
}
