#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Report 69020 NHIF
{
    DefaultLayout = RDLC;
    RDLCLayout = './Layouts/NHIF.rdlc';
    UsageCategory = ReportsandAnalysis;
    ApplicationArea = All;

    dataset
    {
        dataitem("Assignment Matrix-X"; "Assignment Matrix-X")
        {
            DataItemTableView = sorting("Employee No", Type, Code, "Payroll Period", "Reference No") where(Type = const(Deduction));
            RequestFilterFields = "Payroll Period", "Code", "Payroll Grouping";
            RequestFilterHeading = 'NHIF';
            column(ReportForNavId_1213; 1213)
            {
            }
            column(CurrReport_PAGENO; CurrReport.PageNo)
            {
            }
            column(COMPANYNAME; COMPANYNAME)
            {
            }
            column(UPPERCASE_FORMAT_DateSpecified_0___Month_Text___year4____; UpperCase(Format(DateSpecified, 0, '<Month Text> <year4>')))
            {
            }
            column(EmployerNHIFNo; EmployerNHIFNo)
            {
            }
            column(Address; Address)
            {
            }
            column(Tel; Tel)
            {
            }
            column(CompPINNo; CompPINNo)
            {
            }
            column(FORMAT_TODAY_0_4_; Format(Today, 0, 4))
            {
            }
            column(CurrReport_PAGENO_Control42; CurrReport.PageNo)
            {
            }
            column(USERID; UserId)
            {
            }
            column(COMPANYNAME_Control1000000006; COMPANYNAME)
            {
            }
            column(EmployerNHIFNo_Control1000000007; EmployerNHIFNo)
            {
            }
            column(UPPERCASE_FORMAT_DateSpecified_0___Month_Text___year4_____Control1000000009; UpperCase(Format(DateSpecified, 0, '<Month Text> <year4>')))
            {
            }
            column(ABS__Assignment_Matrix_X__Amount_; Abs("Assignment Matrix-X".Amount))
            {
            }
            column(Emp__NHIF_No__; Emp."N.H.I.F No")
            {
            }
            column(FirstName_____Emp__Middle_Name______LastName; FirstName + ' ' + LastName)
            {
            }
            column(Assignment_Matrix_X__Assignment_Matrix_X___Employee_No_; "Assignment Matrix-X"."Employee No")
            {
            }
            column(YEAR; YEAR)
            {
            }
            column(Emp__ID_Number_; Emp."ID Number")
            {
            }
            column(TotalAmount; TotalAmount)
            {
            }
            column(Counter; Counter)
            {
            }
            column(AmountCaption; AmountCaptionLbl)
            {
            }
            column(ID_PassportCaption; ID_PassportCaptionLbl)
            {
            }
            column(Date_of_BirthCaption; Date_of_BirthCaptionLbl)
            {
            }
            column(PageCaption; PageCaptionLbl)
            {
            }
            column(NHIF_No_Caption; NHIF_No_CaptionLbl)
            {
            }
            column(MONTHLY_PAYROLL__BY_PRODUCT__RETURNS_TO_NHIFCaption; MONTHLY_PAYROLL__BY_PRODUCT__RETURNS_TO_NHIFCaptionLbl)
            {
            }
            column(Name_of_EmployeeCaption; Name_of_EmployeeCaptionLbl)
            {
            }
            column(EMPLOYER_NOCaption; EMPLOYER_NOCaptionLbl)
            {
            }
            column(Payroll_No_Caption; Payroll_No_CaptionLbl)
            {
            }
            column(PERIODCaption; PERIODCaptionLbl)
            {
            }
            column(EMPLOYERCaption; EMPLOYERCaptionLbl)
            {
            }
            column(ADDRESSCaption; ADDRESSCaptionLbl)
            {
            }
            column(EMPLOYER_PIN_NOCaption; EMPLOYER_PIN_NOCaptionLbl)
            {
            }
            column(TEL_NOCaption; TEL_NOCaptionLbl)
            {
            }
            column(PageCaption_Control44; PageCaption_Control44Lbl)
            {
            }
            column(UserCaption; UserCaptionLbl)
            {
            }
            column(NATIONAL_HOSPITAL_INSURANCE_FUND_REPORTCaption; NATIONAL_HOSPITAL_INSURANCE_FUND_REPORTCaptionLbl)
            {
            }
            column(EMPLOYER_NOCaption_Control1000000008; EMPLOYER_NOCaption_Control1000000008Lbl)
            {
            }
            column(PERIODCaption_Control1000000010; PERIODCaption_Control1000000010Lbl)
            {
            }
            column(Payroll_No_Caption_Control1000000056; Payroll_No_Caption_Control1000000056Lbl)
            {
            }
            column(Name_of_EmployeeCaption_Control1000000055; Name_of_EmployeeCaption_Control1000000055Lbl)
            {
            }
            column(NHIF_No_Caption_Control1000000053; NHIF_No_Caption_Control1000000053Lbl)
            {
            }
            column(Date_of_BirthCaption_Control1000000051; Date_of_BirthCaption_Control1000000051Lbl)
            {
            }
            column(ID_PassportCaption_Control1000000049; ID_PassportCaption_Control1000000049Lbl)
            {
            }
            column(AmountCaption_Control1000000005; AmountCaption_Control1000000005Lbl)
            {
            }
            column(Total_AmountCaption; Total_AmountCaptionLbl)
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
            column(Picture_CompanyInformation; CompInfo.Picture)
            {
            }

            trigger OnAfterGetRecord()
            begin
                Id := '';
                NhifNo := '';
                if Emp.Get("Assignment Matrix-X"."Employee No") then begin
                    NhifNo := Emp."N.H.I.F No";


                    if Emp."Last Name" = '' then begin
                        LastName := Emp."Middle Name";
                        FirstName := Emp."First Name";
                    end else begin
                        LastName := Emp."Last Name";
                        FirstName := Emp."First Name" + ' ' + Emp."Middle Name";
                    end;

                    Id := Emp."ID Number";
                    YEAR := Emp."Date Of Birth";
                    TotalAmount := TotalAmount + Abs("Assignment Matrix-X".Amount);
                end;
                Counter := Counter + 1;
                if PrintToExcel then
                    MakeExcelDataBody;
                if Counter > 1 then
                    Clear(CompInfo.Picture)
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
                MakeExcelHeader;
                CompInfo.Get();
                CompInfo.CalcFields(Picture);
                //EmployerNHIFNo:=CompInfoSetup."N.H.I.F No";
                // CompPINNo:=CompInfoSetup."Company P.I.N";
                // Address:=CompInfoSetup."Maximum limit";
                //Tel:=CompInfoSetup."Repayment Period";
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
        DateSpecified := "Assignment Matrix-X".GetRangeMin("Assignment Matrix-X"."Payroll Period");
        NHIFCODE := "Assignment Matrix-X".GetRangeMin("Assignment Matrix-X".Code);
        Counter := 0;
    end;

    var
        DateSpecified: Date;
        NhifNo: Code[20];
        Emp: Record Employee;
        Id: Code[20];
        FirstName: Text[30];
        LastName: Text[30];
        TotalAmount: Decimal;
        "Count": Integer;
        Deductions: Record "Assignment Matrix-X";
        EmployerNHIFNo: Code[20];
        DOB: Date;
        CompInfoSetup: Record "Loans transactionsX";
        "HR Details": Record Employee;
        CompPINNo: Code[20];
        YEAR: Date;
        Address: Text[90];
        Tel: Text[30];
        Counter: Integer;
        LastFieldNo: Integer;
        BeginDate: Date;
        NHIFCODE: Code[10];
        ExcelBuf: Record "Excel Buffer" temporary;
        Text002: label 'NHIF';
        Text001: label 'CIMBRIA';
        PrintToExcel: Boolean;
        AmountCaptionLbl: label 'Amount';
        ID_PassportCaptionLbl: label 'ID/Passport';
        Date_of_BirthCaptionLbl: label 'Date of Birth';
        PageCaptionLbl: label 'Page';
        NHIF_No_CaptionLbl: label 'NHIF No.';
        MONTHLY_PAYROLL__BY_PRODUCT__RETURNS_TO_NHIFCaptionLbl: label 'MONTHLY PAYROLL (BY-PRODUCT) RETURNS TO NHIF';
        Name_of_EmployeeCaptionLbl: label 'Name of Employee';
        EMPLOYER_NOCaptionLbl: label 'EMPLOYER NO';
        Payroll_No_CaptionLbl: label 'Payroll No.';
        PERIODCaptionLbl: label 'PERIOD';
        EMPLOYERCaptionLbl: label 'EMPLOYER';
        ADDRESSCaptionLbl: label 'ADDRESS';
        EMPLOYER_PIN_NOCaptionLbl: label 'EMPLOYER PIN NO';
        TEL_NOCaptionLbl: label 'TEL NO';
        PageCaption_Control44Lbl: label 'Page';
        UserCaptionLbl: label 'User';
        NATIONAL_HOSPITAL_INSURANCE_FUND_REPORTCaptionLbl: label 'NATIONAL HOSPITAL INSURANCE FUND REPORT';
        EMPLOYER_NOCaption_Control1000000008Lbl: label 'EMPLOYER NO';
        PERIODCaption_Control1000000010Lbl: label 'PERIOD';
        Payroll_No_Caption_Control1000000056Lbl: label 'Payroll No.';
        Name_of_EmployeeCaption_Control1000000055Lbl: label 'Name of Employee';
        NHIF_No_Caption_Control1000000053Lbl: label 'NHIF No.';
        Date_of_BirthCaption_Control1000000051Lbl: label 'Date of Birth';
        ID_PassportCaption_Control1000000049Lbl: label 'ID/Passport';
        AmountCaption_Control1000000005Lbl: label 'Amount';
        Total_AmountCaptionLbl: label 'Total Amount';
        Text003: label 'NHIF Report';
        CompInfo: Record "Company Information";


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

        //ExcelBuf.CreateBookAndOpenExcel('C:\bd\NHIF.xlsx', Text002, Text001, COMPANYNAME, UserId);
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
        ExcelBuf.AddColumn(LastName, false, '', false, false, false, '@', ExcelBuf."cell type"::Text);
        ExcelBuf.AddColumn(FirstName, false, '', false, false, false, '@', ExcelBuf."cell type"::Text);
        ExcelBuf.AddColumn(Id, false, '', false, false, false, '@', ExcelBuf."cell type"::Text);
        ExcelBuf.AddColumn(NhifNo, false, '', false, false, false, '@', ExcelBuf."cell type"::Text);
        ExcelBuf.AddColumn(Abs("Assignment Matrix-X".Amount), false, '', false, false, false, '@', ExcelBuf."cell type"::Number);
    end;


    procedure MakeExcelHeader()
    var
        BlankFiller: Text[250];
    begin

        BlankFiller := PadStr(' ', MaxStrLen(BlankFiller), ' ');
        ExcelBuf.NewRow;
        ExcelBuf.AddColumn('EMPLOYER CODE', false, '', true, false, false, '@', ExcelBuf."cell type"::Text);
        ExcelBuf.AddColumn('00737', false, '', true, false, false, '@', ExcelBuf."cell type"::Text);
        ExcelBuf.NewRow;
        ExcelBuf.AddColumn('EMPLOYER NAME:' + UpperCase(COMPANYNAME), false, '', true, false, false, '@', ExcelBuf."cell type"::Text);
        ExcelBuf.AddColumn('NATIONAL WATER CONSERVATION & PIPELINE CORPORATION', false, '', true, false, false, '@', ExcelBuf."cell type"::Text);
        ExcelBuf.NewRow;
        ExcelBuf.AddColumn('MONTH OF CONTRIBUTION:', false, '', true, false, false, '@', ExcelBuf."cell type"::Text);
        ExcelBuf.AddColumn(UpperCase(Format(DateSpecified, 0, '<year4>-0<month>')), false, '', true, false, false, '@', ExcelBuf."cell type"::Text);
        ExcelBuf.NewRow;
        ExcelBuf.NewRow;
        ExcelBuf.AddColumn('PAYROLL NO', false, '', true, false, false, '@', ExcelBuf."cell type"::Text);
        ExcelBuf.AddColumn('LAST NAME', false, '', true, false, false, '@', ExcelBuf."cell type"::Text);
        ExcelBuf.AddColumn('FIRST NAME', false, '', true, false, false, '@', ExcelBuf."cell type"::Text);
        ExcelBuf.AddColumn('ID NO', false, '', true, false, false, '@', ExcelBuf."cell type"::Text);
        ExcelBuf.AddColumn('NHIF NO', false, '', true, false, false, '@', ExcelBuf."cell type"::Text);
        ExcelBuf.AddColumn('AMOUNT', false, '', true, false, false, '@', ExcelBuf."cell type"::Text);
        //ExcelBuf.NewRow;
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
        ExcelBuf.AddColumn('', false, '', false, false, false, '@', ExcelBuf."cell type"::Text);
        ExcelBuf.AddColumn('Employees :' + Format(Counter), false, '', false, false, false, '@', ExcelBuf."cell type"::Text);
        ExcelBuf.AddColumn('', false, '', false, false, false, '@', ExcelBuf."cell type"::Text);


        ExcelBuf.AddColumn('TOTAL', false, '', false, false, false, '@', ExcelBuf."cell type"::Text);
        //ExcelBuf.AddColumn('',FALSE,'',FALSE,FALSE,FALSE,'@');
        ExcelBuf.AddColumn(TotalAmount, false, '', false, false, false, '', ExcelBuf."cell type"::Number);
    end;
}
