#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Page 56079 "ICT Helpdesk History"
{
    PageType = Card;
    SourceTable = "ICT Helpdesk";
    SourceTableView = where(Status = filter(Resolved));
    ApplicationArea = All;

    layout
    {
        area(content)
        {
            group(General)
            {
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
                    RowSpan = 3;
                }
            }
            group("Part 2.2: Software Issues")
            {
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
                    RowSpan = 3;
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
                }
                field("Attended Date"; Rec."Attended Date")
                {
                    ApplicationArea = Basic;
                    Caption = 'Date';
                }
                field("Attended Time"; Rec."Attended Time")
                {
                    ApplicationArea = Basic;
                    Caption = 'Time';
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
        }
    }
}
