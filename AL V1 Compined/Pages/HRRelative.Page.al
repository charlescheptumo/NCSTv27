#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Page 69129 "HR Relative"
{
    PageType = List;
    SourceTable = "HR Relative";
    ApplicationArea = All;

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
                field(Relationship; Rec.Relationship)
                {
                    ApplicationArea = Basic;
                }
            }
        }
        area(factboxes)
        {
            systempart(Control1000000005; Links)
            {
            }
            systempart(Control1000000006; MyNotes)
            {
            }
            systempart(Control1000000007; Notes)
            {
            }
            systempart(Control1000000008; Outlook)
            {
            }
        }
    }

    actions
    {
    }
}
