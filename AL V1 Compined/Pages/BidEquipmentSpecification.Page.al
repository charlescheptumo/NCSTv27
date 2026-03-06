#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Page 75150 "Bid Equipment Specification"
{
    PageType = List;
    SourceTable = "Bid Equipment Specification";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Equipment Type Code"; Rec."Equipment Type Code")
                {
                    ApplicationArea = Basic;
                }
                field("Entry No"; Rec."Entry No")
                {
                    ApplicationArea = Basic;
                }
                field("Ownership Type"; Rec."Ownership Type")
                {
                    ApplicationArea = Basic;
                }
                field("Equipment Serial"; Rec."Equipment Serial")
                {
                    ApplicationArea = Basic;
                }
                field("Equipment Usability Code"; Rec."Equipment Usability Code")
                {
                    ApplicationArea = Basic;
                }
                field("Equipment Condition Code"; Rec."Equipment Condition Code")
                {
                    ApplicationArea = Basic;
                }
                field("Qty of Equipment"; Rec."Qty of Equipment")
                {
                    ApplicationArea = Basic;
                }
                field(Description; Rec.Description)
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
