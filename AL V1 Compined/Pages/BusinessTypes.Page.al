#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Page 75022 "Business Types"
{
    ApplicationArea = Basic;
    PageType = List;
    SourceTable = "Business Types";
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
                field(Blocked; Rec.Blocked)
                {
                    ApplicationArea = Basic;
                }
                field("Ownership Type"; Rec."Ownership Type")
                {
                    ApplicationArea = Basic;
                }
                field("No. of Active Vendors"; Rec."No. of Active Vendors")
                {
                    ApplicationArea = Basic;
                }
            }
        }
        area(factboxes)
        {
            systempart(Control9; Outlook)
            {
            }
            systempart(Control10; Notes)
            {
            }
            systempart(Control11; MyNotes)
            {
            }
            systempart(Control12; Links)
            {
            }
        }
    }

    actions
    {
        area(navigation)
        {
            group(ActionGroup14)
            {
                action(Vendors)
                {
                    ApplicationArea = Basic;
                    Image = Vendor;
                    Promoted = true;
                    PromotedCategory = Process;
                    RunObject = Page "Vendor List";
                    RunPageLink = "Business Type" = field(Code);
                }
            }
        }
    }
}
