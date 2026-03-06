#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Page 55005 "Meeting Agenda"
{
    PageType = List;
    SourceTable = Agenda;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Meeting Code"; Rec."Meeting Code")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field("Agenda No"; Rec."Agenda No")
                {
                    ApplicationArea = Basic;
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = Basic;
                }
                field(Comments; Rec.Comments)
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
