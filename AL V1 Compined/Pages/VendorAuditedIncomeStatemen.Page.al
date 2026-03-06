#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Page 75087 "Vendor Audited Income Statemen"
{
    Caption = 'Vendor Audited Income Statement';
    PageType = List;
    SourceTable = "Vendor Audited Income Statemen";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Vendor No."; Rec."Vendor No.")
                {
                    ApplicationArea = Basic;
                }
                field("Audit Year Code Reference"; Rec."Audit Year Code Reference")
                {
                    ApplicationArea = Basic;
                }
                field("Total Revenue (LCY)"; Rec."Total Revenue (LCY)")
                {
                    ApplicationArea = Basic;
                }
                field("Total COGS (LCY)"; Rec."Total COGS (LCY)")
                {
                    ApplicationArea = Basic;
                }
                field("Gross Margin (LCY)"; Rec."Gross Margin (LCY)")
                {
                    ApplicationArea = Basic;
                }
                field("Total Operating Expenses (LCY)"; Rec."Total Operating Expenses (LCY)")
                {
                    ApplicationArea = Basic;
                }
                field("Operating Income/EBIT (LCY)"; Rec."Operating Income/EBIT (LCY)")
                {
                    ApplicationArea = Basic;
                }
                field("Other Non-operating Re/Exp LCY"; Rec."Other Non-operating Re/Exp LCY")
                {
                    ApplicationArea = Basic;
                }
                field("Interest Expense (LCY)"; Rec."Interest Expense (LCY)")
                {
                    ApplicationArea = Basic;
                }
                field("Income Before Taxes (LCY)"; Rec."Income Before Taxes (LCY)")
                {
                    ApplicationArea = Basic;
                }
                field("Income Tax Expense (LCY)"; Rec."Income Tax Expense (LCY)")
                {
                    ApplicationArea = Basic;
                }
                field("Net Income from Ops  (LCY)"; Rec."Net Income from Ops  (LCY)")
                {
                    ApplicationArea = Basic;
                }
                field("Below-the-line Items (LCY)"; Rec."Below-the-line Items (LCY)")
                {
                    ApplicationArea = Basic;
                }
                field("Net Income"; Rec."Net Income")
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
