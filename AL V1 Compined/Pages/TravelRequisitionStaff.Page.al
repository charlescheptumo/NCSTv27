#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Page 59017 "Travel Requisition Staff"
{
    CardPageID = "Fleet Requisition Card";
    PageType = ListPart;
    SourceTable = "Travel Requisition Staff";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Req No"; Rec."Req No")
                {
                    ApplicationArea = Basic;
                }
                field("Employee No"; Rec."Employee No")
                {
                    ApplicationArea = Basic;
                    LookupPageID = "Employee List";
                    TableRelation = Employee;
                }
                field("Employee Name"; Rec."Employee Name")
                {
                    ApplicationArea = Basic;
                }
                field(Position; Rec.Position)
                {
                    ApplicationArea = Basic;
                }
                field("Daily Work Ticket"; Rec."Daily Work Ticket")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field(EntryNo; Rec.EntryNo)
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
