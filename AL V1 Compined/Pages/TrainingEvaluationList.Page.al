#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Page 69224 "Training Evaluation List"
{
    ApplicationArea = Basic;
    CardPageID = "Training Evaluation Page";
    DeleteAllowed = false;
    PageType = List;
    SourceTable = "Training Evaluation Header";
    UsageCategory = Lists;

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
                field(Name; Rec.Name)
                {
                    ApplicationArea = Basic;
                }
                field("Department Code"; Rec."Department Code")
                {
                    ApplicationArea = Basic;
                }
                field("Training Code"; Rec."Training Code")
                {
                    ApplicationArea = Basic;
                }
                field("Training Description"; Rec."Training Description")
                {
                    ApplicationArea = Basic;
                }
            }
        }
        area(factboxes)
        {
            systempart(Control1000000008; Links)
            {
            }
            systempart(Control1000000009; Notes)
            {
            }
        }
    }

    actions
    {
    }
}
