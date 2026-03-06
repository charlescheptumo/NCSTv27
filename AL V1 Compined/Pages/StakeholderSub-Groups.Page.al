#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Page 80007 "Stakeholder Sub-Groups"
{
    PageType = List;
    SourceTable = "Stakeholder Sub-Group";
    ApplicationArea = All;

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
                field("Stakeholder Group"; Rec."Stakeholder Group")
                {
                    ApplicationArea = Basic;
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = Basic;
                }
                field("No. of Stakeholders"; Rec."No. of Stakeholders")
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
