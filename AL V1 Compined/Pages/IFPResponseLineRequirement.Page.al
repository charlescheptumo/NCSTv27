#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Page 75174 "IFP Response Line Requirement"
{
    PageType = List;
    SourceTable = "IFP Response Line Requirement";
    ApplicationArea = All;

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
                field("Procurement Category"; Rec."Procurement Category")
                {
                    ApplicationArea = Basic;
                }
                field("Entry No"; Rec."Entry No")
                {
                    ApplicationArea = Basic;
                }
                field("Requirement Code"; Rec."Requirement Code")
                {
                    ApplicationArea = Basic;
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = Basic;
                }
                field("Requirement Type"; Rec."Requirement Type")
                {
                    ApplicationArea = Basic;
                }
                field("RFI Document No."; Rec."RFI Document No.")
                {
                    ApplicationArea = Basic;
                }
                field("Meets Requirement"; Rec."Meets Requirement")
                {
                    ApplicationArea = Basic;
                }
                field("Proof of compliance summary"; Rec."Proof of compliance summary")
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
