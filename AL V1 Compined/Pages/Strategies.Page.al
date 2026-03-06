#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Page 80029 Strategies
{
    ApplicationArea = Basic;
    PageType = List;
    SourceTable = Strategy;
    UsageCategory = Lists;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Strategic Plan ID"; Rec."Strategic Plan ID")
                {
                    ApplicationArea = Basic;
                }
                field("Theme ID"; Rec."Theme ID")
                {
                    ApplicationArea = Basic;
                }
                field("Objective ID"; Rec."Objective ID")
                {
                    ApplicationArea = Basic;
                }
                field("Code"; Rec.Code)
                {
                    ApplicationArea = Basic;
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = Basic;
                }
                field("No. of Strategic Activities"; Rec."No. of Strategic Activities")
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
