#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Page 59069 "Planning Matrix List"
{
    PageType = ListPart;
    SourceTable = "Planning Marix";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field(No; Rec.No)
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    Visible = false;
                }
                field("Strategic Themes"; Rec."Strategic Themes")
                {
                    ApplicationArea = Basic;
                }
                field("Strategic Objectives"; Rec."Strategic Objectives")
                {
                    ApplicationArea = Basic;
                }
                field(Strategies; Rec.Strategies)
                {
                    ApplicationArea = Basic;
                }
                field(Activities; Rec.Activities)
                {
                    ApplicationArea = Basic;
                }
                field(KPI; Rec.KPI)
                {
                    ApplicationArea = Basic;
                }
                field("Fund Code"; Rec."Fund Code")
                {
                    ApplicationArea = Basic;
                }
                field(Target; Rec.Target)
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
            }
        }
    }

    actions
    {
    }
}
