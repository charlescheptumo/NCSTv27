#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Page 75161 "Bid Evaluation Score Entry"
{
    PageType = ListPart;
    SourceTable = "Bid Evaluation Score Entry";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Vendor No."; Rec."Vendor No.")
                {
                    ApplicationArea = Basic;
                }
                field("Requirement ID"; Rec."Requirement ID")
                {
                    ApplicationArea = Basic;
                }
                field("Evaluation Requirement"; Rec."Evaluation Requirement")
                {
                    ApplicationArea = Basic;
                }
                field("Criteria Group"; Rec."Criteria Group")
                {
                    ApplicationArea = Basic;
                }
                field("Rating Type"; Rec."Rating Type")
                {
                    ApplicationArea = Basic;
                }
                field("Response Value"; Rec."Response Value")
                {
                    ApplicationArea = Basic;
                }
                field("Bid Response Actual Qty"; Rec."Bid Response Actual Qty")
                {
                    ApplicationArea = Basic;
                }
                field("Target Value/KPI"; Rec."Target Value/KPI")
                {
                    ApplicationArea = Basic;
                }
                field("Target Qty"; Rec."Target Qty")
                {
                    ApplicationArea = Basic;
                }
                field("Score %"; Rec."Score %")
                {
                    ApplicationArea = Basic;
                }
                field("Assigned Weight %"; Rec."Assigned Weight %")
                {
                    ApplicationArea = Basic;
                }
                field("Weighted Line Score"; Rec."Weighted Line Score")
                {
                    ApplicationArea = Basic;
                }
                field("Evaluation Results"; Rec."Evaluation Results")
                {
                    ApplicationArea = Basic;
                }
            }
        }
    }

    actions
    {
        area(processing)
        {
            group(Line)
            {
                Caption = 'Line';
                action("Bid Evaluation Score Guide")
                {
                    ApplicationArea = Basic;
                    Image = AllLines;
                    Promoted = true;
                    RunObject = Page "Bid Evaluation Score Guide";
                    RunPageLink = "Template ID" = field("Bid Scoring Document No."),
                                  "Criteria Group ID" = field("Criteria Group"),
                                  "Requirement ID" = field("Requirement ID");
                }
            }
        }
    }
}
