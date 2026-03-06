#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Page 75004 "Solicitation Type"
{
    ApplicationArea = Basic;
    PageType = List;
    SourceTable = "Solicitation Type";
    UsageCategory = Administration;

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
                field("Default Procurement Method"; Rec."Default Procurement Method")
                {
                    ApplicationArea = Basic;
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = Basic;
                }
                field("Supplier Set"; Rec."Supplier Set")
                {
                    ApplicationArea = Basic;
                }
                field("Preliminary RFI"; Rec."Preliminary RFI")
                {
                    ApplicationArea = Basic;
                }
                field("Default Bid Selection Method"; Rec."Default Bid Selection Method")
                {
                    ApplicationArea = Basic;
                }
                field("Bid Evaluation Template"; Rec."Bid Evaluation Template")
                {
                    ApplicationArea = Basic;
                }
                field("No. of Invitations"; Rec."No. of Invitations")
                {
                    ApplicationArea = Basic;
                }
                field("No. of Responses"; Rec."No. of Responses")
                {
                    ApplicationArea = Basic;
                }
                field(Blocked; Rec.Blocked)
                {
                    ApplicationArea = Basic;
                }
            }
        }
        area(factboxes)
        {
            systempart(Control12; Outlook)
            {
            }
            systempart(Control13; Notes)
            {
            }
            systempart(Control14; MyNotes)
            {
            }
            systempart(Control15; Links)
            {
            }
            // chartpart("Q5402-01"; "Q5402-01")
            // {
            // }
        }
    }

    actions
    {
        area(navigation)
        {
            group(ActionGroup28)
            {
                Image = SalesPerson;
                action("Solicitation Schedule")
                {
                    ApplicationArea = Basic;
                    Image = Planning;
                    Promoted = true;
                    PromotedCategory = Process;
                    RunObject = Page "Solicitation Activity Schedule";
                    RunPageLink = "Solicitation Type ID" = field(Code);
                }
                action(RFIs)
                {
                    ApplicationArea = Basic;
                    Image = Info;
                    Promoted = true;
                    PromotedCategory = Category4;
                    RunObject = Page "Request For Information";
                    RunPageLink = "Solicitation Type" = field(Code);
                }
                action("Invitation For Supply")
                {
                    ApplicationArea = Basic;
                    Image = InwardEntry;
                    Promoted = true;
                    PromotedCategory = Category4;
                    RunObject = Page "Draft Invitation For Supply";
                    RunPageLink = "Solicitation Type" = field(Code);
                }
                action(Quotes)
                {
                    ApplicationArea = Basic;
                    Image = Quote;
                    Promoted = true;
                    PromotedCategory = Category4;
                    RunObject = Page "Purchase Quotes";
                    RunPageLink = "Solicitation Type" = field(Code);
                }
                action("Purchase Orders")
                {
                    ApplicationArea = Basic;
                    Image = "Order";
                    Promoted = true;
                    PromotedCategory = Category4;
                    RunObject = Page "Purchase Order List";
                    RunPageLink = "Solicitation Type" = field(Code);
                }
                action("Purchase Agreements")
                {
                    ApplicationArea = Basic;
                    Image = BlanketOrder;
                    Promoted = true;
                    PromotedCategory = Category4;
                    RunObject = Page "Blanket Purchase Orders";
                    RunPageLink = "Solicitation Type" = field(Code);
                }
                action("Procurement Types")
                {
                    ApplicationArea = Basic;
                    Image = Allocate;
                    Promoted = true;
                    PromotedCategory = Category4;
                    RunObject = Page "Solicitation Procurement Types";
                    RunPageLink = "Solicitation Type" = field(Code);
                }
                action("Procurement Activities")
                {
                    ApplicationArea = Basic;
                    Image = CapacityLedger;
                    Promoted = true;
                    PromotedCategory = Category4;
                    RunObject = Page "Solicitation Activity Schedule";
                    RunPageLink = "Solicitation Type ID" = field(Code);
                }
                action("Procurement plan entries")
                {
                    ApplicationArea = Basic;
                    Image = EntriesList;
                    Promoted = true;
                    PromotedCategory = Category4;
                    RunObject = Page "Procurement Plan Entry";
                    RunPageLink = "Solicitation Type" = field(Code);
                }
                action("Submitted Bids")
                {
                    ApplicationArea = Basic;
                    Image = Bin;
                    Promoted = true;
                    PromotedCategory = Process;
                    PromotedIsBig = true;
                    RunObject = Page Bidders;
                }
            }
        }
    }
}
