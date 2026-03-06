#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Page 69104 "Assigned Committee Members"
{
    PageType = List;
    SourceTable = "Committee Board Of Directors";

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
                field(SurName; Rec.SurName)
                {
                    ApplicationArea = Basic;
                }
                field(OtherNames; Rec.OtherNames)
                {
                    ApplicationArea = Basic;
                }
                field(Designation; Rec.Designation)
                {
                    ApplicationArea = Basic;
                }
                field(Remarks; Rec.Remarks)
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
    }
}
