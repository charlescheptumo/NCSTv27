#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Page 56122 "Escalation Matrix"
{
    PageType = List;
    SourceTable = "ICT Helpdesk Escalation Matrix";
    ApplicationArea = All;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Officer Name"; Rec."Officer Name")
                {
                    ApplicationArea = Basic;
                }
                field("Reports To Officer Name"; Rec."Reports To Officer Name")
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
