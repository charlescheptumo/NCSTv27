#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Page 75031 "Special Vendor Category"
{
    ApplicationArea = Basic;
    PageType = List;
    SourceTable = "Special Vendor Category";
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
                field("Vendor Group"; Rec."Vendor Group")
                {
                    ApplicationArea = Basic;
                }
                field("Vendor Type"; Rec."Vendor Type")
                {
                    ApplicationArea = Basic;
                }
                field("Default Certifiying Agency"; Rec."Default Certifiying Agency")
                {
                    ApplicationArea = Basic;
                }
                field("Certifiying Agency URL"; Rec."Certifiying Agency URL")
                {
                    ApplicationArea = Basic;
                }
                field("No of Active Vendors"; Rec."No of Active Vendors")
                {
                    ApplicationArea = Basic;
                }
                field(Blocked; Rec.Blocked)
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
            group(ActionGroup12)
            {
                action(Vendors)
                {
                    ApplicationArea = Basic;
                    Image = Vendor;
                    Promoted = true;
                    PromotedCategory = Process;
                    RunObject = Page "Vendor List";
                    RunPageLink = "Current Vendor Class" = field(Code);
                }
            }
        }
    }
}
