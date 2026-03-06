#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Page 65033 "Grant Types List"
{
    ApplicationArea = Basic;
    PageType = List;
    SourceTable = "Grant Types";
    UsageCategory = Administration;

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
                field(Blocked; Rec.Blocked)
                {
                    ApplicationArea = Basic;
                }
                field(Type; Rec.Type)
                {
                    ApplicationArea = Basic;
                }
            }
        }
    }

    actions
    {
        area(creation)
        {
            group(ActionGroup7)
            {
                action("Funding Sources")
                {
                    ApplicationArea = Basic;
                    Image = ResourceCost;
                    Promoted = true;
                    PromotedCategory = Process;
                    RunObject = Page "Funding Source List";
                    RunPageLink = Code = field(Code);
                }
                action("Grants Profile")
                {
                    ApplicationArea = Basic;
                    Image = GiroPlus;
                    Promoted = true;
                    PromotedCategory = Process;

                    trigger OnAction()
                    begin
                        Message('Testing %1');
                    end;
                }
                action("Projects Profile")
                {
                    ApplicationArea = Basic;
                    Image = Job;
                    Promoted = true;
                    PromotedCategory = Process;
                    RunObject = Page "Job List";
                    RunPageLink = "Grant Type" = field(Code);
                }
                action(Statistics)
                {
                    ApplicationArea = Basic;
                }
            }
        }
    }
}
