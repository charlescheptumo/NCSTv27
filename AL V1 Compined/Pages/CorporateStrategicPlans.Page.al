#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Page 80011 "Corporate Strategic Plans"
{
    ApplicationArea = Basic;
    CardPageID = "Corporate Strategic Plan Card";
    Editable = false;
    PageType = List;
    SourceTable = "Corporate Strategic Plans";
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
                field("Primary Theme"; Rec."Primary Theme")
                {
                    ApplicationArea = Basic;
                }
                field("Strategy Framework"; Rec."Strategy Framework")
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
                field("Duration (Years)"; Rec."Duration (Years)")
                {
                    ApplicationArea = Basic;
                }
                field("Vision Statement"; Rec."Vision Statement")
                {
                    ApplicationArea = Basic;
                }
                field("Mission Statement"; Rec."Mission Statement")
                {
                    ApplicationArea = Basic;
                }
                field("Implementation Status"; Rec."Implementation Status")
                {
                    ApplicationArea = Basic;
                }
                field("Approval Status"; Rec."Approval Status")
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
