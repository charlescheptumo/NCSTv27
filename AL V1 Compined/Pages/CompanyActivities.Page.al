#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Page 69103 "Company Activities"
{
    ApplicationArea = Basic;
    PageType = List;
    SourceTable = "Company Activities";
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
                field(Day; Rec.Day)
                {
                    ApplicationArea = Basic;
                }
                field(Venue; Rec.Venue)
                {
                    ApplicationArea = Basic;
                }
                field(Responsibility; Rec.Responsibility)
                {
                    ApplicationArea = Basic;
                }
                field(Costs; Rec.Costs)
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
            systempart(Control1000000017; Notes)
            {
            }
            systempart(Control1000000018; MyNotes)
            {
            }
        }
    }

    actions
    {
    }
}
