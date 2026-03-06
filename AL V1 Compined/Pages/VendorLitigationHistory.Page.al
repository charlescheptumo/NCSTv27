#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Page 75035 "Vendor Litigation History"
{
    PageType = ListPart;
    SourceTable = "Vendor Litigation History";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Entry No."; Rec."Entry No.")
                {
                    ApplicationArea = Basic;
                }
                field("Vendor No."; Rec."Vendor No.")
                {
                    ApplicationArea = Basic;
                }
                field("Dispute Matter"; Rec."Dispute Matter")
                {
                    ApplicationArea = Basic;
                }
                field("Category of Matter"; Rec."Category of Matter")
                {
                    ApplicationArea = Basic;
                }
                field(Year; Rec.Year)
                {
                    ApplicationArea = Basic;
                }
                field("Other Dispute Party"; Rec."Other Dispute Party")
                {
                    ApplicationArea = Basic;
                }
                field("3rd Party Entity"; Rec."3rd Party Entity")
                {
                    ApplicationArea = Basic;
                }
                field("Dispute Amount LCY"; Rec."Dispute Amount LCY")
                {
                    ApplicationArea = Basic;
                }
                field("Award Type"; Rec."Award Type")
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
