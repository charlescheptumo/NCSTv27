#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Table 57004 "Cash Management Setup"
{

    fields
    {
        field(1; "Primary Key"; Code[10])
        {
        }
        field(2; "Payment Voucher Template"; Code[20])
        {
            TableRelation = "Gen. Journal Template";
        }
        field(3; "Imprest Journal Template"; Code[20])
        {
            TableRelation = "Gen. Journal Template";
        }
        field(4; "Imprest Surrender Template"; Code[20])
        {
            TableRelation = "Gen. Journal Template";
        }
        field(5; "PCASH Journal Template"; Code[20])
        {
            TableRelation = "Gen. Journal Template";
        }
        field(6; "Receipt Template"; Code[20])
        {
            TableRelation = "Gen. Journal Template";
        }
        field(7; "Post VAT"; Boolean)
        {
        }
        field(8; "Rounding Type"; Option)
        {
            OptionCaption = 'Up,Nearest,Down';
            OptionMembers = Up,Nearest,Down;
        }
        field(9; "Rounding Precision"; Decimal)
        {
        }
        field(10; "Imprest Limit"; Decimal)
        {
        }
        field(11; "Imprest Due Date"; DateFormula)
        {
        }
        field(12; "PV Nos"; Code[20])
        {
            TableRelation = "No. Series";
        }
        field(13; "Petty Cash Nos"; Code[20])
        {
            TableRelation = "No. Series";
        }
        field(14; "Imprest Nos"; Code[10])
        {
            TableRelation = "No. Series";
        }
        field(15; "Current Budget"; Code[20])
        {
            TableRelation = "G/L Budget Name".Name;
        }
        field(16; "Current Budget Start Date"; Date)
        {
        }
        field(17; "Current Budget End Date"; Date)
        {
        }
        field(18; "Imprest Posting Group"; Code[20])
        {
            TableRelation = "Customer Posting Group";
        }
        field(19; "General Bus. Posting Group"; Code[20])
        {
            TableRelation = "Gen. Business Posting Group";
        }
        field(20; "VAT Bus. Posting Group"; Code[20])
        {
            TableRelation = "VAT Business Posting Group";
        }
        field(21; "Check for Committment"; Boolean)
        {
        }
        field(22; "Imprest Memo Nos"; Code[20])
        {
            TableRelation = "No. Series";
        }
        field(23; "Imprest Surrender Nos"; Code[10])
        {
            TableRelation = "No. Series";
        }
        field(24; "Bank Transfer Nos"; Code[10])
        {
            TableRelation = "No. Series";
        }
        field(25; "Receipt Nos"; Code[20])
        {
            TableRelation = "No. Series";
        }
        field(26; "Petty Cash Surrender Template"; Code[20])
        {
            TableRelation = "Gen. Journal Template";
        }
        field(27; "Receipt Batch Name"; Code[20])
        {
            TableRelation = "Gen. Journal Batch".Name where("Journal Template Name" = field("Receipt Template"));
        }
        field(28; "Petty Cash Surrender Nos"; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "No. Series";
        }
        field(56000; "PV Journal Template"; Code[10])
        {
            TableRelation = "Gen. Journal Template".Name;
        }
        field(56001; "PV Journal Batch Name"; Code[10])
        {
            TableRelation = "Gen. Journal Batch".Name where("Journal Template Name" = field("PV Journal Template"));
        }
        field(56002; "PCASH Journal Batch Name"; Code[10])
        {
            TableRelation = "Gen. Journal Batch".Name where("Journal Template Name" = field("PCASH Journal Template"));
        }
        field(56003; "IMPREST Journal Batch Name"; Code[10])
        {
            TableRelation = "Gen. Journal Batch".Name where("Journal Template Name" = field("Imprest Journal Template"));
        }
        field(56004; "IMPREST SUR Journal Batch Name"; Code[10])
        {
            TableRelation = "Gen. Journal Batch".Name where("Journal Template Name" = field("Imprest Surrender Template"));
        }
        field(56005; "Bank TR Journal Template"; Code[10])
        {
            TableRelation = "Gen. Journal Template".Name;
        }
        field(56006; "Bank TR Journal Batch Name"; Code[10])
        {
            TableRelation = "Gen. Journal Batch".Name where("Journal Template Name" = field("PV Journal Template"));
        }
        field(56007; "Fuel Market Price"; Decimal)
        {
        }
        field(56008; "Imprest Surr Memo Nos"; Code[20])
        {
            TableRelation = "No. Series";
        }
        field(56009; "EFT Header Nos."; Code[20])
        {
            TableRelation = "No. Series";
        }
        field(56010; "EFT Details Nos."; Code[20])
        {
            TableRelation = "No. Series";
        }
        field(56011; "Staff Claim Nos."; Code[20])
        {
            TableRelation = "No. Series";
        }
        field(56012; "Staff Claim Journal Batch Name"; Code[20])
        {
            TableRelation = "Gen. Journal Batch".Name where("Journal Template Name" = field("Staff Claim Journal Template"));
        }
        field(56013; "Staff Claim Journal Template"; Code[20])
        {
            TableRelation = "Gen. Journal Template".Name;
        }
        field(56014; "Lock Imprest Application"; Boolean)
        {
        }
        field(56015; "Send Email Notification"; Boolean)
        {
        }
        field(56016; "Imprest Email"; Text[100])
        {
        }
        field(56017; "Standing Imprest Nos"; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "No. Series";
        }
        field(56018; "Standing Imp Journal Template"; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Gen. Journal Template".Name;
        }
        field(56019; "StandingImp Journal Batch Name"; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Gen. Journal Batch".Name where("Journal Template Name" = field("Standing Imp Journal Template"));
        }
        field(56020; "Meeting Nos."; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "No. Series";
        }
        field(56021; "Director Journal Template"; Code[10])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Gen. Journal Template".Name;
        }
        field(56022; "Director Journal Batch Name"; Code[10])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Gen. Journal Batch".Name where("Journal Template Name" = field("PV Journal Template"));
        }
        field(56023; "Resolutions Nos"; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "No. Series".Code;
        }
        field(56024; "Recommendation No."; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "No. Series".Code;
        }
        field(56025; "Imprest Voucher Nos"; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "No. Series";
        }
        field(56026; "Imp Voucher Journal Template"; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Gen. Journal Template".Name;
        }
        field(56027; "Imp Voucher Journal Batch Name"; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Gen. Journal Batch".Name where("Journal Template Name" = field("Imp Voucher Journal Template"));
        }
        field(56028; "Standing Imprest Surrender Nos"; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "No. Series";
        }
        field(56029; "Director Net Salary Account"; Code[50])
        {
            DataClassification = ToBeClassified;
            TableRelation = Vendor."No.";
        }
        field(57030; "Check Budget Vailability"; Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(57031; "SharePoint Site Link"; Text[100])
        {
            DataClassification = ToBeClassified;
        }
        field(57032; "SharePoint Site UserName"; Text[100])
        {
            DataClassification = ToBeClassified;
        }
        field(57033; "SharePoint Site Password"; Text[100])
        {
            DataClassification = ToBeClassified;
        }
        field(57034; "SharePoint Document Library"; Text[100])
        {
            DataClassification = ToBeClassified;
        }
        field(57035; "SharePoint Shared Folder"; Text[100])
        {
            DataClassification = ToBeClassified;
        }
        field(57036; "Imprest Memo DMS Link"; Text[100])
        {
            DataClassification = ToBeClassified;
        }
        field(57037; "Imprest Surrender DMS Link"; Text[100])
        {
            DataClassification = ToBeClassified;
        }
        field(57038; "Payment Voucher DMS Link"; Text[100])
        {
            DataClassification = ToBeClassified;
        }
        field(57039; "Petty Cash Voucher DMS Link"; Text[100])
        {
            DataClassification = ToBeClassified;
        }
        field(57040; "Petty Cash Surrender DMS Link"; Text[100])
        {
            DataClassification = ToBeClassified;
        }
        field(57041; "Receipts DMS Link"; Text[100])
        {
            DataClassification = ToBeClassified;
        }
        field(57042; "Staff Claim DMS Link"; Text[100])
        {
            DataClassification = ToBeClassified;
        }
        field(57043; "Leave Application DMS Link"; Text[100])
        {
            DataClassification = ToBeClassified;
        }
        field(57044; "Inter Bank Transfer DMS Link"; Text[100])
        {
            DataClassification = ToBeClassified;
        }
        field(57045; "Store Requisition DMS Link"; Text[100])
        {
            DataClassification = ToBeClassified;
        }
        field(57046; "Inter Fund Transfer DMS Link"; Text[100])
        {
            DataClassification = ToBeClassified;
        }
        field(57047; "Purchase Requisition"; Text[100])
        {
            DataClassification = ToBeClassified;
        }
        field(57048; "RIMS Income Account"; Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = "G/L Account"."No.";
        }
        field(57049; "General Files  DMS Link"; Text[100])
        {
            DataClassification = ToBeClassified;
        }
        field(57050; "Top Secret Files  DMS Link"; Text[100])
        {
            DataClassification = ToBeClassified;
        }
        field(57051; "Confidential Files  DMS Link"; Text[100])
        {
            DataClassification = ToBeClassified;
        }
        field(57052; "IFP  DMS Link"; Text[100])
        {
            DataClassification = ToBeClassified;
        }
    }

    keys
    {
        key(Key1; "Primary Key")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}
