#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Report 69061 "Employee Gratuity Statement"
{
    DefaultLayout = RDLC;
    RDLCLayout = './Layouts/Employee Gratuity Statement.rdlc';
    UsageCategory = ReportsandAnalysis;
    ApplicationArea = All;

    dataset
    {
        dataitem(Employee; Employee)
        {
            RequestFilterFields = "No.";
            column(ReportForNavId_5; 5)
            {
            }
            column(No_Employee; Employee."No.")
            {
            }
            column(FirstName_Employee; Employee."First Name")
            {
            }
            column(MiddleName_Employee; Employee."Middle Name")
            {
            }
            column(LastName_Employee; Employee."Last Name")
            {
            }
            column(GlobalDimension1Code_Employee; Employee."Global Dimension 1 Code")
            {
            }
            column(Logo; CompInfo.Picture)
            {
            }
            column(GlobalDimension2Code_Employee; Employee."Department Name")
            {
            }
            dataitem("Assignment Matrix-X"; "Assignment Matrix-X")
            {
                CalcFields = "Total Amount";
                DataItemLink = "Employee No" = field("No.");
                DataItemTableView = sorting("Employee No", Type, Code, "Payroll Period", "Reference No") where(Type = const(Payment), Code = const('GRATUITY'));
                RequestFilterFields = "Payroll Period";
                column(ReportForNavId_1213; 1213)
                {
                }
                column(PayrollPeriod_AssignmentMatrixX; "Assignment Matrix-X"."Payroll Period")
                {
                }
                column(Amount_AssignmentMatrixX; "Assignment Matrix-X".Amount)
                {
                }
                column(Description_AssignmentMatrixX; "Assignment Matrix-X".Description)
                {
                }
                column(PayPeriod_AssignmentMatrixX; PeriodName)
                {
                }
                column(BasicSalary_AssignmentMatrixX; TotalAmount)
                {
                }
                column(TotalGratuity_AssignmentMatrixX; TotalGratuity)
                {
                }

                trigger OnAfterGetRecord()
                begin
                    //get basic salary for that month
                    TotalAmount := 0;
                    PeriodName := '';
                    AssignmentMatrixX.Reset;
                    AssignmentMatrixX.SetRange("Employee No", "Assignment Matrix-X"."Employee No");
                    AssignmentMatrixX.SetRange("Payroll Period", "Assignment Matrix-X"."Payroll Period");
                    AssignmentMatrixX.SetRange("Basic Salary Code", true);
                    if AssignmentMatrixX.FindFirst then begin
                        TotalAmount := AssignmentMatrixX.Amount;
                        PeriodName := AssignmentMatrixX."Pay Period";
                    end;
                    //get total gratuity
                    TotalGratuity := 0;
                    AssignmentMatrixX.Reset;
                    AssignmentMatrixX.SetRange("Employee No", "Assignment Matrix-X"."Employee No");
                    AssignmentMatrixX.SetRange(Code, "Assignment Matrix-X".Code);
                    AssignmentMatrixX.SetFilter("Payroll Period", '..%1', "Assignment Matrix-X"."Payroll Period");
                    if AssignmentMatrixX.FindSet then begin
                        repeat
                            TotalGratuity := TotalGratuity + AssignmentMatrixX.Amount;
                        until AssignmentMatrixX.Next = 0;
                    end
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
                end;
            }
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

    var
        DateSpecified: Date;
        NhifNo: Code[20];
        Emp: Record Employee;
        Id: Code[20];
        FirstName: Text[30];
        LastName: Text[30];
        TotalAmount: Decimal;
        "Count": Integer;
        AssignmentMatrixX: Record "Assignment Matrix-X";
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
        PeriodName: Text;
        TotalGratuity: Decimal;


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
