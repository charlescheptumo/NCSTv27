#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Page 56218 "ICT HelpdeskAllocation"
{
    ApplicationArea = Basic;
    Caption = 'ICT Helpdesk Allocation';
    PageType = Card;
    SourceTable = "ICT Helpdesk";
    UsageCategory = Lists;

    layout
    {
        area(content)
        {
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
                    Visible = false;
                }
                field("Department Name"; Rec."Department Name")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field("Physical Station"; Rec."Physical Station")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field("Nature of Service"; Rec."Nature of Service")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field("Global Dimension 1 Code"; Rec."Global Dimension 1 Code")
                {
                    ApplicationArea = Basic;
                    Caption = 'Region Name';
                }
                field("Global Dimension 2 Code"; Rec."Global Dimension 2 Code")
                {
                    ApplicationArea = Basic;
                    Caption = 'Constituency Name';
                }
                field("Shortcut Dimension 1 Code"; Rec."Shortcut Dimension 1 Code")
                {
                    ApplicationArea = Basic;
                    Caption = 'Department Name';
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
            group("Part 2.2: Software Issues")
            {
                Editable = false;
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
            group("Please describe the issue here")
            {
                Editable = false;
                field("Description of the issue"; Rec."Description of the issue")
                {
                    ApplicationArea = Basic;
                    MultiLine = true;
                }
            }
            group(Assigned)
            {
                Caption = 'Assigned';
                Editable = true;
                Enabled = true;
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
        }
    }

    actions
    {
        area(processing)
        {
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
            action("Assign Task")
            {
                ApplicationArea = Basic;
                Image = Forecast;
                Promoted = true;
                PromotedCategory = Process;

                trigger OnAction()
                begin
                    if Confirm('Are you sure you want to assign the ICT helpdesk issue?' + ' ' + Rec."Job No.") = true then begin
                        Rec."Escalated By" := UpperCase(UserId);
                        Rec."Escalated Date" := Today;
                        Rec."Escalated Time" := Time;
                        Rec.Status := Rec.Status::Assigned;
                        Rec.Modify;
                    end;

                    //Notify the requester that the issue has been escalated
                    ObjComInfo.Get;
                    SenderEmailAddress := ObjComInfo."Administrator Email";
                    SenderName := COMPANYNAME;
                    if UserSetup.Get(Rec."Requesting Officer") then
                        Recipient := UserSetup."E-Mail";
                    Subject := 'ISSUE ESCALATION' + ' ' + Rec."Job No.";
                    Body := 'Please note that the issue on the subject above has been assigned to ' + '  ' + Rec."Assigned To";
                    ObjNotify.FnSendEmail(SenderEmailAddress, SenderName, Recipient, Subject, Body);

                    //Notify the Escalted To that the issue has been escalated
                    ObjComInfo.Get;
                    SenderEmailAddress := ObjComInfo."Administrator Email";
                    SenderName := COMPANYNAME;
                    if UserSetup.Get(Rec."Escalated To") then
                        Recipient := UserSetup."E-Mail";
                    Subject := 'ICT ISSUE ASSIGNMENT' + ' ' + Rec."Job No.";
                    Body := 'Please note that the issue on the subject above has been assigned to you';
                    ObjNotify.FnSendEmail(SenderEmailAddress, SenderName, Recipient, Subject, Body);

                    CurrPage.Close;
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
        ICTHelpdesk: Record "ICT Helpdesk";
        Mapping: Record "ICT Officers Category Mapping";
}
