#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Page 59120 "File Issuance Card"
{
    PageType = Card;
    SourceTable = "Registry File  Entry";
    ApplicationArea = All;

    layout
    {
        area(content)
        {
            group(General)
            {
                field("File No"; Rec."File No")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Global Dimension 1 Code"; Rec."Global Dimension 1 Code")
                {
                    ApplicationArea = Basic;
                }
                field(Custody; Rec.Custody)
                {
                    ApplicationArea = Basic;
                }
                field("Employee Name"; Rec."Employee Name")
                {
                    ApplicationArea = Basic;
                }
                field("Assigned Employee"; Rec."Assigned Employee")
                {
                    ApplicationArea = Basic;
                    Caption = 'User ID';
                }
            }
        }
    }

    actions
    {
        area(processing)
        {
            action("Issue File")
            {
                ApplicationArea = Basic;
                Image = Allocate;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;

                trigger OnAction()
                begin
                    Rec.TestField(Rec."Global Dimension 1 Code");
                    Rec.TestField(Rec.Custody);
                    Rec.TestField(Rec."File No");
                    RecordCreation.Reset;
                    RecordCreation.SetRange("File No", Rec."File No");
                    if RecordCreation.FindSet then begin
                        RecordCreation."Global Dimension 1 Code" := Rec."Global Dimension 1 Code";
                        RecordCreation.Custody := Rec.Custody;
                        RecordCreation."Employee Name" := Rec."Employee Name";
                        RecordCreation."Assigned Employee" := Rec."Assigned Employee";
                        RecordCreation.Status := RecordCreation.Status::Assigned;
                        if RecordCreation.Modify(true) then begin
                            Email2 := CompanyInfo."Administrator Email";
                            Usersetup.Reset;
                            Usersetup.SetRange("User ID", Rec."Assigned Employee");
                            if Usersetup.Find('-') then begin
                                Body := 'You have been assigned File Number ' + Rec."File No" + ' Kindly login to Microsoft Dynamics NAV to Action.';

                                //  SMTP.CreateMessage('NACOSTI', Email2,
                                // Usersetup."E-Mail", 'Registry File Allocation ',
                                // 'Dear ' + Rec."Employee Name" + ',<BR><BR>' +
                                //  Body
                                // , true);

                                //   SMTP.AppendBody('<BR><BR>Kind Regards.' + '<BR>');
                                // SMTP.Send();
                                Body := 'Dear ' + Rec."Employee Name" + ',<BR><BR>' +
                                Body + '<BR><BR>Kind Regards,<BR><BR>NACOSTI';
                                EMAILMESSAGE.Create(Usersetup."E-Mail", 'Registry File Allocation ', Body);
                                EMAILSNED.Send(EMAILMESSAGE, enum::"Email Scenario"::Default);
                            end;

                            Message('Notified Successfully');

                        end;
                    end;
                    Rec.Posted := true;
                    Rec."Posted By" := UserId;
                    Rec."Posted On" := CreateDatetime(Today, Time);
                    Rec.Modify(true);
                    Message('File Issued Successfully to %1', Rec."Employee Name");
                    CurrPage.Close;
                end;
            }
        }
    }

    var
        RecordCreation: Record "Record Creation";
        Usersetup: Record "User Setup";

        //  SMTP: Codeunit "SMTP Mail";
        CompanyInfo: Record "Company Information";
        Email2: Code[50];
        EMAILSNED: Codeunit EMAIL;
        EMAILMESSAGE: Codeunit "Email Message";
        BODY: Text[1024];
}
