#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Page 75260 "Purchase Contract Template"
{
    ApplicationArea = Basic;
    PageType = List;
    SourceTable = "Purchase Contract Template";
    UsageCategory = Administration;

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
                field(Description; Rec.Description)
                {
                    ApplicationArea = Basic;
                }
                field("Procurement Type"; Rec."Procurement Type")
                {
                    ApplicationArea = Basic;
                }
                field("Procurement Doc Template ID"; Rec."Procurement Doc Template ID")
                {
                    ApplicationArea = Basic;
                }
                field("Default Language Code"; Rec."Default Language Code")
                {
                    ApplicationArea = Basic;
                }
                field("Governing Laws"; Rec."Governing Laws")
                {
                    ApplicationArea = Basic;
                }
                field("Max Contract Variation %"; Rec."Max Contract Variation %")
                {
                    ApplicationArea = Basic;
                }
                field("Defects Liability Period"; Rec."Defects Liability Period")
                {
                    ApplicationArea = Basic;
                }
                field("Daily Liquidated Unit Cost"; Rec."Daily Liquidated Unit Cost")
                {
                    ApplicationArea = Basic;
                }
                field("Liquidated Damages Limit %"; Rec."Liquidated Damages Limit %")
                {
                    ApplicationArea = Basic;
                }
                field("Payment Retention %"; Rec."Payment Retention %")
                {
                    ApplicationArea = Basic;
                }
                field("Retention Amount Limit %"; Rec."Retention Amount Limit %")
                {
                    ApplicationArea = Basic;
                }
                field("Minimum Interim Certificate"; Rec."Minimum Interim Certificate")
                {
                    ApplicationArea = Basic;
                }
                field("Written Consent for 3rd Party"; Rec."Written Consent for 3rd Party")
                {
                    ApplicationArea = Basic;
                }
                field("Limitation of Liability Clause"; Rec."Limitation of Liability Clause")
                {
                    ApplicationArea = Basic;
                }
                field("Idemnification Clause"; Rec."Idemnification Clause")
                {
                    ApplicationArea = Basic;
                }
                field("Full Transfer of Ownership"; Rec."Full Transfer of Ownership")
                {
                    ApplicationArea = Basic;
                }
                field("Written Consent for Subcontr"; Rec."Written Consent for Subcontr")
                {
                    ApplicationArea = Basic;
                }
                field("Max Subcontractor Value %"; Rec."Max Subcontractor Value %")
                {
                    ApplicationArea = Basic;
                }
                field("Amicable Dispute Settlement"; Rec."Amicable Dispute Settlement")
                {
                    ApplicationArea = Basic;
                }
                field("Appointer of Arbitrator"; Rec."Appointer of Arbitrator")
                {
                    ApplicationArea = Basic;
                }
                field("Min Termination Notice Period"; Rec."Min Termination Notice Period")
                {
                    ApplicationArea = Basic;
                }
                field(Blocked; Rec.Blocked)
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
