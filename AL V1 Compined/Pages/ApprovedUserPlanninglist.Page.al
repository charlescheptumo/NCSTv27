#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Page 59107 "Approved User Planning  list"
{
    CardPageID = "User Evaluation Card";
    Editable = false;
    PageType = List;
    SourceTable = Planning;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field(No; Rec.No)
                {
                    ApplicationArea = Basic;
                }
                field("Annual Workplan"; Rec."Annual Workplan")
                {
                    ApplicationArea = Basic;
                }
                field(Department; Rec.Department)
                {
                    ApplicationArea = Basic;
                }
                field("Accounting Period"; Rec."Accounting Period")
                {
                    ApplicationArea = Basic;
                }
                field("Global Dimension 1 Code"; Rec."Global Dimension 1 Code")
                {
                    ApplicationArea = Basic;
                }
                field("Global Dimension 2 Code"; Rec."Global Dimension 2 Code")
                {
                    ApplicationArea = Basic;
                }
                field("Responsible Employee"; Rec."Responsible Employee")
                {
                    ApplicationArea = Basic;
                }
                field("Employee Name"; Rec."Employee Name")
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
