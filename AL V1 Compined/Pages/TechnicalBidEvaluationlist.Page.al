#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Page 75266 "Technical Bid Evaluation list"
{
    ApplicationArea = Basic;
    CardPageID = "Technical Bid Evaluation Card";
    Editable = false;
    PageType = List;
    SourceTable = "Bid Evaluation Register";
    SourceTableView = where("Evaluation Type" = filter("Technical Evaluation"),
                            "Evaluator Category" = const("Evaluation Committee"));
    UsageCategory = Tasks;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Code"; Rec.Code)
                {
                    ApplicationArea = Basic;
                }
                field("Evaluation Type"; Rec."Evaluation Type")
                {
                    ApplicationArea = Basic;
                }
                field("Evaluator Category"; Rec."Evaluator Category")
                {
                    ApplicationArea = Basic;
                }
                field("Evaluation Lead"; Rec."Evaluation Lead")
                {
                    ApplicationArea = Basic;
                }
                field("Evaluation Lead Name"; Rec."Evaluation Lead Name")
                {
                    ApplicationArea = Basic;
                }
                field("Bid No."; Rec."Bid No.")
                {
                    ApplicationArea = Basic;
                }
                field("Vendor No."; Rec."Vendor No.")
                {
                    ApplicationArea = Basic;
                }
                field("Bidder Name"; Rec."Bidder Name")
                {
                    ApplicationArea = Basic;
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = Basic;
                }
                field("Evaluation Date"; Rec."Evaluation Date")
                {
                    ApplicationArea = Basic;
                }
                field("Evaluation Venue"; Rec."Evaluation Venue")
                {
                    ApplicationArea = Basic;
                }
                field("IFS Code"; Rec."IFS Code")
                {
                    ApplicationArea = Basic;
                }
                field("Bid Scoring Document No."; Rec."Bid Scoring Document No.")
                {
                    ApplicationArea = Basic;
                }
                field("Bid Scoring Document Type"; Rec."Bid Scoring Document Type")
                {
                    ApplicationArea = Basic;
                }
                field("Bid Opening Register No."; Rec."Bid Opening Register No.")
                {
                    ApplicationArea = Basic;
                }
                field("Bid Opening Date"; Rec."Bid Opening Date")
                {
                    ApplicationArea = Basic;
                }
                field("Tender Evaluation Deadline"; Rec."Tender Evaluation Deadline")
                {
                    ApplicationArea = Basic;
                }
                field("Appointed Bid Evaluation Commi"; Rec."Appointed Bid Evaluation Commi")
                {
                    ApplicationArea = Basic;
                }
                field("Primary Region"; Rec."Primary Region")
                {
                    ApplicationArea = Basic;
                }
                field("Bid Envelop Type"; Rec."Bid Envelop Type")
                {
                    ApplicationArea = Basic;
                }
                field("Final Opening Done"; Rec."Final Opening Done")
                {
                    ApplicationArea = Basic;
                }
                field("Purchaser Code"; Rec."Purchaser Code")
                {
                    ApplicationArea = Basic;
                }
                field("Preliminary Evaluation Score"; Rec."Preliminary Evaluation Score")
                {
                    ApplicationArea = Basic;
                }
                field("Weighted Technical Eval Score"; Rec."Weighted Technical Eval Score")
                {
                    ApplicationArea = Basic;
                }
                field("Technical Evaluation  Decision"; Rec."Technical Evaluation  Decision")
                {
                    ApplicationArea = Basic;
                }
                field("Weighted Financial Eval Score"; Rec."Weighted Financial Eval Score")
                {
                    ApplicationArea = Basic;
                }
                field("Award Decision"; Rec."Award Decision")
                {
                    ApplicationArea = Basic;
                }
                field("Tender Evaluation Comm Remarks"; Rec."Tender Evaluation Comm Remarks")
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
