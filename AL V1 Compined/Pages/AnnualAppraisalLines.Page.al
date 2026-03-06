#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Page 56210 "Annual Appraisal Lines"
{
    PageType = ListPart;
    SourceTable = "Annual  Appraisal Lines";
    SourceTableView = where("Mid Year" = filter(false));
    ApplicationArea = All;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Performance Objectives"; Rec."Performance Objectives")
                {
                    ApplicationArea = Basic;
                    TableRelation = "Departmental Objectives Lines".Description;
                }
                field("Performance Indicator"; Rec."Performance Indicator")
                {
                    ApplicationArea = Basic;
                    TableRelation = "Performance Indicators".Description;
                }
                field("Performance Target (%)"; Rec."Performance Target (%)")
                {
                    ApplicationArea = Basic;
                }
                field("Actual Achieved"; Rec."Actual Achieved")
                {
                    ApplicationArea = Basic;
                }
                field("Rating Self (%)"; Rec."Rating Self (%)")
                {
                    ApplicationArea = Basic;
                }
                field("Rating Supervisor (%)"; Rec."Rating Supervisor (%)")
                {
                    ApplicationArea = Basic;
                }
                field("Actual of Eighty"; Rec."Actual of Eighty")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
            }
        }
    }

    actions
    {
    }
}
