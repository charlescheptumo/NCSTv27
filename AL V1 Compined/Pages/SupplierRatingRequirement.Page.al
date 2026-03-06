#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Page 75165 "Supplier Rating Requirement"
{
    PageType = ListPart;
    SourceTable = "Supplier Rating Requirement";
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
                field("Evaluation Requirement"; Rec."Evaluation Requirement")
                {
                    ApplicationArea = Basic;
                }
                field("Rating Type"; Rec."Rating Type")
                {
                    ApplicationArea = Basic;
                }
                field("Assigned Weight %"; Rec."Assigned Weight %")
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
        area(processing)
        {
            group(Line)
            {
                Caption = 'Line';
                action("Score Guide")
                {
                    ApplicationArea = Basic;
                    Image = CreditMemo;
                    RunObject = Page "Supplier Rating Score Guide";
                    RunPageLink = "Appraisal Template ID" = field("Appraisal Template ID"),
                                  "Template Type" = field("Template Type"),
                                  "Criteria Group" = field("Criteria Group");
                }
            }
        }
    }
}
