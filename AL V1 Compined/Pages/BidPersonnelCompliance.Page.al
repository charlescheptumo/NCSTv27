#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Page 75256 "Bid Personnel Compliance"
{
    PageType = List;
    SourceTable = "Bid Personnel Compliance";
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
                field("Document No."; Rec."Document No.")
                {
                    ApplicationArea = Basic;
                }
                field("Staff Role Code"; Rec."Staff Role Code")
                {
                    ApplicationArea = Basic;
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = Basic;
                }
                field("Staff Category"; Rec."Staff Category")
                {
                    ApplicationArea = Basic;
                }
                field("Minimum No. of Required Staff"; Rec."Minimum No. of Required Staff")
                {
                    ApplicationArea = Basic;
                }
                field("Requirement Type"; Rec."Requirement Type")
                {
                    ApplicationArea = Basic;
                }
                field("Actual No. of Proposed Staff"; Rec."Actual No. of Proposed Staff")
                {
                    ApplicationArea = Basic;
                }
                field("Compliance Check"; Rec."Compliance Check")
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
