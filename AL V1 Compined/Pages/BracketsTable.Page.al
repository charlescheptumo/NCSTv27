#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Page 69009 "Brackets Table"
{
    ApplicationArea = Basic;
    DeleteAllowed = false;
    PageType = List;
    SourceTable = "Bracket Tablesx";
    UsageCategory = Administration;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Bracket Code"; Rec."Bracket Code")
                {
                    ApplicationArea = Basic;
                }
                field("Bracket Description"; Rec."Bracket Description")
                {
                    ApplicationArea = Basic;
                }
                field("Effective Starting Date"; Rec."Effective Starting Date")
                {
                    ApplicationArea = Basic;
                }
                field("Effective End Date"; Rec."Effective End Date")
                {
                    ApplicationArea = Basic;
                }
                field(Gratuity; Rec.Gratuity)
                {
                    ApplicationArea = Basic;
                }
                field(Annual; Rec.Annual)
                {
                    ApplicationArea = Basic;
                }
            }
        }
        area(factboxes)
        {
            systempart(Control1000000008; Notes)
            {
            }
            systempart(Control1000000009; MyNotes)
            {
            }
            systempart(Control1000000010; Links)
            {
            }
        }
    }

    actions
    {
        area(processing)
        {
            action("&Brackets Table")
            {
                ApplicationArea = Basic;
                Caption = '&Brackets Table';
                Ellipsis = true;
                Image = "Table";
                Promoted = true;
                PromotedCategory = Process;
                RunObject = Page "Tax Table";
                RunPageLink = "Table Code" = field("Bracket Code");
            }
        }
    }
}
