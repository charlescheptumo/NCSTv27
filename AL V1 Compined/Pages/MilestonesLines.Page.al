#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Page 65127 "Milestones Lines"
{
    PageType = List;
    SourceTable = "Milestones Lines";
    ApplicationArea = All;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Project No"; Rec."Project No")
                {
                    ApplicationArea = Basic;
                }
                field("Task No"; Rec."Task No")
                {
                    ApplicationArea = Basic;
                }
                field("Milestone Code"; Rec."Milestone Code")
                {
                    ApplicationArea = Basic;
                }
                field("Milestone Description"; Rec."Milestone Description")
                {
                    ApplicationArea = Basic;
                }
                field("Milestone Start Date"; Rec."Milestone Start Date")
                {
                    ApplicationArea = Basic;
                }
                field("Milestone End Date"; Rec."Milestone End Date")
                {
                    ApplicationArea = Basic;
                }
                field("Notification Period"; Rec."Notification Period")
                {
                    ApplicationArea = Basic;
                }
                field("Notfification Date"; Rec."Notfification Date")
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
