#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Page 70115 "Disposal Quotes per bidder"
{
    PageType = List;
    SourceTable = "Disposal Bids Per Line 1";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Disposal No"; Rec."Disposal No")
                {
                    ApplicationArea = Basic;
                }
                field("Document No."; Rec."Document No.")
                {
                    ApplicationArea = Basic;
                }
                field(Type; Rec.Type)
                {
                    ApplicationArea = Basic;
                }
                field(No; Rec.No)
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
                field(Amount; Rec.Amount)
                {
                    ApplicationArea = Basic;
                }
                field(Award; Rec.Award)
                {
                    ApplicationArea = Basic;
                }
                field(Customer; Rec.Customer)
                {
                    ApplicationArea = Basic;
                }
                field("Quoted Amount"; Rec."Quoted Amount")
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
