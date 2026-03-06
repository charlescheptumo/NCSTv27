#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Page 75257 "Bid Response List"
{
    ApplicationArea = Basic;
    CardPageID = "Bid Response Card";
    PageType = List;
    SourceTable = "Purchase Header";
    SourceTableView = where("Document Type" = filter(Quote));
    UsageCategory = Lists;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("No."; Rec."No.")
                {
                    ApplicationArea = Basic;
                }
                field("Buy-from Vendor No."; Rec."Buy-from Vendor No.")
                {
                    ApplicationArea = Basic;
                }
                field("Primary Region"; Rec."Primary Region")
                {
                    ApplicationArea = Basic;
                }
                field("Primary Directorate"; Rec."Primary Directorate")
                {
                    ApplicationArea = Basic;
                }
                field("Primary Department"; Rec."Primary Department")
                {
                    ApplicationArea = Basic;
                }
                field("Invitation For Supply No"; Rec."Invitation For Supply No")
                {
                    ApplicationArea = Basic;
                }
                field("Invitation Notice Type"; Rec."Invitation Notice Type")
                {
                    ApplicationArea = Basic;
                }
                field("Bid Envelope Type"; Rec."Bid Envelope Type")
                {
                    ApplicationArea = Basic;
                }
                field("Bid Seal Type"; Rec."Bid Seal Type")
                {
                    ApplicationArea = Basic;
                }
                field("Tender Description"; Rec."Tender Description")
                {
                    ApplicationArea = Basic;
                }
                field("Bidder Representative Name"; Rec."Bidder Representative Name")
                {
                    ApplicationArea = Basic;
                }
                field("Bidder Representative Desgn"; Rec."Bidder Representative Desgn")
                {
                    ApplicationArea = Basic;
                }
                field("Bidder Representative Address"; Rec."Bidder Representative Address")
                {
                    ApplicationArea = Basic;
                }
                field("Bidder Witness Name"; Rec."Bidder Witness Name")
                {
                    ApplicationArea = Basic;
                }
                field("Bidder Witness Designation"; Rec."Bidder Witness Designation")
                {
                    ApplicationArea = Basic;
                }
                field("Bidder Witness Address"; Rec."Bidder Witness Address")
                {
                    ApplicationArea = Basic;
                }
                field("Tender Document Source"; Rec."Tender Document Source")
                {
                    ApplicationArea = Basic;
                }
                field("Bid Charge Code"; Rec."Bid Charge Code")
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
