#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Page 57008 "Cash Management Setup"
{
    ApplicationArea = Basic;
    PageType = Card;
    SourceTable = "Cash Management Setup";
    UsageCategory = Administration;

    layout
    {
        area(content)
        {
            group(General)
            {
                field("PV Journal Template"; Rec."PV Journal Template")
                {
                    ApplicationArea = Basic;
                }
                field("PV Journal Batch Name"; Rec."PV Journal Batch Name")
                {
                    ApplicationArea = Basic;
                }
                field("Imprest Journal Template"; Rec."Imprest Journal Template")
                {
                    ApplicationArea = Basic;
                }
                field("IMPREST Journal Batch Name"; Rec."IMPREST Journal Batch Name")
                {
                    ApplicationArea = Basic;
                }
                field("Imprest Surrender Template"; Rec."Imprest Surrender Template")
                {
                    ApplicationArea = Basic;
                }
                field("Petty Cash Surrender Template"; Rec."Petty Cash Surrender Template")
                {
                    ApplicationArea = Basic;
                }
                field("IMPREST SUR Journal Batch Name"; Rec."IMPREST SUR Journal Batch Name")
                {
                    ApplicationArea = Basic;
                }
                field("PCASH Journal Template"; Rec."PCASH Journal Template")
                {
                    ApplicationArea = Basic;
                }
                field("PCASH Journal Batch Name"; Rec."PCASH Journal Batch Name")
                {
                    ApplicationArea = Basic;
                }
                field("Bank TR Journal Template"; Rec."Bank TR Journal Template")
                {
                    ApplicationArea = Basic;
                }
                field("Bank TR Journal Batch Name"; Rec."Bank TR Journal Batch Name")
                {
                    ApplicationArea = Basic;
                }
                field("Receipt Template"; Rec."Receipt Template")
                {
                    ApplicationArea = Basic;
                }
                field("Receipt Batch Name"; Rec."Receipt Batch Name")
                {
                    ApplicationArea = Basic;
                }
                field("Director Journal Template"; Rec."Director Journal Template")
                {
                    ApplicationArea = Basic;
                }
                field("Director Journal Batch Name"; Rec."Director Journal Batch Name")
                {
                    ApplicationArea = Basic;
                }
                field("Lock Imprest Application"; Rec."Lock Imprest Application")
                {
                    ApplicationArea = Basic;
                }
                field("Post VAT"; Rec."Post VAT")
                {
                    ApplicationArea = Basic;
                }
                field("Rounding Type"; Rec."Rounding Type")
                {
                    ApplicationArea = Basic;
                }
                field("Rounding Precision"; Rec."Rounding Precision")
                {
                    ApplicationArea = Basic;
                }
                field("Imprest Limit"; Rec."Imprest Limit")
                {
                    ApplicationArea = Basic;
                }
                field("Imprest Due Date"; Rec."Imprest Due Date")
                {
                    ApplicationArea = Basic;
                }
                field("Staff Claim Journal Template"; Rec."Staff Claim Journal Template")
                {
                    ApplicationArea = Basic;
                }
                field("Staff Claim Journal Batch Name"; Rec."Staff Claim Journal Batch Name")
                {
                    ApplicationArea = Basic;
                }
                field("Staff Claim Nos."; Rec."Staff Claim Nos.")
                {
                    ApplicationArea = Basic;
                }
                field("PV Nos"; Rec."PV Nos")
                {
                    ApplicationArea = Basic;
                }
                field("Petty Cash Nos"; Rec."Petty Cash Nos")
                {
                    ApplicationArea = Basic;
                }
                field("Petty Cash Surrender Nos"; Rec."Petty Cash Surrender Nos")
                {
                    ApplicationArea = Basic;
                }
                field("Imprest Memo Nos"; Rec."Imprest Memo Nos")
                {
                    ApplicationArea = Basic;
                }
                field("Imprest Nos"; Rec."Imprest Nos")
                {
                    ApplicationArea = Basic;
                }
                field("Imprest Surrender Nos"; Rec."Imprest Surrender Nos")
                {
                    ApplicationArea = Basic;
                }
                field("Imprest Surr Memo Nos"; Rec."Imprest Surr Memo Nos")
                {
                    ApplicationArea = Basic;
                }
                field("Imprest Voucher Nos"; Rec."Imprest Voucher Nos")
                {
                    ApplicationArea = Basic;
                }
                field("Imp Voucher Journal Template"; Rec."Imp Voucher Journal Template")
                {
                    ApplicationArea = Basic;
                }
                field("Imp Voucher Journal Batch Name"; Rec."Imp Voucher Journal Batch Name")
                {
                    ApplicationArea = Basic;
                }
                field("Send Email Notification"; Rec."Send Email Notification")
                {
                    ApplicationArea = Basic;
                }
                field("Receipt Nos"; Rec."Receipt Nos")
                {
                    ApplicationArea = Basic;
                }
                field("Bank Transfer Nos"; Rec."Bank Transfer Nos")
                {
                    ApplicationArea = Basic;
                }
                field("Current Budget"; Rec."Current Budget")
                {
                    ApplicationArea = Basic;
                }
                field("Current Budget Start Date"; Rec."Current Budget Start Date")
                {
                    ApplicationArea = Basic;
                }
                field("Current Budget End Date"; Rec."Current Budget End Date")
                {
                    ApplicationArea = Basic;
                }
                field("Imprest Posting Group"; Rec."Imprest Posting Group")
                {
                    ApplicationArea = Basic;
                }
                field("General Bus. Posting Group"; Rec."General Bus. Posting Group")
                {
                    ApplicationArea = Basic;
                }
                field("VAT Bus. Posting Group"; Rec."VAT Bus. Posting Group")
                {
                    ApplicationArea = Basic;
                }
                field("Check for Committment"; Rec."Check for Committment")
                {
                    ApplicationArea = Basic;
                }
                field("Fuel Market Price"; Rec."Fuel Market Price")
                {
                    ApplicationArea = Basic;
                }
                field("Imprest Email"; Rec."Imprest Email")
                {
                    ApplicationArea = Basic;
                }
                field("Standing Imprest Nos"; Rec."Standing Imprest Nos")
                {
                    ApplicationArea = Basic;
                }
                field("Standing Imp Journal Template"; Rec."Standing Imp Journal Template")
                {
                    ApplicationArea = Basic;
                }
                field("StandingImp Journal Batch Name"; Rec."StandingImp Journal Batch Name")
                {
                    ApplicationArea = Basic;
                }
                field("Standing Imprest Surrender Nos"; Rec."Standing Imprest Surrender Nos")
                {
                    ApplicationArea = Basic;
                }
                field("Meeting Nos."; Rec."Meeting Nos.")
                {
                    ApplicationArea = Basic;
                }
                field("Primary Key"; Rec."Primary Key")
                {
                    ApplicationArea = Basic;
                }
                field("Check Budget Vailability"; Rec."Check Budget Vailability")
                {
                    ApplicationArea = Basic;
                }
                field("RIMS Income Account"; Rec."RIMS Income Account")
                {
                    ApplicationArea = Basic;
                }
            }
            group("EDMS Libraries")
            {
                field("SharePoint Site Link"; Rec."SharePoint Site Link")
                {
                    ApplicationArea = Basic;
                }
                field("SharePoint Site UserName"; Rec."SharePoint Site UserName")
                {
                    ApplicationArea = Basic;
                }
                field("SharePoint Site Password"; Rec."SharePoint Site Password")
                {
                    ApplicationArea = Basic;
                }
                field("SharePoint Document Library"; Rec."SharePoint Document Library")
                {
                    ApplicationArea = Basic;
                }
                field("SharePoint Shared Folder"; Rec."SharePoint Shared Folder")
                {
                    ApplicationArea = Basic;
                }
                field("Imprest Memo DMS Link"; Rec."Imprest Memo DMS Link")
                {
                    ApplicationArea = Basic;
                }
                field("Imprest Surrender DMS Link"; Rec."Imprest Surrender DMS Link")
                {
                    ApplicationArea = Basic;
                }
                field("Payment Voucher DMS Link"; Rec."Payment Voucher DMS Link")
                {
                    ApplicationArea = Basic;
                }
                field("Petty Cash Voucher DMS Link"; Rec."Petty Cash Voucher DMS Link")
                {
                    ApplicationArea = Basic;
                }
                field("Petty Cash Surrender DMS Link"; Rec."Petty Cash Surrender DMS Link")
                {
                    ApplicationArea = Basic;
                }
                field("Receipts DMS Link"; Rec."Receipts DMS Link")
                {
                    ApplicationArea = Basic;
                }
                field("Staff Claim DMS Link"; Rec."Staff Claim DMS Link")
                {
                    ApplicationArea = Basic;
                }
                field("Leave Application DMS Link"; Rec."Leave Application DMS Link")
                {
                    ApplicationArea = Basic;
                }
                field("Inter Bank Transfer DMS Link"; Rec."Inter Bank Transfer DMS Link")
                {
                    ApplicationArea = Basic;
                }
                field("Store Requisition DMS Link"; Rec."Store Requisition DMS Link")
                {
                    ApplicationArea = Basic;
                }
                field("Inter Fund Transfer DMS Link"; Rec."Inter Fund Transfer DMS Link")
                {
                    ApplicationArea = Basic;
                }
                field("General Files  DMS Link"; Rec."General Files  DMS Link")
                {
                    ApplicationArea = Basic;
                }
                field("Top Secret Files  DMS Link"; Rec."Top Secret Files  DMS Link")
                {
                    ApplicationArea = Basic;
                }
                field("Confidential Files  DMS Link"; Rec."Confidential Files  DMS Link")
                {
                    ApplicationArea = Basic;
                }
                field("Purchase Requisition"; Rec."Purchase Requisition")
                {
                    ApplicationArea = Basic;
                }
                field("IFP  DMS Link"; Rec."IFP  DMS Link")
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
