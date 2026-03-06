#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Page 75151 "Bid_Contract Security Register"
{
    PageType = List;
    SourceTable = "Bid_Contract Security Register";
    ApplicationArea = All;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Form of Security"; Rec."Form of Security")
                {
                    ApplicationArea = Basic;
                }
                field("Vendor No."; Rec."Vendor No.")
                {
                    ApplicationArea = Basic;
                }
                field("Security Type"; Rec."Security Type")
                {
                    ApplicationArea = Basic;
                }
                field("Issuer Institution Type"; Rec."Issuer Institution Type")
                {
                    ApplicationArea = Basic;
                }
                field("Issuer/Guarantor Name"; Rec."Issuer/Guarantor Name")
                {
                    ApplicationArea = Basic;
                }
                field("Issuer Registered Offices"; Rec."Issuer Registered Offices")
                {
                    ApplicationArea = Basic;
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = Basic;
                }
                field("Security Amount (LCY)"; Rec."Security Amount (LCY)")
                {
                    ApplicationArea = Basic;
                }
                field("Bid Security Effective Date"; Rec."Bid Security Effective Date")
                {
                    ApplicationArea = Basic;
                    Caption = 'Bid Security Effective Date';
                    Description = 'Bid Security Effective Date';
                }
                field("Bid Security Validity Expiry"; Rec."Bid Security Validity Expiry")
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
