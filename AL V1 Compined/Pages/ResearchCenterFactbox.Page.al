#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Page 65065 "Research Center Factbox"
{
    PageType = CardPart;
    SourceTable = "Responsibility Center";

    layout
    {
        area(content)
        {
            field("Code"; Rec.Code)
            {
                ApplicationArea = Basic;
            }
            field(Name; Rec.Name)
            {
                ApplicationArea = Basic;
            }
            field("Headed By (Title)"; Rec."Headed By (Title)")
            {
                ApplicationArea = Basic;
            }
            field("Current Head"; Rec."Current Head")
            {
                ApplicationArea = Basic;
            }
            field("No. of Research Programs"; Rec."No. of Research Programs")
            {
                ApplicationArea = Basic;
            }
            field("No. of Awarded GFO"; Rec."No. of Awarded GFO")
            {
                ApplicationArea = Basic;
                Caption = 'No. of Awarded Grant Funding Proposals';
                Style = AttentionAccent;
                StyleExpr = true;
            }
            field("No. of Lost Grant GFO"; Rec."No. of Lost Grant GFO")
            {
                ApplicationArea = Basic;
                Caption = 'No. of Lost Grant Grant Funding Proposals';
            }
            field("No. of Ongoing RProjects"; Rec."No. of Ongoing RProjects")
            {
                ApplicationArea = Basic;
                Caption = 'No. of Ongoing Projects';
            }
            field("No. of Completed RProjects"; Rec."No. of Completed RProjects")
            {
                ApplicationArea = Basic;
                Caption = 'No. of Completed Projects';
            }
            field("Total Amount Awarded(LCY)"; Rec."Total Amount Awarded(LCY)")
            {
                ApplicationArea = Basic;
                Style = AttentionAccent;
                StyleExpr = true;
            }
        }
    }

    actions
    {
    }
}
