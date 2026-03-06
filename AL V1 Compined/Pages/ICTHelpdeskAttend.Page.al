#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Page 56078 "ICT Helpdesk Attend"
{
    PageType = Card;
    SourceTable = "ICT Helpdesk";
    SourceTableView = where(Status = filter(Pending));
    ApplicationArea = All;

    layout
    {
        area(content)
        {
            group(General)
            {
                Editable = false;
                field("Assigned To"; Rec."Assigned To")
                {
                    ApplicationArea = Basic;
                }
                field("Assigned Date"; Rec."Assigned Date")
                {
                    ApplicationArea = Basic;
                    Caption = 'Date';
                }
                field("Assigned Time"; Rec."Assigned Time")
                {
                    ApplicationArea = Basic;
                    Caption = 'Time';
                }
            }
            group("Part 1: User Information")
            {
                Editable = false;
                field("Job No."; Rec."Job No.")
                {
                    ApplicationArea = Basic;
                }
                field(Department; Rec.Department)
                {
                    ApplicationArea = Basic;
                }
                field("Department Name"; Rec."Department Name")
                {
                    ApplicationArea = Basic;
                }
                field("Physical Station"; Rec."Physical Station")
                {
                    ApplicationArea = Basic;
                }
                field("Nature of Service"; Rec."Nature of Service")
                {
                    ApplicationArea = Basic;
                }
                field(EXT; Rec.EXT)
                {
                    ApplicationArea = Basic;
                }
                field("Requesting Officer"; Rec."Requesting Officer")
                {
                    ApplicationArea = Basic;
                }
                field("Requesting Officer Name"; Rec."Requesting Officer Name")
                {
                    ApplicationArea = Basic;
                }
                field(Phone; Rec.Phone)
                {
                    ApplicationArea = Basic;
                }
                field(Email; Rec.Email)
                {
                    ApplicationArea = Basic;
                }
                field("Request Date"; Rec."Request Date")
                {
                    ApplicationArea = Basic;
                }
                field("Request Time"; Rec."Request Time")
                {
                    ApplicationArea = Basic;
                }
                field(Status; Rec.Status)
                {
                    ApplicationArea = Basic;
                }
            }
            group("Part 2.1: Hardware Issues")
            {
                Editable = false;
                field("Computer not Starting up"; Rec."Computer not Starting up")
                {
                    ApplicationArea = Basic;
                }
                field("Keyboard, Mouse Failure"; Rec."Keyboard, Mouse Failure")
                {
                    ApplicationArea = Basic;
                }
                field("Printer Failure"; Rec."Printer Failure")
                {
                    ApplicationArea = Basic;
                }
                field("UPS Failure"; Rec."UPS Failure")
                {
                    ApplicationArea = Basic;
                }
                field("LCD /Monitor Failure"; Rec."LCD /Monitor Failure")
                {
                    ApplicationArea = Basic;
                }
                field("Storage Device Failure"; Rec."Storage Device Failure")
                {
                    ApplicationArea = Basic;
                }
                field("Hardware Installation"; Rec."Hardware Installation")
                {
                    ApplicationArea = Basic;
                }
                field("Others, specify HW"; Rec."Others, specify HW")
                {
                    ApplicationArea = Basic;
                }
            }
            group("Part 2.2: Software Issues")
            {
                Editable = false;
                field("Computer Running /Loading Slow"; Rec."Computer Running /Loading Slow")
                {
                    ApplicationArea = Basic;
                }
                field("Network Access Problems"; Rec."Network Access Problems")
                {
                    ApplicationArea = Basic;
                }
                field("Antivirus Inefficiency"; Rec."Antivirus Inefficiency")
                {
                    ApplicationArea = Basic;
                }
                field(Applications; Rec.Applications)
                {
                    ApplicationArea = Basic;
                    Caption = 'Applications Software (MS Word, MS Excel, MS Access, MS PowerPoint etc)';
                }
                field("Software Installation"; Rec."Software Installation")
                {
                    ApplicationArea = Basic;
                }
                field("Others, specify SW"; Rec."Others, specify SW")
                {
                    ApplicationArea = Basic;
                }
            }
            group(Control6)
            {
                field(Diagnosis; Rec.Diagnosis)
                {
                    ApplicationArea = Basic;
                }
                field("Action Taken"; Rec."Action Taken")
                {
                    ApplicationArea = Basic;
                }
                field("Attended By"; Rec."Attended By")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field("Attended Date"; Rec."Attended Date")
                {
                    ApplicationArea = Basic;
                    Caption = 'Date';
                    Visible = false;
                }
                field("Attended Time"; Rec."Attended Time")
                {
                    ApplicationArea = Basic;
                    Caption = 'Time';
                    Visible = false;
                }
            }
        }
    }

    actions
    {
        area(processing)
        {
            action(Close)
            {
                ApplicationArea = Basic;
                Image = Close;
                Promoted = true;
                PromotedCategory = Process;

                trigger OnAction()
                begin
                    if Confirm('Are you sure you want to Close the ICT helpdesk issue?') = true then begin
                        Rec."Attended Date" := Today;
                        Rec."Attended By" := UpperCase(UserId);
                        Rec."Attended Time" := Time;
                        Rec.Status := Rec.Status::Closed;
                        Rec.Modify;
                    end;

                    //Notify the requester that the issue has been closed
                    // ObjComInfo.GET;
                    // SenderEmailAddress:=ObjComInfo."Administrator Email";
                    // SenderName:=COMPANYNAME;
                    // MESSAGE(COMPANYNAME);
                    // IF UserSetup.GET("Requesting Officer") THEN
                    // Recipient:=UserSetup."E-Mail";
                    // Subject:='ISSUE CLOSURE'+ ' '+"Job No.";
                    // Body:='Please note that the issue on the subject above has been resoved by'+ '  '+"Attended By";
                    // ObjNotify.FnSendEmail(SenderEmailAddress,SenderName,Recipient,Subject,Body);
                end;
            }
            action(Print)
            {
                ApplicationArea = Basic;
                Image = Print;
                Promoted = true;
                PromotedCategory = Process;

                trigger OnAction()
                begin

                    Rec.SetFilter(Rec."Job No.", Rec."Job No.");
                    Report.Run(56238, true, true, Rec);
                end;
            }
            action(Escalate)
            {
                ApplicationArea = Basic;
                Image = Forecast;
                Promoted = true;
                PromotedCategory = Process;

                trigger OnAction()
                begin
                    if Confirm('Are you sure you want to escalate the ICT helpdesk issue?' + ' ' + Rec."Job No.") = true then begin
                        Rec."Escalated By" := UpperCase(UserId);
                        Rec."Escalated Date" := Today;
                        Rec."Escalated Time" := Time;
                        if UserSetup.Get(Rec."Escalated By") then
                            Rec."Escalated To" := UserSetup."Approver ID";
                        Rec.Status := Rec.Status::Escalated;
                        Rec.Modify;
                    end;

                    //Notify the requester that the issue has been escalated
                    ObjComInfo.Get;
                    SenderEmailAddress := ObjComInfo."Administrator Email";
                    SenderName := COMPANYNAME;
                    //MESSAGE(COMPANYNAME);
                    if UserSetup.Get(Rec."Requesting Officer") then
                        Recipient := UserSetup."E-Mail";
                    Subject := 'ISSUE ESCALATION' + ' ' + Rec."Job No.";
                    Body := 'Please note that the issue on the subject above has been escalatd to ' + '  ' + Rec."Escalated To";
                    ObjNotify.FnSendEmail(SenderEmailAddress, SenderName, Recipient, Subject, Body);
                end;
            }
        }
    }

    var
        ObjNotify: Codeunit "Insurance Notifications";
        SenderEmailAddress: Text[250];
        SenderName: Text[250];
        Recipient: Text[250];
        Subject: Text[250];
        Body: Text[250];
        ObjComInfo: Record "Company Information";
        UserSetup: Record "User Setup";
}
