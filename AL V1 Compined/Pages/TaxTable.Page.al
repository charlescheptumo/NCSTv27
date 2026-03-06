#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Page 69001 "Tax Table"
{
    PageType = List;
    SourceTable = BracketsX;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Table Code"; Rec."Table Code")
                {
                    ApplicationArea = Basic;
                }
                field("Tax Band"; Rec."Tax Band")
                {
                    ApplicationArea = Basic;
                }
                field("Taxable Amount"; Rec."Taxable Amount")
                {
                    ApplicationArea = Basic;
                }
                field(Percentage; Rec.Percentage)
                {
                    ApplicationArea = Basic;
                }
                field("Lower Limit"; Rec."Lower Limit")
                {
                    ApplicationArea = Basic;
                }
                field("Upper Limit"; Rec."Upper Limit")
                {
                    ApplicationArea = Basic;
                }
                field(Amount; Rec.Amount)
                {
                    ApplicationArea = Basic;
                }
                field("From Date"; Rec."From Date")
                {
                    ApplicationArea = Basic;
                }
                field("End Date"; Rec."End Date")
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
