#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Report 69063 "EFT/SFI-Admin"
{
    DefaultLayout = RDLC;
    RDLCLayout = './Layouts/EFTSFI-Admin.rdlc';
    UsageCategory = Tasks;
    ApplicationArea = All;

    dataset
    {
        dataitem(Employee; Employee)
        {
            DataItemTableView = sorting("No.") where("Pay Mode" = const(Bank));
            RequestFilterFields = "Pay Period Filter";
            column(ReportForNavId_7528; 7528)
            {
            }

            trigger OnAfterGetRecord()
            begin



                //PayPeriod.GET("Pay Period Filter");
                //PayPeriod.TESTFIELD(PayPeriod."Pay Date");

                PayPeriod.Get(PayPeriodDate);
                PayPeriod.TestField(PayPeriod."Pay Date");
                PayDate := PayPeriod."Pay Date";


                Employee.CalcFields(Employee."Total Allowances1", Employee."Total Deductions");
                NetPay := 0;
                NetPay := Employee."Total Allowances1" + Employee."Total Deductions";

                if NetPay = 0 then
                    CurrReport.Skip;
                Name := Employee."First Name" + ' ' + Employee."Middle Name" + ' ' + Employee."Last Name";

                BankName := '';

                BranchName := '';

                //filter Non-Agents Banks

                EmpBank.Get(Employee."Employee's Bank", Employee."Bank Branch");
                //IF EmpBank.FIND('-') THEN
                //BEGIN
                BankName := EmpBank."Bank Name";
                BranchName := EmpBank."Branch Name";
                if EmpBank.Agent = true then
                    CurrReport.Skip;
                //END;


                //
                //cc//  NetPay := payroll.PayrollRounding(NetPay);
                BankCode := '';
                RefNo := '';
                Amount := '';
                Evaluate(Amount, Format(NetPay));
                Amount := DelChr(Amount, '=', ',');
                BankCode := Employee."Employee's Bank";
                BranchCode := Employee."Bank Branch";
                RefNo := Employee."No.";

                Amtlen := StrLen(Amount);
                Space := '';
                i := 0;
                j := 0;
                i := 12 - (Amtlen + 1);
                if j < i then
                    repeat
                        Space := Space + ' ';
                        j := j + 1;
                    until j = i;
                Amount := Space + Amount;

                Amtlen2 := StrLen(Employee."Bank Account Number");
                Space2 := '';
                i := 0;
                j := 0;
                i := 14 - (Amtlen2);
                if j < i then
                    repeat
                        if i = 1 then
                            Space2 := ' '
                        else
                            Space2 := Space2 + ' ';

                        j := j + 1;
                    until j = i;

                BankAcc := Space2 + DelChr(Employee."Bank Account Number", '=', ' ');

                if NetPay < 0 then
                    Error('Employee %1 %2 has a negative pay', Employee."No.", Employee."First Name" + ' ' + Employee."Middle Name" + ' ' + Employee."Last Name");



                /*
                IF NetPay<501 THEN
                 CurrDataport.SKIP;
                
                */

                MakeExcelDataBody;
                TotalNet := TotalNet + NetPay;

            end;

            trigger OnPostDataItem()
            begin
                MakeExcelFooter;
                CreateExcelbook;
            end;

            trigger OnPreDataItem()
            begin
                LastFieldNo := Employee.FieldNo(Employee."No.");
                //MakeExcelHeader;
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

    trigger OnPreReport()
    begin

        PayPeriodtext := Employee.GetFilter("Pay Period Filter");
        if PayPeriodtext = '' then
            Error('Pay period must be specified for this report');
        Evaluate(PayPeriodDate, Format(PayPeriodtext));

        /*
        
        IF UserRole.GET(USERID,'PAYROLLVIEW',' ')=FALSE THEN
        ERROR('You do not have permissions to view this form');
        
        */

    end;

    var
        LastFieldNo: Integer;
        FooterPrinted: Boolean;
        Name: Text[250];
        NetPay: Decimal;
        BankCode: Code[20];
        RefNo: Code[50];
        Amount: Text[30];
        payroll: Codeunit Payroll3;
        Amtlen: Integer;
        Space: Text[12];
        i: Integer;
        j: Integer;
        BankAcc: Text[20];
        Amtlen2: Integer;
        Space2: Text[15];
        BankName: Text[50];
        BranchName: Text[50];
        EmpBank: Record "Employee Bank AccountX";
        ExcelBuf: Record "Excel Buffer" temporary;
        TotalNet: Decimal;
        Text002: label 'PAYROLLEFT';
        Text001: label 'CIMBRIA';
        BranchCode: Code[10];
        PayPeriod: Record "Payroll PeriodX";
        PayDate: Date;
        PayPeriodDate: Date;
        PayPeriodtext: Text[30];


    procedure CreateExcelbook()
    begin
        /*
        
        ExcelBuf.CreateBook;
        ExcelBuf.CreateSheet(Text002,Text001,COMPANYNAME,USERID);
        ExcelBuf.GiveUserControl;
        ERROR('');
        
        */

        //ExcelBuf.CreateBookAndOpenExcel('EFT',Text002,Text001,COMPANYNAME,USERID);
        //ExcelBuf.CreateBookAndOpenExcel('C:\Payroll\EFT.xlsx', Text002, Text001, COMPANYNAME, UserId);
        Error('');

    end;


    procedure MakeExcelDataBody()
    var
        BlankFiller: Text[250];
    begin


        BlankFiller := PadStr(' ', MaxStrLen(BlankFiller), ' ');
        ExcelBuf.NewRow;

        ExcelBuf.AddColumn(PayDate, false, '', false, false, false, '@', ExcelBuf."cell type"::Text);
        ExcelBuf.AddColumn(BankCode, false, '', false, false, false, '@', ExcelBuf."cell type"::Text);
        ExcelBuf.AddColumn(BranchCode, false, '', false, false, false, '@', ExcelBuf."cell type"::Text);
        ExcelBuf.AddColumn(BankAcc, false, '', false, false, false, '@', ExcelBuf."cell type"::Text);
        ExcelBuf.AddColumn(Name, false, '', false, false, false, '@', ExcelBuf."cell type"::Text);
        //ExcelBuf.AddColumn(BranchName,FALSE,'',FALSE,FALSE,FALSE,'@');

        ExcelBuf.AddColumn(Amount, false, '', false, false, false, '', ExcelBuf."cell type"::Number);
        ExcelBuf.AddColumn(RefNo, false, '', false, false, false, '@', ExcelBuf."cell type"::Text);
    end;


    procedure MakeExcelHeader()
    var
        BlankFiller: Text[250];
    begin
        /*
        
        BlankFiller := PADSTR(' ',MAXSTRLEN(BlankFiller),' ');
        ExcelBuf.NewRow;
        ExcelBuf.AddColumn('PAY DATE',FALSE,'',FALSE,FALSE,FALSE,'@');
        ExcelBuf.AddColumn('BANK CODE',FALSE,'',FALSE,FALSE,FALSE,'@');
        ExcelBuf.AddColumn('BANK BRANCH',FALSE,'',FALSE,FALSE,FALSE,'@');
        ExcelBuf.AddColumn('EMPLOYEE NAME',FALSE,'',FALSE,FALSE,FALSE,'@');
        ExcelBuf.AddColumn('A/C NUMBER',FALSE,'',FALSE,FALSE,FALSE,'@');
        ExcelBuf.AddColumn('AMOUNT KSHS',FALSE,'',FALSE,FALSE,FALSE,'');
        ExcelBuf.AddColumn('EMP NO.',FALSE,'',FALSE,FALSE,FALSE,'@');
        */

    end;


    procedure MakeExcelFooter()
    var
        BlankFiller: Text[250];
    begin

        BlankFiller := PadStr(' ', MaxStrLen(BlankFiller), ' ');
        ExcelBuf.NewRow;
        ExcelBuf.AddColumn('', false, '', false, false, false, '@', ExcelBuf."cell type"::Text);
        ExcelBuf.AddColumn('', false, '', false, false, false, '@', ExcelBuf."cell type"::Text);
        ExcelBuf.AddColumn('', false, '', false, false, false, '@', ExcelBuf."cell type"::Text);
        ExcelBuf.AddColumn('', false, '', false, false, false, '@', ExcelBuf."cell type"::Text);
        ExcelBuf.AddColumn('', false, '', false, false, false, '@', ExcelBuf."cell type"::Text);
        //ExcelBuf.AddColumn('',FALSE,'',FALSE,FALSE,FALSE,'@');
        ExcelBuf.AddColumn(TotalNet, false, '', false, false, false, '', ExcelBuf."cell type"::Number);
    end;
}
