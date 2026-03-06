#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Page 56121 MyHeldeskRequests
{
    PageType = List;
    SourceTable = "ICT Helpdesk";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Job No."; Rec."Job No.")
                {
                    ApplicationArea = Basic;
                }
                field("Assigned To"; Rec."Assigned To")
                {
                    ApplicationArea = Basic;
                }
                field("Assigned Date"; Rec."Assigned Date")
                {
                    ApplicationArea = Basic;
                }
                field("Assigned Time"; Rec."Assigned Time")
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
                field("Ascalation Details"; Rec."Ascalation Details")
                {
                    ApplicationArea = Basic;
                }
                field("Assigned To EmpNo"; Rec."Assigned To EmpNo")
                {
                    ApplicationArea = Basic;
                }
                field("Escalated To EmpNo"; Rec."Escalated To EmpNo")
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
                }
                field("Software Installation"; Rec."Software Installation")
                {
                    ApplicationArea = Basic;
                }
                field("Others, specify SW"; Rec."Others, specify SW")
                {
                    ApplicationArea = Basic;
                }
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
                }
                field("Attended Date"; Rec."Attended Date")
                {
                    ApplicationArea = Basic;
                }
                field("Employee No"; Rec."Employee No")
                {
                    ApplicationArea = Basic;
                }
                field("Attended Time"; Rec."Attended Time")
                {
                    ApplicationArea = Basic;
                }
                field("Technical Staff Remarks"; Rec."Technical Staff Remarks")
                {
                    ApplicationArea = Basic;
                }
                field("Requesting Officer Remarks"; Rec."Requesting Officer Remarks")
                {
                    ApplicationArea = Basic;
                }
                field("Attended by Name"; Rec."Attended by Name")
                {
                    ApplicationArea = Basic;
                }
                field(Status; Rec.Status)
                {
                    ApplicationArea = Basic;
                }
                field("No. Series"; Rec."No. Series")
                {
                    ApplicationArea = Basic;
                }
                field("ICT Issue Category"; Rec."ICT Issue Category")
                {
                    ApplicationArea = Basic;
                }
                field("Escalated To"; Rec."Escalated To")
                {
                    ApplicationArea = Basic;
                }
                field("Escalated By"; Rec."Escalated By")
                {
                    ApplicationArea = Basic;
                }
                field("Escalated Date"; Rec."Escalated Date")
                {
                    ApplicationArea = Basic;
                }
                field("Escalated Time"; Rec."Escalated Time")
                {
                    ApplicationArea = Basic;
                }
                field("Requester Feedback"; Rec."Requester Feedback")
                {
                    ApplicationArea = Basic;
                }
                field(Reopened; Rec.Reopened)
                {
                    ApplicationArea = Basic;
                }
                field("Reopened By"; Rec."Reopened By")
                {
                    ApplicationArea = Basic;
                }
                field("Feed Back Given"; Rec."Feed Back Given")
                {
                    ApplicationArea = Basic;
                }
                field("Global Dimension 1 Code"; Rec."Global Dimension 1 Code")
                {
                    ApplicationArea = Basic;
                }
                field("Global Dimension 2 Code"; Rec."Global Dimension 2 Code")
                {
                    ApplicationArea = Basic;
                }
                field("Shortcut Dimension 1 Code"; Rec."Shortcut Dimension 1 Code")
                {
                    ApplicationArea = Basic;
                }
                field("Region Name"; Rec."Region Name")
                {
                    ApplicationArea = Basic;
                }
                field("Constituency Name"; Rec."Constituency Name")
                {
                    ApplicationArea = Basic;
                }
                field("Description of the issue"; Rec."Description of the issue")
                {
                    ApplicationArea = Basic;
                }
            }
        }
    }

    actions
    {
    }
}
