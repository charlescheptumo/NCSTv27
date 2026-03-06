#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Page 59016 "Daily Work Ticket Lines"
{
    PageType = ListPart;
    SourceTable = "Daily Work Ticket Lines";

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
                field("Date of Request"; Rec."Date of Request")
                {
                    ApplicationArea = Basic;
                }
                field("Opening Odometer Reading"; Rec."Opening Odometer Reading")
                {
                    ApplicationArea = Basic;
                }
                field("Daily Work Ticket"; Rec."Daily Work Ticket")
                {
                    ApplicationArea = Basic;
                }
                field("Closing Odometer Reading"; Rec."Closing Odometer Reading")
                {
                    ApplicationArea = Basic;
                }
                field("Total Kilometres"; Rec."Total Kilometres")
                {
                    ApplicationArea = Basic;
                }
                field(EntryNo; Rec.EntryNo)
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
                field("Fuel Drawn(Litres)"; Rec."Fuel Drawn(Litres)")
                {
                    ApplicationArea = Basic;
                }
                field("Order No"; Rec."Order No")
                {
                    ApplicationArea = Basic;
                }
                field("Authorized By"; Rec."Authorized By")
                {
                    ApplicationArea = Basic;
                }
                field(Position; Rec.Position)
                {
                    ApplicationArea = Basic;
                }
                field("Driver Name"; Rec."Driver Name")
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
