#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Page 75007 "Law & Regulation Card"
{
    PageType = Card;
    SourceTable = "Procurement Law & Regulation";

    layout
    {
        area(content)
        {
            group(General)
            {
                field("Code"; Rec.Code)
                {
                    ApplicationArea = Basic;
                }
                field("Document Type"; Rec."Document Type")
                {
                    ApplicationArea = Basic;
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = Basic;
                }
                field("No. of Versions"; Rec."No. of Versions")
                {
                    ApplicationArea = Basic;
                }
                field("Current Version No"; Rec."Current Version No")
                {
                    ApplicationArea = Basic;
                }
                field(Status; Rec.Status)
                {
                    ApplicationArea = Basic;
                }
            }
        }
        area(factboxes)
        {
            systempart(Control10; Outlook)
            {
            }
            systempart(Control11; Notes)
            {
            }
            systempart(Control12; MyNotes)
            {
            }
            systempart(Control13; Links)
            {
            }
        }
    }

    actions
    {
        area(navigation)
        {
            action(Versions)
            {
                ApplicationArea = Basic;
                Image = Versions;
                Promoted = true;
                PromotedCategory = Process;
                RunObject = Page "Proc Regulation Version";
                RunPageLink = "Primary Document No" = field(Code);
            }
            action("Procurement Disputes")
            {
                ApplicationArea = Basic;
            }
        }
    }
}
