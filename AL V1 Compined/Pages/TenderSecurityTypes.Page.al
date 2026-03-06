#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Page 75108 "Tender Security Types"
{
    ApplicationArea = Basic;
    PageType = List;
    SourceTable = "Tender Security Types";
    UsageCategory = Administration;

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
                field("Security Type"; Rec."Security Type")
                {
                    ApplicationArea = Basic;
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = Basic;
                }
                field("Nature of Security"; Rec."Nature of Security")
                {
                    ApplicationArea = Basic;
                }
                field("No. of Filed Securities"; Rec."No. of Filed Securities")
                {
                    ApplicationArea = Basic;
                }
                field("Filed Securities Value (LCY)"; Rec."Filed Securities Value (LCY)")
                {
                    ApplicationArea = Basic;
                }
                field("No. of Forfeited Securities"; Rec."No. of Forfeited Securities")
                {
                    ApplicationArea = Basic;
                }
                field("Forfeited Securities Value LCY"; Rec."Forfeited Securities Value LCY")
                {
                    ApplicationArea = Basic;
                }
                field("No. of Released Securities"; Rec."No. of Released Securities")
                {
                    ApplicationArea = Basic;
                }
                field("Released Securities Value LCY"; Rec."Released Securities Value LCY")
                {
                    ApplicationArea = Basic;
                }
                field(BLocked; Rec.BLocked)
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
