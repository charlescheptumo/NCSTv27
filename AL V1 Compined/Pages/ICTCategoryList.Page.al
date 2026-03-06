#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Page 56116 "ICT Category List"
{
    ApplicationArea = Basic;
    PageType = List;
    SourceTable = "ICT Helpdesk Category";
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
                field("Category Head"; Rec."Category Head")
                {
                    ApplicationArea = Basic;
                }
                field("Expected Duration"; Rec."Expected Duration")
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
