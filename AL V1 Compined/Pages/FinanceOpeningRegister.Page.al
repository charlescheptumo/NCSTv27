#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Page 75272 "Finance Opening Register"
{
    ApplicationArea = Basic;
    CardPageID = "Finance Opening Register Card";
    PageType = List;
    SourceTable = "Bid Opening Register";
    SourceTableView = where(Type = const(Finance));
    UsageCategory = Tasks;

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
                field("IFS Code"; Rec."IFS Code")
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
                field("No. of Intention To Bid Vendor"; Rec."No. of Intention To Bid Vendor")
                {
                    ApplicationArea = Basic;
                }
                field("No. of Submitted Bids"; Rec."No. of Submitted Bids")
                {
                    ApplicationArea = Basic;
                }
                field("No. Series"; Rec."No. Series")
                {
                    ApplicationArea = Basic;
                }
                field("Created By"; Rec."Created By")
                {
                    ApplicationArea = Basic;
                }
                field("Created Date"; Rec."Created Date")
                {
                    ApplicationArea = Basic;
                }
                field("Created Time"; Rec."Created Time")
                {
                    ApplicationArea = Basic;
                }
                field("Primary Region"; Rec."Primary Region")
                {
                    ApplicationArea = Basic;
                }
                field("Appointed Bid Opening Com"; Rec."Appointed Bid Opening Com")
                {
                    ApplicationArea = Basic;
                }
                field("Bid Envelop Type"; Rec."Bid Envelop Type")
                {
                    ApplicationArea = Basic;
                }
                field("Bid Unsealing Type"; Rec."Bid Unsealing Type")
                {
                    ApplicationArea = Basic;
                }
                field("Final Opening Done"; Rec."Final Opening Done")
                {
                    ApplicationArea = Basic;
                }
                field("Tender Evaluation Deadline"; Rec."Tender Evaluation Deadline")
                {
                    ApplicationArea = Basic;
                }
                field("Bid Register No."; Rec."Bid Register No.")
                {
                    ApplicationArea = Basic;
                }
                field("Required Bid Security Amount"; Rec."Required Bid Security Amount")
                {
                    ApplicationArea = Basic;
                }
                field("Bid Opening Venue"; Rec."Bid Opening Venue")
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
