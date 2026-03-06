#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Page 59033 "Limit Types"
{
    ApplicationArea = Basic;
    CardPageID = "Limit Types Card";
    PageType = List;
    SourceTable = "Limit Types";
    UsageCategory = Administration;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Lower Limit"; Rec."Lower Limit")
                {
                    ApplicationArea = Basic;
                }
                field("Upper Limit"; Rec."Upper Limit")
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
