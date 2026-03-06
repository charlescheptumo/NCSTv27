#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Page 57165 "Payments Documents"
{
    DeleteAllowed = false;
    ModifyAllowed = false;
    PageType = List;
    SourceTable = Payments;
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
                field("Payment Type"; Rec."Payment Type")
                {
                    ApplicationArea = Basic;
                }
                field(Payee; Rec.Payee)
                {
                    ApplicationArea = Basic;
                }
                field("Payment Narration"; Rec."Payment Narration")
                {
                    ApplicationArea = Basic;
                }
                field("Total Amount"; Rec."Total Amount")
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
                field("Account Name"; Rec."Account Name")
                {
                    ApplicationArea = Basic;
                }
                field("Imprest Amount"; Rec."Imprest Amount")
                {
                    ApplicationArea = Basic;
                }
            }
        }
        area(factboxes)
        {
            part(Control14; "Sales Documents")
            {
            }
        }
    }

    actions
    {
    }
}
