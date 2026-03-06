#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Page 65054 "Grant Budget Summary List"
{
    PageType = List;
    SourceTable = "Grant Budget Summary";
    ApplicationArea = All;

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
                field("Budget Currency"; Rec."Budget Currency")
                {
                    ApplicationArea = Basic;
                }
                field("Budget Amount"; Rec."Budget Amount")
                {
                    ApplicationArea = Basic;
                }
                field("Budget Amount(LCY)"; Rec."Budget Amount(LCY)")
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
