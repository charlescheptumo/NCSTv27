#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Page 75270 "Bid Evaluation Score Guide"
{
    PageType = List;
    SourceTable = "Bid Evaluation Score Guide";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Template ID"; Rec."Template ID")
                {
                    ApplicationArea = Basic;
                }
                field("Criteria Group ID"; Rec."Criteria Group ID")
                {
                    ApplicationArea = Basic;
                }
                field("Requirement ID"; Rec."Requirement ID")
                {
                    ApplicationArea = Basic;
                }
                field("Entry No"; Rec."Entry No")
                {
                    ApplicationArea = Basic;
                }
                field("Target Qty"; Rec."Target Qty")
                {
                    ApplicationArea = Basic;
                }
                field("Rating Type"; Rec."Rating Type")
                {
                    ApplicationArea = Basic;
                }
                field("Evaluation Type"; Rec."Evaluation Type")
                {
                    ApplicationArea = Basic;
                }
                field("Desired Perfomance Direction"; Rec."Desired Perfomance Direction")
                {
                    ApplicationArea = Basic;
                }
                field("Response Value"; Rec."Response Value")
                {
                    ApplicationArea = Basic;
                }
                field("Min Bid Value"; Rec."Min Bid Value")
                {
                    ApplicationArea = Basic;
                }
                field("Max Bid Value"; Rec."Max Bid Value")
                {
                    ApplicationArea = Basic;
                }
                field("Score %"; Rec."Score %")
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
