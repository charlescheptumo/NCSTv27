#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Page 56138 "ICT Category"
{
    ApplicationArea = Basic;
    PageType = List;
    SourceTable = "ICT Asset Category";
    UsageCategory = Administration;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field(Category; Rec.Category)
                {
                    ApplicationArea = Basic;
                }
                field("Code"; Rec.Code)
                {
                    ApplicationArea = Basic;
                }
                field(Name; Rec.Name)
                {
                    ApplicationArea = Basic;
                }
                field("FA Class Code"; Rec."FA Class Code")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field("FA SubClass"; Rec."FA SubClass")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
            }
        }
        area(factboxes)
        {
            systempart(Control8; Outlook)
            {
            }
            systempart(Control9; Notes)
            {
            }
            systempart(Control10; MyNotes)
            {
            }
            systempart(Control11; Links)
            {
            }
        }
    }

    actions
    {
    }
}
