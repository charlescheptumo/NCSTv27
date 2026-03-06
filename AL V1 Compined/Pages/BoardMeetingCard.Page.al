#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Page 55003 "Board Meeting Card"
{
    Caption = 'Committee Meeting Card';
    PageType = Card;
    SourceTable = "Board Meetings";
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
                    Caption = 'Committee Meeting Code';
                }
                field("Meeting group"; Rec."Meeting group")
                {
                    ApplicationArea = Basic;
                    Caption = 'Commitee Meeting';
                }
                field("Meeting Type"; Rec."Meeting Type")
                {
                    ApplicationArea = Basic;
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
            part(Control35; "Agenda Lines")
            {
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
                    VAR
                        emailmessage: Codeunit "Email Message";
                        emailsender: Codeunit "Email";
                        body: Text[1024];
                    begin
                        if Confirm('Are you sure you want to publish meeting No. ' + Rec.No + ' ?') = true then begin
                            Rec.Published := true;
                            Rec.Status := Rec.Status::Upcoming;
                            Rec."Published By" := UserId;
                            Rec."Date Published" := Today;
                            Rec."Time Published" := Time;
                            //TO-DO: For Developer, please insert code for sending group emails here

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
                                            //    SMTP.CreateMessage('NACOSTI', Email2,
                                            //  Email1, 'Meeting ' + 'No: ' + Rec.No,
                                            body := 'Dear ' + BoardMembers."Member Name" + ',<BR><BR>' +
                                            'Your are Invited to attend Meeting no. ' + Rec.No + ', Starting on ' + Format(Rec."Start date") + ' Time ' + Format(Rec."Start time") + ' To Date ' + Format(Rec."End Date")
                                            + 'To Time ' + Format(Rec."End time") + ' <BR><BR>';
                                            body := body + '<BR><BR>Location and Venue respectively shall be,' + ' ' + Rec."Venue/Location" + ' , ' + Rec."Conference Venue" + '<BR>';
                                            body := body + '<BR><BR>Kind Regards,' + '<BR><BR>NACOSTI.<BR>' + '<BR>' + 'This is an auto-generated email, please do not reply.';
                                            //  SMTP.Send();
                                            emailmessage.Create(Vend."E-Mail", 'NACOSTI', body);
                                            emailsender.Send(emailmessage, enum::"Email Scenario"::Default);
                                        end;
                                    end;
                                until BoardMembers.Next = 0;
                            end;
                        end;

                    end;
                }
                action("In Attendance")
                {
                    ApplicationArea = Basic;
                    Image = Add;
                    Promoted = true;
                    PromotedCategory = Process;
                    PromotedIsBig = true;
                    RunObject = Page "Board Meeting In-Attendance";
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
                    Visible = false;
                }
                group(ActionGroup32)
                {
                }
                action("Cancel Meeting")
                {
                    ApplicationArea = Basic;
                    Enabled = isCanceled;
                    Image = Cancel;
                    Promoted = true;
                    PromotedCategory = Process;
                    PromotedIsBig = true;
                    Visible = false;

                    trigger OnAction()
                    begin
                        if Confirm('Are you sure you want to cancel meeting No. ' + Rec.No + ' ?') = true then begin
                            if BoardMeetings.Get(Rec.No) then begin
                                BoardMeetings."Cancelled By" := UserId;
                                BoardMeetings."Date Cancelled" := Today;
                                BoardMeetings."Time Cancelled" := Time;
                                BoardMeetings.Status := BoardMeetings.Status::Cancelled;
                                BoardMeetings.Modify;
                                Message('Cancelled Successfully');
                            end;
                        end;
                    end;
                }
                action("Completed Meeting")
                {
                    ApplicationArea = Basic;
                    Image = CheckList;
                    Promoted = true;
                    PromotedCategory = Process;
                    PromotedIsBig = true;

                    trigger OnAction()
                    begin

                        if Confirm('Are you sure you want to complete meeting No. ' + Rec.No + ' ?') = true then begin
                            if BoardMeetings.Get(Rec.No) then begin
                                BoardMeetings."Completed By" := UserId;
                                BoardMeetings."Date Completed" := Today;
                                BoardMeetings."Time Completed" := Time;
                                BoardMeetings.Status := BoardMeetings.Status::Completed;
                                BoardMeetings.Modify;
                                Message('Completed successfully');
                            end;
                        end;
                    end;
                }
            }
        }
    }

    trigger OnOpenPage()
    begin
        if Rec.Status = Rec.Status::Cancelled then
            isCanceled := false
        else if Rec.Status = Rec.Status::Completed then
            isCanceled := false
        else
            isCanceled := true;
    end;

    var
        BoardMeetings: Record "Board Meetings";
        isCanceled: Boolean;
        BoardMembers: Record "Board Meeting Attendance";
        CashMgt: Record "Cash Management Setup";
        //   SMTP: Codeunit "SMTP Mail";
        Body: Text[1024];
        Email1: Text[250];
        Email2: Text[250];
        CompInfo: Record "Company Information";
        Vend: Record Vendor;
}
