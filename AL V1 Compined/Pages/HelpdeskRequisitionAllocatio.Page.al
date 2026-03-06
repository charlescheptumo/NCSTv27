#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Page 56217 "Helpdesk Requisition Allocatio"
{
    Caption = 'Helpdesk Requisition Allocation';
    CardPageID = "ICT HelpdeskAllocation";
    PageType = List;
    SourceTable = "ICT Helpdesk";
    SourceTableView = where(Status = filter(Pending));

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
                field("Requesting Officer"; Rec."Requesting Officer")
                {
                    ApplicationArea = Basic;
                }
                field("Requesting Officer Name"; Rec."Requesting Officer Name")
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
                field(Email; Rec.Email)
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
                field("Assigned To"; Rec."Assigned To")
                {
                    ApplicationArea = Basic;
                }
                field("Attended By"; Rec."Attended By")
                {
                    ApplicationArea = Basic;
                }
                field(Status; Rec.Status)
                {
                    ApplicationArea = Basic;
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
            action(Resolve)
            {
                ApplicationArea = Basic;
                Image = Close;
                Promoted = true;
                PromotedCategory = Process;

                trigger OnAction()
                begin
                    Rec.TestField(Rec."Action Taken");
                    if Confirm('Are you sure you want to Close the ICT helpdesk issue?') = true then begin
                        Rec."Attended Date" := Today;
                        Rec."Attended By" := UpperCase(UserId);
                        Rec."Attended Time" := Time;
                        Rec.Status := Rec.Status::Resolved;
                        Rec.Modify;
                    end;
                end;
            }
            action(Escalate)
            {
                ApplicationArea = Basic;
                Image = Forecast;
                Promoted = true;
                PromotedCategory = Process;
            }
            action("Assign Task")
            {
                ApplicationArea = Basic;
                Image = Forecast;
                Promoted = true;
                PromotedCategory = Process;
            }
        }
    }
}
