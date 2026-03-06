#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Page 80023 "Organization Hierarchy"
{
    ApplicationArea = Basic;
    PageType = List;
    SourceTable = "Organization Hierarchy";
    UsageCategory = Tasks;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field(Level; Rec.Level)
                {
                    ApplicationArea = Basic;
                }
                field(Description; Rec.Description)
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
            action("Organization Units")
            {
                ApplicationArea = Basic;
                Image = Hierarchy;
                Promoted = true;
                RunObject = Page "Organizational Units  List";
                RunPageLink = "Hierarchical  Level ID" = field(Level);
            }
        }
    }
}
