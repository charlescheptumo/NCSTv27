#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Page 70000 "Supplier Category"
{
    ApplicationArea = Basic;
    PageType = Card;
    SourceTable = "Supplier Category";
    UsageCategory = Lists;

    layout
    {
        area(content)
        {
            repeater(Control1000000000)
            {
                field("Category Code"; Rec."Category Code")
                {
                    ApplicationArea = Basic;
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = Basic;
                }
                field("No. Prequalified"; Rec."No. Prequalified")
                {
                    ApplicationArea = Basic;
                }
                field("Vendor Posting Group"; Rec."Vendor Posting Group")
                {
                    ApplicationArea = Basic;
                }
                field("Gen. Bus. Posting Group"; Rec."Gen. Bus. Posting Group")
                {
                    ApplicationArea = Basic;
                }
                field("VAT Bus. Posting Group"; Rec."VAT Bus. Posting Group")
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
