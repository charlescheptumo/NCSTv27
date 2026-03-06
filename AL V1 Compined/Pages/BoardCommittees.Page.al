#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Page 55006 "Board Committees"
{
    ApplicationArea = Basic;
    Caption = 'Categories of Board Committees';
    PageType = List;
    SourceTable = "Board Committees";
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
                field(Mandate; Rec.Mandate)
                {
                    ApplicationArea = Basic;
                }
                field("Start Date"; Rec."Start Date")
                {
                    ApplicationArea = Basic;
                }
                field("End Date"; Rec."End Date")
                {
                    ApplicationArea = Basic;
                }
                field(Status; Rec.Status)
                {
                    ApplicationArea = Basic;
                }
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
                    RunObject = Page "Board Committee Members";
                    RunPageLink = Committee = field(Code);
                }
            }
        }
    }
}
