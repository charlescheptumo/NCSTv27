#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Page 75248 "Tender Addendum Amendment"
{
    PageType = List;
    SourceTable = "Tender Addendum Amendment";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Addendum Notice No."; Rec."Addendum Notice No.")
                {
                    ApplicationArea = Basic;
                }
                field("Line No."; Rec."Line No.")
                {
                    ApplicationArea = Basic;
                }
                field("Amended Section of Tender Doc"; Rec."Amended Section of Tender Doc")
                {
                    ApplicationArea = Basic;
                }
                field("Amendment Type"; Rec."Amendment Type")
                {
                    ApplicationArea = Basic;
                }
                field("Amendment Description"; Rec."Amendment Description")
                {
                    ApplicationArea = Basic;
                }
            }
        }
    }

    actions
    {
    }
}
