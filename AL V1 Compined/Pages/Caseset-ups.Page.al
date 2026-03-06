#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Page 56029 "Case set-ups"
{
    ApplicationArea = Basic;
    PageType = List;
    SourceTable = "Case Set-Ups";
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
                field(Description; Rec.Description)
                {
                    ApplicationArea = Basic;
                }
            }
        }
        area(factboxes)
        {
            systempart(Control6; Outlook)
            {
            }
            systempart(Control7; Notes)
            {
            }
            systempart(Control8; Links)
            {
            }
        }
    }

    actions
    {
    }
}
