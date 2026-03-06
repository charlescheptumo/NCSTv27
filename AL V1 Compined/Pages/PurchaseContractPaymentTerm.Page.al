#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Page 75287 "Purchase Contract Payment Term"
{
    PageType = List;
    SourceTable = "Purchase Contract Payment Term";
    ApplicationArea = All;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("No."; Rec."No.")
                {
                    ApplicationArea = Basic;
                }
                field("Instalment Code"; Rec."Instalment Code")
                {
                    ApplicationArea = Basic;
                }
                field("Payment Certificate Type"; Rec."Payment Certificate Type")
                {
                    ApplicationArea = Basic;
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = Basic;
                }
                field("Payment %"; Rec."Payment %")
                {
                    ApplicationArea = Basic;
                }
                field("Currency Code"; Rec."Currency Code")
                {
                    ApplicationArea = Basic;
                }
                field("Planned Amount"; Rec."Planned Amount")
                {
                    ApplicationArea = Basic;
                }
                field("Planned Amount (LCY)"; Rec."Planned Amount (LCY)")
                {
                    ApplicationArea = Basic;
                }
                field("Paid Amount"; Rec."Paid Amount")
                {
                    ApplicationArea = Basic;
                }
                field("Paid Amount (LCY)"; Rec."Paid Amount (LCY)")
                {
                    ApplicationArea = Basic;
                }
            }
        }
    }

    actions
    {
        area(processing)
        {
            group(Lines)
            {
                Caption = 'Lines';
                action("Purchase Contract Milestone")
                {
                    ApplicationArea = Basic;
                    Image = PlanningWorksheet;
                    Promoted = true;
                    PromotedCategory = Category4;
                    RunObject = Page "Purchase Contract Milestone";
                    RunPageLink = "No." = field("No."),
                                  "Payment Instalment Code" = field("Instalment Code");
                }
            }
        }
    }
}
