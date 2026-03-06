#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Page 65059 "Grant Admin Teams List"
{
    PageType = List;
    SourceTable = "Grant Admin Team";
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
                field(Name; Rec.Name)
                {
                    ApplicationArea = Basic;
                }
                field("Next Task"; Rec."Next Task")
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
            group("&Team")
            {
                Caption = '&Team';
                Image = SalesPurchaseTeam;
                action("Admin Team Members")
                {
                    ApplicationArea = Basic, Suite;
                    Caption = 'Admin Team Members';
                    Image = ExportSalesPerson;
                    Promoted = true;
                    PromotedCategory = Process;
                    RunObject = Page "Admin Team Members";
                    RunPageLink = "Team Code" = field(Code);
                    ToolTip = 'View a list of admin within the team.';
                }
            }
        }
    }
}
