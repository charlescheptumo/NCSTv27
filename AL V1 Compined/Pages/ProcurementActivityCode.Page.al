#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Page 75026 "Procurement Activity Code"
{
    ApplicationArea = Basic;
    PageType = List;
    SourceTable = "Procurement Activity Code";
    UsageCategory = Administration;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Activity Code"; Rec."Activity Code")
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
            }
        }
    }

    actions
    {
        area(navigation)
        {
            action("Procurement Plan Schedule")
            {
                ApplicationArea = Basic;
                Image = Planning;
                Promoted = true;
                PromotedCategory = Process;
                RunObject = Page "PP Purchase Activity Schedule";
                RunPageLink = "Activity Code" = field("Activity Code");
            }
        }
    }
}
