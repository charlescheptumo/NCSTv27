#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Page 75086 "Vendor Audited Balance Sheet"
{
    PageType = List;
    SourceTable = "Vendor Audited Balance Sheet";

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
                field("Current Assets (LCY)"; Rec."Current Assets (LCY)")
                {
                    ApplicationArea = Basic;
                }
                field("Fixed Assets (LCY)"; Rec."Fixed Assets (LCY)")
                {
                    ApplicationArea = Basic;
                }
                field("Total Assets (LCY)"; Rec."Total Assets (LCY)")
                {
                    ApplicationArea = Basic;
                }
                field("Current Liabilities (LCY)"; Rec."Current Liabilities (LCY)")
                {
                    ApplicationArea = Basic;
                }
                field("Long-term Liabilities (LCY)"; Rec."Long-term Liabilities (LCY)")
                {
                    ApplicationArea = Basic;
                }
                field("Total Liabilities (LCY)"; Rec."Total Liabilities (LCY)")
                {
                    ApplicationArea = Basic;
                }
                field("Owners Equity (LCY)"; Rec."Owners Equity (LCY)")
                {
                    ApplicationArea = Basic;
                }
                field("Total Liabilities & Equity(LCY"; Rec."Total Liabilities & Equity(LCY")
                {
                    ApplicationArea = Basic;
                }
                field("Debt Ratio"; Rec."Debt Ratio")
                {
                    ApplicationArea = Basic;
                }
                field("Current Ratio"; Rec."Current Ratio")
                {
                    ApplicationArea = Basic;
                }
                field("Working Capital (LCY)"; Rec."Working Capital (LCY)")
                {
                    ApplicationArea = Basic;
                }
                field("Assets-To-Equity Ratio"; Rec."Assets-To-Equity Ratio")
                {
                    ApplicationArea = Basic;
                }
                field("Debt-To-Equity Ratio"; Rec."Debt-To-Equity Ratio")
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
