#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Table 70182 "Bid Tabulation Line"
{

    fields
    {
        field(1; "Tabulation ID"; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Bid Tabulation Header";
        }
        field(2; "Tabulation Type"; Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = 'Evaluation Report,Professional Opinion,Notice of Award';
            OptionMembers = "Evaluation Report","Professional Opinion","Notice of Award";
        }
        field(3; "Document Type"; Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = 'Quote,Order,Invoice,Credit Memo,Blanket Order,Return Order,Store Requisition,Purchase Requisition,,,,,,IEC Materials';
            OptionMembers = Quote,"Order",Invoice,"Credit Memo","Blanket Order","Return Order","Store Requisition","Purchase Requisition",,,,,,"IEC Materials";
        }
        field(4; "No."; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Purchase Header"."No.";
        }
        field(5; "Bidder No"; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = Vendor;

            trigger OnValidate()
            begin
                Vend.Reset;
                Vend.SetRange("No.", "Bidder No");
                if Vend.FindSet then begin
                    "Bidder Name" := Vend.Name;
                end;
            end;
        }
        field(6; "Bidder Name"; Text[80])
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(7; "Invitation For Supply No"; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Standard Purchase Code";
        }
        field(8; "Bid Currency Code"; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = Currency.Code;
        }
        field(9; "Pre-bid Register No."; Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(10; "Attended Pre-bid Conference"; Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(11; "Prebid Conference Date"; Date)
        {
            DataClassification = ToBeClassified;
        }
        field(12; "Bid Opening Register No."; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Bid Opening Register".Code;
        }
        field(13; "Bid Opening Date"; Date)
        {
            DataClassification = ToBeClassified;
        }
        field(14; "Late Bid (Opening Stage)"; Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(15; "Withdrawn Bid (Opening Stage)"; Code[50])
        {
            DataClassification = ToBeClassified;
        }
        field(16; "Withdrawal Notice No"; Code[50])
        {
            DataClassification = ToBeClassified;
        }
        field(17; "Succesful Bid (Opening Stage)"; Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(18; "Preliminary Evaluation Date"; Date)
        {
            DataClassification = ToBeClassified;
        }
        field(19; "Responsive Bid"; Boolean)
        {
            Caption = 'Responsive Bid (Preliminary Evaluation)';
            DataClassification = ToBeClassified;
            Description = 'Responsive Bid (Preliminary Evaluation)';
        }
        field(20; "Technical Evaluation Date"; Date)
        {
            DataClassification = ToBeClassified;
        }
        field(21; "Weighted Tech Score %"; Decimal)
        {
            DataClassification = ToBeClassified;
            MaxValue = 100;
            MinValue = 0;
        }
        field(22; "Passed Tech Evaluation"; Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(23; "Tech Evaluation Ranking"; Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(24; "Final Evaluated Bid Price"; Decimal)
        {
            DataClassification = ToBeClassified;
            Description = 'Final Evaluated Bid Price (I=F+G+H)';
        }
        field(25; "Financial Evaluation Date"; Date)
        {
            DataClassification = ToBeClassified;
        }
        field(26; "Weighted Financial Score %"; Decimal)
        {
            DataClassification = ToBeClassified;
            MaxValue = 100;
            MinValue = 0;
        }
        field(27; "Financial Evaluation Ranking"; Code[10])
        {
            DataClassification = ToBeClassified;
        }
        field(28; "Aggregate Weighted Score %"; Decimal)
        {
            DataClassification = ToBeClassified;
            MaxValue = 100;
            MinValue = 0;
        }
        field(29; "Aggregate Ranking"; Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(30; "Due Dilgence Date"; Date)
        {
            DataClassification = ToBeClassified;
        }
        field(31; "Due Diligence Rating"; Code[20])
        {
            DataClassification = ToBeClassified;
            Description = 'Due Diligence Assessment Rating';
        }
        field(32; "Professional Opion No."; Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(33; "Professional Opion Date"; Date)
        {
            DataClassification = ToBeClassified;
        }
        field(34; "Professional Opinion Outcome"; Option)
        {
            DataClassification = ToBeClassified;
            Description = 'Professional Opinion Outcome';
            OptionCaption = ',Succesful Bid,Unsuccesful Bid,Canceled Tender';
            OptionMembers = ,"Succesful Bid","Unsuccesful Bid","Canceled Tender";
        }
        field(35; "Corrected Bid Price (C=A+B)"; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(36; "Unconditional Discount % (D)"; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(37; "Unconditional Disc Amount (E)"; Decimal)
        {
            Caption = 'Unconditional Discount Amount (E)';
            DataClassification = ToBeClassified;
            Description = 'Unconditional Discount Amount (E)';
        }
        field(38; "Corrected & Disc Bid Price"; Decimal)
        {
            Caption = 'Corrected & Discounted Bid Price (F=C-E)';
            DataClassification = ToBeClassified;
            Description = 'Corrected & Discounted Bid Price (F=C-E)';
        }
        field(39; "Any Additional Adjustments (G)"; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(40; "Any Priced Deviations (H))"; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(41; "Financial Evaluation Comm Rem"; Text[250])
        {
            Caption = 'Evaluation Committee Remarks (Financial Evaluation)';
            DataClassification = ToBeClassified;
            Description = 'Evaluation Committee Remarks (Financial Evaluation)';
        }
        field(42; "Evaluation Committee Recomm"; Option)
        {
            DataClassification = ToBeClassified;
            Description = 'Evaluation Committee Recommendation';
            OptionCaption = ',Award,Unsuccesful';
            OptionMembers = ,Award,Unsuccesful;
        }
        field(43; "Read-out Bid Price (A)"; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(44; "Arithmetic Corrections (B)"; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(45; "Bid Opening Result"; Text[80])
        {
            DataClassification = ToBeClassified;
        }
        field(46; "Bid Opening Committee Remarks"; Text[100])
        {
            DataClassification = ToBeClassified;
        }
        field(47; "Preliminary Evaluation Reg"; Code[20])
        {
            Caption = 'Preliminary Evaluation Register No.';
            DataClassification = ToBeClassified;
            Description = 'Preliminary Evaluation Register No.';
        }
        field(49; "Preliminary Evaluation Outcome"; Text[80])
        {
            DataClassification = ToBeClassified;
        }
        field(50; "Preminary Evaluation Committee"; Text[100])
        {
            Caption = 'Evaluation Committee Remarks (Preminary Evaluation)';
            DataClassification = ToBeClassified;
            Description = 'Evaluation Committee Remarks (Preminary Evaluation)';
        }
        field(51; "Bid Opening Finance Register"; Code[20])
        {
            Caption = 'Bid Opening Register No.  (Financial)';
            DataClassification = ToBeClassified;
            Description = 'Bid Opening Register No.  (Financial)';
        }
        field(52; "Bid Opening Date (Financial)"; Date)
        {
            DataClassification = ToBeClassified;
        }
        field(53; "Financial Eval Register No"; Code[20])
        {
            Caption = 'Financial Evaluation Register No';
            DataClassification = ToBeClassified;
            Description = 'Financial Evaluation Register No';
        }
        field(54; "Vendor PIN"; Code[30])
        {
            DataClassification = ToBeClassified;
        }
        field(55; "Procurement Head Comments"; Text[250])
        {
            DataClassification = ToBeClassified;
        }
        field(56; "Due Diligence Report ID"; Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = ',Pass,Fail';
            OptionMembers = ,Pass,Fail;
        }
    }

    keys
    {
        key(Key1; "Tabulation ID", "Tabulation Type", "Document Type", "No.")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }

    var
        Vend: Record Vendor;
}
