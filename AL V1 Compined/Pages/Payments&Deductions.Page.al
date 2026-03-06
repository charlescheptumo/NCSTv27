#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Page 69006 "Payments & Deductions"
{
    PageType = List;
    SourceTable = "Assignment Matrix-X";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Employee No"; Rec."Employee No")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field(Type; Rec.Type)
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field("Code"; Rec.Code)
                {
                    ApplicationArea = Basic;
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = Basic;
                }
                field("Payroll Period"; Rec."Payroll Period")
                {
                    ApplicationArea = Basic;
                    Visible = true;
                }
                field("Reference No"; Rec."Reference No")
                {
                    ApplicationArea = Basic;
                }
                field("Days Worked/Lost"; Rec."Days Worked/Lost")
                {
                    ApplicationArea = Basic;
                }
                field("No. Of Hours"; Rec."No. Of Hours")
                {
                    ApplicationArea = Basic;
                }
                field(Amount; Rec.Amount)
                {
                    ApplicationArea = Basic;
                }
                field("Insurance Code"; Rec."Insurance Code")
                {
                    ApplicationArea = Basic;
                }
                field("Effective Start Date"; Rec."Effective Start Date")
                {
                    ApplicationArea = Basic;
                }
                field("Effective End Date"; Rec."Effective End Date")
                {
                    ApplicationArea = Basic;
                }
                field("Basic Salary Code"; Rec."Basic Salary Code")
                {
                    ApplicationArea = Basic;
                }
                field("Opening Balance"; Rec."Opening Balance")
                {
                    ApplicationArea = Basic;
                }
                field("Closing Balance"; Rec."Closing Balance")
                {
                    ApplicationArea = Basic;
                }
                field("Employee Voluntary"; Rec."Employee Voluntary")
                {
                    ApplicationArea = Basic;
                }
                field("Employer Amount"; Rec."Employer Amount")
                {
                    ApplicationArea = Basic;
                }
                field("Next Period Entry"; Rec."Next Period Entry")
                {
                    ApplicationArea = Basic;
                }
                field("Posting Group Filter"; Rec."Posting Group Filter")
                {
                    ApplicationArea = Basic;
                }
                field("Profit Centre"; Rec."Profit Centre")
                {
                    ApplicationArea = Basic;
                }
                field(Branch; Rec.Branch)
                {
                    ApplicationArea = Basic;
                }
                field("Department Code"; Rec."Department Code")
                {
                    ApplicationArea = Basic;
                }
                field("Staffing Group"; Rec."Staffing Group")
                {
                    ApplicationArea = Basic;
                }
                field("Pay Point"; Rec."Pay Point")
                {
                    ApplicationArea = Basic;
                }
                field("Payroll Grouping"; Rec."Payroll Grouping")
                {
                    ApplicationArea = Basic;
                }
                field(Rank; Rec.Rank)
                {
                    ApplicationArea = Basic;
                }
                field("Non-Cash Benefit"; Rec."Non-Cash Benefit")
                {
                    ApplicationArea = Basic;
                }
                field(Taxable; Rec.Taxable)
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
