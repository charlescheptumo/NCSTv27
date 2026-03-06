#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Page 75333 "IFP Opening Register"
{
    CardPageID = "IFP Opening Register Card";
    Editable = false;
    PageType = List;
    SourceTable = "Bid Opening Register";
    SourceTableView = where(Type = const(Technical),
                            "Tender Number" = const('1'));
    ApplicationArea = All;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Code"; Rec.Code)
                {
                    ApplicationArea = Basic;
                }
                field("Opening Person 5"; Rec."Opening Person 5")
                {
                    ApplicationArea = Basic;
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = Basic;
                }
                field("Tender Name"; Rec."Tender Name")
                {
                    ApplicationArea = Basic;
                }
                field("Bid Opening Date"; Rec."Bid Opening Date")
                {
                    ApplicationArea = Basic;
                }
                field("Bid Opening Start Time"; Rec."Bid Opening Start Time")
                {
                    ApplicationArea = Basic;
                }
                field("Bid Opening End Date"; Rec."Bid Opening End Date")
                {
                    ApplicationArea = Basic;
                }
                field("Bid Opening End Time"; Rec."Bid Opening End Time")
                {
                    ApplicationArea = Basic;
                }
                field("Pre-bid Purchaser Code"; Rec."Pre-bid Purchaser Code")
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
