#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Page 75140 "Bid Key Staff"
{
    PageType = List;
    SourceTable = "Bid Key Staff";
    ApplicationArea = All;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Document Type"; Rec."Document Type")
                {
                    ApplicationArea = Basic;
                }
                field("No."; Rec."No.")
                {
                    ApplicationArea = Basic;
                }
                field("Vendor No."; Rec."Vendor No.")
                {
                    ApplicationArea = Basic;
                }
                field("Staff No."; Rec."Staff No.")
                {
                    ApplicationArea = Basic;
                }
                field("Staff Name"; Rec."Staff Name")
                {
                    ApplicationArea = Basic;
                }
                field(Nationality; Rec.Nationality)
                {
                    ApplicationArea = Basic;
                }
                field("Proposed Project Role ID"; Rec."Proposed Project Role ID")
                {
                    ApplicationArea = Basic;
                }
                field("Required Project Role"; Rec."Required Project Role")
                {
                    ApplicationArea = Basic;
                }
                field("Staff Category"; Rec."Staff Category")
                {
                    ApplicationArea = Basic;
                }
                field(Profession; Rec.Profession)
                {
                    ApplicationArea = Basic;
                }
                field("Date of Birth"; Rec."Date of Birth")
                {
                    ApplicationArea = Basic;
                }
                field("Years with Firm"; Rec."Years with Firm")
                {
                    ApplicationArea = Basic;
                }
                field("Phone No."; Rec."Phone No.")
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
        area(navigation)
        {
            group(ActionGroup18)
            {
                action("Bid Key Staff Qualification")
                {
                    ApplicationArea = Basic;
                    Image = QualificationOverview;
                    Promoted = true;
                    PromotedCategory = Process;
                    RunObject = Page "Bid Key Staff Qualification";
                    RunPageLink = "Staff No." = field("Staff No.");
                }
                action("Bid Key Staff Experience")
                {
                    ApplicationArea = Basic;
                    Image = FileContract;
                    Promoted = true;
                    PromotedCategory = Process;
                    RunObject = Page "Bid Key Staff Experience";
                    RunPageLink = "Staff No." = field("Staff No.");
                }
            }
        }
    }
}
