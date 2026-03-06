#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Page 75036 "Vendor Past Experience"
{
    Caption = 'Vendor Past Experience';
    PageType = ListPart;
    SourceTable = "Vendor Past Experience";

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
                field("Client Name"; Rec."Client Name")
                {
                    ApplicationArea = Basic;
                }
                field("Name 2"; Rec."Name 2")
                {
                    ApplicationArea = Basic;
                }
                field(Address; Rec.Address)
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
                field("Nationality ID"; Rec."Nationality ID")
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
                field("Entity Ownership %"; Rec."Entity Ownership %")
                {
                    ApplicationArea = Basic;
                }
                field("Share Types"; Rec."Share Types")
                {
                    ApplicationArea = Basic;
                }
                field("No. of Shares"; Rec."No. of Shares")
                {
                    ApplicationArea = Basic;
                }
                field("Nominal Value/Share"; Rec."Nominal Value/Share")
                {
                    ApplicationArea = Basic;
                }
                field("Total Nominal Value"; Rec."Total Nominal Value")
                {
                    ApplicationArea = Basic;
                }
                field("Ownership Effective Date"; Rec."Ownership Effective Date")
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
                field("Primary Contact Person"; Rec."Primary Contact Person")
                {
                    ApplicationArea = Basic;
                }
                field("Primary Contact Designation"; Rec."Primary Contact Designation")
                {
                    ApplicationArea = Basic;
                }
                field("Primary Contact Tel"; Rec."Primary Contact Tel")
                {
                    ApplicationArea = Basic;
                }
                field("Primary Contact Email"; Rec."Primary Contact Email")
                {
                    ApplicationArea = Basic;
                }
                field("Assignment Name"; Rec."Assignment Name")
                {
                    ApplicationArea = Basic;
                }
                field("Project Scope Summary"; Rec."Project Scope Summary")
                {
                    ApplicationArea = Basic;
                }
                field("Delivery Location"; Rec."Delivery Location")
                {
                    ApplicationArea = Basic;
                }
                field("Contract Ref No"; Rec."Contract Ref No")
                {
                    ApplicationArea = Basic;
                }
                field("Assignment Start Date"; Rec."Assignment Start Date")
                {
                    ApplicationArea = Basic;
                }
                field("Assignment End Date"; Rec."Assignment End Date")
                {
                    ApplicationArea = Basic;
                }
                field("Assignment Value LCY"; Rec."Assignment Value LCY")
                {
                    ApplicationArea = Basic;
                }
                field("Assignment Status"; Rec."Assignment Status")
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
