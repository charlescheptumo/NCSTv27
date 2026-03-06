#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Page 75220 "EOI Response Line"
{
    PageType = ListPart;
    SourceTable = "IFP Response Line";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Procurement Category"; Rec."Procurement Category")
                {
                    ApplicationArea = Basic;
                }
                field("Document No."; Rec."Document No.")
                {
                    ApplicationArea = Basic;
                }
                field("Category Description"; Rec."Category Description")
                {
                    ApplicationArea = Basic;
                }
                field("RFI Document No."; Rec."RFI Document No.")
                {
                    ApplicationArea = Basic;
                }
                field("Vendor No."; Rec."Vendor No.")
                {
                    ApplicationArea = Basic;
                }
                field("Special Group Reservation"; Rec."Special Group Reservation")
                {
                    ApplicationArea = Basic;
                }
                field("Unique Category Requirements"; Rec."Unique Category Requirements")
                {
                    ApplicationArea = Basic;
                }
                field("Global RC Prequalification"; Rec."Global RC Prequalification")
                {
                    ApplicationArea = Basic;
                }
                field("Restricted Responsbility Cente"; Rec."Restricted Responsbility Cente")
                {
                    ApplicationArea = Basic;
                }
                field("Restricted RC ID"; Rec."Restricted RC ID")
                {
                    ApplicationArea = Basic;
                }
                field("Prequalification Start Date"; Rec."Prequalification Start Date")
                {
                    ApplicationArea = Basic;
                }
                field("Prequalification End Date"; Rec."Prequalification End Date")
                {
                    ApplicationArea = Basic;
                }
                field("Evaluation Decision"; Rec."Evaluation Decision")
                {
                    ApplicationArea = Basic;
                }
                field("Evaluation Score %"; Rec."Evaluation Score %")
                {
                    ApplicationArea = Basic;
                }
            }
        }
    }

    actions
    {
        area(processing)
        {
            group(Line)
            {
                Caption = 'Line';
                action("RFI Category Requirement ")
                {
                    ApplicationArea = Basic;
                    Caption = 'Specific Requirement';
                    Image = Category;
                    Promoted = true;
                    RunObject = Page "RFI Category Requirement";
                    RunPageLink = "Requirement Code" = field("Procurement Category");
                }
                action("Prequalified Responsibility Centers")
                {
                    ApplicationArea = Basic;
                    Caption = 'Prequalified Responsibility Centers';
                    Image = Comment;
                    Promoted = true;
                    RunObject = Page "IFP Response Line RC";
                    RunPageLink = "Document No." = field("Document No."),
                                  "Document Type" = field("Document Type");
                }
            }
        }
    }
}
