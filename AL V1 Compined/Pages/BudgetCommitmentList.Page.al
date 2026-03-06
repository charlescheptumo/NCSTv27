#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Page 57043 "Budget Commitment List"
{
    ApplicationArea = Basic;
    PageType = List;
    SourceTable = "Budget Commitment";
    UsageCategory = Administration;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Entry No."; Rec."Entry No.")
                {
                    ApplicationArea = Basic;
                }
                field("Account No."; Rec."Account No.")
                {
                    ApplicationArea = Basic;
                }
                field("Account Name"; Rec."Account Name")
                {
                    ApplicationArea = Basic;
                }
                field("Budgeted Amount"; Rec."Budgeted Amount")
                {
                    ApplicationArea = Basic;
                }
                field("Commited Amount PRN"; Rec."Commited Amount PRN")
                {
                    ApplicationArea = Basic;
                }
                field("Commited Amount Imprest"; Rec."Commited Amount Imprest")
                {
                    ApplicationArea = Basic;
                }
                field("Commited Amount Orders"; Rec."Commited Amount Orders")
                {
                    ApplicationArea = Basic;
                }
                field("Committed Invoices"; Rec."Committed Invoices")
                {
                    ApplicationArea = Basic;
                }
                field("Budget Name"; Rec."Budget Name")
                {
                    ApplicationArea = Basic;
                }
                field("Budget Start Date"; Rec."Budget Start Date")
                {
                    ApplicationArea = Basic;
                }
            }
        }
        area(factboxes)
        {
            systempart(Control13; Notes)
            {
            }
            systempart(Control14; Links)
            {
            }
        }
    }

    actions
    {
    }
}
