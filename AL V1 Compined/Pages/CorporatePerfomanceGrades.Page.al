#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Page 80032 "Corporate Perfomance Grades"
{
    ApplicationArea = Basic;
    PageType = List;
    SourceTable = "Corporate Perfomance Grades";
    UsageCategory = Administration;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Code"; Rec.Code)
                {
                    ApplicationArea = Basic;
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = Basic;
                }
                field("Min Score (%) Per. Contract"; Rec."Min Score (%) Per. Contract")
                {
                    ApplicationArea = Basic;
                }
                field("Max Score (%) Per. Contract"; Rec."Max Score (%) Per. Contract")
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
