#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Page 75152 "Bid Insurance"
{
    PageType = List;
    SourceTable = "Bid Insurance";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Insurance Type"; Rec."Insurance Type")
                {
                    ApplicationArea = Basic;
                }
                field("Policy Cover Type"; Rec."Policy Cover Type")
                {
                    ApplicationArea = Basic;
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = Basic;
                }
                field("Policy Start Date"; Rec."Policy Start Date")
                {
                    ApplicationArea = Basic;
                }
                field("Policy Expiry Date"; Rec."Policy Expiry Date")
                {
                    ApplicationArea = Basic;
                }
                field("Issuer Insurance Name"; Rec."Issuer Insurance Name")
                {
                    ApplicationArea = Basic;
                }
                field("Insurance Address"; Rec."Insurance Address")
                {
                    ApplicationArea = Basic;
                }
                field("Policy No."; Rec."Policy No.")
                {
                    ApplicationArea = Basic;
                }
                field("Policy Coverage (LCY)"; Rec."Policy Coverage (LCY)")
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
