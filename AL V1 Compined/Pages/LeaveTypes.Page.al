#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Page 69163 "Leave Types"
{
    PageType = List;
    SourceTable = "Leave Types";

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
                field(Days; Rec.Days)
                {
                    ApplicationArea = Basic;
                }
                field(Gender; Rec.Gender)
                {
                    ApplicationArea = Basic;
                }
                field("Inclusive of Holidays"; Rec."Inclusive of Holidays")
                {
                    ApplicationArea = Basic;
                }
                field("Inclusive of Saturday"; Rec."Inclusive of Saturday")
                {
                    ApplicationArea = Basic;
                }
                field("Inclusive of Sunday"; Rec."Inclusive of Sunday")
                {
                    ApplicationArea = Basic;
                }
                field("Annual Leave"; Rec."Annual Leave")
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
