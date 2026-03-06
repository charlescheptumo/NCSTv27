#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Page 69026 "Loan Repayment Schedule"
{
    PageType = List;
    SourceTable = "Loan Repayment Schedule";
    ApplicationArea = All;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Employee No."; Rec."Employee No.")
                {
                    ApplicationArea = Basic;
                }
                field("Employee Name"; Rec."Employee Name")
                {
                    ApplicationArea = Basic;
                }
                field("Instalment No"; Rec."Instalment No")
                {
                    ApplicationArea = Basic;
                }
                field("Repayment Date"; Rec."Repayment Date")
                {
                    ApplicationArea = Basic;
                }
                field("Loan Amount"; Rec."Loan Amount")
                {
                    ApplicationArea = Basic;
                }
                field("Balance B/F"; Rec."Balance B/F")
                {
                    ApplicationArea = Basic;
                }
                field("Principal Repayment"; Rec."Principal Repayment")
                {
                    ApplicationArea = Basic;
                }
                field("Monthly Interest"; Rec."Monthly Interest")
                {
                    ApplicationArea = Basic;
                }
                field("Monthly Repayment"; Rec."Monthly Repayment")
                {
                    ApplicationArea = Basic;
                }
                field("Balance C/F"; Rec."Balance C/F")
                {
                    ApplicationArea = Basic;
                }
                field("Principal Ded Code"; Rec."Principal Ded Code")
                {
                    ApplicationArea = Basic;
                }
                field("Interest Ded Code"; Rec."Interest Ded Code")
                {
                    ApplicationArea = Basic;
                }
                field("Principal Recovered"; Rec."Principal Recovered")
                {
                    ApplicationArea = Basic;
                }
                field("Interest Recovered"; Rec."Interest Recovered")
                {
                    ApplicationArea = Basic;
                }
                field("Loan Product Type"; Rec."Loan Product Type")
                {
                    ApplicationArea = Basic;
                }
                field("Cash Payment"; Rec."Cash Payment")
                {
                    ApplicationArea = Basic;
                }
                field(Refinanced; Rec.Refinanced)
                {
                    ApplicationArea = Basic;
                }
            }
        }
        area(factboxes)
        {
            systempart(Control1000000020; Notes)
            {
            }
            systempart(Control1000000021; Links)
            {
            }
        }
    }

    actions
    {
    }
}
