#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Page 69090 "Directors Earnings"
{
    ApplicationArea = Basic;
    PageType = List;
    SourceTable = "Directors Earnings";
    UsageCategory = Lists;

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
                field("Start Date"; Rec."Start Date")
                {
                    ApplicationArea = Basic;
                }
                field("End Date"; Rec."End Date")
                {
                    ApplicationArea = Basic;
                }
                field(Taxable; Rec.Taxable)
                {
                    ApplicationArea = Basic;
                }
                field("Per Diem"; Rec."Per Diem")
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
                field("Account Type"; Rec."Account Type")
                {
                    ApplicationArea = Basic;
                }
                field("Account No."; Rec."Account No.")
                {
                    ApplicationArea = Basic;
                }
                field("Total Amount"; Rec."Total Amount")
                {
                    ApplicationArea = Basic;
                }
                field("Non-Cash Benefit"; Rec."Non-Cash Benefit")
                {
                    ApplicationArea = Basic;
                }
                field("Minimum Limit"; Rec."Minimum Limit")
                {
                    ApplicationArea = Basic;
                }
                field("Maximum Limit"; Rec."Maximum Limit")
                {
                    ApplicationArea = Basic;
                }
                field("Reduces Tax"; Rec."Reduces Tax")
                {
                    ApplicationArea = Basic;
                }
                field("Show Balance"; Rec."Show Balance")
                {
                    ApplicationArea = Basic;
                }
                field(CoinageRounding; Rec.CoinageRounding)
                {
                    ApplicationArea = Basic;
                }
                field("Opening Balance"; Rec."Opening Balance")
                {
                    ApplicationArea = Basic;
                }
                field("Department Filter"; Rec."Department Filter")
                {
                    ApplicationArea = Basic;
                }
                field(Months; Rec.Months)
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
                field("No of Entries"; Rec."No of Entries")
                {
                    ApplicationArea = Basic;
                }
            }
        }
        area(factboxes)
        {
            systempart(Control1000000037; Notes)
            {
            }
            systempart(Control1000000038; MyNotes)
            {
            }
            systempart(Control1000000039; Outlook)
            {
            }
        }
    }

    actions
    {
    }
}
