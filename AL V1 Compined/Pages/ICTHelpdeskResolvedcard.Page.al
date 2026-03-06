#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Page 56221 "ICT Helpdesk Resolved card"
{
    DeleteAllowed = false;
    Editable = true;
    InsertAllowed = false;
    PageType = Card;
    SourceTable = "ICT Helpdesk";
    SourceTableView = where(Status = filter(Resolved));

    layout
    {
        area(content)
        {
            group("Part 1: User Information.")
            {
                Editable = true;
                field("Job No."; Rec."Job No.")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Global Dimension 1 Code"; Rec."Global Dimension 1 Code")
                {
                    ApplicationArea = Basic;
                    Caption = 'Region Name';
                    Editable = false;
                }
                field("Region Name"; Rec."Region Name")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field("Global Dimension 2 Code"; Rec."Global Dimension 2 Code")
                {
                    ApplicationArea = Basic;
                    Caption = 'Constituency Name';
                    Editable = false;
                    Visible = false;
                }
                field("Constituency Name"; Rec."Constituency Name")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field("Shortcut Dimension 1 Code"; Rec."Shortcut Dimension 1 Code")
                {
                    ApplicationArea = Basic;
                    Caption = 'Department Name';
                    Editable = false;
                }
                field("Department Name"; Rec."Department Name")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field("Requesting Officer"; Rec."Requesting Officer")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Requesting Officer Name"; Rec."Requesting Officer Name")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field(Phone; Rec.Phone)
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field(Email; Rec.Email)
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Request Date"; Rec."Request Date")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Request Time"; Rec."Request Time")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Attended Time"; Rec."Attended Time")
                {
                    ApplicationArea = Basic;
                    Enabled = false;
                }
                field("ICT Issue Category"; Rec."ICT Issue Category")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field(Status; Rec.Status)
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Requester Feedback"; Rec."Requester Feedback")
                {
                    ApplicationArea = Basic;
                    ShowMandatory = true;
                }
            }
            group("Part 2:1 Hardware Issues")
            {
                Visible = false;
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
            group("Part 2:2 Software Issues")
            {
                Visible = false;
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
            group("Please describe the issue here:")
            {
                Editable = false;
                field("Description of the issue"; Rec."Description of the issue")
                {
                    ApplicationArea = Basic;
                    MultiLine = true;
                    ShowMandatory = true;
                }
                field("Action Taken"; Rec."Action Taken")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Attended By"; Rec."Attended By")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Attended Date"; Rec."Attended Date")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
            }
            group(Assigned)
            {
                Caption = 'Assigned';
                Editable = false;
                field("Assigned To"; Rec."Assigned To")
                {
                    ApplicationArea = Basic;
                }
                field("Assigned Date"; Rec."Assigned Date")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    Visible = false;
                }
            }
            group("Escalation Details")
            {
                Caption = 'Escalation Details';
                Editable = false;
                field("Escalated To"; Rec."Escalated To")
                {
                    ApplicationArea = Basic;
                }
                field("Escalated By"; Rec."Escalated By")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field("Escalated Date"; Rec."Escalated Date")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field("Escalated Time"; Rec."Escalated Time")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
            }
        }
    }

    actions
    {
        area(processing)
        {
            action("Send Request")
            {
                ApplicationArea = Basic;
                Image = SendApprovalRequest;
                Promoted = true;
                PromotedCategory = Process;

                trigger OnAction()
                begin
                    Rec.TestField(Rec."ICT Issue Category");
                    Rec.TestField(Rec."Description of the issue");
                    if Confirm('Are you sure you want to send ICT helpdesk issue?') = true then begin
                        Rec."Request Date" := Today;
                        Rec."Request Time" := Time;
                        Rec.Status := Rec.Status::Assigned;
                        Rec.Modify;

                        Category.Reset;
                        Category.SetRange(Category.Code, Rec."ICT Issue Category");
                        if Category.FindSet then begin
                            Mapping.Reset;
                            Mapping.SetRange(Mapping."Help Desk Category", Rec."ICT Issue Category");
                            if Mapping.FindSet then begin
                                Rec."Assigned To" := Mapping.UserName;
                                Rec."Assigned Date" := Today;
                                Rec."Assigned Time" := Time;
                                Rec.Modify;
                            end;
                        end;

                        /*
                          Employee.RESET;
                          Employee.SETRANGE(Employee.Position,'JOB002');
                          IF Employee.FIND('-')THEN
                          BEGIN
                            Email2:=Employee."Company E-Mail";
                          END;
                          */
                        CInfo.Get;
                        Employee.Reset;
                        Employee.SetRange(Employee."User ID", Rec."Assigned To");
                        if Employee.Find('-') then begin
                            //MESSAGE("Assigned To");
                            Rec.Email := Employee."E-Mail";
                            Rec."Requesting Officer Name" := Employee."First Name" + ' ' + Employee."Middle Name" + ' ' + Employee."Last Name";
                        end;


                        Email2 := CInfo."Administrator Email";
                        Body := '<br>Kindly login to the ERP System and attend to the ICT Issue No. ' + Rec."Job No." + ' from ' + Rec."Requesting Officer Name" + '.' + '</br>';
                        Body := '<br>' + Body + ' ' + 'Best Regards,' + '</br>';
                        Body := Body + ' ' + 'ERP AUTOMATIC MAILS';
                        //   SMTP.CreateMessage(COMPANYNAME, Email2, Rec.Email, 'ICT Heldesk Notification', Body, true);
                        //   SMTP.Send();
                        BODY := Body;
                        EMAILMESSAGE.Create(CInfo."Administrator Email", 'ICT Heldesk Notification', BODY);
                        EMAILSNED.send(EMAILMESSAGE, Enum::"Email Scenario"::Default);
                        Message('ICT Issue notification sent successfully.');
                    end;

                    CurrPage.Close;

                end;
            }
            action(Ascertain)
            {
                ApplicationArea = Basic;
                Image = PostApplication;
                Promoted = true;
                PromotedIsBig = true;
                PromotedOnly = true;

                trigger OnAction()
                begin
                    if not Confirm('Are you ascertaining that your request' + ' ' + Rec."Job No." + ' ' + 'has been resolved?') then
                        exit;
                    Rec.TestField(Rec."Requester Feedback");
                    Rec.Status := Rec.Status::Closed;
                    Rec."Closed Date" := Today;
                    Rec."Closed Time" := Time;
                    Rec.Modify(true);

                    //Release the Officer
                    Mapping.Reset;
                    Mapping.SetRange(Mapping.UserName, Rec."Assigned To");
                    Mapping.SetRange(Mapping."Help Desk Category", Rec."ICT Issue Category");
                    if Mapping.FindSet then begin
                        Mapping.Assigned := false;
                        Mapping.Modify;
                    end;
                    //End Release the Officer
                end;
            }
            action(Reopen)
            {
                ApplicationArea = Basic;
                Image = OpenJournal;
                Promoted = true;
                PromotedIsBig = true;
                PromotedOnly = true;

                trigger OnAction()
                begin
                    if not Confirm('Are you quoke sure you want to reopen this ICT Helpdesk issue?' + ' ' + Rec."Job No.") then
                        exit;
                    Rec.TestField(Rec."Requester Feedback");
                    Rec.Status := Rec.Status::Open;
                    Rec.Reopened := true;
                    Rec."Reopened By" := UpperCase(UserId);
                    Rec."Assigned To" := '';
                    Rec."Attended By" := '';
                    Rec."Assigned Date" := 0D;
                    Rec."Assigned Time" := 0T;
                    Rec."Attended by Name" := '';
                    Rec."Attended Date" := 0D;
                    Rec."Attended Time" := 0T;
                    Rec.Modify;
                end;
            }
        }
    }

    trigger OnInsertRecord(BelowxRec: Boolean): Boolean
    begin
        Rec.Validate(Rec."Job No.");
    end;

    trigger OnNewRecord(BelowxRec: Boolean)
    begin
        Rec.Status := Rec.Status::Open;
    end;

    var
        Employee: Record Employee;

        //  SMTP: Codeunit "SMTP Mail";
        Email2: Text[250];
        CInfo: Record "Company Information";
        Category: Record "ICT Helpdesk Category";
        Mapping: Record "ICT Officers Category Mapping";
        UserSetup: Record "User Setup";
        EMAILSNED: Codeunit EMAIL;
        EMAILMESSAGE: Codeunit "Email Message";
        BODY: Text[1024];
}
