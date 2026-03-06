#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Report 69137 "Sacco Master report"
{
    DefaultLayout = RDLC;
    RDLCLayout = './Layouts/Sacco Master report.rdlc';
    UsageCategory = ReportsandAnalysis;
    ApplicationArea = All;

    dataset
    {
        dataitem(DeductionsX; DeductionsX)
        {
            DataItemTableView = where(SACCO = filter(true));
            column(ReportForNavId_1; 1)
            {
            }
            dataitem("Assignment Matrix-X"; "Assignment Matrix-X")
            {
                DataItemLink = Code = field(Code);
                DataItemTableView = where(Type = filter(Deduction));
                RequestFilterFields = "Payroll Period";
                column(ReportForNavId_1000000000; 1000000000)
                {
                }
                column(EmployeeNo_AssignmentMatrixX; "Assignment Matrix-X"."Employee No")
                {
                }
                column(Code_AssignmentMatrixX; "Assignment Matrix-X".Code)
                {
                }
                column(Description_AssignmentMatrixX; "Assignment Matrix-X".Description)
                {
                }
                column(Amount_AssignmentMatrixX; "Assignment Matrix-X".Amount)
                {
                }
                column(EmployerAmount_AssignmentMatrixX; "Assignment Matrix-X"."Employer Amount")
                {
                }
                column(EmployeeName_AssignmentMatrixX; "Assignment Matrix-X"."Employee Name")
                {
                }
                column(PayrollPeriod_AssignmentMatrixX; "Assignment Matrix-X"."Payroll Period")
                {
                }
                column(Name; Name)
                {
                }
                column(ClosingBalance_AssignmentMatrixX; "Assignment Matrix-X"."Closing Balance")
                {
                }
                column(ReferenceNo_AssignmentMatrixX; "Assignment Matrix-X"."Reference No")
                {
                }
                dataitem("Company Information"; "Company Information")
                {
                    column(ReportForNavId_1000000008; 1000000008)
                    {
                    }
                    column(Name_CompanyInformation; "Company Information".Name)
                    {
                    }
                    column(Picture_CompanyInformation; "Company Information".Picture)
                    {
                    }
                }

                trigger OnAfterGetRecord()
                begin

                    if Emp.Get("Assignment Matrix-X"."Employee No") then begin
                        Name := Emp."First Name" + ' ' + Emp."Middle Name" + ' ' + Emp."Last Name";
                        Id := Emp."ID Number";
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
    }

    var
        LastFieldNo: Integer;
        FooterPrinted: Boolean;
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
        GroupCode: Code[20];
        CUser: Code[20];
        ExcelBuf: Record "Excel Buffer" temporary;
        Counter: Decimal;
        TotalEmployee: Decimal;
        TotalEmployer: Decimal;
        TotalBalance: Decimal;
        PrintToExcel: Boolean;
        Id: Text[30];
        TotalFor: label 'Total for ';
        Text002: label 'DEDUCTION';
        Text001: label 'KS';
        employeename: Text[100];
        PayrollMonth: Date;
        PayrollMonthText: Text[30];
        Text0001: label 'Please specify payperiod for the report';


    procedure GetPayperiod()
    begin
        PayPeriod.SetRange(PayPeriod.Closed, false);
        if PayPeriod.Find('-') then
            PayPeriodText := PayPeriod.Name;
    end;


    procedure CreateExcelbook()
    begin
        /*
        ExcelBuf.CreateBook('','');
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
        //ExcelBuf.AddColumn(Id,FALSE,'',FALSE,FALSE,FALSE,'@');
        //ExcelBuf.AddColumn(counter,FALSE,'',FALSE,FALSE,FALSE,'@');
        ExcelBuf.AddColumn(Emp."No.", false, '', false, false, false, '@', ExcelBuf."cell type"::Text);
        //ExcelBuf.AddColumn(Employee."Last Name",FALSE,'',FALSE,FALSE,FALSE,'@');
        ExcelBuf.AddColumn(Name, false, '', false, false, false, '@', ExcelBuf."cell type"::Text);
        //ExcelBuf.AddColumn(FirstName,FALSE,'',FALSE,FALSE,FALSE,'@');
        //ExcelBuf.AddColumn(Id,FALSE,'',FALSE,FALSE,FALSE,'@');
        //ExcelBuf.AddColumn(NhifNo,FALSE,'',FALSE,FALSE,FALSE,'@');
        ExcelBuf.AddColumn(Abs("Assignment Matrix-X".Amount), false, '', false, false, false, '@', ExcelBuf."cell type"::Number);
        //ExcelBuf.AddColumn(ABS("Assignment Matrix-X"."Employer Amount"),FALSE,'',FALSE,FALSE,FALSE,'@');
        //ExcelBuf.AddColumn(ABS("Assignment Matrix-X"."Closing Balance"),FALSE,'',FALSE,FALSE,FALSE,'@');
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
        UpperCase(Format(DateSpecified, 0, '<month text> <year4>')), false, '', true, false, false, '@', ExcelBuf."cell type"::Date);
        ExcelBuf.NewRow;
        //ExcelBuf.AddColumn('ID NO',FALSE,'',TRUE,FALSE,FALSE,'@');
        ExcelBuf.AddColumn('PAYROLL NO', false, '', true, false, false, '@', ExcelBuf."cell type"::Text);
        ExcelBuf.AddColumn('EMPLOYEE NAME', false, '', true, false, false, '@', ExcelBuf."cell type"::Text);
        //ExcelBuf.AddColumn('FIRST NAMES',FALSE,'',TRUE,FALSE,FALSE,'@');
        //ExcelBuf.AddColumn('I.D NO',FALSE,'',TRUE,FALSE,FALSE,'@');
        //ExcelBuf.AddColumn('N.H.I.F NO.',FALSE,'',TRUE,FALSE,FALSE,'@');
        ExcelBuf.AddColumn('AMOUNT', false, '', true, false, false, '@', ExcelBuf."cell type"::Number);
        //ExcelBuf.AddColumn('COMPANY',FALSE,'',TRUE,FALSE,FALSE,'@');
        //ExcelBuf.AddColumn('BALANCE',FALSE,'',TRUE,FALSE,FALSE,'@');
        ExcelBuf.NewRow;
    end;


    procedure MakeExcelFooter()
    var
        BlankFiller: Text[250];
    begin
        BlankFiller := PadStr(' ', MaxStrLen(BlankFiller), ' ');

        ExcelBuf.NewRow;
        ExcelBuf.NewRow;
        //ExcelBuf.AddColumn('',FALSE,'',FALSE,FALSE,FALSE,'@',ExcelBuf."Cell Type"::Text);
        ExcelBuf.AddColumn('', false, '', false, false, false, '@', ExcelBuf."cell type"::Text);
        ExcelBuf.AddColumn('Employees :' + Format(Counter), false, '', false, false, false, '@', ExcelBuf."cell type"::Number);
        ExcelBuf.AddColumn(Abs(TotalEmployee), false, '', false, false, false, '@', ExcelBuf."cell type"::Number);


        ExcelBuf.AddColumn(TotalEmployer, false, '', false, false, false, '@', ExcelBuf."cell type"::Number);
        //ExcelBuf.AddColumn('',FALSE,'',FALSE,FALSE,FALSE,'@');
        ExcelBuf.AddColumn(TotalBalance, false, '', false, false, false, '', ExcelBuf."cell type"::Number);
    end;
}
