#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Page 75082 "Specifications Voucher Line"
{
    PageType = List;
    SourceTable = Item;
    SourceTableView = where("Bill Item Group Code" = filter(<> ''),
                            Description = filter(<> ''));
    ApplicationArea = All;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("No."; Rec."No.")
                {
                    ApplicationArea = Basic;
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = Basic;
                }
                field("Bill Item Group Code"; Rec."Bill Item Group Code")
                {
                    ApplicationArea = Basic;
                }
                field("Base Unit of Measure"; Rec."Base Unit of Measure")
                {
                    ApplicationArea = Basic;
                }
                field(Quantity; Rec.Quantity)
                {
                    ApplicationArea = Basic;
                }
                field("Amount Excl. VAT"; Rec."Amount Excl. VAT")
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
