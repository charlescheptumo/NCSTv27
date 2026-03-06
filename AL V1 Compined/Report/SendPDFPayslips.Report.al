#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Report 69049 "Send PDF Payslips"
{
    DefaultLayout = RDLC;
    RDLCLayout = './Layouts/Send PDF Payslips.rdlc';
    UsageCategory = Tasks;

    dataset
    {
        dataitem(Employee; Employee)
        {
            RequestFilterFields = "No.", "Pay Period Filter";
            column(ReportForNavId_1000000013; 1000000013)
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
            column(Counter; Counter)
            {
            }

            trigger OnAfterGetRecord()
            begin
                if Employee."Send Payslip By E-mail?" = true then begin

                    CompInfo.Get;
                    HRSetup.Get;



                    FileDirectory := 'C:\DOCS\';
                    //FileName := 'example.pdf';
                    //FileName := 'Payslip'+Employee."No."+FORMAT(TODAY, 0, '_<Day,2>_<Month,2>_<Year,2>')+'.pdf';
                    //FileName := 'Payslip_'+Employee."No."+FORMAT(PayPeriod."Pay Date", 0, '_<Day,2>_<Month,2>_<Year,2>')+'.pdf';

                    FileName := 'Payslip_' + Employee."No." + '_' + UpperCase(Format(PayrollMonth, 0, '<month text> <year4>')) + '.pdf';
                    //Window.OPEN('processing');
                    Window.Open('PROCESSING EMPLOYEE ######################1##');
                    Window.Update(1, Employee."No." + '-' + Employee."First Name" + ' ' + Employee."Last Name");

                    WindowisOpen := true;
                    if FileName = '' then
                        Error('Please specify what the file should be saved as');

                    //
                    // PDFCreator.cStart('/NoProcessingAtStartup',TRUE);
                    Emp.Reset;
                    ///Emp.SETRANGE(Emp."No.",Employee."No.");
                    //Emp.SETRANGE(Emp."Pay Period Filter",Employee."Pay Period Filter");
                    Emp.SetFilter(Emp."No.", Employee."No.");
                    Emp.SetFilter(Emp."Pay Period Filter", Format(Employee.GetFilter("Pay Period Filter")));
                    //Report.SaveAsPdf(69027, FileDirectory + FileName, Emp);




                    // if Exists(FileDirectory + FileName) then
                    if emp.findset() then begin
                        //   MESSAGE('Nimeiona!!!');
                        Counter := Counter + 1;


                        //Create message

                        //IF UserSetup.GET(USERID) THEN
                        //SenderAddress:=UserSetup."E-Mail";
                        if HRSetup."HR E-mail Address" = '' then
                            Error('Please specify HR email address under HR setup page!!');
                        SenderAddress := HRSetup."HR E-mail Address";
                        ;
                        CustEmail := Employee."Company E-Mail";
                        //MESSAGE('Wow');
                        // cu400.CreateMessage(CompInfo.Name, SenderAddress,
                        // CustEmail, 'Payslip==>' + 'Employee No : ' + Employee."No." + '-' + UpperCase(Format(PayrollMonth, 0, '<month text> <year4>')),
                        // 'Dear ' + Employee."First Name" + ',<BR><BR>' +
                        // 'Please find attached your payslip for ' + UpperCase(Format(PayrollMonth, 0, '<month text> <year4>')) + '.<BR>' +
                        // 'Kindly use Acrobat Reader Version 6.0 or above to open the attachment.<BR><BR>', true);



                        // cu400.AppendBody(
                        // '<BR><BR>Kind Regards,' +
                        // '<BR><BR>HR Department.<BR>');


                        // cu400.AppendBody('<BR>' + CompInfo.Name);

                        // //cu400.AddAttachment('Payslip',FileDirectory+FileName);
                        // cu400.AddAttachment(FileDirectory + FileName, FileName);
                        // //cu400.AddCC('ericmuchoki@kksecurity.com');
                        // //cu400.AddBCC('johnmacharia@kksecurity.com');
                        // //Send email
                        // cu400.Send;
                        //MESSAGE('sent');
                        SendingDate := Today;
                        SendingTime := Time;



                        //record sending details



                        DocLog.Init;
                        DocLog."Entry No" := 0;
                        DocLog."Customer No" := Employee."No.";
                        DocLog."E-mailed To" := Employee."E-Mail";
                        DocLog.Date := SendingDate;
                        DocLog."Document Type" := DocLog."document type"::Payslip;
                        DocLog."File Extension" := FileDirectory + FileName;
                        DocLog.Time := SendingTime;
                        DocLog."S/no" := Counter;
                        DocLog."Profit Centre" := Employee."Global Dimension 1 Code";
                        DocLog."Branch code" := Employee."Global Dimension 2 Code";
                        DocLog."Sender ID" := UserId;
                        DocLog.Insert(true);


                        //END ELSE

                        //CurrReport.SKIP;
                        //SLEEP(1000);
                        // if Exists(FileDirectory + FileName) then
                        //     Erase(FileDirectory + FileName);
                        FileDirectory := '';
                        FileName := '';






                        Sleep(1000);
                        Window.Close;

                    end else
                        CurrReport.Skip;



                end else
                    CurrReport.Skip;
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
        Evaluate(PayrollMonth, Format(PayPeriodtext));
        PayrollMonthText := Format(PayrollMonth, 1, 4);
        PayPeriod.Get(PayrollMonth);
        if PayPeriod."Pay Date" = 0D then
            Error('Please specify Pay date on Pay period setup!!');

        //MESSAGE('%1',PayrollMonthText);
    end;

    var
        LastFieldNo: Integer;
        FooterPrinted: Boolean;
        FileDirectory: Text[100];
        FileName: Text[100];
        ReportID: Integer;
        //"Object": Record "Object";
        Window: Dialog;
        RunOnceFile: Text[1000];
        TimeOut: Integer;
        Customer2: Record Customer;
        Cust: Record Customer;
        cr: Integer;
        lf: Integer;
        EmailBody: array[2] of Text[30];
        BodyText: Text[250];
        mymail: Codeunit Mail;
        DefaultPrinter: Text[200];
        WindowisOpen: Boolean;
        //cc// FileDialog: Codeunit "SMTP Test Mail";
        SendingDate: Date;
        SendingTime: Time;
        Counter: Integer;
        //cc// cu400: Codeunit "SMTP Mail";
        DocLog: Record "Document E-mail Log";
        BranchName: Code[80];
        DimValue: Record "Dimension Value";
        SenderAddress: Text[100];
        CustEmail: Text[100];
        UserSetup: Record "User Setup";
        HRSetup: Record "Human Resources Setup";
        Customer_Statements_Sent_By_E_mailCaptionLbl: label 'Customer Statements Sent By E-mail';
        CurrReport_PAGENOCaptionLbl: label 'Page';
        CUST_NO_CaptionLbl: label 'CUST NO.';
        CUSTOMER_NAMECaptionLbl: label 'CUSTOMER NAME';
        BRANCHCaptionLbl: label 'BRANCH';
        DATECaptionLbl: label 'DATE';
        TIMECaptionLbl: label 'TIME';
        S_NO_CaptionLbl: label 'S/NO.';
        Emp: Record Employee;
        PayrollMonth: Date;
        PayrollMonthText: Text[30];
        PayPeriodtext: Text;
        PayPeriod: Record "Payroll PeriodX";
        CompInfo: Record "Company Information";
}
