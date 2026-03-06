#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Page 69179 "Disciplinary Actions"
{
    PageType = List;
    SourceTable = "Disciplinary Actions";

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
                field(Description; Rec.Description)
                {
                    ApplicationArea = Basic;
                }
                field(Terminate; Rec.Terminate)
                {
                    ApplicationArea = Basic;
                }
                field(Document; Rec.Document)
                {
                    ApplicationArea = Basic;
                }
                field(Comments; Rec.Comments)
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
            systempart(Control1000000009; MyNotes)
            {
            }
            systempart(Control1000000010; Notes)
            {
            }
            systempart(Control1000000011; Outlook)
            {
            }
        }
    }

    actions
    {
    }
}
