#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Page 55021 "Board Meeting Replies"
{
    PageType = List;
    SourceTable = "Board Meeting Comments";
    ApplicationArea = All;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field(EntryNo; Rec.EntryNo)
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Meeting Code"; Rec."Meeting Code")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Member No"; Rec."Member No")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field(Comment; Rec.Comment)
                {
                    ApplicationArea = Basic;
                }
                field("Date Created"; Rec."Date Created")
                {
                    ApplicationArea = Basic;
                }
                field("Time Created"; Rec."Time Created")
                {
                    ApplicationArea = Basic;
                }
                field("Comment Reply"; Rec."Comment Reply")
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
