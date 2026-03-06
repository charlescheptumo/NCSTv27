#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Page 70113 "Quotation Bids Per vendor"
{
    PageType = List;
    SourceTable = "Quotation Bids Per Line 1";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field(Type; Rec.Type)
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field(No; Rec.No)
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field(Quantity; Rec.Quantity)
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Unit Price"; Rec."Unit Price")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field(Amount; Rec.Amount)
                {
                    ApplicationArea = Basic;
                    Editable = false;
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
