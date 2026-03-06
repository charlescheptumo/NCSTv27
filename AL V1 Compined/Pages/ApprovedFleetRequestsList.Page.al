#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Page 59018 "Approved Fleet Requests List"
{
    ApplicationArea = Basic;
    CardPageID = "Fleet Requisition Card";
    DeleteAllowed = false;
    PageType = List;
    SourceTable = "Transport Requisition";
    SourceTableView = order(ascending)
                      where(Status = const(Approved));
    UsageCategory = Lists;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Transport Requisition No"; Rec."Transport Requisition No")
                {
                    ApplicationArea = Basic;
                }
                field(Commencement; Rec.Commencement)
                {
                    ApplicationArea = Basic;
                }
                field(Destination; Rec.Destination)
                {
                    ApplicationArea = Basic;
                }
                field("Vehicle Allocated"; Rec."Vehicle Allocated")
                {
                    ApplicationArea = Basic;
                }
                field("Driver Allocated"; Rec."Driver Allocated")
                {
                    ApplicationArea = Basic;
                }
                field("Requested By"; Rec."Requested By")
                {
                    ApplicationArea = Basic;
                }
                field("Date of Request"; Rec."Date of Request")
                {
                    ApplicationArea = Basic;
                }
                field("Vehicle Allocated by"; Rec."Vehicle Allocated by")
                {
                    ApplicationArea = Basic;
                }
                field("Opening Odometer Reading"; Rec."Opening Odometer Reading")
                {
                    ApplicationArea = Basic;
                }
                field(Status; Rec.Status)
                {
                    ApplicationArea = Basic;
                }
                field("Date of Trip"; Rec."Date of Trip")
                {
                    ApplicationArea = Basic;
                }
                field("Purpose of Trip"; Rec."Purpose of Trip")
                {
                    ApplicationArea = Basic;
                }
                field(Comments; Rec.Comments)
                {
                    ApplicationArea = Basic;
                }
                field(Department; Rec.Department)
                {
                    ApplicationArea = Basic;
                }
                field("Driver Name"; Rec."Driver Name")
                {
                    ApplicationArea = Basic;
                }
                field("Responsibility Center"; Rec."Responsibility Center")
                {
                    ApplicationArea = Basic;
                }
                field("Loaded to WorkTicket"; Rec."Loaded to WorkTicket")
                {
                    ApplicationArea = Basic;
                }
                field("Time out"; Rec."Time out")
                {
                    ApplicationArea = Basic;
                }
                field("Time In"; Rec."Time In")
                {
                    ApplicationArea = Basic;
                }
                field("Journey Route"; Rec."Journey Route")
                {
                    ApplicationArea = Basic;
                }
                field("Time Requested"; Rec."Time Requested")
                {
                    ApplicationArea = Basic;
                }
                field("Closing Odometer Reading"; Rec."Closing Odometer Reading")
                {
                    ApplicationArea = Basic;
                }
                field("Work Ticket No"; Rec."Work Ticket No")
                {
                    ApplicationArea = Basic;
                }
                field("No of Days Requested"; Rec."No of Days Requested")
                {
                    ApplicationArea = Basic;
                }
                field("Authorized  By"; Rec."Authorized  By")
                {
                    ApplicationArea = Basic;
                }
                field(Position; Rec.Position)
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
