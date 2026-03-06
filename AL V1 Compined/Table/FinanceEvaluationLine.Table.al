#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Table 70217 "Finance Evaluation Line"
{

    fields
    {
        field(1; "Document ID"; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Bid Evaluation Register".Code;
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
        field(24; "Read-out Bid Price (A)"; Decimal)
        {
            DataClassification = ToBeClassified;
            Description = 'Final Evaluated Bid Price (I=F+G+H)';

            trigger OnValidate()
            begin

                "Final Evaluated Bid Price" := "Read-out Bid Price (A)";
            end;
        }
        field(25; "Financial Evaluation Date"; Date)
        {
            DataClassification = ToBeClassified;
        }
        field(26; "Weighted Financial Score %"; Decimal)
        {
            DataClassification = ToBeClassified;
            MaxValue = 20;
            MinValue = 0;
        }
        field(27; "Financial Evaluation Ranking"; Code[20])
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
        field(30; "Arithmetic Corrections (B)"; Decimal)
        {
            DataClassification = ToBeClassified;

            trigger OnValidate()
            begin
                "Corrected Bid Price" := "Read-out Bid Price (A)" + "Arithmetic Corrections (B)";
                "Final Evaluated Bid Price" := "Corrected Bid Price";
            end;
        }
        field(31; "Corrected Bid Price"; Decimal)
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(32; "Final Evaluated Bid Price"; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(33; "Evaluation Committee Remarks"; Text[250])
        {
            Caption = 'Evaluation Committee Remarks (Financial Evaluation)';
            DataClassification = ToBeClassified;
        }
        field(34; "Evaluation Committee Recomm"; Option)
        {
            DataClassification = ToBeClassified;
            Description = 'Evaluation Committee Recommendation';
            OptionCaption = ',Award,Unsuccesful';
            OptionMembers = ,Award,Unsuccesful;
        }
        field(35; "Final Tender Outcome"; Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = ',Awarded,Unsuccesful,Canceled';
            OptionMembers = ,Awarded,Unsuccesful,Canceled;
        }
        field(59; "Unconditional Discount % (D)"; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(60; "Unconditional Disc Amount (E)"; Decimal)
        {
            Caption = 'Unconditional Discount Amount (E)';
            DataClassification = ToBeClassified;
            Description = 'Unconditional Discount Amount (E)';
        }
        field(61; "Corrected & Disc Bid Price"; Decimal)
        {
            Caption = 'Corrected & Discounted Bid Price (F=C-E)';
            DataClassification = ToBeClassified;
            Description = 'Corrected & Discounted Bid Price (F=C-E)';
        }
        field(62; "Any Additional Adjustments (G)"; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(63; "Any Priced Deviations (H))"; Decimal)
        {
            DataClassification = ToBeClassified;
        }
    }

    keys
    {
        key(Key1; "Document ID", "Document Type", "No.")
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
