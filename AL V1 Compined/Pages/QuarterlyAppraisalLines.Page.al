#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Page 56205 "Quarterly Appraisal Lines"
{
    PageType = ListPart;
    SourceTable = "Quarterly  Appraisal Lines";
    ApplicationArea = All;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Agreed Performance Targets"; Rec."Agreed Performance Targets")
                {
                    ApplicationArea = Basic;
                }
                field("Acheived Targets for the Quart"; Rec."Acheived Targets for the Quart")
                {
                    ApplicationArea = Basic;
                }
                field("Performance Indicator"; Rec."Performance Indicator")
                {
                    ApplicationArea = Basic;
                }
                field("Percentage Cumulative Achievem"; Rec."Percentage Cumulative Achievem")
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
