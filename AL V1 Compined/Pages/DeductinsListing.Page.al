#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Page 69021 "Deductins Listing"
{
    Editable = false;
    PageType = List;
    SourceTable = DeductionsX;
    ApplicationArea = All;

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
                field("Insurance Code"; Rec."Insurance Code")
                {
                    ApplicationArea = Basic;
                }
                field(Block; Rec.Block)
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
                field("Pension Scheme Code"; Rec."Pension Scheme Code")
                {
                    ApplicationArea = Basic;
                }
                field("Main Deduction Code"; Rec."Main Deduction Code")
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
                field("Voluntary Percentage"; Rec."Voluntary Percentage")
                {
                    ApplicationArea = Basic;
                }
                field("Balance Type"; Rec."Balance Type")
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
                field("Total Amount"; Rec."Total Amount")
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
            }
        }
    }

    actions
    {
    }
}
