#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Page 69000 Earnings
{
    ApplicationArea = Basic;
    DeleteAllowed = false;
    PageType = List;
    SourceTable = EarningsX;
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
                field(Description; Rec.Description)
                {
                    ApplicationArea = Basic;
                }
                field("Show on Master Roll"; Rec."Show on Master Roll")
                {
                    ApplicationArea = Basic;
                }
                field("Show No.of Days"; Rec."Show No.of Days")
                {
                    ApplicationArea = Basic;
                }
                field("Show No.of Hours"; Rec."Show No.of Hours")
                {
                    ApplicationArea = Basic;
                }
                field("Basic Pay Arrears"; Rec."Basic Pay Arrears")
                {
                    ApplicationArea = Basic;
                }
                field("Basic Salary Code"; Rec."Basic Salary Code")
                {
                    ApplicationArea = Basic;
                }
                field("KRA Classification"; Rec."KRA Classification")
                {
                    ApplicationArea = Basic;
                }
                field("Responsibility Allowance Code"; Rec."Responsibility Allowance Code")
                {
                    ApplicationArea = Basic;
                }
                field("Commuter Allowance Code"; Rec."Commuter Allowance Code")
                {
                    ApplicationArea = Basic;
                }
                field("House Allowance Code"; Rec."House Allowance Code")
                {
                    ApplicationArea = Basic;
                }
                field("Earning Type"; Rec."Earning Type")
                {
                    ApplicationArea = Basic;
                }
                field("Fluctuation Type"; Rec."Fluctuation Type")
                {
                    ApplicationArea = Basic;
                }
                field("Applies to All"; Rec."Applies to All")
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
                field(Block; Rec.Block)
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
                field(Taxable; Rec.Taxable)
                {
                    ApplicationArea = Basic;
                }
                field("Reduces Tax"; Rec."Reduces Tax")
                {
                    ApplicationArea = Basic;
                }
                field("Non-Cash Benefit"; Rec."Non-Cash Benefit")
                {
                    ApplicationArea = Basic;
                }
                field(OverTime; Rec.OverTime)
                {
                    ApplicationArea = Basic;
                }
                field("Low Interest Benefit"; Rec."Low Interest Benefit")
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
                field("Total Amount"; Rec."Total Amount")
                {
                    ApplicationArea = Basic;
                }
                field("Show Balance"; Rec."Show Balance")
                {
                    ApplicationArea = Basic;
                }
                field("Show on Report"; Rec."Show on Report")
                {
                    ApplicationArea = Basic;
                }
                field("Total Days"; Rec."Total Days")
                {
                    ApplicationArea = Basic;
                }
                field("Negative Earning"; Rec."Negative Earning")
                {
                    ApplicationArea = Basic;
                }
                field("Date Filter"; Rec."Date Filter")
                {
                    ApplicationArea = Basic;
                }
                field("Posting Group Filter"; Rec."Posting Group Filter")
                {
                    ApplicationArea = Basic;
                }
                field("Pay Period Filter"; Rec."Pay Period Filter")
                {
                    ApplicationArea = Basic;
                }
                field("Payroll Grouping Filter"; Rec."Payroll Grouping Filter")
                {
                    ApplicationArea = Basic;
                }
                field("ProfitCtr Filter"; Rec."ProfitCtr Filter")
                {
                    ApplicationArea = Basic;
                }
                field("Branch Filter"; Rec."Branch Filter")
                {
                    ApplicationArea = Basic;
                }
                field("Department Filter"; Rec."Department Filter")
                {
                    ApplicationArea = Basic;
                }
                field("Rank Filter"; Rec."Rank Filter")
                {
                    ApplicationArea = Basic;
                }
                field("Exclude Housing Levy"; Rec."Exclude Housing Levy")
                {
                    ApplicationArea = Basic;
                }
            }
        }
        area(factboxes)
        {
            systempart(Control1000000036; Notes)
            {
            }
            systempart(Control1000000037; MyNotes)
            {
            }
            systempart(Control1000000038; Links)
            {
            }
        }
    }

    actions
    {
    }
}
