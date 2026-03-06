#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Page 75149 "Bid Equipment Compliance"
{
    PageType = List;
    SourceTable = "Bid Equipment Compliance";

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
                field("Equipment Type Code"; Rec."Equipment Type Code")
                {
                    ApplicationArea = Basic;
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = Basic;
                }
                field("Total No. of Equipment"; Rec."Total No. of Equipment")
                {
                    ApplicationArea = Basic;
                }
                field("Requirement Type"; Rec."Requirement Type")
                {
                    ApplicationArea = Basic;
                }
                field("Minimum Required Quantity"; Rec."Minimum Required Quantity")
                {
                    ApplicationArea = Basic;
                }
                field("Actual Owned Quantity"; Rec."Actual Owned Quantity")
                {
                    ApplicationArea = Basic;
                }
                field("Actual Leased Equipment"; Rec."Actual Leased Equipment")
                {
                    ApplicationArea = Basic;
                }
                field("Total Owned/Leased Quantity"; Rec."Total Owned/Leased Quantity")
                {
                    ApplicationArea = Basic;
                }
                field("Compliance Check"; Rec."Compliance Check")
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
    }
}
