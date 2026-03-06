#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Page 69139 "Confidential Info"
{
    PageType = List;
    SourceTable = "Confidential Information";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Confidential Code"; Rec."Confidential Code")
                {
                    ApplicationArea = Basic;
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = Basic;
                }
                field(Comment; Rec.Comment)
                {
                    ApplicationArea = Basic;
                }
            }
        }
        area(factboxes)
        {
            systempart(Control1000000007; Notes)
            {
            }
            systempart(Control1000000008; MyNotes)
            {
            }
            systempart(Control1000000009; Links)
            {
            }
        }
    }

    actions
    {
    }
}
