#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Page 55001 "Board Committee Members"
{
    CardPageID = "Committee Member Card";
    PageType = List;
    SourceTable = "Committee Board Members";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field(Committee; Rec.Committee)
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field("Code"; Rec.Code)
                {
                    ApplicationArea = Basic;
                }
                field("Director No"; Rec."Director No")
                {
                    ApplicationArea = Basic;
                }
                field(Names; Rec.Names)
                {
                    ApplicationArea = Basic;
                }
                field(Role; Rec.Role)
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
