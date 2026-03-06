#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Page 70048 "Commitee Members"
{
    PageType = ListPart;
    SourceTable = "Commitee Members";

    layout
    {
        area(content)
        {
            repeater(Control1000000000)
            {
                field("Employee No"; Rec."Employee No")
                {
                    ApplicationArea = Basic;
                }
                field(Name; Rec.Name)
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field(Chair; Rec.Chair)
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field(Role; Rec.Role)
                {
                    ApplicationArea = Basic;
                }
                field(Email; Rec.Email)
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Nominated Bid Opening"; Rec."Nominated Bid Opening")
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
