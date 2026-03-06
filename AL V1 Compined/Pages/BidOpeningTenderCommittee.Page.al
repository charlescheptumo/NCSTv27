#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Page 75158 "Bid Opening Tender Committee"
{
    PageType = List;
    SourceTable = "Bid Opening Tender Committee";

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
                    Visible = false;
                }
                field("ID/Passport No"; Rec."ID/Passport No")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field("Tax Registration (PIN) No."; Rec."Tax Registration (PIN) No.")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field(Email; Rec.Email)
                {
                    ApplicationArea = Basic;
                }
                field("Telephone No."; Rec."Telephone No.")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field("Staff  No."; Rec."Staff  No.")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field("IFS Code"; Rec."IFS Code")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field("Nominated Bid Opening"; Rec."Nominated Bid Opening")
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
