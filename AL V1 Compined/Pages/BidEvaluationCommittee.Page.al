#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Page 75160 "Bid Evaluation Committee"
{
    PageType = List;
    SourceTable = "Bid Evaluation Committee";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Document No."; Rec."Document No.")
                {
                    ApplicationArea = Basic;
                }
                field("Line No"; Rec."Line No")
                {
                    ApplicationArea = Basic;
                }
                field("Appointed Bid Opening Com"; Rec."Appointed Bid Opening Com")
                {
                    ApplicationArea = Basic;
                }
                field("Role Type"; Rec."Role Type")
                {
                    ApplicationArea = Basic;
                }
                field("Member No."; Rec."Member No.")
                {
                    ApplicationArea = Basic;
                }
                field("Member Name"; Rec."Member Name")
                {
                    ApplicationArea = Basic;
                }
                field(Designation; Rec.Designation)
                {
                    ApplicationArea = Basic;
                }
                field("ID/Passport No"; Rec."ID/Passport No")
                {
                    ApplicationArea = Basic;
                }
                field("Tax Registration (PIN) No."; Rec."Tax Registration (PIN) No.")
                {
                    ApplicationArea = Basic;
                }
                field(Email; Rec.Email)
                {
                    ApplicationArea = Basic;
                }
                field("Telephone No."; Rec."Telephone No.")
                {
                    ApplicationArea = Basic;
                }
                field("Staff  No."; Rec."Staff  No.")
                {
                    ApplicationArea = Basic;
                }
                field("IFS Code"; Rec."IFS Code")
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
