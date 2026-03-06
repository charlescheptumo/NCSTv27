#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Page 69050 "Closed Earnings/Deductions"
{
    ApplicationArea = Basic;
    Editable = false;
    PageType = List;
    SourceTable = "Assignment Matrix-X";
    SourceTableView = sorting("Employee No", Type, Code, "Payroll Period", "Reference No")
                      order(ascending)
                      where(Closed = const(true));
    UsageCategory = Lists;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Employee No"; Rec."Employee No")
                {
                    ApplicationArea = Basic;
                }
                field("First Name"; Rec."First Name")
                {
                    ApplicationArea = Basic;
                }
                field("Middle Name"; Rec."Middle Name")
                {
                    ApplicationArea = Basic;
                }
                field("Last Name"; Rec."Last Name")
                {
                    ApplicationArea = Basic;
                }
                field(Type; Rec.Type)
                {
                    ApplicationArea = Basic;
                }
                field("Code"; Rec.Code)
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
                field("Payroll Period"; Rec."Payroll Period")
                {
                    ApplicationArea = Basic;
                }
                field(Amount; Rec.Amount)
                {
                    ApplicationArea = Basic;
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = Basic;
                }
                field("Opening Balance"; Rec."Opening Balance")
                {
                    ApplicationArea = Basic;
                }
                field("KRA Classification"; Rec."KRA Classification")
                {
                    ApplicationArea = Basic;
                }
                field("Advance Interest"; Rec."Advance Interest")
                {
                    ApplicationArea = Basic;
                }
                field("Negative Earning"; Rec."Negative Earning")
                {
                    ApplicationArea = Basic;
                }
                field("Closing Balance"; Rec."Closing Balance")
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
                field(Taxable; Rec.Taxable)
                {
                    ApplicationArea = Basic;
                }
                field("Tax Deductible"; Rec."Tax Deductible")
                {
                    ApplicationArea = Basic;
                }
                field(Frequency; Rec.Frequency)
                {
                    ApplicationArea = Basic;
                }
                field("Pay Period"; Rec."Pay Period")
                {
                    ApplicationArea = Basic;
                }
                field("Basic Pay"; Rec."Basic Pay")
                {
                    ApplicationArea = Basic;
                }
                field("Employer Amount"; Rec."Employer Amount")
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
                field("Next Period Entry"; Rec."Next Period Entry")
                {
                    ApplicationArea = Basic;
                }
                field("Non-Fluctuating"; Rec."Non-Fluctuating")
                {
                    ApplicationArea = Basic;
                }
                field("Posting Group Filter"; Rec."Posting Group Filter")
                {
                    ApplicationArea = Basic;
                }
                field("Initial Amount"; Rec."Initial Amount")
                {
                    ApplicationArea = Basic;
                }
                field("Outstanding Amount"; Rec."Outstanding Amount")
                {
                    ApplicationArea = Basic;
                }
                field("Basic Salary Code"; Rec."Basic Salary Code")
                {
                    ApplicationArea = Basic;
                }
                field("Payroll Group"; Rec."Payroll Group")
                {
                    ApplicationArea = Basic;
                }
                field(Rank; Rec.Rank)
                {
                    ApplicationArea = Basic;
                }
                field("Payroll Grouping"; Rec."Payroll Grouping")
                {
                    ApplicationArea = Basic;
                }
            }
        }
        area(factboxes)
        {
            systempart(Control1000000041; Notes)
            {
            }
            systempart(Control1000000042; MyNotes)
            {
            }
            systempart(Control1000000043; Links)
            {
            }
        }
    }

    actions
    {
    }

    trigger OnOpenPage()
    begin
        UserSetup.Get(UserId);

        if UserSetup."Payroll View" = false then
            Error('You do not have sufficient rights to view payroll!Please contact system administrator.');
    end;

    var
        UserSetup: Record "User Setup";
}
