#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Page 75028 "Procurement Categories"
{
    ApplicationArea = Basic;
    PageType = List;
    SourceTable = "Procurement Category";
    SourceTableView = where(Blocked = const(false));
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
                field("Procurement Type"; Rec."Procurement Type")
                {
                    ApplicationArea = Basic;
                }
                field("Preferred Vendor Cluster"; Rec."Preferred Vendor Cluster")
                {
                    ApplicationArea = Basic;
                }
                field("Applicable Location"; Rec."Applicable Location")
                {
                    ApplicationArea = Basic;
                }
                field("Specific Responsibility Center"; Rec."Specific Responsibility Center")
                {
                    ApplicationArea = Basic;
                }
                field("Responsibility Center Type"; Rec."Responsibility Center Type")
                {
                    ApplicationArea = Basic;
                }
                field("Responsibility Center Code"; Rec."Responsibility Center Code")
                {
                    ApplicationArea = Basic;
                }
                field("Category Type"; Rec."Category Type")
                {
                    ApplicationArea = Basic;
                }
                field(Blocked; Rec.Blocked)
                {
                    ApplicationArea = Basic;
                }
            }
        }
        area(factboxes)
        {
            systempart(Control14; Outlook)
            {
            }
            systempart(Control15; Notes)
            {
            }
            systempart(Control16; MyNotes)
            {
            }
            systempart(Control17; Links)
            {
            }
            // chartpart("Q5402-01"; "Q5402-01")
            // {
            // }
            // chartpart("Q9150-01"; "Q9150-01")
            // {
            // }
        }
    }

    actions
    {
        area(navigation)
        {
            action(Products)
            {
                ApplicationArea = Basic;
                Image = Item;
                Promoted = true;
                PromotedCategory = Process;
                RunObject = Page "Procurement Category Product";
                RunPageLink = "Category ID" = field(Code);
            }
            action("Registered Vendors")
            {
                ApplicationArea = Basic;
                Image = Vendor;
                Promoted = true;
                PromotedCategory = Process;
                RunObject = Page "Vendor List";
            }
            action("Specific Category Requirement")
            {
                ApplicationArea = Basic;
                Image = ServiceAccessories;
                Promoted = true;
                PromotedCategory = Process;
                RunObject = Page "RFI Category Requirement";
                RunPageLink = "Category ID" = field(Code);
            }
            action("Procurement Planning")
            {
                ApplicationArea = Basic;
                Image = AbsenceCategory;
                Promoted = true;
                PromotedCategory = Process;
                RunObject = Page "Procurement Plan Lines";
                RunPageLink = "Planning Category" = field(Code);
            }
            action("Invitation For Prequalification")
            {
                ApplicationArea = Basic;
                Image = Info;
                Promoted = true;
                PromotedCategory = Category4;
                RunObject = Page "Request For Information";
            }
            action("Invitation For Supply")
            {
                ApplicationArea = Basic;
                Image = InwardEntry;
                Promoted = true;
                PromotedCategory = Category4;
                RunObject = Page "Draft Invitation For Supply";
            }
        }
    }
}
