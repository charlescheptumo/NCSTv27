#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Page 55012 "Board Meeting Card1"
{
    Caption = 'Board Meeting Card';
    PageType = Card;
    SourceTable = "Board Meetings1";

    layout
    {
        area(content)
        {
            group(General)
            {
                field(No; Rec.No)
                {
                    ApplicationArea = Basic;
                    Caption = 'Meeting Ref No.';
                    Editable = false;
                }
                field(Title; Rec.Title)
                {
                    ApplicationArea = Basic;
                    Caption = 'Meeting Ref. No:';
                    MultiLine = false;
                    Visible = false;
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = Basic;
                    Caption = 'Board Meeting Category';
                    Visible = false;
                }
                field("Type of Meeting"; Rec."Type of Meeting")
                {
                    ApplicationArea = Basic;
                }
                field("Meeting Type"; Rec."Meeting Type")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field("Start date"; Rec."Start date")
                {
                    ApplicationArea = Basic;
                    Caption = 'Meeting Date';
                }
                field("Start time"; Rec."Start time")
                {
                    ApplicationArea = Basic;
                }
                field("End Date"; Rec."End Date")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field("End time"; Rec."End time")
                {
                    ApplicationArea = Basic;
                }
                field("Venue/Location"; Rec."Venue/Location")
                {
                    ApplicationArea = Basic;
                }
                field("Conference Venue"; Rec."Conference Venue")
                {
                    ApplicationArea = Basic;
                    Caption = 'Conference Venue';
                }
                field("Contact Tel. No"; Rec."Contact Tel. No")
                {
                    ApplicationArea = Basic;
                }
                field("Contact Email"; Rec."Contact Email")
                {
                    ApplicationArea = Basic;
                }
                field("Meeting Status"; Rec."Meeting Status")
                {
                    ApplicationArea = Basic;
                }
                field("Parking Arrangement"; Rec."Parking Arrangement")
                {
                    ApplicationArea = Basic;
                    Caption = 'Logistics Arrangements';
                }
                field("Access requirement"; Rec."Access requirement")
                {
                    ApplicationArea = Basic;
                }
                field("Convened by"; Rec."Convened by")
                {
                    ApplicationArea = Basic;
                    Caption = 'Convened by:';
                }
                field(Published; Rec.Published)
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field(Status; Rec.Status)
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    Visible = false;
                }
            }
            part(Control28; "Agenda Lines")
            {
                Caption = 'Agenda Information';
                SubPageLink = "Board Meeting No" = field(No);
            }
        }
        area(factboxes)
        {
            systempart(Control22; Notes)
            {
            }
        }
    }

    actions
    {
        area(navigation)
        {
            group(ActionGroup24)
            {
                action("Board Meeting Attendance")
                {
                    ApplicationArea = Basic;
                    Caption = 'Board Meeting Attendance';
                    Image = Absence;
                    Promoted = true;
                    PromotedCategory = Process;
                    PromotedIsBig = true;
                    RunObject = Page "Board Meeting Attendance";
                    RunPageLink = "Meeting Code" = field(No);
                }
                action("Publish the Meeting")
                {
                    ApplicationArea = Basic;

                    trigger OnAction()
                    begin
                        if Confirm('Are you sure you want to publish meeting No. ' + Rec.No + ' ?') = true then begin
                            //Published := TRUE;
                            //Status := Status::Upcoming;
                            Rec."Published By" := UserId;
                            Rec."Date Published" := Today;
                            Rec."Time Published" := Time;
                            Rec.Modify;

                            //notify board members
                            BoardMembers.Reset;
                            BoardMembers.SetRange("Meeting Code", Rec.No);
                            if BoardMembers.FindSet then begin
                                repeat
                                    CashMgt.Get;
                                    if CashMgt."Send Email Notification" = true then begin
                                        Email1 := '';
                                        BoardMemb.Reset;
                                        BoardMemb.SetRange(Code, BoardMembers."Member No");
                                        if BoardMemb.FindFirst() then
                                            Email1 := BoardMemb.Email;
                                        Email2 := 'mosesotieno@dynasoft.co.ke';
                                        Message('Email 1%', Email1);
                                        if Email1 <> '' then begin
                                            //   SMTP.CreateMessage('NACOSTI', Email2,
                                            // Email1, 'Meeting ' + 'No: ' + Rec.No,
                                            Body := 'Dear ' + BoardMembers."Member Name" + ',<BR><BR>' +
                                            'Your are hereby Invited to a Board Meeting Meeting no:' + ' ' + Rec.No + ' ' + 'with below details.' + '<BR>';
                                            Body := Body + '<BR><B>Venue Location:</B>,' + ' ' + Rec."Conference Venue" + '<BR>';
                                            Body := Body + '<B>Meeting Date":</B>' + ' ' + Format(Rec."Start date") + '<BR>';
                                            Body := Body + '<B>Times:</B>' + ' ' + Format(Rec."Start time") + ' ' + '<B>To:</B>' + Format(Rec."End time") + '<BR>';
                                            Body := Body + '<BR>Click the this <A href="http://41.89.63.253:8086/">E-Board Website link and log in</A> to view the meeting Agenda<BR>';
                                            Body := Body + '<BR><BR>Kind Regards,' + '<BR><BR>NACOSTI.<BR>' + '<BR>' + 'This is an auto-generated email, please do not reply.';
                                            //
                                            //  SMTP.AddCC(Email2);
                                            // SMTP.Send();
                                            //  SMTP.Send();
                                            emailmessage.Create(Vend."E-Mail", 'NACOSTI', body);
                                            emailsender.Send(emailmessage, enum::"Email Scenario"::Default);
                                            Message('Invitation sent successfully to %1', BoardMembers."Member Name");
                                        end;
                                    end;
                                until BoardMembers.Next = 0;
                            end;
                            Message('Published, and members notified sucessfully');
                        end;
                    end;
                }
                action("Meeting Agenda")
                {
                    ApplicationArea = Basic;
                    Caption = 'Meeting Agenda';
                    Image = Agreement;
                    Promoted = true;
                    PromotedIsBig = true;
                    RunObject = Page "Meeting Agenda";
                }
                action("Notify ICT")
                {
                    ApplicationArea = Basic;
                    Image = AddContacts;

                    trigger OnAction()
                    begin
                        BoardMeeting.Reset;
                        BoardMeeting.SetRange(No);
                        if BoardMeeting.FindFirst() then
                            Email2 := BoardMeeting."Contact Email";
                        Message(Email2);
                        if BoardMeeting."Contact Email" <> '' then begin
                            //  SMTP.CreateMessage('NACOSTI', Email2,
                            //    Email2, 'Meeting ' + 'No: ' + Rec.No,
                            Body := 'Dear ICT Admin<BR><BR>' +
                              'Your are hereby notified to create a link to a scheduled board Meeting no:' + ' ' + Rec.No + ' ' + 'with below details.' + '<BR>';
                            Body := Body + '<BR><B>Venue Location:</B>,' + ' ' + Rec."Conference Venue" + '<BR>';
                            Body := Body + '<B>Meeting Date":</B>' + ' ' + Format(Rec."Start date") + '<BR>';
                            Body := Body + '<B>Times:</B>' + ' ' + Format(Rec."Start time") + ' ' + '<B>To:</B>' + Format(Rec."End time") + '<BR>';
                            Body := Body + '<BR><BR>Kind Regards,' + '<BR><BR>NACOSTI E-BOARD ADMIN.<BR>' + '<BR>' + 'This is an auto-generated email, please do not reply.';
                            //   SMTP.AppendBody('<B>Times:</B>' + ' ' + Format(Rec."Start time") + ' ' + '-' + Format(Rec."End time"));
                            //     SMTP.AppendBody('<BR><BR>Kind Regards,' + '<BR>E-BOARD ADMIN.<BR>' + '<BR>');
                            // SMTP.Send();
                            emailmessage.Create(Email2, 'NACOSTI', Body, true);
                            emailsender.Send(emailmessage, enum::"Email Scenario"::Default);
                            Message('Email Sent successfully');
                        end;
                    end;
                }
                action("Meeting Comments")
                {
                    ApplicationArea = Basic;
                    Caption = 'Meeting Comments';
                    Image = NewSum;
                    Promoted = true;
                    PromotedIsBig = true;
                    RunObject = Page "Board Meeting Comments";
                    RunPageLink = "Meeting Code" = field(No);
                    Visible = false;
                }
            }
        }
    }

    var
        BoardMembers: Record "Board Meeting Attendance";
        CashMgt: Record "Cash Management Setup";
        //   SMTP: Codeunit "SMTP Mail";
        emailmessage: Codeunit "Email Message";
        emailsender: Codeunit "Email";

        Body: Text[1024];
        Email1: Text[250];
        Email2: Text[250];
        CompInfo: Record "Company Information";
        Vend: Record Vendor;
        objPortalUser: Record portalusers;
        Username: Text;
        Password: Text;
        BoardMemb: Record "Board Of Directors";
        BoardMeeting: Record "Board Meetings1";
}
