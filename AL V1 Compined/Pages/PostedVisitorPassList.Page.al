#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Page 56068 "Posted Visitor Pass List"
{
    ApplicationArea = Basic;
    CardPageID = "Posted Visitor Pass";
    DeleteAllowed = false;
    Editable = false;
    InsertAllowed = false;
    ModifyAllowed = false;
    PageType = List;
    SourceTable = "Visitors Pass";
    SourceTableView = where(Status = filter(Released));
    UsageCategory = History;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field(No; Rec.No)
                {
                    ApplicationArea = Basic;
                }
                field("Document Date"; Rec."Document Date")
                {
                    ApplicationArea = Basic;
                }
                field("Date of visit"; Rec."Date of visit")
                {
                    ApplicationArea = Basic;
                }
                field("Time of visit"; Rec."Time of visit")
                {
                    ApplicationArea = Basic;
                }
                field("Visitor Name"; Rec."Visitor Name")
                {
                    ApplicationArea = Basic;
                }
                field("ID No"; Rec."ID No")
                {
                    ApplicationArea = Basic;
                }
                field(From; Rec.From)
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
