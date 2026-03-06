#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Page 80006 "Stakeholder Groups"
{
    ApplicationArea = Basic;
    PageType = List;
    SourceTable = "Stakeholder Group";
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
                field("Object Type"; Rec."Object Type")
                {
                    ApplicationArea = Basic;
                }
                field("Object ID"; Rec."Object ID")
                {
                    ApplicationArea = Basic;
                }
                field("No. of Sub-Groups"; Rec."No. of Sub-Groups")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Blocked?"; Rec."Blocked?")
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
            action("Go To List")
            {
                ApplicationArea = Basic;
                Image = Navigate;
                Promoted = true;
                PromotedCategory = Process;

                trigger OnAction()
                begin
                    RunReportOrPageLink;
                end;
            }
            action("Sub-Groups")
            {
                ApplicationArea = Basic;
                Image = Route;
                Promoted = true;
                PromotedCategory = Process;
                RunObject = Page "Stakeholder Sub-Groups";
                RunPageLink = "Stakeholder Group" = field(Code);
            }
        }
    }

    local procedure RunReportOrPageLink()
    var
        AllObjWithCaption: Record AllObjWithCaption;
    begin
        if (Rec."Object Type" = 0) or (Rec."Object ID" = 0) then
            exit;
        if Rec."Object Type" = AllObjWithCaption."object type"::Page then
            Page.Run(Rec."Object ID")
        else
            Report.Run(Rec."Object ID");
    end;
}
