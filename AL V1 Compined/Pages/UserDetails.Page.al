#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Page 50061 "User Detail"
{
    PageType = List;
    SourceTable = User;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("User Name"; Rec."User Name")
                {
                    ApplicationArea = Basic;
                }
                field("Full Name"; Rec."Full Name")
                {
                    ApplicationArea = Basic;
                }
            }
        }
        area(factboxes)
        {
            systempart(Control1000000011; Notes)
            {
            }
            systempart(Control1000000012; MyNotes)
            {
            }
            systempart(Control1000000013; Links)
            {
            }
        }
    }

    actions
    {
    }
}
