#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Page 75139 "Bid Business Owner"
{
    PageType = List;
    SourceTable = "Bid Business Owner";
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
                field("Entry No."; Rec."Entry No.")
                {
                    ApplicationArea = Basic;
                }
                field("Vendor No."; Rec."Vendor No.")
                {
                    ApplicationArea = Basic;
                }
                field(Name; Rec.Name)
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
                field("ID/Passport No."; Rec."ID/Passport No.")
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
                field(No; Rec.No)
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
