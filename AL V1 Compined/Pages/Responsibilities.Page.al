#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Page 69124 Responsibilities
{
    PageType = List;
    SourceTable = "Job Responsibilities Lines";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field(Date; Rec.Date)
                {
                    ApplicationArea = Basic;
                }
                field(Responsibility; Rec.Responsibility)
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
            systempart(Control1000000006; Notes)
            {
            }
            systempart(Control1000000007; MyNotes)
            {
            }
            systempart(Control1000000008; Links)
            {
            }
        }
    }

    actions
    {
    }
}
