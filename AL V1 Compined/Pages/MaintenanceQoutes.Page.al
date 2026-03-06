#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Page 59046 "Maintenance Qoutes"
{
    CardPageID = "Purchase Quote";
    PageType = List;
    SourceTable = "Purchase Header";

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
                field("Buy-from Vendor No."; Rec."Buy-from Vendor No.")
                {
                    ApplicationArea = Basic;
                }
                field("No."; Rec."No.")
                {
                    ApplicationArea = Basic;
                }
                field("Quote No."; Rec."Quote No.")
                {
                    ApplicationArea = Basic;
                }
                field("Pay-to Vendor No."; Rec."Pay-to Vendor No.")
                {
                    ApplicationArea = Basic;
                }
                field("Pay-to Name"; Rec."Pay-to Name")
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
