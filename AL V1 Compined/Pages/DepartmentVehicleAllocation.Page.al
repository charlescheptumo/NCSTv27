#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Page 59040 "Department Vehicle Allocation"
{
    PageType = List;
    SourceTable = "Department Vehicle Allocation";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field(Department; Rec.Department)
                {
                    ApplicationArea = Basic;
                }
                field("Department Name"; Rec."Department Name")
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
