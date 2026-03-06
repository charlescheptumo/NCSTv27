#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Page 75280 "Notice of Award list"
{
    ApplicationArea = Basic;
    CardPageID = "Notice of Award Card";
    Editable = false;
    PageType = List;
    SourceTable = "Bid Tabulation Header";
    SourceTableView = where("Document Type" = const("Notice of Award"));
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
                field("IFS Code"; Rec."IFS Code")
                {
                    ApplicationArea = Basic;
                }
                field("Document Date"; Rec."Document Date")
                {
                    ApplicationArea = Basic;
                }
                field("Final Evaluation Report ID"; Rec."Final Evaluation Report ID")
                {
                    ApplicationArea = Basic;
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = Basic;
                }
                field("Tender Name"; Rec."Tender Name")
                {
                    ApplicationArea = Basic;
                }
                field("Raised By"; Rec."Raised By")
                {
                    ApplicationArea = Basic;
                }
                field(Name; Rec.Name)
                {
                    ApplicationArea = Basic;
                }
                field("Tender Committee Role"; Rec."Tender Committee Role")
                {
                    ApplicationArea = Basic;
                }
                field("Designation/Title"; Rec."Designation/Title")
                {
                    ApplicationArea = Basic;
                }
                field("Annual Procurement Plan ID"; Rec."Annual Procurement Plan ID")
                {
                    ApplicationArea = Basic;
                }
                field("Procurement Plan Date"; Rec."Procurement Plan Date")
                {
                    ApplicationArea = Basic;
                }
                field("Financial Year Code"; Rec."Financial Year Code")
                {
                    ApplicationArea = Basic;
                }
                field("Procurement Plan Line No."; Rec."Procurement Plan Line No.")
                {
                    ApplicationArea = Basic;
                }
                field("Procurement Plan Entry No"; Rec."Procurement Plan Entry No")
                {
                    ApplicationArea = Basic;
                }
                field("Available Procurement Budget"; Rec."Available Procurement Budget")
                {
                    ApplicationArea = Basic;
                }
                field("Budget Narration"; Rec."Budget Narration")
                {
                    ApplicationArea = Basic;
                }
                field("Bid Opening Date"; Rec."Bid Opening Date")
                {
                    ApplicationArea = Basic;
                }
                field("Evaluation Completion Date"; Rec."Evaluation Completion Date")
                {
                    ApplicationArea = Basic;
                }
                field("Appointed Bid Opening Comm"; Rec."Appointed Bid Opening Comm")
                {
                    ApplicationArea = Basic;
                }
                field("Appointed Bid Evaluation Com"; Rec."Appointed Bid Evaluation Com")
                {
                    ApplicationArea = Basic;
                }
                field("Primary Region"; Rec."Primary Region")
                {
                    ApplicationArea = Basic;
                }
                field("Approval Status"; Rec."Approval Status")
                {
                    ApplicationArea = Basic;
                }
                field("Professional Opinion ID"; Rec."Professional Opinion ID")
                {
                    ApplicationArea = Basic;
                }
                field("Awarded Bid No"; Rec."Awarded Bid No")
                {
                    ApplicationArea = Basic;
                }
                field("Awarded Bidder No."; Rec."Awarded Bidder No.")
                {
                    ApplicationArea = Basic;
                }
                field("Awarded Bidder Name"; Rec."Awarded Bidder Name")
                {
                    ApplicationArea = Basic;
                }
                field("Award Tender Sum Inc Taxes"; Rec."Award Tender Sum Inc Taxes")
                {
                    ApplicationArea = Basic;
                }
                field("Award Acceptance Deadline"; Rec."Award Acceptance Deadline")
                {
                    ApplicationArea = Basic;
                }
                field("Award Acceptance Response"; Rec."Award Acceptance Response")
                {
                    ApplicationArea = Basic;
                }
                field("Min. Contract Holding"; Rec."Min. Contract Holding")
                {
                    ApplicationArea = Basic;
                }
                field("Earliest Contract Issuance Dt"; Rec."Earliest Contract Issuance Dt")
                {
                    ApplicationArea = Basic;
                }
                field("Bidder NoA Response Type"; Rec."Bidder NoA Response Type")
                {
                    ApplicationArea = Basic;
                }
                field("Bidder NoA Response Date"; Rec."Bidder NoA Response Date")
                {
                    ApplicationArea = Basic;
                }
                field("No. of Post-Award Disputes"; Rec."No. of Post-Award Disputes")
                {
                    ApplicationArea = Basic;
                }
                field("Document Status"; Rec."Document Status")
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
