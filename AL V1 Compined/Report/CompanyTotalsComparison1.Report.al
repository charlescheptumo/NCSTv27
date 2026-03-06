#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Report 99055 "Company Totals Comparison1"
{
    DefaultLayout = RDLC;
    RDLCLayout = './Layouts/Company Totals Comparison1.rdlc';
    ApplicationArea = All;

    dataset
    {
        dataitem(EarningsX; EarningsX)
        {
            DataItemTableView = sorting(Code) order(ascending) where("Earning Type" = filter(<> "Tax Relief"));
            PrintOnlyIfDetail = false;
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
            column(EarningFilter; EarningFilter)
            {
            }
            column(EARNINGS_; 'EARNINGS')
            {
            }
            column(STRSUBSTNO___1__UPPERCASE_FORMAT_Thismonth_0___month_text___year4_____; StrSubstNo('%1', UpperCase(Format(Thismonth, 0, '<month text> <year4>'))))
            {
            }
            column(STRSUBSTNO___1__UPPERCASE_FORMAT_Lastmonth_0___month_text___year4_____; StrSubstNo('%1', UpperCase(Format(Lastmonth, 0, '<month text> <year4>'))))
            {
            }
            column(EarningsX_Code; EarningsX.Code)
            {
            }
            column(EarningsX_Description; EarningsX.Description)
            {
            }
            column(ThisMonthVal; ThisMonthVal)
            {
            }
            column(LastMonthVal; LastMonthVal)
            {
            }
            column(ThisMonthVal_LastMonthVal; ThisMonthVal - LastMonthVal)
            {
            }
            column(TOTAL_EARNINGS_; 'TOTAL EARNINGS')
            {
            }
            column(TotalEarnThisMonth; TotalEarnThisMonth)
            {
            }
            column(TotalEarnLastMonth; TotalEarnLastMonth)
            {
            }
            column(TotalEarnThisMonth_TotalEarnLastMonth; TotalEarnThisMonth - TotalEarnLastMonth)
            {
            }
            column(DEDUCTIONS_; 'DEDUCTIONS')
            {
            }
            column(PAYROLL_RECONCILIATIONCaption; PAYROLL_RECONCILIATIONCaptionLbl)
            {
            }
            column(CurrReport_PAGENOCaption; CurrReport_PAGENOCaptionLbl)
            {
            }
            column(DIFFERENCECaption; DIFFERENCECaptionLbl)
            {
            }

            trigger OnAfterGetRecord()
            begin

                if EarningsX."Non-Cash Benefit" = true then
                    CurrReport.Skip;


                Earn.Reset;
                Earn.SetRange(Earn.Code, EarningsX.Code);
                Earn.SetRange(Earn."Pay Period Filter", Thismonth);
                if EarningsX.GetFilter(EarningsX."Posting Group Filter") <> '' then
                    Earn.SetRange(Earn."Posting Group Filter", EarningsX.GetFilter(EarningsX."Posting Group Filter"));
                if Earn.FindFirst then
                    Earn.CalcFields(Earn."Total Amount");
                ThisMonthVal := Earn."Total Amount";
                TotalEarnThisMonth := TotalEarnThisMonth + ThisMonthVal;

                Earn.Reset;
                Earn.SetRange(Earn.Code, EarningsX.Code);
                Earn.SetRange(Earn."Pay Period Filter", Lastmonth);
                if EarningsX.GetFilter(EarningsX."Posting Group Filter") <> '' then
                    Earn.SetRange(Earn."Posting Group Filter", EarningsX.GetFilter(EarningsX."Posting Group Filter"));
                if Earn.FindFirst then
                    Earn.CalcFields(Earn."Total Amount");

                LastMonthVal := Earn."Total Amount";
                TotalEarnLastMonth := TotalEarnLastMonth + LastMonthVal;

                if (ThisMonthVal = 0) and (LastMonthVal = 0) then
                    CurrReport.Skip;

                MakeExcelDataBody;
            end;

            trigger OnPostDataItem()
            begin
                MakeExcelFooter
            end;

            trigger OnPreDataItem()
            begin
                MakeExcelHeader;
            end;
        }
        dataitem(DeductionsX; DeductionsX)
        {
            DataItemTableView = sorting(Code);
            PrintOnlyIfDetail = false;
            column(ReportForNavId_3377; 3377)
            {
            }
            column(ThisMonthVal_LastMonthVal_Control1000000009; ThisMonthVal - LastMonthVal)
            {
            }
            column(LastMonthVal_Control1000000012; LastMonthVal)
            {
            }
            column(ThisMonthVal_Control1000000013; ThisMonthVal)
            {
            }
            column(DeductionsX_Description; DeductionsX.Description)
            {
            }
            column(DeductionsX_Code; DeductionsX.Code)
            {
            }
            column(TOTAL_DEDUCTIONS_; 'TOTAL DEDUCTIONS')
            {
            }
            column(TotalDedThisMonth; TotalDedThisMonth)
            {
            }
            column(TotalDedLastMonth; TotalDedLastMonth)
            {
            }
            column(TotalDedThisMonth_TotalDedLastMonth; TotalDedThisMonth - TotalDedLastMonth)
            {
            }
            column(NET_PAY_; 'NET PAY')
            {
            }
            column(TotalEarnThisMonth_TotalDedThisMonth; TotalEarnThisMonth + TotalDedThisMonth)
            {
            }
            column(TotalEarnLastMonth_TotalDedLastMonth; TotalEarnLastMonth + TotalDedLastMonth)
            {
            }
            column(TotalEarnThisMonth_TotalDedThisMonth__TotalEarnLastMonth_TotalDedLastMonth_; TotalEarnThisMonth + TotalDedThisMonth - (TotalEarnLastMonth + TotalDedLastMonth))
            {
            }

            trigger OnAfterGetRecord()
            begin
                LastMonthVal := 0;
                ThisMonthVal := 0;
                Ded.Reset;
                Ded.SetRange(Ded.Code, DeductionsX.Code);
                Ded.SetRange(Ded."Pay Period Filter", Thismonth);
                if EarningsX.GetFilter(EarningsX."Posting Group Filter") <> '' then
                    Ded.SetRange(Ded."Posting Group Filter", EarningsX.GetFilter(EarningsX."Posting Group Filter"));
                if Ded.FindFirst then
                    Ded.CalcFields(Ded."Total Amount");
                ThisMonthVal := Ded."Total Amount";
                TotalDedThisMonth := TotalDedThisMonth + ThisMonthVal;

                Ded.Reset;
                Ded.SetRange(Ded.Code, DeductionsX.Code);
                Ded.SetRange(Ded."Pay Period Filter", Lastmonth);
                if EarningsX.GetFilter(EarningsX."Posting Group Filter") <> '' then
                    Ded.SetRange(Ded."Posting Group Filter", EarningsX.GetFilter(EarningsX."Posting Group Filter"));
                if Ded.FindFirst then
                    Ded.CalcFields(Ded."Total Amount");

                LastMonthVal := Ded."Total Amount";
                TotalDedLastMonth := TotalDedLastMonth + LastMonthVal;
                if (ThisMonthVal = 0) and (LastMonthVal = 0) then
                    CurrReport.Skip;


                MakeExcelDataBodyDed;
            end;

            trigger OnPostDataItem()
            begin
                MakeExcelFooterDed;
            end;

            trigger OnPreDataItem()
            begin
                MakeExcelHeaderDed
            end;
        }
        dataitem(Employee; Employee)
        {
            PrintOnlyIfDetail = false;
            column(ReportForNavId_7528; 7528)
            {
            }
            column(TOTAL_NUMBER_OF_EMPLOYEES_; 'TOTAL NUMBER OF EMPLOYEES')
            {
            }
            column(TotalEmployees; TotalEmployees)
            {
            }
            column(TotalEmployeesLastMonth; TotalEmployeesLastMonth)
            {
            }
            column(TotalEmployees_TotalEmployeesLastMonth; TotalEmployees - TotalEmployeesLastMonth)
            {
            }
            column(Employee_No_; Employee."No.")
            {
            }

            trigger OnAfterGetRecord()
            begin

                Assignmat.Reset;
                Assignmat.SetRange(Assignmat."Employee No", Employee."No.");
                Assignmat.SetRange(Assignmat."Payroll Period", Thismonth);
                Assignmat.SetRange(Assignmat."Non-Cash Benefit", false);


                if EarningsX.GetFilter(EarningsX."Posting Group Filter") <> '' then
                    Assignmat.SetRange(Assignmat."Posting Group Filter", EarningsX.GetFilter(EarningsX."Posting Group Filter"));

                if Assignmat.Find('-') then
                    TotalEmployees := TotalEmployees + 1;


                Assignmat.Reset;
                Assignmat.SetRange(Assignmat."Employee No", Employee."No.");
                Assignmat.SetRange(Assignmat."Payroll Period", Lastmonth);
                Assignmat.SetRange(Assignmat."Non-Cash Benefit", false);
                if EarningsX.GetFilter(EarningsX."Posting Group Filter") <> '' then
                    Assignmat.SetRange(Assignmat."Posting Group Filter", EarningsX.GetFilter(EarningsX."Posting Group Filter"));

                if Assignmat.Find('-') then
                    TotalEmployeesLastMonth := TotalEmployeesLastMonth + 1;


                /*
               Assignmat.RESET;
               Assignmat.SETRANGE(Assignmat."Employee No",Employee."No.");
               Assignmat.SETRANGE(Assignmat."Payroll Period",Lastmonth);
               IF Assignmat.FIND('+') THEN
               //FoundLastmonth:=TRUE;


               Employee.SETRANGE(Employee."Pay Period Filter",Thismonth);
               Employee.CALCFIELDS(Employee."Total Allowances1");

               IF Employee."Total Allowances1">0 THEN
               TotalEmployees:=TotalEmployees+1;
               */

            end;

            trigger OnPostDataItem()
            begin
                MakeExcelFooterEmp;
            end;

            trigger OnPreDataItem()
            begin
                TotalEmployees := 0;
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
        CreateExcelbook;
    end;

    trigger OnPreReport()
    begin
        Thismonth := EarningsX.GetRangeMin(EarningsX."Pay Period Filter");
        Lastmonth := CalcDate('-1M', Thismonth);
        EarningFilter := EarningsX.GetFilters;

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
        Earn: Record EarningsX;
        ThisMonthVal: Decimal;
        TotalEarnThisMonth: Decimal;
        TotalDedThisMonth: Decimal;
        TotalEarnLastMonth: Decimal;
        TotalDedLastMonth: Decimal;
        Ded: Record DeductionsX;
        EarningFilter: Text[200];
        TotalEmployees: Integer;
        TotalEmployeesLastMonth: Integer;
        PAYROLL_RECONCILIATIONCaptionLbl: label 'PAYROLL RECONCILIATION';
        CurrReport_PAGENOCaptionLbl: label 'Page';
        DIFFERENCECaptionLbl: label 'DIFFERENCE';
        ExcelBuf: Record "Excel Buffer" temporary;
        Text002: label 'PAYROLL RECONCILIATION';
        Text001: label 'KKSL';
        MASTER_ROLLCaptionLbl: label 'MASTER ROLL';


    procedure CreateExcelbook()
    begin
        /*
        ExcelBuf.CreateBook;
        ExcelBuf.CreateSheet(Text002,Text001,COMPANYNAME,USERID);
        ExcelBuf.GiveUserControl;
        ERROR('');
        
        */

        //ExcelBuf.CreateBookAndOpenExcel(Text002,Text001,COMPANYNAME,USERID);
        //ERROR('');

    end;


    procedure MakeExcelDataBody()
    var
        BlankFiller: Text[250];
    begin
        BlankFiller := PadStr(' ', MaxStrLen(BlankFiller), ' ');

        ExcelBuf.NewRow;
        ExcelBuf.AddColumn(EarningsX.Code, false, '', false, false, false, '@', ExcelBuf."cell type"::Text);
        ExcelBuf.AddColumn(EarningsX.Description, false, '', false, false, false, '@', ExcelBuf."cell type"::Text);
        ExcelBuf.AddColumn(ThisMonthVal, false, '', false, false, false, '@', ExcelBuf."cell type"::Number);
        ExcelBuf.AddColumn(LastMonthVal, false, '', false, false, false, '@', ExcelBuf."cell type"::Number);
        ExcelBuf.AddColumn(ThisMonthVal - LastMonthVal, false, '', false, false, false, '@', ExcelBuf."cell type"::Number);
    end;


    procedure MakeExcelHeader()
    var
        BlankFiller: Text[250];
    begin
        BlankFiller := PadStr(' ', MaxStrLen(BlankFiller), ' ');
        ExcelBuf.NewRow;

        ExcelBuf.AddColumn('', false, '', true, false, false, '@', ExcelBuf."cell type"::Text);
        //ExcelBuf.AddColumn('',FALSE,'',TRUE,FALSE,FALSE,'@',ExcelBuf."Cell Type"::Text);
        ExcelBuf.AddColumn(UpperCase(COMPANYNAME), false, '', true, false, false, '@', ExcelBuf."cell type"::Text);

        ExcelBuf.NewRow;
        ExcelBuf.AddColumn('', false, '', true, false, false, '@', ExcelBuf."cell type"::Text);
        ExcelBuf.AddColumn('', false, '', true, false, false, '@', ExcelBuf."cell type"::Text);
        //ExcelBuf.AddColumn('PERIOD: '+UPPERCASE(FORMAT(DateSpecified,0,'<month text> <year4>')),FALSE,'',TRUE,FALSE,FALSE,'@',ExcelBuf."Cell Type"::Text);

        ExcelBuf.NewRow;
        ExcelBuf.AddColumn('', false, '', true, false, false, '@', ExcelBuf."cell type"::Text);
        ExcelBuf.AddColumn('', false, '', true, false, false, '@', ExcelBuf."cell type"::Text);
        //ExcelBuf.AddColumn('POSTING GROUP: '+Employee.GETFILTER(Employee."Posting Group"),FALSE,'',TRUE,FALSE,FALSE,'@',ExcelBuf."Cell Type"::Text);


        ExcelBuf.NewRow;
        ExcelBuf.AddColumn('', false, '', true, false, false, '@', ExcelBuf."cell type"::Text);
        //ExcelBuf.AddColumn('',FALSE,'',TRUE,FALSE,FALSE,'@',ExcelBuf."Cell Type"::Text);
        ExcelBuf.AddColumn('GENERATED ON: ' + Format(CurrentDatetime), false, '', true, false, false, '@', ExcelBuf."cell type"::Text);

        ExcelBuf.NewRow;
        ExcelBuf.NewRow;
        ExcelBuf.AddColumn('', false, '', true, false, false, '@', ExcelBuf."cell type"::Text);
        ExcelBuf.AddColumn('EARNINGS', false, '', true, false, false, '@', ExcelBuf."cell type"::Text);
        ExcelBuf.AddColumn(StrSubstNo('%1', UpperCase(Format(Thismonth, 0, '<month text> <year4>'))), false, '', true, false, false, '@', ExcelBuf."cell type"::Text);
        ExcelBuf.AddColumn(StrSubstNo('%1', UpperCase(Format(Lastmonth, 0, '<month text> <year4>'))), false, '', true, false, false, '@', ExcelBuf."cell type"::Text);
        ExcelBuf.AddColumn('DIFFERENCE', false, '', true, false, false, '@', ExcelBuf."cell type"::Text);
    end;


    procedure MakeExcelFooter()
    var
        BlankFiller: Text[250];
    begin
        BlankFiller := PadStr(' ', MaxStrLen(BlankFiller), ' ');

        /*
        
        ExcelBuf.NewRow;
        ExcelBuf.AddColumn('',FALSE,'',FALSE,FALSE,FALSE,'@');
        ExcelBuf.AddColumn('',FALSE,'',FALSE,FALSE,FALSE,'@');
        ExcelBuf.AddColumn('',FALSE,'',FALSE,FALSE,FALSE,'@');
        ExcelBuf.AddColumn('',FALSE,'',FALSE,FALSE,FALSE,'@');
        ExcelBuf.AddColumn('',FALSE,'',FALSE,FALSE,FALSE,'@');
        ExcelBuf.AddColumn('',FALSE,'',FALSE,FALSE,FALSE,'@');
        ExcelBuf.AddColumn('',FALSE,'',FALSE,FALSE,FALSE,'@');
        ExcelBuf.AddColumn(TotalNet,FALSE,'',FALSE,FALSE,FALSE,'');
        
        */


        ExcelBuf.NewRow;
        ExcelBuf.AddColumn('', false, '', true, false, false, '@', ExcelBuf."cell type"::Text);
        ExcelBuf.AddColumn('TOTAL EARNINGS', false, '', true, false, false, '@', ExcelBuf."cell type"::Text);
        ExcelBuf.AddColumn(TotalEarnThisMonth, false, '', true, false, false, '@', ExcelBuf."cell type"::Number);
        ExcelBuf.AddColumn(TotalEarnLastMonth, false, '', true, false, false, '@', ExcelBuf."cell type"::Number);
        ExcelBuf.AddColumn(TotalEarnThisMonth - TotalEarnLastMonth, false, '', true, false, false, '@', ExcelBuf."cell type"::Number);

    end;


    procedure MakeExcelDataBodyDed()
    var
        BlankFiller: Text[250];
    begin
        BlankFiller := PadStr(' ', MaxStrLen(BlankFiller), ' ');


        ExcelBuf.NewRow;
        ExcelBuf.AddColumn(DeductionsX.Code, false, '', false, false, false, '@', ExcelBuf."cell type"::Text);
        ExcelBuf.AddColumn(DeductionsX.Description, false, '', false, false, false, '@', ExcelBuf."cell type"::Text);
        ExcelBuf.AddColumn(ThisMonthVal, false, '', false, false, false, '@', ExcelBuf."cell type"::Number);
        ExcelBuf.AddColumn(LastMonthVal, false, '', false, false, false, '@', ExcelBuf."cell type"::Number);
        ExcelBuf.AddColumn(ThisMonthVal - LastMonthVal, false, '', false, false, false, '@', ExcelBuf."cell type"::Number);
    end;


    procedure MakeExcelHeaderDed()
    var
        BlankFiller: Text[250];
    begin
        ExcelBuf.NewRow;
        ExcelBuf.NewRow;
        ExcelBuf.AddColumn('', false, '', true, false, false, '@', ExcelBuf."cell type"::Text);
        ExcelBuf.AddColumn('DEDUCTIONS', false, '', true, false, false, '@', ExcelBuf."cell type"::Text);
        //ExcelBuf.AddColumn(STRSUBSTNO('%1',UPPERCASE(FORMAT(Thismonth,0,'<month text> <year4>'))),FALSE,'',TRUE,FALSE,FALSE,'@',ExcelBuf."Cell Type"::Text);
        //ExcelBuf.AddColumn(STRSUBSTNO('%1',UPPERCASE(FORMAT(Lastmonth,0,'<month text> <year4>'))),FALSE,'',TRUE,FALSE,FALSE,'@',ExcelBuf."Cell Type"::Text);
        //ExcelBuf.AddColumn('DIFFERENCE',FALSE,'',TRUE,FALSE,FALSE,'@',ExcelBuf."Cell Type"::Text);
    end;


    procedure MakeExcelFooterDed()
    var
        BlankFiller: Text[250];
    begin
        BlankFiller := PadStr(' ', MaxStrLen(BlankFiller), ' ');

        /*
        
        ExcelBuf.NewRow;
        ExcelBuf.AddColumn('',FALSE,'',FALSE,FALSE,FALSE,'@');
        ExcelBuf.AddColumn('',FALSE,'',FALSE,FALSE,FALSE,'@');
        ExcelBuf.AddColumn('',FALSE,'',FALSE,FALSE,FALSE,'@');
        ExcelBuf.AddColumn('',FALSE,'',FALSE,FALSE,FALSE,'@');
        ExcelBuf.AddColumn('',FALSE,'',FALSE,FALSE,FALSE,'@');
        ExcelBuf.AddColumn('',FALSE,'',FALSE,FALSE,FALSE,'@');
        ExcelBuf.AddColumn('',FALSE,'',FALSE,FALSE,FALSE,'@');
        ExcelBuf.AddColumn(TotalNet,FALSE,'',FALSE,FALSE,FALSE,'');
        
        */


        ExcelBuf.NewRow;

        ExcelBuf.AddColumn('', false, '', true, false, false, '@', ExcelBuf."cell type"::Text);
        ExcelBuf.AddColumn('TOTAL DEDUCTIONS', false, '', true, false, false, '@', ExcelBuf."cell type"::Text);
        ExcelBuf.AddColumn(TotalDedThisMonth, false, '', true, false, false, '@', ExcelBuf."cell type"::Number);
        ExcelBuf.AddColumn(TotalDedLastMonth, false, '', true, false, false, '@', ExcelBuf."cell type"::Number);
        ExcelBuf.AddColumn(TotalDedThisMonth - TotalDedLastMonth, false, '', true, false, false, '@', ExcelBuf."cell type"::Number);


        ExcelBuf.NewRow;
        ExcelBuf.NewRow;
        ExcelBuf.AddColumn('', false, '', true, false, false, '@', ExcelBuf."cell type"::Text);
        ExcelBuf.AddColumn('NET PAY', false, '', true, false, false, '@', ExcelBuf."cell type"::Text);
        ExcelBuf.AddColumn(TotalEarnThisMonth + TotalDedThisMonth, false, '', true, false, false, '@', ExcelBuf."cell type"::Number);
        ExcelBuf.AddColumn(TotalEarnLastMonth + TotalDedLastMonth, false, '', true, false, false, '@', ExcelBuf."cell type"::Number);
        ExcelBuf.AddColumn(TotalEarnThisMonth + TotalDedThisMonth - (TotalEarnLastMonth + TotalDedLastMonth), false, '', true, false, false, '@', ExcelBuf."cell type"::Number);

    end;


    procedure MakeExcelFooterEmp()
    var
        BlankFiller: Text[250];
    begin
        BlankFiller := PadStr(' ', MaxStrLen(BlankFiller), ' ');

        /*
        
        ExcelBuf.NewRow;
        ExcelBuf.AddColumn('',FALSE,'',FALSE,FALSE,FALSE,'@');
        ExcelBuf.AddColumn('',FALSE,'',FALSE,FALSE,FALSE,'@');
        ExcelBuf.AddColumn('',FALSE,'',FALSE,FALSE,FALSE,'@');
        ExcelBuf.AddColumn('',FALSE,'',FALSE,FALSE,FALSE,'@');
        ExcelBuf.AddColumn('',FALSE,'',FALSE,FALSE,FALSE,'@');
        ExcelBuf.AddColumn('',FALSE,'',FALSE,FALSE,FALSE,'@');
        ExcelBuf.AddColumn('',FALSE,'',FALSE,FALSE,FALSE,'@');
        ExcelBuf.AddColumn(TotalNet,FALSE,'',FALSE,FALSE,FALSE,'');
        
        */
        ExcelBuf.NewRow;
        ExcelBuf.NewRow;
        ExcelBuf.AddColumn('', false, '', true, false, false, '@', ExcelBuf."cell type"::Text);
        ExcelBuf.AddColumn('TOTAL NUMBER OF EMPLOYEES', false, '', true, false, false, '@', ExcelBuf."cell type"::Text);
        ExcelBuf.AddColumn(TotalEmployees, false, '', true, false, false, '@', ExcelBuf."cell type"::Number);
        ExcelBuf.AddColumn(TotalEmployeesLastMonth, false, '', true, false, false, '@', ExcelBuf."cell type"::Number);
        ExcelBuf.AddColumn(TotalEmployees - TotalEmployeesLastMonth, false, '', true, false, false, '@', ExcelBuf."cell type"::Number);

    end;
}
