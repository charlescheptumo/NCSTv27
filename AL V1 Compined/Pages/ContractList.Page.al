#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Page 75283 "Contract List"
{
    ApplicationArea = Basic;
    CardPageID = "Contract Card";
    PageType = List;
    SourceTable = "Purchase Header";
    SourceTableView = where("Document Type" = const("Blanket Order"),
                            "Contract Status" = const(Signed));
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
                field("Buy-from Vendor Name"; Rec."Buy-from Vendor Name")
                {
                    ApplicationArea = Basic;
                }
                field("VAT Registration No."; Rec."VAT Registration No.")
                {
                    ApplicationArea = Basic;
                }
                field("Buy-from Address"; Rec."Buy-from Address")
                {
                    ApplicationArea = Basic;
                }
                field("Buy-from Address 2"; Rec."Buy-from Address 2")
                {
                    ApplicationArea = Basic;
                }
                field("Buy-from City"; Rec."Buy-from City")
                {
                    ApplicationArea = Basic;
                }
                field("Buy-from Contact"; Rec."Buy-from Contact")
                {
                    ApplicationArea = Basic;
                }
                field("Buy-from Country/Region Code"; Rec."Buy-from Country/Region Code")
                {
                    ApplicationArea = Basic;
                }
                field("Language Code"; Rec."Language Code")
                {
                    ApplicationArea = Basic;
                }
                field("Contract Description"; Rec."Contract Description")
                {
                    ApplicationArea = Basic;
                }
                field("Contract Start Date"; Rec."Contract Start Date")
                {
                    ApplicationArea = Basic;
                }
                field("Contract End Date"; Rec."Contract End Date")
                {
                    ApplicationArea = Basic;
                }
                field("Notice of Award No."; Rec."Notice of Award No.")
                {
                    ApplicationArea = Basic;
                }
                field("Awarded Bid No"; Rec."Awarded Bid No")
                {
                    ApplicationArea = Basic;
                }
                field("Award Tender Sum Inc Taxes"; Rec."Award Tender Sum Inc Taxes")
                {
                    ApplicationArea = Basic;
                }
                field("IFS Code"; Rec."IFS Code")
                {
                    ApplicationArea = Basic;
                }
                field("Tender Name"; Rec."Tender Name")
                {
                    ApplicationArea = Basic;
                }
                field("Contract Type"; Rec."Contract Type")
                {
                    ApplicationArea = Basic;
                }
                field("Governing Laws"; Rec."Governing Laws")
                {
                    ApplicationArea = Basic;
                }
                field("Contract Status"; Rec."Contract Status")
                {
                    ApplicationArea = Basic;
                }
                field("Procuring Entity (PE) Name"; Rec."Procuring Entity (PE) Name")
                {
                    ApplicationArea = Basic;
                }
                field("PE Representative"; Rec."PE Representative")
                {
                    ApplicationArea = Basic;
                }
                field("Your Reference"; Rec."Your Reference")
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
