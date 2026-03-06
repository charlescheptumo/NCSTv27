#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Page 69002 Deductions
{
    ApplicationArea = Basic;
    PageType = List;
    SourceTable = DeductionsX;
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
                field(Statutory; Rec.Statutory)
                {
                    ApplicationArea = Basic;
                }
                field("Balance Type"; Rec."Balance Type")
                {
                    ApplicationArea = Basic;
                }
                field("Show on Payslip Information"; Rec."Show on Payslip Information")
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
                field("G/L Account"; Rec."G/L Account")
                {
                    ApplicationArea = Basic;
                }
                field("Institution Code"; Rec."Institution Code")
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
                field(Reference; Rec.Reference)
                {
                    ApplicationArea = Basic;
                }
                field("Pension Limit Percentage"; Rec."Pension Limit Percentage")
                {
                    ApplicationArea = Basic;
                }
                field("Pension Limit Amount"; Rec."Pension Limit Amount")
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
                field(Type; Rec.Type)
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
                field("Flat Amount Employer"; Rec."Flat Amount Employer")
                {
                    ApplicationArea = Basic;
                }
                field("PAYE Code"; Rec."PAYE Code")
                {
                    ApplicationArea = Basic;
                }
                field("Maximum Amount"; Rec."Maximum Amount")
                {
                    ApplicationArea = Basic;
                }
                field("Total Amount"; Rec."Total Amount")
                {
                    ApplicationArea = Basic;
                }
                field("Total Amount Employer"; Rec."Total Amount Employer")
                {
                    ApplicationArea = Basic;
                }
                field("Pension Scheme"; Rec."Pension Scheme")
                {
                    ApplicationArea = Basic;
                }
                field(Percentage; Rec.Percentage)
                {
                    ApplicationArea = Basic;
                }
                field("Percentage Employer"; Rec."Percentage Employer")
                {
                    ApplicationArea = Basic;
                }
                field("Voluntary Percentage"; Rec."Voluntary Percentage")
                {
                    ApplicationArea = Basic;
                }
                field("Tax deductible"; Rec."Tax deductible")
                {
                    ApplicationArea = Basic;
                }
                field("Deduction Table"; Rec."Deduction Table")
                {
                    ApplicationArea = Basic;
                }
                field("Show Balance"; Rec."Show Balance")
                {
                    ApplicationArea = Basic;
                }
                field(Shares; Rec.Shares)
                {
                    ApplicationArea = Basic;
                }
                field("Show on report"; Rec."Show on report")
                {
                    ApplicationArea = Basic;
                }
                field("Co-operative"; Rec."Co-operative")
                {
                    ApplicationArea = Basic;
                }
                field("Deduct From Pension"; Rec."Deduct From Pension")
                {
                    ApplicationArea = Basic;
                }
                field("Calculate Excess Pension"; Rec."Calculate Excess Pension")
                {
                    ApplicationArea = Basic;
                }
                field("Both Signs"; Rec."Both Signs")
                {
                    ApplicationArea = Basic;
                }
                field(SACCO; Rec.SACCO)
                {
                    ApplicationArea = Basic;
                }
                field("Pay Period Filter"; Rec."Pay Period Filter")
                {
                    ApplicationArea = Basic;
                }
                field("Posting Group Filter"; Rec."Posting Group Filter")
                {
                    ApplicationArea = Basic;
                    Visible = true;
                }
                field("Payroll Grouping Filter"; Rec."Payroll Grouping Filter")
                {
                    ApplicationArea = Basic;
                    Visible = true;
                }
                field("Branch Filter"; Rec."Branch Filter")
                {
                    ApplicationArea = Basic;
                    Visible = true;
                }
                field("ProfitCtr Filter"; Rec."ProfitCtr Filter")
                {
                    ApplicationArea = Basic;
                    Visible = true;
                }
                field("Department Filter"; Rec."Department Filter")
                {
                    ApplicationArea = Basic;
                    Visible = true;
                }
                field("OP Deduction"; Rec."OP Deduction")
                {
                    ApplicationArea = Basic;
                }
            }
        }
        area(factboxes)
        {
            systempart(Control1000000034; Notes)
            {
            }
            systempart(Control1000000035; MyNotes)
            {
            }
            systempart(Control1000000036; Links)
            {
            }
        }
    }

    actions
    {
    }

    trigger OnDeleteRecord(): Boolean
    begin
        Rec.TestField(Rec."Total Amount", 0);
    end;
}
