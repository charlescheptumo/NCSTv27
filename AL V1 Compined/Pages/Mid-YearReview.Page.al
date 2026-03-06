#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Page 56212 "Mid-Year Review"
{
    PageType = ListPart;
    SourceTable = "Annual  Appraisal Lines";
    SourceTableView = where("Mid Year" = filter(true));
    ApplicationArea = All;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Targets changed or added"; Rec."Targets changed or added")
                {
                    ApplicationArea = Basic;
                }
                field("Performance Indicator"; Rec."Performance Indicator")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Performance Target (%)"; Rec."Performance Target (%)")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Actual Achieved (%)"; Rec."Actual Achieved (%)")
                {
                    ApplicationArea = Basic;
                }
                field("Rating Supervisor (%)"; Rec."Rating Supervisor (%)")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
            }
        }
    }

    actions
    {
    }

    trigger OnInsertRecord(BelowxRec: Boolean): Boolean
    begin
        Rec."Mid Year" := true;
    end;
}
