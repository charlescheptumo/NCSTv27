#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Page 90007 "Submitted Tender Bids"
{
    ApplicationArea = Basic;
    Caption = 'Submitted Tender Bids';
    Editable = false;
    PageType = List;
    SourceTable = "Tender Bids";
    UsageCategory = Lists;

    layout
    {
        area(content)
        {
            repeater(Control1000000000)
            {
                field("Requisition No"; Rec."Requisition No")
                {
                    ApplicationArea = Basic;
                }
                field("Vendor No"; Rec."Vendor No")
                {
                    ApplicationArea = Basic;
                }
                field("Linked vendor"; Rec."Linked vendor")
                {
                    ApplicationArea = Basic;
                }
                field("Bidder Name"; Rec."Bidder Name")
                {
                    ApplicationArea = Basic;
                }
                field("Bidder Email"; Rec."Bidder Email")
                {
                    ApplicationArea = Basic;
                }
                field("Item No"; Rec."Item No")
                {
                    ApplicationArea = Basic;
                }
                field(Type; Rec.Type)
                {
                    ApplicationArea = Basic;
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = Basic;
                }
                field(Quantity; Rec.Quantity)
                {
                    ApplicationArea = Basic;
                }
                field("Unit Price"; Rec."Unit Price")
                {
                    ApplicationArea = Basic;
                }
                field(Amount; Rec.Amount)
                {
                    ApplicationArea = Basic;
                }
                field("Tender Document Source"; Rec."Tender Document Source")
                {
                    ApplicationArea = Basic;
                }
                field("Respresentative Name"; Rec."Respresentative Name")
                {
                    ApplicationArea = Basic;
                }
                field("Representative Designation"; Rec."Representative Designation")
                {
                    ApplicationArea = Basic;
                }
                field(Remarks; Rec.Remarks)
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
