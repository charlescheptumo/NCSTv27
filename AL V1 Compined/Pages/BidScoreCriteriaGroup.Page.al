#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Page 75054 "Bid Score Criteria Group"
{
    PageType = List;
    SourceTable = "Bid Score Criteria Group";
    ApplicationArea = All;

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
                field("Evaluation Type"; Rec."Evaluation Type")
                {
                    ApplicationArea = Basic;
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = Basic;
                }
                field("Total Weight %"; Rec."Total Weight %")
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
