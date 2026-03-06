#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Page 56065 "Internal Memos"
{
    ApplicationArea = Basic;
    CardPageID = "Internal Memo";
    PageType = List;
    SourceTable = "Internal Memos";
    UsageCategory = Lists;

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
                field(RE; Rec.RE)
                {
                    ApplicationArea = Basic;
                }
                field("Employee UserID"; Rec."Employee UserID")
                {
                    ApplicationArea = Basic;
                }
                field(From; Rec.From)
                {
                    ApplicationArea = Basic;
                }
                field("To CEO"; Rec."To CEO")
                {
                    ApplicationArea = Basic;
                }
                field(Through; Rec.Through)
                {
                    ApplicationArea = Basic;
                }
            }
        }
        area(factboxes)
        {
            systempart(Control10; Notes)
            {
            }
        }
    }

    actions
    {
    }
}
