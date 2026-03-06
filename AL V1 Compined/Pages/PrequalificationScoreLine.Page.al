#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Page 75188 "Prequalification Score Line"
{
    PageType = ListPart;
    SourceTable = "Prequalification Score Line";
    ApplicationArea = All;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Evaluation Voucher ID"; Rec."Evaluation Voucher ID")
                {
                    ApplicationArea = Basic;
                }
                field("Line No"; Rec."Line No")
                {
                    ApplicationArea = Basic;
                }
                field("Rating Template ID"; Rec."Rating Template ID")
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
                field("Evaluation Requirement"; Rec."Evaluation Requirement")
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
                field("Target Qty"; Rec."Target Qty")
                {
                    ApplicationArea = Basic;
                }
                field("Desired Perfomance Direction"; Rec."Desired Perfomance Direction")
                {
                    ApplicationArea = Basic;
                }
                field("Target Value"; Rec."Target Value")
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
