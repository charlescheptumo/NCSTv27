#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Page 75166 "Supplier Rating Score Guide"
{
    PageType = List;
    SourceTable = "Supplier Rating Score Guide";
    ApplicationArea = All;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Appraisal Template ID"; Rec."Appraisal Template ID")
                {
                    ApplicationArea = Basic;
                }
                field("Template Type"; Rec."Template Type")
                {
                    ApplicationArea = Basic;
                }
                field("Criteria Group"; Rec."Criteria Group")
                {
                    ApplicationArea = Basic;
                }
                field("Checklist ID"; Rec."Checklist ID")
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
                field("Min Date Value"; Rec."Min Date Value")
                {
                    ApplicationArea = Basic;
                }
                field("Max Date Value"; Rec."Max Date Value")
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
