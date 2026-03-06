#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Page 75340 "IFP Response Lines"
{
    PageType = ListPart;
    SourceTable = "RFI Response";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Vendor No."; Rec."Vendor No.")
                {
                    ApplicationArea = Basic;
                }
                field("Vendor Name"; Rec."Vendor Name")
                {
                    ApplicationArea = Basic;
                }
                field("RFI Document No."; Rec."RFI Document No.")
                {
                    ApplicationArea = Basic;
                }
                field("Vendor Representative Name"; Rec."Vendor Representative Name")
                {
                    ApplicationArea = Basic;
                }
                field("Vendor Repr Designation"; Rec."Vendor Repr Designation")
                {
                    ApplicationArea = Basic;
                }
                field("Vendor Address"; Rec."Vendor Address")
                {
                    ApplicationArea = Basic;
                }
                field("Vendor Address 2"; Rec."Vendor Address 2")
                {
                    ApplicationArea = Basic;
                }
                field(City; Rec.City)
                {
                    ApplicationArea = Basic;
                }
                field("Phone No."; Rec."Phone No.")
                {
                    ApplicationArea = Basic;
                }
                field("Country/Region Code"; Rec."Country/Region Code")
                {
                    ApplicationArea = Basic;
                }
                field("Post Code"; Rec."Post Code")
                {
                    ApplicationArea = Basic;
                }
                field(County; Rec.County)
                {
                    ApplicationArea = Basic;
                }
                field("E-Mail"; Rec."E-Mail")
                {
                    ApplicationArea = Basic;
                }
            }
        }
    }

    actions
    {
        area(processing)
        {
            action("IFR Lines")
            {
                ApplicationArea = Basic;
                RunObject = Page "IFP Response Line Requirement";
            }
            action("Technical Attachments")
            {
                ApplicationArea = Basic;
                Caption = 'Attachments';
                Image = Documents;
                Promoted = true;
                PromotedCategory = Category4;
                RunObject = Page "Bid Filed Document";
                RunPageLink = "Vendor No" = field("Vendor No.");
            }
        }
    }
}
