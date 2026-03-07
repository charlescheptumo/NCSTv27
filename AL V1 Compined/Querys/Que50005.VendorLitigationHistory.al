query 50005 VendorLitigationHistory
{
    Caption = 'VendorLitigationHistory';
    QueryType = Normal;

    elements
    {
        dataitem(VendorLitigationHistory; "Vendor Litigation History")
        {
            column("ThirdPartyEntity"; "3rd Party Entity")
            {
            }
            column(AwardType; "Award Type")
            {
            }
            column(CategoryofMatter; "Category of Matter")
            {
            }
            column(DisputeAmountLCY; "Dispute Amount LCY")
            {
            }
            column(DisputeMatter; "Dispute Matter")
            {
            }
            column(EntryNo; "Entry No.")
            {
            }
            column(VendorNo; "Vendor No.")
            {
            }
            column(Year; Year)
            {
            }
            column(OtherDisputeParty; "Other Dispute Party")
            {
            }
        }
    }

    trigger OnBeforeOpen()
    begin

    end;
}
