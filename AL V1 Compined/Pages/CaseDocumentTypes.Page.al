#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Page 56033 "Case Document Types"
{
    ApplicationArea = Basic;
    PageType = List;
    SourceTable = "Case Document Types";
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
                field("Require Court Date?"; Rec."Require Court Date?")
                {
                    ApplicationArea = Basic;
                }
            }
        }
        area(factboxes)
        {
            systempart(Control6; Notes)
            {
            }
            systempart(Control7; Outlook)
            {
            }
            systempart(Control8; Links)
            {
            }
        }
    }

    actions
    {
        area(navigation)
        {
            action("Case Document Sub Types")
            {
                ApplicationArea = Basic;
                Caption = 'Case Document Sub Types';
                Image = process;
                Promoted = true;
                PromotedIsBig = true;
                RunObject = Page "Case Document Sub Types";
                RunPageLink = "Case Document Type" = field(Code);
            }
        }
    }
}
