#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Page 75109 "Tender Security Close Code"
{
    ApplicationArea = Basic;
    PageType = List;
    SourceTable = "Tender Security Close Code";
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
                field("Close Type"; Rec."Close Type")
                {
                    ApplicationArea = Basic;
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = Basic;
                }
                field("No. of Transactions"; Rec."No. of Transactions")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Determines the No. of Forfeiture and Release transactions done for the bid & performance securities';
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
