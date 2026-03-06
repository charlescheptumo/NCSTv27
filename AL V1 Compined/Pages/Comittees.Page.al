#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Page 69100 Comittees
{
    ApplicationArea = Basic;
    PageType = List;
    SourceTable = Committees;
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
                field(Comments; Rec.Comments)
                {
                    ApplicationArea = Basic;
                }
            }
        }
        area(factboxes)
        {
            systempart(Control1000000006; Notes)
            {
            }
            systempart(Control1000000007; MyNotes)
            {
            }
            systempart(Control1000000008; Links)
            {
            }
        }
    }

    actions
    {
        area(navigation)
        {
            group("M&embers")
            {
                Caption = 'M&embers';
                Image = Employee;
                action("Assigned Committee Members")
                {
                    ApplicationArea = Basic;
                    Caption = 'Assigned Committee Members';
                    Image = Relatives;
                    Promoted = true;
                    PromotedCategory = Process;
                    RunObject = Page "Assigned Committee Members";
                    RunPageLink = Committee = field(Code);
                }
            }
        }
    }
}
