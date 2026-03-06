#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Page 69020 "Earnings List"
{
    Editable = false;
    PageType = List;
    SourceTable = EarningsX;

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
                field(Description; Rec.Description)
                {
                    ApplicationArea = Basic;
                }
                field("Pay Type"; Rec."Pay Type")
                {
                    ApplicationArea = Basic;
                }
                field(Taxable; Rec.Taxable)
                {
                    ApplicationArea = Basic;
                }
                field("Calculation Method"; Rec."Calculation Method")
                {
                    ApplicationArea = Basic;
                }
                field("Flat Amount"; Rec."Flat Amount")
                {
                    ApplicationArea = Basic;
                }
                field(Percentage; Rec.Percentage)
                {
                    ApplicationArea = Basic;
                }
                field("Total Amount"; Rec."Total Amount")
                {
                    ApplicationArea = Basic;
                }
                field("Reduces Tax"; Rec."Reduces Tax")
                {
                    ApplicationArea = Basic;
                }
                field("Show on Report"; Rec."Show on Report")
                {
                    ApplicationArea = Basic;
                }
                field("Earning Type"; Rec."Earning Type")
                {
                    ApplicationArea = Basic;
                }
                field("Applies to All"; Rec."Applies to All")
                {
                    ApplicationArea = Basic;
                }
                field("Show on Master Roll"; Rec."Show on Master Roll")
                {
                    ApplicationArea = Basic;
                }
                field(Block; Rec.Block)
                {
                    ApplicationArea = Basic;
                }
                field("Basic Pay Arrears"; Rec."Basic Pay Arrears")
                {
                    ApplicationArea = Basic;
                }
                field("Negative Earning"; Rec."Negative Earning")
                {
                    ApplicationArea = Basic;
                }
                field("Show No.of Days"; Rec."Show No.of Days")
                {
                    ApplicationArea = Basic;
                }
                field("KRA Classification"; Rec."KRA Classification")
                {
                    ApplicationArea = Basic;
                }
                field("Fluctuation Type"; Rec."Fluctuation Type")
                {
                    ApplicationArea = Basic;
                }
            }
        }
        area(factboxes)
        {
            systempart(Control1000000023; Notes)
            {
            }
            systempart(Control1000000024; MyNotes)
            {
            }
            systempart(Control1000000025; Links)
            {
            }
        }
    }

    actions
    {
    }
}
