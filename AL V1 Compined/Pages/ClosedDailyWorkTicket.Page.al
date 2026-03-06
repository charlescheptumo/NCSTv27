#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Page 59023 "Closed Daily Work Ticket"
{
    ApplicationArea = Basic;
    CardPageID = "Closed Daily Work Ticket Card";
    DeleteAllowed = false;
    Editable = false;
    PageType = List;
    SourceTable = "Dialy Work Ticket Header";
    SourceTableView = where(Status = const(Closed));
    UsageCategory = History;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Daily Work Ticket"; Rec."Daily Work Ticket")
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
                field(Status; Rec.Status)
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
                field("Closed by"; Rec."Closed by")
                {
                    ApplicationArea = Basic;
                }
                field("Date Closed"; Rec."Date Closed")
                {
                    ApplicationArea = Basic;
                }
                field("Opening Odometer"; Rec."Opening Odometer")
                {
                    ApplicationArea = Basic;
                }
                field("Closing Odometer"; Rec."Closing Odometer")
                {
                    ApplicationArea = Basic;
                }
                field("Created By"; Rec."Created By")
                {
                    ApplicationArea = Basic;
                }
                field("Date Created"; Rec."Date Created")
                {
                    ApplicationArea = Basic;
                }
                field("Time Created"; Rec."Time Created")
                {
                    ApplicationArea = Basic;
                }
                field("Total Km's Covered"; Rec."Total Km's Covered")
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
