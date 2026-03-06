#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Page 69028 "Pay Periods-Self Service"
{
    ApplicationArea = Basic;
    DeleteAllowed = false;
    InsertAllowed = false;
    ModifyAllowed = false;
    PageType = List;
    SourceTable = "Payroll PeriodX";
    SourceTableView = where(Closed = const(true));
    UsageCategory = Lists;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Starting Date"; Rec."Starting Date")
                {
                    ApplicationArea = Basic;
                }
                field(Name; Rec.Name)
                {
                    ApplicationArea = Basic;
                }
            }
        }
        area(factboxes)
        {
            systempart(Control6; Outlook)
            {
            }
            systempart(Control7; Notes)
            {
            }
            systempart(Control8; MyNotes)
            {
            }
            systempart(Control9; Links)
            {
            }
        }
    }

    actions
    {
        area(processing)
        {
            action("Send Payslip to my Company Email")
            {
                ApplicationArea = Basic;
                Image = Currencies;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                PromotedOnly = true;

                trigger OnAction()
                begin
                    CompanyInfo.Get();
                    //    SMTPMailSet.Get;
                    //  SenderAddress := SMTPMailSet."Email Sender Address";
                    SenderName := CompanyInfo.Name + '  PAYROLL';
                    Subject := StrSubstNo('Employee Payslip');

                    Emp.Reset;
                    Emp.SetRange(Emp."User ID", UserId);
                    Emp.SetFilter(Emp."Pay Period Filter", Format(Rec."Starting Date"));
                    if Emp.FindFirst then begin
                        Body := StrSubstNo('Dear %2,<br><br>Please find attached your Payslip for the month starting: %1', Rec."Starting Date", Emp."First Name");
                        ProgressWindow.Open('Sending Payslip to your email #1#######');
                        ProgressWindow.Update(1, Emp."Company E-Mail");
                     //   FileName := FileMangement.ServerTempFileName('.pdf');
                        //Report.SaveAsPdf(Report::"New Payslip Self Service", FileName, Emp);

                        if Emp."Company E-Mail" <> '' then begin
                            Recipients := Emp."Company E-Mail";
                            //cc  SMTPSetup.CreateMessage(SenderName, SenderAddress, Recipients, Subject, Body, true);
                            //cc     SMTPSetup.AddAttachment(FileName, Rec.Name + ' Payslip.PDF');
                            // SMTPSetup.AppendBody('<br><br>');
                            // SMTPSetup.AppendBody('This email is system generated. Please do not reply to this email ID.');
                            // SMTPSetup.Send;
                            EMAILMESSAGE.Create(Recipients, Subject, Body);
                            EMAILSNED.Send(EMAILMESSAGE, enum::"Email Scenario"::Default);
                            ProgressWindow.Close;
                            Message('Your Payslip for period %1 Send to %2', Rec.Name, Emp."Company E-Mail");

                        end else
                            Error('Employee number: %1 do not have an email address ', Emp."No.");
                    end else
                        Error('The user do not have a valid Employee setup');
                    //CurrReport.QUIT;
                end;
            }
            action("&Print Payslip")
            {
                ApplicationArea = Basic;
                Caption = '&Print Payslip';
                Ellipsis = true;
                Image = "Report";
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                Visible = false;

                trigger OnAction()
                var
                    StdGenJnl: Record "Standard General Journal";
                begin
                    //IM.GenerateAcquisitionJournal(Rec);
                    Emp.Reset;
                    Emp.SetRange(Emp."User ID", UserId);
                    //Emp.SETRANGE(Employee."No.","No.");
                    /*
                    PayPeriod.RESET;
                    PayPeriod.SETRANGE(PayPeriod.Closed,FALSE);
                    IF PayPeriod.FIND('-') THEN
                     CurrentMonth:=PayPeriod."Starting Date";
                       Employee.SETRANGE(Employee."No.","No.");
                       Employee.SETRANGE(Employee."Pay Period Filter",CurrentMonth);
                       */
                    //REPORT.RUN(50053,TRUE,FALSE,Employee);
                    // REPORT.RUN(69045,TRUE,FALSE,Employee);
                    Report.Run(89028, true, false, Employee);

                end;
            }
        }
    }

    var
        //    SMTPSetup: Codeunit "SMTP Mail";
        CompanyInfo: Record "Company Information";
        UserSetup: Record "User Setup";
        SenderAddress: Text[80];
        Recipients: Text[80];
        SenderName: Text[70];
        EMAILSNED: Codeunit EMAIL;
        EMAILMESSAGE: Codeunit "Email Message";
        BODY: Text[1024];
        Subject: Text[80];
        Emp: Record Employee;
        FileName: Text;
        FileMangement: Codeunit "File Management";
        AssignmentMatrixX: Record "Assignment Matrix-X";
        ProgressWindow: Dialog;
        //SMTPMailSet: Record "SMTP Mail Setup";
        Employee: Record Employee;
}
