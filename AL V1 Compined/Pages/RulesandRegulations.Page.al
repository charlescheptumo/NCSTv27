#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Page 69101 "Rules and Regulations"
{
    ApplicationArea = Basic;
    PageType = List;
    SourceTable = "Rules & Regulations";
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
                field(Date; Rec.Date)
                {
                    ApplicationArea = Basic;
                }
                field("Rules & Regulations"; Rec."Rules & Regulations")
                {
                    ApplicationArea = Basic;
                }
                field(Remarks; Rec.Remarks)
                {
                    ApplicationArea = Basic;
                }
            }
        }
        area(factboxes)
        {
            systempart(Control1000000013; Links)
            {
            }
            systempart(Control1000000010; Notes)
            {
            }
            systempart(Control1000000011; MyNotes)
            {
            }
        }
    }

    actions
    {
    }
}
