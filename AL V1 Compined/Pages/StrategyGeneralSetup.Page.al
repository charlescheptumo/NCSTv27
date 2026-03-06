#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Page 80036 "Strategy General Setup"
{
    ApplicationArea = Basic;
    PageType = Card;
    SourceTable = "SPM General Setup";
    UsageCategory = Administration;

    layout
    {
        area(content)
        {
            group(General)
            {
                field("Corp Strategic Plan Nos"; Rec."Corp Strategic Plan Nos")
                {
                    ApplicationArea = Basic;
                }
                field("Work Plan Nos"; Rec."Work Plan Nos")
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
