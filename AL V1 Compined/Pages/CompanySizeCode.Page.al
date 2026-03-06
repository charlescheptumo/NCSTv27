#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Page 75083 "Company Size Code"
{
    ApplicationArea = Basic;
    PageType = List;
    SourceTable = "Company Size Code";
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
                field("Min No. Of Employees"; Rec."Min No. Of Employees")
                {
                    ApplicationArea = Basic;
                }
                field("Max No. Of Employees"; Rec."Max No. Of Employees")
                {
                    ApplicationArea = Basic;
                }
                field("No. of Vendors"; Rec."No. of Vendors")
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
            group("Company Size")
            {
                Caption = 'Company Size';
                Image = IndustryGroups;
                action(Vendors)
                {
                    ApplicationArea = Basic;
                    Image = Vendor;
                    Promoted = true;
                    PromotedCategory = Process;
                    RunObject = Page "Vendor List";
                    RunPageLink = "Company Size" = field(Code);
                }
            }
        }
    }
}
