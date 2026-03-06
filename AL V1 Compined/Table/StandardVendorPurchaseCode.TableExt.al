#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
TableExtension 50023 tableextension50023 extends "Standard Vendor Purchase Code"
{
    fields
    {

        //Unsupported feature: Property Insertion (DataClassification) on ""Vendor No."(Field 1)".


        //Unsupported feature: Property Insertion (DataClassification) on "Code(Field 2)".


        //Unsupported feature: Property Insertion (DataClassification) on "Description(Field 3)".


        //Unsupported feature: Property Modification (DataClassification) on ""Insert Rec. Lines On Quotes"(Field 15)".


        //Unsupported feature: Property Modification (DataClassification) on ""Insert Rec. Lines On Orders"(Field 16)".


        //Unsupported feature: Property Modification (DataClassification) on ""Insert Rec. Lines On Invoices"(Field 17)".


        //Unsupported feature: Property Modification (DataClassification) on ""Insert Rec. Lines On Cr. Memos"(Field 18)".


        //Unsupported feature: Code Insertion on ""Vendor No."(Field 1)".

        //trigger OnValidate()
        //Parameters and return type have not been exported.
        //begin
        /*
        Vend.RESET;
        Vend.SETRANGE("No.","Vendor No.");
        IF Vend.FINDSET THEN BEGIN
          "Vendor Name":=Vend.Name;
           "Primary Email":=Vend."E-Mail";
          END;
        */
        //end;
        field(19; "IFS Code"; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Standard Purchase Code".Code;
        }
        field(20; "Bid No."; Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(21; "Vendor Name"; Text[100])
        {
            DataClassification = ToBeClassified;
        }
        field(22; "Primary Email"; Text[80])
        {
            DataClassification = ToBeClassified;
            Description = 'Linked to Vendor.Primary Email (It shall be used for vendor communications during the bidding process)';
        }
        field(23; "Positive Intent To Bid"; Boolean)
        {
            DataClassification = ToBeClassified;
            Description = 'This field is updated based on the invited bidder''s acknowledgement of their intent to participate in the IFS';
        }
        field(24; "Invitation Email Sent"; Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(25; "Date/Time Notified"; DateTime)
        {
            DataClassification = ToBeClassified;
        }
        field(26; "No. of Posted Addendum Notices"; Integer)
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(27; "Posted Addendum Notice No."; Code[20])
        {
            DataClassification = ToBeClassified;
            Description = 'Last Posted Addendum Notice No.';
        }
        field(28; "Bid Currency Code"; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = Currency.Code;
        }
        field(29; "Sealed Bids (Technical)"; Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(30; "Sealed Bids (Financial)"; Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(31; "Prebid Register No."; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "IFS Prebid Register".Code;
        }
        field(32; "Prebid Meeting Date"; Date)
        {
            DataClassification = ToBeClassified;
        }
        field(33; "Bid Opening Register No."; Code[10])
        {
            Caption = 'Bid Opening Register No.  (Technical)';
            DataClassification = ToBeClassified;
            Description = 'Bid Opening Register No.  (Technical)';
            TableRelation = "Bid Opening Register".Code;
        }
        field(34; "Bid Opening Date (Technical)"; Date)
        {
            DataClassification = ToBeClassified;
        }
        field(35; "Late Bid (Opening Stage)"; Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(36; "Withdrawn Bid (Opening Stage)"; Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(37; "Bid Withdrawal Notice No"; Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(38; "Modified Bid (Opening Stage)"; Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(39; "Bid Opening Result"; Text[80])
        {
            DataClassification = ToBeClassified;
        }
        field(40; "Bid Opening Committee Remarks"; Text[100])
        {
            DataClassification = ToBeClassified;
        }
        field(41; "Preliminary Evaluation Reg"; Code[20])
        {
            Caption = 'Preliminary Evaluation Register No.';
            DataClassification = ToBeClassified;
            Description = 'Preliminary Evaluation Register No.';
        }
        field(42; "Preliminary Evaluation Date"; Date)
        {
            DataClassification = ToBeClassified;
        }
        field(43; "Preliminary Evaluation Outcome"; Text[80])
        {
            DataClassification = ToBeClassified;
        }
        field(44; "Preminary Evaluation Committee"; Text[100])
        {
            Caption = 'Evaluation Committee Remarks (Preminary Evaluation)';
            DataClassification = ToBeClassified;
            Description = 'Evaluation Committee Remarks (Preminary Evaluation)';
        }
        field(45; "Technical Evaluation Reg"; Code[10])
        {
            DataClassification = ToBeClassified;
            Description = 'Technical Evaluation Register No.';
        }
        field(46; "Technical Evaluation Date"; Date)
        {
            DataClassification = ToBeClassified;
        }
        field(47; "Min Weighted Tech Pass Score %"; Decimal)
        {
            DataClassification = ToBeClassified;
            Description = 'Minimum Weighted Tech Pass Score %';
        }
        field(48; "Weighted Technical  Score %"; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(49; "Technical Evaluation  Outcome"; Text[250])
        {
            DataClassification = ToBeClassified;
        }
        field(50; "Evaluation Committee Rem"; Text[250])
        {
            Caption = 'Evaluation Committee Remarks (Technical Evaluation)';
            DataClassification = ToBeClassified;
            Description = 'Evaluation Committee Remarks (Technical Evaluation)';
        }
        field(51; "Technical Evaluation Committee"; Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(52; "Bid Opening Finance Register"; Code[20])
        {
            Caption = 'Bid Opening Register No.  (Financial)';
            DataClassification = ToBeClassified;
            Description = 'Bid Opening Register No.  (Financial)';
        }
        field(53; "Bid Opening Date (Financial)"; Date)
        {
            DataClassification = ToBeClassified;
        }
        field(54; "Financial Eval Register No"; Code[20])
        {
            Caption = 'Financial Evaluation Register No';
            DataClassification = ToBeClassified;
            Description = 'Financial Evaluation Register No';
        }
        field(55; "Financial Evaluation Date"; Date)
        {
            DataClassification = ToBeClassified;
        }
        field(56; "Read-out Bid Price (A)"; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(57; "Arithmetic Corrections (B)"; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(58; "Corrected Bid Price (C=A+B)"; Decimal)
        {
            DataClassification = ToBeClassified;
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
        field(64; "Final Evaluated Bid Price"; Decimal)
        {
            Caption = 'Final Evaluated Bid Price (I=F+G+H)';
            DataClassification = ToBeClassified;
            Description = 'Final Evaluated Bid Price (I=F+G+H)';
        }
        field(66; "Weighted Financial Score %"; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(67; "Financial Evaluation Ranking"; Code[30])
        {
            DataClassification = ToBeClassified;
        }
        field(68; "Financial Evaluation Comm Rem"; Text[250])
        {
            Caption = 'Evaluation Committee Remarks (Financial Evaluation)';
            DataClassification = ToBeClassified;
            Description = 'Evaluation Committee Remarks (Financial Evaluation)';
        }
        field(69; "Aggregate Weighted Score %"; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(70; "Evaluation Committee Recomm"; Option)
        {
            DataClassification = ToBeClassified;
            Description = 'Evaluation Committee Recommendation';
            OptionCaption = ',Award,Unsuccesful';
            OptionMembers = ,Award,Unsuccesful;
        }
        field(71; "Final Evaluation Report"; Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(72; "Final Evaluation Date"; Date)
        {
            DataClassification = ToBeClassified;
        }
        field(73; "Professional Opion ID"; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Bid Tabulation Header".Code;
        }
        field(74; "Professional Opion Date"; Date)
        {
            DataClassification = ToBeClassified;
        }
        field(75; "Due Dilgence Date"; Date)
        {
            DataClassification = ToBeClassified;
        }
        field(76; "Due Diligence Rating"; Code[20])
        {
            DataClassification = ToBeClassified;
            Description = 'Due Diligence Assessment Rating';
        }
        field(77; "Due Diligence Report ID"; Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = ',Pass,Fail';
            OptionMembers = ,Pass,Fail;
        }
        field(78; "Due Diligence Voucher"; Code[20])
        {
            DataClassification = ToBeClassified;
        }
    }

    var
        Vend: Record Vendor;
}
