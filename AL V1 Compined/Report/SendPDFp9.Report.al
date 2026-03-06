#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Report 69060 "Send PDF p9"
{
    ProcessingOnly = true;
    UsageCategory = ReportsandAnalysis;
    ApplicationArea = All;

    dataset
    {
        dataitem(Employee; Employee)
        {
            RequestFilterFields = "No.";
            column(ReportForNavId_1000000013; 1000000013)
            {
            }
            column(No_Employee; Employee."No.")
            {
            }
            column(Counter; Counter)
            {
            }
            column(Name_Employee; Employee."First Name")
            {
            }

            trigger OnAfterGetRecord()
            begin

                Emp.Reset;
                Emp.SetRange(Emp."No.", Employee."No.");
                if Emp.Find('-') then begin
                    //REPEAT
                    CompInfo.Get;
                    HRSetup.Get;



                    FileDirectory := 'C:\DOCS\';
                    //FileName := 'example.pdf';
                    //FileName := 'Payslip'+vendor."No."+FORMAT(TODAY, 0, '_<Day,2>_<Month,2>_<Year,2>')+'.pdf';
                    //FileName := 'Payslip_'+vendor."No."+FORMAT(PayPeriod."Pay Date", 0, '_<Day,2>_<Month,2>_<Year,2>')+'.pdf';

                    //FileName := 'Statement_'+Vendor."No."+'_'+UPPERCASE(FORMAT(PayrollMonth,0,'<month text> <year4>'))+'.pdf';
                    FileName := 'P9_' + Employee."No." + '.pdf';
                    //Window.OPEN('processing');
                    Window.Open('PROCESSING Employee ######################1##');
                    Window.Update(1, Employee."No." + '-' + Employee."First Name");

                    WindowisOpen := true;
                    if FileName = '' then
                        Error('Please specify what the file should be saved as');

                    //
                    // PDFCreator.cStart('/NoProcessingAtStartup',TRUE);
                    //Emp.RESET;
                    ///Emp.SETRANGE(Emp."No.",vendor."No.");
                    //Emp.SETRANGE(Emp."Pay Period Filter",vendor."Pay Period Filter");

                    FromDate := StartDate;
                    ToDate := EndDAte;
                    Evaluate(FromDateS, Format(FromDate));
                    Evaluate(ToDateS, Format(ToDate));
                    DateFilter := FromDateS + '..' + ToDateS;
                    Emp.SetFilter(Emp."No.", Employee."No.");
                    Emp.SetFilter(Emp."Date Filter", Format(DateFilter));


                    //Report.SaveAsPdf(69019, FileDirectory + FileName, Emp);




                    // if Exists(FileDirectory + FileName) then
                    begin
                        //   MESSAGE('Nimeiona!!!');
                        Counter := Counter + 1;


                        //Create message

                        //IF UserSetup.GET(USERID) THEN
                        //SenderAddress:=UserSetup."E-Mail";
                        if HRSetup."HR E-mail Address" = '' then
                            Error('Please specify Hr Admin email address under Human Resource setup page!!');
                        SenderAddress := HRSetup."HR E-mail Address";
                        ;
                        CustEmail := Employee."Company E-Mail";
                        if CustEmail = '' then
                            CurrReport.Skip;

                        // cu400.CreateMessage(CompInfo.Name, SenderAddress,
                        // CustEmail, 'P9 -' + 'Employee No : ' + Employee."No." + '-',
                        // 'Dear ' + Employee."First Name" + ',<BR><BR>' +
                        // 'Please find attached your P9 for Period (' + Format(StartDate) + '...' + Format(EndDAte) + ' )' + '.<BR>' +
                        // 'Kindly be Compliant.<BR><BR>', true);



                        // cu400.AppendBody(
                        // '<BR><BR>Kind Regards,');


                        // cu400.AppendBody('<BR>' + CompInfo.Name);


                        // cu400.AddAttachment(FileDirectory + FileName, FileName);

                        // //Send email
                        // cu400.Send;
                        //cc//        //MESSAGE('sent');
                        SendingDate := Today;
                        SendingTime := Time;



                        //record sending details

                        /*

                        DocLog.INIT;
                        DocLog."Entry No":=0;
                        DocLog."Customer No":=Vendor."No.";
                        DocLog."E-mailed To":=Vendor."E-Mail";
                        DocLog.Date:=SendingDate;
                        DocLog."Document Type":=DocLog."Document Type"::Payslip;
                        DocLog."File Extension":=FileDirectory+FileName;
                        DocLog.Time:=SendingTime;
                        DocLog."S/no":=Counter;
                        DocLog."Profit Centre":=Vendor."Global Dimension 1 Code";
                        DocLog."Branch code":=Vendor."Global Dimension 2 Code";
                        DocLog."Sender ID":=USERID;
                        DocLog.INSERT(TRUE);
                        */

                        //END ELSE

                        //CurrReport.SKIP;
                        //SLEEP(1000);
                        // if Exists(FileDirectory + FileName) then
                        //     Erase(FileDirectory + FileName);
                        FileDirectory := '';
                        FileName := '';






                        Sleep(1000);
                        Window.Close;
                    end;
                    //UNTIL vend.NEXT=0;

                end else
                    CurrReport.Skip;



                //END ELSE
                //CurrReport.SKIP;

            end;
        }
    }

    requestpage
    {

        layout
        {
            area(content)
            {
                field("Start Date"; StartDate)
                {
                    ApplicationArea = Basic;
                }
                field("End Date"; EndDAte)
                {
                    ApplicationArea = Basic;
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

        PayPeriodtext := Employee.GetFilter("Date Filter");
        //PayPeriodtext:='010116';
        Evaluate(PayrollMonth, Format(PayPeriodtext));
        PayrollMonthText := Format(PayrollMonth, 1, 4);
        /*
        PayPeriod.GET(PayrollMonth);
        IF PayPeriod."Pay Date"=0D THEN
        ERROR('Please specify Pay date on Pay period setup!!');
        */
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
        //cc//  FileDialog: Codeunit "SMTP Test Mail";
        SendingDate: Date;
        SendingTime: Time;
        Counter: Integer;
        //cc//  cu400: Codeunit "SMTP Mail";
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
        DateFilter: Text;
        FromDate: Date;
        ToDate: Date;
        FromDateS: Text;
        ToDateS: Text;
        Employer: Record Employee;
        StartDate: Date;
        EndDAte: Date;
}
