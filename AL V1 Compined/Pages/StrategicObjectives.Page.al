#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Page 80028 "Strategic Objectives"
{
    ApplicationArea = Basic;
    PageType = List;
    SourceTable = "Strategic Objective";
    UsageCategory = Tasks;

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
                field("Code"; Rec.Code)
                {
                    ApplicationArea = Basic;
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = Basic;
                }
                field("No. of Strategies"; Rec."No. of Strategies")
                {
                    ApplicationArea = Basic;
                }
                field("No. of Strategic Initiatives"; Rec."No. of Strategic Initiatives")
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
