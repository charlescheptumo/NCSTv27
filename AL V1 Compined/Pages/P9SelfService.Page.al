#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Page 69046 "P9 Self Service"
{
    PageType = Card;
    SourceTable = "Payroll PeriodX";

    layout
    {
        area(content)
        {
            group(General)
            {
                field("P9 Start Date"; Rec."P9 Start Date")
                {
                    ApplicationArea = Basic;
                }
                field("P9 End Date"; Rec."P9 End Date")
                {
                    ApplicationArea = Basic;
                }
            }
        }
    }

    actions
    {
        area(processing)
        {
            action("Send P9 to my Company Email")
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
                    //cc   SMTPMailSet.Get;
                    //cc  SenderAddress := SMTPMailSet."Email Sender Address";
                    SenderName := CompanyInfo.Name + '  PAYROLL';
                    Subject := StrSubstNo('Employee P9');

                    Emp.Reset;
                    Emp.SetRange(Emp."User ID", UserId);
                    if Emp.FindFirst then begin
                        FileDirectory := 'C:\DOCS\';
                        FileName := 'P9_' + Emp."No." + '.pdf';
                        //Window.OPEN('processing');
                        Window.Open('PROCESSING Employee ######################1##');
                        Window.Update(1, Emp."No." + '-' + Emp."First Name");

                        WindowisOpen := true;
                        if FileName = '' then
                            Error('Please specify what the file should be saved as');


                        FromDate := Rec."P9 Start Date";
                        ToDate := Rec."P9 End Date";
                        Evaluate(FromDateS, Format(FromDate));
                        Evaluate(ToDateS, Format(ToDate));
                        DateFilter := FromDateS + '..' + ToDateS;
                        Emp.SetFilter(Emp."No.", Emp."No.");
                        Emp.SetFilter(Emp."Date Filter", Format(DateFilter));


                        //Report.SaveAsPdf(69036, FileDirectory + FileName, Emp);




                      //  if Exists(FileDirectory + FileName) then
                         begin
                            Counter := Counter + 1;

                            //cc     SMTPMailSet.Get;
                            //cc    SenderAddress := SMTPMailSet."Email Sender Address";
                            if Emp."Company E-Mail" <> '' then begin
                                Recipients := Emp."Company E-Mail";


                                //cc  cu400.CreateMessage(CompInfo.Name, SenderAddress,
                                //cc   Recipients, 'P9 -' + 'Employee No : ' + Emp."No." + '-',
                                //cc   'Dear ' + Emp."First Name" + ',<BR><BR>' +
                                //cc   'Please find attached your P9 for Period (' + Format(FromDateS) + '...' + Format(ToDateS) + ' )' + '.<BR>' +
                                //cc  'Kindly be Compliant.<BR><BR>', true);



                                //cc    cu400.AppendBody(
                                //cc   '<BR><BR>Kind Regards,');


                                //cc    cu400.AppendBody('<BR>' + CompInfo.Name);


                                //cc    cu400.AddAttachment(FileDirectory + FileName, FileName);

                                //Send email
                                //cc   cu400.Send;
                                BODY := 'Dear ' + Emp."First Name" + ',<BR><BR>' +
                                'Please find attached your P9 for Period (' + Format(FromDateS) + '...' + Format(ToDateS) + ' )' + '.<BR>' +
                                'Kindly be Compliant.<BR><BR>' +
                                  'Kind Regards,' + '<BR>' + CompInfo.Name;
                                EMAILMESSAGE.Create(Recipients, Subject, BODY);
                                EMAILSNED.Send(EMAILMESSAGE, enum::"Email Scenario"::Default);
                                Message('sent');
                                //SendingDate:=TODAY;
                                //SendingTime:=TIME;
                                Sleep(1000);
                                Window.Close;
                            end;
                        end;
                    end;
                end;
            }
        }
    }

    var
        //cc   SMTPSetup: Codeunit "SMTP Mail";
        CompanyInfo: Record "Company Information";
        UserSetup: Record "User Setup";
        SenderAddress: Text[80];
        Recipients: Text[80];
        SenderName: Text[70];

        Subject: Text[80];
        Emp: Record Employee;
        FileName: Text;
        FileMangement: Codeunit "File Management";
        AssignmentMatrixX: Record "Assignment Matrix-X";
        ProgressWindow: Dialog;
        //SMTPMailSet: Record "SMTP Mail Setup";
        FileDirectory: Text[100];
        Window: Dialog;
        WindowisOpen: Boolean;
        FromDate: Date;
        ToDate: Date;
        FromDateS: Text;
        ToDateS: Text;
        Employer: Record Employee;
        StartDate: Date;
        EndDAte: Date;
        DateFilter: Text;
        Counter: Integer;
        //cc   cu400: Codeunit "SMTP Mail";
        EMAILSNED: Codeunit EMAIL;
        EMAILMESSAGE: Codeunit "Email Message";
        BODY: Text[1024];
        DocLog: Record "Document E-mail Log";
        BranchName: Code[80];
        DimValue: Record "Dimension Value";
        CustEmail: Text[100];
        HRSetup: Record "Human Resources Setup";
        CompInfo: Record "Company Information";
}
