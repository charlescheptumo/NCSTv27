#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Page 57027 "Imprest Surrender Lines"
{
    PageType = ListPart;
    SourceTable = "Imprest Lines";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Advance Type"; Rec."Advance Type")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field("Account Type"; Rec."Account Type")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Account No."; Rec."Account No.")
                {
                    ApplicationArea = Basic;
                    Editable = true;
                }
                field("Account Name"; Rec."Account Name")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Job No."; Rec."Job No.")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field("Job Task No."; Rec."Job Task No.")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field(Purpose; Rec.Purpose)
                {
                    ApplicationArea = Basic;
                }
                field(Amount; Rec.Amount)
                {
                    ApplicationArea = Basic;
                    Editable = true;
                }
                field("Actual Spent"; Rec."Actual Spent")
                {
                    ApplicationArea = Basic;
                }
                field("Receipt No."; Rec."Receipt No.")
                {
                    ApplicationArea = Basic;
                }
                field("Cash Receipt Amount"; Rec."Cash Receipt Amount")
                {
                    ApplicationArea = Basic;
                    Editable = true;
                }
                field("Remaining Amount"; Rec."Remaining Amount")
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
