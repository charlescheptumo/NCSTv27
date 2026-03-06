#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Page 69030 "Payroll Lines"
{
    PageType = List;
    SourceTable = "Payroll Lines";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Line No"; Rec."Line No")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field("Personal No."; Rec."Personal No.")
                {
                    ApplicationArea = Basic;
                }
                field("Employee Name"; Rec."Employee Name")
                {
                    ApplicationArea = Basic;
                }
                field("Payroll Period"; Rec."Payroll Period")
                {
                    ApplicationArea = Basic;
                }
                field("Basic Salary"; Rec."Basic Salary")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field("Basic Arrears"; Rec."Basic Arrears")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field("Gross Pay"; Rec."Gross Pay")
                {
                    ApplicationArea = Basic;
                }
                field("Total Deduction"; Rec."Total Deduction")
                {
                    ApplicationArea = Basic;
                }
                field(Netpay; Rec.Netpay)
                {
                    ApplicationArea = Basic;
                }
                field("Payroll Header"; Rec."Payroll Header")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field("Payroll Group"; Rec."Payroll Group")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
            }
        }
    }

    actions
    {
    }
}
