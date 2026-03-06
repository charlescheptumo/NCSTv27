#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Page 75286 "Purchase Contract Insurance"
{
    PageType = List;
    SourceTable = "Purchase Contract Insurance";
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
                field("Insurance Type"; Rec."Insurance Type")
                {
                    ApplicationArea = Basic;
                }
                field("Policy Cover Type"; Rec."Policy Cover Type")
                {
                    ApplicationArea = Basic;
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = Basic;
                }
                field("Policy Coverage (LCY)"; Rec."Policy Coverage (LCY)")
                {
                    ApplicationArea = Basic;
                }
                field("Policy ID"; Rec."Policy ID")
                {
                    ApplicationArea = Basic;
                }
                field("Insurance Company"; Rec."Insurance Company")
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
