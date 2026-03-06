#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Page 69167 "Leave Posting Journal"
{
    PageType = List;
    SourceTable = "Employee Leaves";
    SourceTableView = sorting("Employee No", "Leave Code", "Posting  Date")
                      order(ascending)
                      where(Posted = const(false));
    ApplicationArea = All;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Employee No"; Rec."Employee No")
                {
                    ApplicationArea = Basic;
                }
                field("First Name"; Rec."First Name")
                {
                    ApplicationArea = Basic;
                }
                field("Last Name"; Rec."Last Name")
                {
                    ApplicationArea = Basic;
                }
                field("Leave Code"; Rec."Leave Code")
                {
                    ApplicationArea = Basic;
                }
                field("Posting  Date"; Rec."Posting  Date")
                {
                    ApplicationArea = Basic;
                }
                field("Adjustment Type"; Rec."Adjustment Type")
                {
                    ApplicationArea = Basic;
                }
                field("No. Of Days"; Rec."No. Of Days")
                {
                    ApplicationArea = Basic;
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = Basic;
                }
                field("From Date"; Rec."From Date")
                {
                    ApplicationArea = Basic;
                }
                field("To Date"; Rec."To Date")
                {
                    ApplicationArea = Basic;
                }
                field(Posted; Rec.Posted)
                {
                    ApplicationArea = Basic;
                }
            }
        }
        area(factboxes)
        {
            systempart(Control1000000015; Notes)
            {
            }
            systempart(Control1000000016; MyNotes)
            {
            }
            systempart(Control1000000017; Links)
            {
            }
        }
    }

    actions
    {
        area(navigation)
        {
            group("Leave Application")
            {
                Caption = 'Leave Application';
                Image = "Order";
                action("Post Leave Accuals")
                {
                    ApplicationArea = Basic;
                    Caption = 'Post Leave Accuals';
                    Image = Post;
                    Promoted = true;
                    PromotedIsBig = true;
                    RunObject = Report "Post Leave Accuals";
                }
            }
        }
    }
}
