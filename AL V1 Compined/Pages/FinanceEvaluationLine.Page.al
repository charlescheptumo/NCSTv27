#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Page 75271 "Finance Evaluation Line"
{
    PageType = ListPart;
    SourceTable = "Finance Evaluation Line";

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
                field("Bidder No"; Rec."Bidder No")
                {
                    ApplicationArea = Basic;
                }
                field("Bidder Name"; Rec."Bidder Name")
                {
                    ApplicationArea = Basic;
                }
                field("Final Evaluated Bid Price"; Rec."Final Evaluated Bid Price")
                {
                    ApplicationArea = Basic;
                }
                field("Read-out Bid Price (A)"; Rec."Read-out Bid Price (A)")
                {
                    ApplicationArea = Basic;
                }
                field("Weighted Tech Score %"; Rec."Weighted Tech Score %")
                {
                    ApplicationArea = Basic;
                }
                field("Tech Evaluation Ranking"; Rec."Tech Evaluation Ranking")
                {
                    ApplicationArea = Basic;
                }
                field("Financial Evaluation Date"; Rec."Financial Evaluation Date")
                {
                    ApplicationArea = Basic;
                }
                field("Weighted Financial Score %"; Rec."Weighted Financial Score %")
                {
                    ApplicationArea = Basic;
                }
                field("Financial Evaluation Ranking"; Rec."Financial Evaluation Ranking")
                {
                    ApplicationArea = Basic;
                }
                field("Aggregate Weighted Score %"; Rec."Aggregate Weighted Score %")
                {
                    ApplicationArea = Basic;
                }
                field("Arithmetic Corrections (B)"; Rec."Arithmetic Corrections (B)")
                {
                    ApplicationArea = Basic;
                }
                field("Corrected Bid Price"; Rec."Corrected Bid Price")
                {
                    ApplicationArea = Basic;
                }
                field("Evaluation Committee Remarks"; Rec."Evaluation Committee Remarks")
                {
                    ApplicationArea = Basic;
                }
                field("Evaluation Committee Recomm"; Rec."Evaluation Committee Recomm")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
            }
        }
    }

    actions
    {
    }
}
