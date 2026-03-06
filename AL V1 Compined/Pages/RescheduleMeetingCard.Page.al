#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Page 55023 "Reschedule Meeting Card"
{
    Caption = 'Board Meeting Card';
    PageType = Card;
    SourceTable = "Board Meetings1";
    ApplicationArea = All;

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
                field("Meeting group Code"; Rec."Meeting group Code")
                {
                    ApplicationArea = Basic;
                    Caption = 'Board Meeting Code';
                }
                field("Meeting group"; Rec."Meeting group")
                {
                    ApplicationArea = Basic;
                    Caption = 'Board';
                }
                field("Meeting Type"; Rec."Meeting Type")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = Basic;
                    Caption = 'Board Meeting Category';
                    Visible = false;
                }
                field("Start date"; Rec."Start date")
                {
                    ApplicationArea = Basic;
                }
                field("Start time"; Rec."Start time")
                {
                    ApplicationArea = Basic;
                }
                field("End Date"; Rec."End Date")
                {
                    ApplicationArea = Basic;
                }
                field("End time"; Rec."End time")
                {
                    ApplicationArea = Basic;
                }
                field("Venue/Location"; Rec."Venue/Location")
                {
                    ApplicationArea = Basic;
                    Caption = 'Location';
                }
                field("Conference Venue"; Rec."Conference Venue")
                {
                    ApplicationArea = Basic;
                }
                field("Convened by"; Rec."Convened by")
                {
                    ApplicationArea = Basic;
                }
                field("Contact Tel. No"; Rec."Contact Tel. No")
                {
                    ApplicationArea = Basic;
                }
                field("Contact Email"; Rec."Contact Email")
                {
                    ApplicationArea = Basic;
                }
                field(Status; Rec.Status)
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    Visible = false;
                }
                field("Meeting Status"; Rec."Meeting Status")
                {
                    ApplicationArea = Basic;
                }
                field(Published; Rec.Published)
                {
                    ApplicationArea = Basic;
                    Editable = false;
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
                        if objPortalUser.Get(objPortalUser."customer No") then begin
                            Username := BoardMembers."Member No";
                            Password := objPortalUser.Password;
                        end;

                        if Confirm('Are you sure you want to publish meeting No. ' + Rec.No + ' ?') = true then begin
                            Rec.Published := true;
                            Rec.Status := Rec.Status::Upcoming;
                            Rec."Published By" := UserId;
                            Rec."Date Published" := Today;
                            Rec."Time Published" := Time;
                            Rec.Modify;
                            Message('Published Successfully');

                            //notify board members
                            BoardMembers.Reset;
                            BoardMembers.SetRange("Meeting Code", Rec.No);
                            if BoardMembers.FindSet then begin
                                repeat
                                    CashMgt.Get;
                                    if CashMgt."Send Email Notification" = true then begin
                                        Email1 := '';
                                        /*Body:='Your imprest application no. '+ Imprestheaders."No." + ' has been created from memo no. '+"No."+
                                        ' Kindly logon to Microsoft Dynamics NAV to confirm and send it for approval.';*/
                                        if Vend.Get(BoardMembers."Member No") then
                                            Email1 := Vend."E-Mail";
                                        Email2 := 'erickdaudi@dynasoft.co.ke';
                                        //MESSAGE('Email 1%',Email1);
                                        if Email1 <> '' then begin
                                            // SMTP.CreateMessage('NACOSTI', Email2,
                                            // Email1, 'Meeting ' + 'No: ' + Rec.No,
                                            // 'Dear ' + BoardMembers."Member Name" + ',<BR><BR>' +
                                            // 'Your are Invited to attend Meeting no. ' + Rec.No + ', Starting on ' + Format(Rec."Start date") + ' Time ' + Format(Rec."Start time") + ' To Date ' + Format(Rec."End Date")
                                            // + 'To Time ' + Format(Rec."End time") + ' <BR><BR>', true);
                                            // SMTP.AppendBody('<BR><BR>Location and Venue respectively shall be,' + ' ' + Rec."Venue/Location" + ' , ' + Rec."Conference Venue" + '<BR>');
                                            // SMTP.AppendBody('<BR>Click the this <a href="http://41.89.63.254/">link </a> to view the meeting details<BR>');
                                            // SMTP.AppendBody('<BR>Use the following credentials to login<BR>');
                                            // SMTP.AppendBody('<BR>Username: ' + Username + '<BR>');
                                            // SMTP.AppendBody('<BR>Password: ' + Password + '<BR>');
                                            // SMTP.AppendBody('<BR><BR>Kind Regards,' + '<BR><BR>NACOSTI.<BR>' + '<BR>');
                                            // SMTP.Send();
                                            body := 'Dear ' + BoardMembers."Member Name" + ',<BR><BR>' +
                                            'Your are Invited to attend Meeting no. ' + Rec.No + ', Starting on ' + Format(Rec."Start date") + ' Time ' + Format(Rec."Start time") + ' To Date ' + Format(Rec."End Date")
                                            + 'To Time ' + Format(Rec."End time") + ' <BR><BR>';
                                            body := body + '<BR><BR>Location and Venue respectively shall be,' + ' ' + FORMAT(Rec."Venue/Location") + ' , ' + Rec."Conference Venue" + '<BR>';
                                            body := body + '<BR>Click the this <a href="http://41.89.63.254/">link </a> to view the meeting details<BR>';
                                            body := body + '<BR>Use the following credentials to login<BR>';
                                            body := body + '<BR>Username: ' + Username + '<BR>';
                                            body := body + '<BR>Password: ' + Password + '<BR>';
                                            body := body + '<BR><BR>Kind Regards,' + '<BR><BR>NACOSTI.<BR>';
                                            EMAILMESSAGE.Create(Email1, 'Meeting ' + 'No: ' + Rec.No, Body);
                                            EMAILSNED.Send(EMAILMESSAGE, enum::"Email Scenario"::Default);
                                        end;
                                    end;
                                until BoardMembers.Next = 0;
                            end;
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
                    RunPageLink = Description = field(No);
                    Visible = false;
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
                }
            }
        }
    }

    var
        BoardMembers: Record "Board Meeting Attendance";
        CashMgt: Record "Cash Management Setup";
        // SMTP: Codeunit "SMTP Mail";
        EMAILSNED: Codeunit EMAIL;
        EMAILMESSAGE: Codeunit "Email Message";
        Body: Text[1024];
        Email1: Text[250];
        Email2: Text[250];
        CompInfo: Record "Company Information";
        Vend: Record Vendor;
        objPortalUser: Record portalusers;
        Username: Text;
        Password: Text;
}
