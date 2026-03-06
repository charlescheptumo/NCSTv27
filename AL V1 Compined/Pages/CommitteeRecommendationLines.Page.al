#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Page 55020 "Committee Recommendation Lines"
{
    PageType = ListPart;
    SourceTable = "Comm Recomendations  Lines";

    layout
    {
        area(content)
        {
            repeater(Control9)
            {
                field(Recommendation; Rec.Recommendation)
                {
                    ApplicationArea = Basic;
                }
                field("Action Owner"; Rec."Action Owner")
                {
                    ApplicationArea = Basic;
                }
                field("Action Taken"; Rec."Action Taken")
                {
                    ApplicationArea = Basic;
                }
                field("Date of the Meeting"; Rec."Date of the Meeting")
                {
                    ApplicationArea = Basic;
                }
                field(Status; Rec.Status)
                {
                    ApplicationArea = Basic;
                }
                field(Comments; Rec.Comments)
                {
                    ApplicationArea = Basic;
                }
                field("Date Closed"; Rec."Date Closed")
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
