#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Page 69049 "Pay Periods List"
{
    Editable = false;
    PageType = List;
    SourceTable = "Payroll PeriodX";
    ApplicationArea = All;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Starting Date"; Rec."Starting Date")
                {
                    ApplicationArea = Basic;
                }
                field(Name; Rec.Name)
                {
                    ApplicationArea = Basic;
                }
                field("New Fiscal Year"; Rec."New Fiscal Year")
                {
                    ApplicationArea = Basic;
                }
                field("Pay Date"; Rec."Pay Date")
                {
                    ApplicationArea = Basic;
                }
                field(Status; Rec.Status)
                {
                    ApplicationArea = Basic;
                }
                field(Closed; Rec.Closed)
                {
                    ApplicationArea = Basic;
                }
                field("Job Book Lock Date"; Rec."Job Book Lock Date")
                {
                    ApplicationArea = Basic;
                }
                field("Job Book Locked?"; Rec."Job Book Locked?")
                {
                    ApplicationArea = Basic;
                }
                field("Job Book Start Date"; Rec."Job Book Start Date")
                {
                    ApplicationArea = Basic;
                }
                field("Job Book End Date"; Rec."Job Book End Date")
                {
                    ApplicationArea = Basic;
                }
                field("Close Pay"; Rec."Close Pay")
                {
                    ApplicationArea = Basic;
                }
            }
        }
        area(factboxes)
        {
            systempart(Control1000000014; Notes)
            {
            }
            systempart(Control1000000015; MyNotes)
            {
            }
            systempart(Control1000000016; Links)
            {
            }
        }
    }

    actions
    {
        area(processing)
        {
            group("F&unctions")
            {
                Caption = 'F&unctions';
                Image = "Action";
                action("Payroll Costs Analysis")
                {
                    ApplicationArea = Basic;
                    Caption = 'Payroll Costs Analysis';
                    Image = "Report";
                    Promoted = true;
                    PromotedCategory = "Report";
                    PromotedIsBig = true;

                    trigger OnAction()
                    begin

                        PayrollCost.GetDateFilters(Rec."Starting Date", CalcDate('-1M', Rec."Starting Date"));
                        PayrollCost.Run;
                    end;
                }
            }
        }
    }

    var
        ClosingFunction: Report "Close Pay period";
        ApprovalsMgmt: Codeunit "Approvals Mgmt.";
        PayrollCost: Report "Payroll Cost Analysis";
}
