#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Page 65093 "Effort & Payroll Matrix list"
{
    Caption = 'Effort & Payroll Matrixs';
    PageType = List;
    SourceTable = "Effort & Payroll Matrix";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Project No"; Rec."Project No")
                {
                    ApplicationArea = Basic;
                }
                field("Task No"; Rec."Task No")
                {
                    ApplicationArea = Basic;
                }
                field("Resource ID"; Rec."Resource ID")
                {
                    ApplicationArea = Basic;
                }
                field("Employee No"; Rec."Employee No")
                {
                    ApplicationArea = Basic;
                    Editable = true;
                }
                field("Employee Name"; Rec."Employee Name")
                {
                    ApplicationArea = Basic;
                }
                field("Project Position"; Rec."Project Position")
                {
                    ApplicationArea = Basic;
                }
                field("FTE Effort (%)"; Rec."FTE Effort (%)")
                {
                    ApplicationArea = Basic;
                }
                field("Project Invoice Currency Code"; Rec."Project Invoice Currency Code")
                {
                    ApplicationArea = Basic;
                }
                field("Payroll Earning Code"; Rec."Payroll Earning Code")
                {
                    ApplicationArea = Basic;
                }
                field("Earning Description"; Rec."Earning Description")
                {
                    ApplicationArea = Basic;
                }
                field("FTE Annual Earning Amount"; Rec."FTE Annual Earning Amount")
                {
                    ApplicationArea = Basic;
                }
                field("FTE Annual Earning Amount(LCY)"; Rec."FTE Annual Earning Amount(LCY)")
                {
                    ApplicationArea = Basic;
                }
                field("Monthly Earned Amount"; Rec."Monthly Earned Amount")
                {
                    ApplicationArea = Basic;
                }
                field("Monthly Earned Amount(LCY)"; Rec."Monthly Earned Amount(LCY)")
                {
                    ApplicationArea = Basic;
                }
                field("Starting Pay Period"; Rec."Starting Pay Period")
                {
                    ApplicationArea = Basic;
                }
                field("Ending Pay Period"; Rec."Ending Pay Period")
                {
                    ApplicationArea = Basic;
                }
                field("Last Payroll Run Period"; Rec."Last Payroll Run Period")
                {
                    ApplicationArea = Basic;
                }
                field("Total Posted Earnin(LCY)"; Rec."Total Posted Earnin(LCY)")
                {
                    ApplicationArea = Basic;
                }
                field(Blocked; Rec.Blocked)
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
