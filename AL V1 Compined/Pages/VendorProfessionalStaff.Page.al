#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Page 75037 "Vendor Professional Staff"
{
    PageType = List;
    SourceTable = "Vendor Professional Staff";
    ApplicationArea = All;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Entry No."; Rec."Entry No.")
                {
                    ApplicationArea = Basic;
                }
                field("Vendor No."; Rec."Vendor No.")
                {
                    ApplicationArea = Basic;
                }
                field("Staff Name"; Rec."Staff Name")
                {
                    ApplicationArea = Basic;
                }
                field(Proffesion; Rec.Proffesion)
                {
                    ApplicationArea = Basic;
                }
                field("Current Designation"; Rec."Current Designation")
                {
                    ApplicationArea = Basic;
                }
                field("Address 2"; Rec."Address 2")
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
                field(Nationality; Rec.Nationality)
                {
                    ApplicationArea = Basic;
                }
                field("Citizenship Type"; Rec."Citizenship Type")
                {
                    ApplicationArea = Basic;
                }
                field("Date of Birth"; Rec."Date of Birth")
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
                field(Blocked; Rec.Blocked)
                {
                    ApplicationArea = Basic;
                }
                field("No. Series"; Rec."No. Series")
                {
                    ApplicationArea = Basic;
                }
                field("Joining Date"; Rec."Joining Date")
                {
                    ApplicationArea = Basic;
                }
                field("Years With the Firm"; Rec."Years With the Firm")
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
            action("Vendor Staff Qualification")
            {
                ApplicationArea = Basic;
                Image = QualificationOverview;
                Promoted = true;
                PromotedCategory = Process;
                RunObject = Page "Vendor Staff Qualification";
                //RunPageLink = "Staff Id" = field("Entry No.");
            }
            action("Vendor Staff Experience")
            {
                ApplicationArea = Basic;
                Image = Skills;
                Promoted = true;
                PromotedCategory = Process;
                RunObject = Page "Vendor Staff Experience";
                // RunPageLink = "Staff ID" = field("Entry No.");
            }
            action("Vendor Staff Employment")
            {
                ApplicationArea = Basic;
                Image = EmployeeAgreement;
                Promoted = true;
                PromotedCategory = Process;
                RunObject = Page "Vendor Staff Employment";
                //   RunPageLink = "Staff ID" = field("Entry No.");
            }
        }
    }
}
