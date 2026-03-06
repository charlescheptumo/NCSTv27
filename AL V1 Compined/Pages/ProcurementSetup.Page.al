#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Page 75000 "Procurement Setup"
{
    ApplicationArea = Basic;
    PageType = Card;
    SourceTable = "Procurement Setup";
    UsageCategory = Administration;

    layout
    {
        area(content)
        {
            group(General)
            {
                field("Default Proc Email Contact"; Rec."Default Proc Email Contact")
                {
                    ApplicationArea = Basic;
                }
                field("Default IFP Bid Charge Code"; Rec."Default IFP Bid Charge Code")
                {
                    ApplicationArea = Basic;
                }
                field("Effective Procurement Plan"; Rec."Effective Procurement Plan")
                {
                    ApplicationArea = Basic;
                }
                field("Default Language Code"; Rec."Default Language Code")
                {
                    ApplicationArea = Basic;
                }
                field("Local Vendor Country Code"; Rec."Local Vendor Country Code")
                {
                    ApplicationArea = Basic;
                }
                field("Display Scoring Criteria"; Rec."Display Scoring Criteria")
                {
                    ApplicationArea = Basic;
                    Caption = 'Display Scoring Criteria to Vendors?';
                }
                field("Default Tender Addendum Type"; Rec."Default Tender Addendum Type")
                {
                    ApplicationArea = Basic;
                }
                field("Default PRN Conversion Proc"; Rec."Default PRN Conversion Proc")
                {
                    ApplicationArea = Basic;
                }
                field("Default IFS Bid Charge Code"; Rec."Default IFS Bid Charge Code")
                {
                    ApplicationArea = Basic;
                }
                field("Default Single Stage Tender"; Rec."Default Single Stage Tender")
                {
                    ApplicationArea = Basic;
                }
                field("Default Two Stage Tender valid"; Rec."Default Two Stage Tender valid")
                {
                    ApplicationArea = Basic;
                }
                field("Default RFQ Validity Duration"; Rec."Default RFQ Validity Duration")
                {
                    ApplicationArea = Basic;
                }
                field("Default LVP Validity Duration"; Rec."Default LVP Validity Duration")
                {
                    ApplicationArea = Basic;
                }
                field("Award Acceptance Deadline"; Rec."Award Acceptance Deadline")
                {
                    ApplicationArea = Basic;
                }
                field("Min. Contract Holding Duration"; Rec."Min. Contract Holding Duration")
                {
                    ApplicationArea = Basic;
                }
                field("Procurement Appeal Review"; Rec."Procurement Appeal Review")
                {
                    ApplicationArea = Basic;
                }
                field("Enforce Strict Proc Budget che"; Rec."Enforce Strict Proc Budget che")
                {
                    ApplicationArea = Basic;
                }
                field("Back Alert on PRN Approval"; Rec."Back Alert on PRN Approval")
                {
                    ApplicationArea = Basic;
                }
                field("Back Alert on IFS Creation"; Rec."Back Alert on IFS Creation")
                {
                    ApplicationArea = Basic;
                }
                field("Default Procurement Template"; Rec."Default Procurement Template")
                {
                    ApplicationArea = Basic;
                }
                field("Default General Product PG"; Rec."Default General Product PG")
                {
                    ApplicationArea = Basic;
                }
                field("Default Vendor PG"; Rec."Default Vendor PG")
                {
                    ApplicationArea = Basic;
                }
                field("Default Tender Evaluation Peri"; Rec."Default Tender Evaluation Peri")
                {
                    ApplicationArea = Basic;
                }
            }
            group("Number Series")
            {
                field("Procument Plan Nos"; Rec."Procument Plan Nos")
                {
                    ApplicationArea = Basic;
                }
                field("Request For Registration Nos"; Rec."Request For Registration Nos")
                {
                    ApplicationArea = Basic;
                }
                field("IFT Nos"; Rec."IFT Nos")
                {
                    ApplicationArea = Basic;
                }
                field("IFP Nos."; Rec."IFP Nos.")
                {
                    ApplicationArea = Basic;
                }
                field("Bid Req Template No. Series"; Rec."Bid Req Template No. Series")
                {
                    ApplicationArea = Basic;
                }
                field("ITT No. Series"; Rec."ITT No. Series")
                {
                    ApplicationArea = Basic;
                }
                field("EOI No. Series"; Rec."EOI No. Series")
                {
                    ApplicationArea = Basic;
                }
                field("Low Value Purchase No. Series"; Rec."Low Value Purchase No. Series")
                {
                    ApplicationArea = Basic;
                }
                field("Standing Proc Committee  No."; Rec."Standing Proc Committee  No.")
                {
                    ApplicationArea = Basic;
                }
                field("Vendor Debarment No. series"; Rec."Vendor Debarment No. series")
                {
                    ApplicationArea = Basic;
                }
                field("Vendor Reinstatement Nos"; Rec."Vendor Reinstatement Nos")
                {
                    ApplicationArea = Basic;
                }
                field("Project Key Staff Temp Nos"; Rec."Project Key Staff Temp Nos")
                {
                    ApplicationArea = Basic;
                }
                field("IFS Prebid Register"; Rec."IFS Prebid Register")
                {
                    ApplicationArea = Basic;
                    Caption = 'IFS Prebid Register Nos';
                }
                field("Supplier Appraisal Template No"; Rec."Supplier Appraisal Template No")
                {
                    ApplicationArea = Basic;
                }
                field("IFP Response Nos"; Rec."IFP Response Nos")
                {
                    ApplicationArea = Basic;
                }
                field("IFS Tender Committee No."; Rec."IFS Tender Committee No.")
                {
                    ApplicationArea = Basic;
                }
                field("EOI Response Nos"; Rec."EOI Response Nos")
                {
                    ApplicationArea = Basic;
                }
                field("Prequalification Score Header"; Rec."Prequalification Score Header")
                {
                    ApplicationArea = Basic;
                }
                field("Tender Addendum Notice"; Rec."Tender Addendum Notice")
                {
                    ApplicationArea = Basic;
                }
                field("Tender Cancellation Nos"; Rec."Tender Cancellation Nos")
                {
                    ApplicationArea = Basic;
                }
                field("Bid Opening Nos"; Rec."Bid Opening Nos")
                {
                    ApplicationArea = Basic;
                }
                field("Final Evaluation Report Nos"; Rec."Final Evaluation Report Nos")
                {
                    ApplicationArea = Basic;
                }
                field("Proffesional Opinion Nos"; Rec."Proffesional Opinion Nos")
                {
                    ApplicationArea = Basic;
                }
                field("Notice of Award"; Rec."Notice of Award")
                {
                    ApplicationArea = Basic;
                }
                field("Bid Security Claim Nos"; Rec."Bid Security Claim Nos")
                {
                    ApplicationArea = Basic;
                }
                field("Bid Security Returned Nos"; Rec."Bid Security Returned Nos")
                {
                    ApplicationArea = Basic;
                }
            }
            group(Bid)
            {
                Caption = 'Bid';
                field("Default Bid Security %"; Rec."Default Bid Security %")
                {
                    ApplicationArea = Basic;
                }
                field("Default Performance Security %"; Rec."Default Performance Security %")
                {
                    ApplicationArea = Basic;
                }
                field("Default Advance Pay Security %"; Rec."Default Advance Pay Security %")
                {
                    ApplicationArea = Basic;
                }
                field("Special Grp Bid Waiver"; Rec."Special Grp Bid Waiver")
                {
                    ApplicationArea = Basic;
                }
                field("Special Grp Performance Waiver"; Rec."Special Grp Performance Waiver")
                {
                    ApplicationArea = Basic;
                }
                field("Tender Validity Duration"; Rec."Tender Validity Duration")
                {
                    ApplicationArea = Basic;
                }
                field("Bid Security Validity(After)"; Rec."Bid Security Validity(After)")
                {
                    ApplicationArea = Basic;
                }
                field("Goods Supply Insurance Type"; Rec."Goods Supply Insurance Type")
                {
                    ApplicationArea = Basic;
                }
                field("Works Supply Insurance Type"; Rec."Works Supply Insurance Type")
                {
                    ApplicationArea = Basic;
                }
                field("Service Supply Insurance Type"; Rec."Service Supply Insurance Type")
                {
                    ApplicationArea = Basic;
                }
                field("Default Arbitrator Appointer"; Rec."Default Arbitrator Appointer")
                {
                    ApplicationArea = Basic;
                }
                field("Infinite Bid Value Limit"; Rec."Infinite Bid Value Limit")
                {
                    ApplicationArea = Basic;
                }
                field("YES Bid Rating Response Value"; Rec."YES Bid Rating Response Value")
                {
                    ApplicationArea = Basic;
                }
                field("Default YES Bid Rating Score %"; Rec."Default YES Bid Rating Score %")
                {
                    ApplicationArea = Basic;
                }
                field("NO Bid Rating Response Value"; Rec."NO Bid Rating Response Value")
                {
                    ApplicationArea = Basic;
                }
                field("Default NO Bid Rating Score %"; Rec."Default NO Bid Rating Score %")
                {
                    ApplicationArea = Basic;
                }
                field("1-POOR Option Text Bid Score %"; Rec."1-POOR Option Text Bid Score %")
                {
                    ApplicationArea = Basic;
                }
                field("2-FAIR Option Text Bid Score %"; Rec."2-FAIR Option Text Bid Score %")
                {
                    ApplicationArea = Basic;
                }
                field("3-GOOD Option Text Bid Score %"; Rec."3-GOOD Option Text Bid Score %")
                {
                    ApplicationArea = Basic;
                }
                field("4-VERY GOOD  Text Bid Score %"; Rec."4-VERY GOOD  Text Bid Score %")
                {
                    ApplicationArea = Basic;
                }
                field("5-EXCELLENT Text Bid Score %"; Rec."5-EXCELLENT Text Bid Score %")
                {
                    ApplicationArea = Basic;
                }
            }
            group(Notification)
            {
                Caption = 'Notification';
                field("Notify Committe Members"; Rec."Notify Committe Members")
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
