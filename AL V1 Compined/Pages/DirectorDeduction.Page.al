#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Page 69091 "Director Deduction"
{
    ApplicationArea = Basic;
    DeleteAllowed = false;
    PageType = List;
    SourceTable = "Director Deductions";
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
                field(Type; Rec.Type)
                {
                    ApplicationArea = Basic;
                }
                field("Tax deductible"; Rec."Tax deductible")
                {
                    ApplicationArea = Basic;
                }
                field("Start date"; Rec."Start date")
                {
                    ApplicationArea = Basic;
                }
                field("End Date"; Rec."End Date")
                {
                    ApplicationArea = Basic;
                }
                field(Percentage; Rec.Percentage)
                {
                    ApplicationArea = Basic;
                }
                field("Calculation Method"; Rec."Calculation Method")
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
                field("Flat Amount"; Rec."Flat Amount")
                {
                    ApplicationArea = Basic;
                }
                field("Total Amount"; Rec."Total Amount")
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
                field(Loan; Rec.Loan)
                {
                    ApplicationArea = Basic;
                }
                field("Maximum Amount"; Rec."Maximum Amount")
                {
                    ApplicationArea = Basic;
                }
                field("Pay Period Filter"; Rec."Pay Period Filter")
                {
                    ApplicationArea = Basic;
                }
                field("Pension Scheme"; Rec."Pension Scheme")
                {
                    ApplicationArea = Basic;
                }
                field("Deduction Table"; Rec."Deduction Table")
                {
                    ApplicationArea = Basic;
                }
                field("G/L Account Employer"; Rec."G/L Account Employer")
                {
                    ApplicationArea = Basic;
                }
                field("Percentage Employer"; Rec."Percentage Employer")
                {
                    ApplicationArea = Basic;
                }
                field("Minimum Amount"; Rec."Minimum Amount")
                {
                    ApplicationArea = Basic;
                }
                field("Flat Amount Employer"; Rec."Flat Amount Employer")
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
                field("Director Filter"; Rec."Director Filter")
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
                field("Show on report"; Rec."Show on report")
                {
                    ApplicationArea = Basic;
                }
                field("PAYE Code"; Rec."PAYE Code")
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
                field("Insurance Code"; Rec."Insurance Code")
                {
                    ApplicationArea = Basic;
                }
                field(Block; Rec.Block)
                {
                    ApplicationArea = Basic;
                }
                field("Institution Code"; Rec."Institution Code")
                {
                    ApplicationArea = Basic;
                }
                field("Show on Payslip Information"; Rec."Show on Payslip Information")
                {
                    ApplicationArea = Basic;
                }
                field(Statutory; Rec.Statutory)
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
            systempart(Control1000000042; Outlook)
            {
            }
            systempart(Control1000000043; Notes)
            {
            }
            systempart(Control1000000044; MyNotes)
            {
            }
            systempart(Control1000000045; Links)
            {
            }
        }
    }

    actions
    {
    }
}
