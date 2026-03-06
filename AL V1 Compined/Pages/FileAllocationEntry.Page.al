#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Page 59131 "File Allocation Entry"
{
    PageType = Card;
    SourceTable = "File Allocation Entries";

    layout
    {
        area(content)
        {
            group(General)
            {
                field("File No"; Rec."File No")
                {
                    ApplicationArea = Basic;
                }
                field("File Name"; Rec."File Name")
                {
                    ApplicationArea = Basic;
                }
                field("Folio Name"; Rec."Folio Name")
                {
                    ApplicationArea = Basic;
                }
                field("Employee No"; Rec."Employee No")
                {
                    ApplicationArea = Basic;
                }
                field("Assign User ID"; Rec."Assign User ID")
                {
                    ApplicationArea = Basic;
                }
                field("Employee Name"; Rec."Employee Name")
                {
                    ApplicationArea = Basic;
                }
                field(Remarks; Rec.Remarks)
                {
                    ApplicationArea = Basic;
                    MultiLine = true;
                }
                field(Posted; Rec.Posted)
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
            }
        }
        area(factboxes)
        {
            systempart(Control16; Outlook)
            {
            }
            systempart(Control17; Notes)
            {
            }
            systempart(Control18; MyNotes)
            {
            }
            systempart(Control19; Links)
            {
            }
        }
    }

    actions
    {
        area(processing)
        {
            action(Assign)
            {
                ApplicationArea = Basic;
                Promoted = true;
                PromotedCategory = Category4;
                PromotedIsBig = true;

                trigger OnAction()
                begin
                    //TESTFIELD("Nature of Receipt");
                    Rec.TestField(Rec."Assign User ID");
                    Rec.TestField(Rec."Employee No");
                    FileReceivingHeader.Reset;
                    FileReceivingHeader.SetRange(No, Rec."Document No");
                    if FileReceivingHeader.FindSet then begin
                        FileReceivingHeader."Assigned To" := Rec."Assign User ID";
                        FileReceivingHeader."Assigned To Name" := Rec."Employee Name";
                        FileReceivingHeader."Assigned to Employee No" := Rec."Employee No";
                        FileReceivingHeader.Remarks := Rec.Remarks;
                        //FileReceivingHeader."Assigned Employee Email":=e
                        //CaseRegister."Nature of Receipt":="Nature of Receipt";
                        // CaseRegister."Under Protest Details":="Under Protest Details";
                        FileReceivingHeader.Status := FileReceivingHeader.Status::Assigned;
                        if FileReceivingHeader.Modify(true) then begin
                            Rec.Posted := true;
                            Rec."Posted By" := UserId;
                            Rec."Posted On" := CurrentDatetime;
                            Rec.Modify(true);
                        end;
                    end;

                    //    SMTPMailSetup.Get;
                    //   Email2 := SMTPMailSetup."Email Sender Address";
                    UserSetup.Get(UserId);
                    Employee.Reset;
                    Employee.SetRange("No.", Rec."Employee No");
                    if Employee.FindSet then
                        //       SMTP.CreateMessage('Electronic Document Management System', Email2, Employee."Company E-Mail",
                        // 'File Management',
                        // 'Dear ' + Rec."Employee Name" + ' ,<BR><BR>' +
                        //  'Kindly note that File No ' + Rec."File No" + ' :<b>' + Rec."File Name" + '</b> has been marked to you <BR>' +
                        // 'Kindly take the necessary action.'
                        //   , true);
                        //    SMTP.AppendBody('<BR><BR>Kind Regards,' + '<BR><BR>NACOSTI<BR>' +
                        //  '<BR>[THIS IS AN AUTOMATED MESSAGE - PLEASE DO NOT REPLY DIRECTLY TO THIS EMAIL]<BR>');
                        //  SMTP.Send();
                        BODY := 'Dear ' + Rec."Employee Name" + ' ,<BR><BR>' +
 'Kindly note that File No ' + Rec."File No" + ' :<b>' + Rec."File Name" + '</b> has been marked to you <BR>' +
'Kindly take the necessary action.<BR><BR>Kind Regards,' + '<BR><BR>NACOSTI<BR>' +
'<BR>[THIS IS AN AUTOMATED MESSAGE - PLEASE DO NOT REPLY DIRECTLY TO THIS EMAIL]<BR>';
                    EMAILMESSAGE.Create(Employee."Company E-Mail", 'File Management', Body);
                    EMAILSNED.Send(EMAILMESSAGE, enum::"Email Scenario"::Default);
                    Message('Assigned Successfully');
                    CurrPage.Close;
                end;
            }
        }
    }

    var
        FileReceivingHeader: Record "File Receiving Header";
        CrmGeneralSetup: Record "Crm General Setup.";
        legalEmail: Text;
        Email2: Text;
        CompanyInformation: Record "Company Information";
        UserSetup: Record "User Setup";

        // SMTP: Codeunit "SMTP Mail";
        EMAILSNED: Codeunit EMAIL;
        EMAILMESSAGE: Codeunit "Email Message";
        BODY: Text[1024];
        FileAllocationEntries: Record "File Allocation Entries";
        FileAllocationEntries1: Record "File Allocation Entries";
        //  SMTPMailSetup: Record "SMTP Mail Setup";
        Employee: Record Employee;
}
