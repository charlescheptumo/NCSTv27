#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Page 70018 "Commitment Entries"
{
    PageType = List;
    SourceTable = "Commitment Entries1";

    layout
    {
        area(content)
        {
            repeater(Control1000000000)
            {
                field("Entry No"; Rec."Entry No")
                {
                    ApplicationArea = Basic;
                }
                field("Commitment Date"; Rec."Commitment Date")
                {
                    ApplicationArea = Basic;
                }
                field("Document No."; Rec."Document No.")
                {
                    ApplicationArea = Basic;
                }
                field(Amount; Rec.Amount)
                {
                    ApplicationArea = Basic;
                }
                field(GLAccount; Rec.GLAccount)
                {
                    ApplicationArea = Basic;
                }
                field("Budget Line"; Rec."Budget Line")
                {
                    ApplicationArea = Basic;
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = Basic;
                }
                field("Global Dimension 1 Code"; Rec."Global Dimension 1 Code")
                {
                    ApplicationArea = Basic;
                }
                field("Commitment Type"; Rec."Commitment Type")
                {
                    ApplicationArea = Basic;
                }
                field("Global Dimension 2 Code"; Rec."Global Dimension 2 Code")
                {
                    ApplicationArea = Basic;
                }
                field("Budget Year"; Rec."Budget Year")
                {
                    ApplicationArea = Basic;
                }
                field("Uncommittment Date"; Rec."Uncommittment Date")
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
                field("Account Type"; Rec."Account Type")
                {
                    ApplicationArea = Basic;
                }
                field("Vote Item"; Rec."Vote Item")
                {
                    ApplicationArea = Basic;
                }
                field("PE Admin Code"; Rec."PE Admin Code")
                {
                    ApplicationArea = Basic;
                }
                field("Procurement Plan"; Rec."Procurement Plan")
                {
                    ApplicationArea = Basic;
                }
                field(Type; Rec.Type)
                {
                    ApplicationArea = Basic;
                }
                field("Unit Cost"; Rec."Unit Cost")
                {
                    ApplicationArea = Basic;
                }
                field(Quantity; Rec.Quantity)
                {
                    ApplicationArea = Basic;
                }
                field("Remaining Quanity"; Rec."Remaining Quanity")
                {
                    ApplicationArea = Basic;
                }
                field("Remaining in Batch"; Rec."Remaining in Batch")
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
