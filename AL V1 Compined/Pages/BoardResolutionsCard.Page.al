#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Page 55016 "Board Resolutions Card"
{
    Caption = 'Board Resolutions';
    PageType = Card;
    RefreshOnActivate = true;
    SourceTable = "Board Resolutions Header";
    ApplicationArea = All;

    layout
    {
        area(content)
        {
            group("<Control1>")
            {
                Caption = 'General';
                field("Resolution No."; Rec."Resolution No.")
                {
                    ApplicationArea = Basic;
                }
                field("Type of Meeting"; Rec."Type of Meeting")
                {
                    ApplicationArea = Basic;
                }
                field("Meeting Ref No."; Rec."Meeting Ref No.")
                {
                    ApplicationArea = Basic;
                    TableRelation = "Board Meetings1".Title;
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = Basic;
                }
                field("Created By"; Rec."Created By")
                {
                    ApplicationArea = Basic;
                }
                field(Date; Rec.Date)
                {
                    ApplicationArea = Basic;
                }
                field(Time; Rec.Time)
                {
                    ApplicationArea = Basic;
                }
                field("No.Series"; Rec."No.Series")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
            }
            part(Control11; "Board Resolution Lines")
            {
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
                    RunPageLink = "Meeting Code" = field("No.Series");
                    Visible = false;
                }
                action("Publish the Meeting")
                {
                    ApplicationArea = Basic;
                    Visible = false;

                    trigger OnAction()
                    begin
                        /*IF CONFIRM('Are you sure you want to publish meeting No. '+No+' ?')=TRUE THEN
                        BEGIN
                          Published := TRUE;
                          Status := Status::Upcoming;
                          "Published By":=USERID;
                          "Date Published":=TODAY;
                          "Time Published":=TIME;
                          MODIFY;
                          MESSAGE('Published Successfully');
                        
                        //notify board members
                        BoardMembers.RESET;
                        BoardMembers.SETRANGE("Meeting Code",No);
                        IF BoardMembers.FINDSET THEN BEGIN
                          REPEAT
                                  CashMgt.GET;
                                  IF CashMgt."Send Email Notification" = TRUE THEN
                                  BEGIN
                                    Email1:='';
                                    {Body:='Your imprest application no. '+ Imprestheaders."No." + ' has been created from memo no. '+"No."+
                                    ' Kindly logon to Microsoft Dynamics NAV to confirm and send it for approval.';}
                                    IF Vend.GET(BoardMembers."Member No") THEN
                                    Email1:=Vend."E-Mail";
                                   Email2:='erickdaudi@dynasoft.co.ke';
                                   //MESSAGE('Email 1%',Email1);
                                   IF Email1<>'' THEN BEGIN
                                    SMTP.CreateMessage('NACOSTI',Email2,
                                    Email1,'Meeting '+'No: '+No,
                                    'Dear '+BoardMembers."Member Name"+',<BR><BR>'+
                                    'Your are Invited to attend Meeting no. '+ No + ', Starting on '+FORMAT("Start date")+ ' Time '+FORMAT("Start time")+ ' To Date '+FORMAT("End Date")
                                    + 'To Time '+FORMAT("End time")+' <BR><BR>',TRUE);
                                    SMTP.AppendBody('<BR><BR>Location and Venue respectively shall be,'+' '+"Venue/Location"+' , '+ "Conference Venue"+'<BR>');
                                    SMTP.AppendBody('<BR><BR>Kind Regards,'+'<BR><BR>NACOSTI.<BR>'+'<BR>');
                                    SMTP.Send();
                                    END;
                                  END;
                          UNTIL BoardMembers.NEXT=0;
                          END;
                        END;
                        */

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
                    RunPageLink = Description = field("No.Series");
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
                    RunPageLink = "Meeting Code" = field("No.Series");
                    Visible = false;
                }
            }
        }
    }

    var
        BoardMembers: Record "Board Meeting Attendance";
        CashMgt: Record "Cash Management Setup";
        //cc//   SMTP: Codeunit "SMTP Mail";
        Body: Text[1024];
        Email1: Text[250];
        Email2: Text[250];
        CompInfo: Record "Company Information";
        Vend: Record Vendor;
}
