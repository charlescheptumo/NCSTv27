#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Table 70060 "Procurement Setup"
{

    fields
    {
        field(1; "Primary Key"; Code[30])
        {
            DataClassification = ToBeClassified;
        }
        field(2; "Procurement Class"; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Procurement Classes".Code;
        }
        field(3; "Procument Plan Nos"; Code[10])
        {
            Caption = 'Procument Plan Nos';
            DataClassification = ToBeClassified;
            TableRelation = "No. Series";
        }
        field(4; "Request for Quotation Nos."; Code[20])
        {
            DataClassification = ToBeClassified;
            Description = 'RFQ No. Series';
            TableRelation = "No. Series";
        }
        field(5; "Request for Proposals Nos."; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "No. Series";
        }
        field(6; "ITT No. Series"; Code[10])
        {
            DataClassification = ToBeClassified;
            Description = 'ITT No. Series';
            TableRelation = "No. Series";
        }
        field(7; "EOI No. Series"; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "No. Series";
        }
        field(8; "Direct Prcmnt Nos"; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "No. Series";
        }
        field(9; "Low Value Purchase No. Series"; Code[20])
        {
            DataClassification = ToBeClassified;
            Description = 'Low Value Purchase No. Series';
            TableRelation = "No. Series";
        }
        field(10; "Specially Permitted Prcmnt Nos"; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "No. Series";
        }
        field(11; "Purchase Req No"; Code[10])
        {
            DataClassification = ToBeClassified;
            TableRelation = "No. Series";
        }
        field(12; "Effective Procurement Plan"; Code[10])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Procurement Plan".Code;
        }
        field(13; "Standing Proc Committee  No."; Code[10])
        {
            DataClassification = ToBeClassified;
            Description = 'Standing Proc Committee  No. Series';
            TableRelation = "No. Series";
        }
        field(14; "Contract Nos"; Code[10])
        {
            DataClassification = ToBeClassified;
            TableRelation = "No. Series";
        }
        field(15; "Legal Dept Code"; Code[50])
        {
            Caption = 'Legal Department Code';
            DataClassification = ToBeClassified;
            TableRelation = "Dimension Value".Code where("Global Dimension No." = const(1));

            trigger OnValidate()
            begin
                //ValidateShortcutDimCode(2,"Global Dimension 2 Code");
            end;
        }
        field(16; "Tender Documents Path"; Text[250])
        {
            DataClassification = ToBeClassified;
        }
        field(17; "RFP Documents Path"; Text[250])
        {
            DataClassification = ToBeClassified;
        }
        field(18; "RFQ Documents Path"; Text[250])
        {
            DataClassification = ToBeClassified;
        }
        field(19; "Direct Documents Path"; Text[250])
        {
            DataClassification = ToBeClassified;
        }
        field(20; "IFS Tender Committee No."; Code[20])
        {
            DataClassification = ToBeClassified;
            Description = 'IFS Tender Committee Appointment No. Series';
            TableRelation = "No. Series";
        }
        field(21; "Current Year"; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "G/L Budget Name";
        }
        field(22; "Asset Disposal Nos"; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "No. Series";
        }
        field(23; "Special RFQ Prcmnt Nos"; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "No. Series";
        }
        field(24; "Default Proc Email Contact"; Code[100])
        {
            DataClassification = ToBeClassified;
        }
        field(25; "IFT Nos"; Code[100])
        {
            DataClassification = ToBeClassified;
            TableRelation = "No. Series";
        }
        field(26; "IFP Nos."; Code[10])
        {
            DataClassification = ToBeClassified;
            TableRelation = "No. Series";
        }
        field(27; "Bid Req Template No. Series"; Code[10])
        {
            DataClassification = ToBeClassified;
            Description = 'Bid Req Template No. Series';
            TableRelation = "No. Series";
        }
        field(28; "Default IFP Bid Charge Code"; Code[20])
        {
            DataClassification = ToBeClassified;
            Description = 'Linked to Bid Charge Code Table. The default charge code is defined here; when the user raises an IFP, the system shall pick the default charge code and insert the amount to be charged for each setup of bid';
            TableRelation = "Bid Charges Schedule";
        }
        field(29; "Local Vendor Country Code"; Code[20])
        {
            DataClassification = ToBeClassified;
            Description = 'Country code that the system shall use to determine Local or Foreign Suppliers';
            TableRelation = "Country/Region";
        }
        field(30; "Display Scoring Criteria"; Boolean)
        {
            DataClassification = ToBeClassified;
            Description = 'When this is enabled, all Solicitation documents such as IFP, RFQ, RFP etc that have an assigned Scoring Template shall support access/display of the scoring criteria within the vendor portal';
        }
        field(31; "Default Bid Security %"; Decimal)
        {
            DataClassification = ToBeClassified;
            Description = 'It shall be used to compute the Bid Security under IFS';
            MaxValue = 100;
            MinValue = 0;
        }
        field(32; "Default Performance Security %"; Decimal)
        {
            DataClassification = ToBeClassified;
            Description = 'Default % for Performance Security that shall be picked on IFS';
            MaxValue = 100;
            MinValue = 0;
        }
        field(33; "Default Advance Pay Security %"; Decimal)
        {
            Caption = 'Default Advance Payment Security %';
            DataClassification = ToBeClassified;
            Description = 'Default % for Advance Payment Security that shall be picked on IFS';
            MaxValue = 100;
            MinValue = 0;
        }
        field(34; "Special Grp Bid Waiver"; Boolean)
        {
            Caption = 'Special Group Bid Security Waiver';
            DataClassification = ToBeClassified;
            Description = 'It shall be inherited as the default setup on all IFSs';
        }
        field(35; "Special Grp Performance Waiver"; Boolean)
        {
            Caption = 'Special Group Performance Security Waiver';
            DataClassification = ToBeClassified;
            Description = 'Used to indicate Performance security waiver rules for valid Special Group Vendors (e.g. Women, Youth, PWDs etc). The default setup is inherited across all the IFSs but the user can amend on a case by case basis';
        }
        field(36; "Tender Validity Duration"; Code[20])
        {
            Caption = 'Default Tender Validity Duration';
            DataClassification = ToBeClassified;
            Description = 'Default Tender Validity Duration that shall be picked by the IFS';
        }
        field(37; "Bid Security Validity(After)"; Code[20])
        {
            Caption = 'Bid Security Validity (After Tender Validity)';
            DataClassification = ToBeClassified;
            Description = 'Default duration for the extra days that all bid securities should include beyond the Tender validity period';
        }
        field(38; "Goods Supply Insurance Type"; Code[30])
        {
            Caption = 'Default Goods Supply Insurance Type';
            DataClassification = ToBeClassified;
            Description = 'Linked to Insurance Types Table. It is used to define the default Insurance Type that shall be picked by the IFS in case insurance policy cover is a requireemnt for all biddders';
            TableRelation = "Insurance Type".Code;
        }
        field(39; "Works Supply Insurance Type"; Code[30])
        {
            Caption = 'Default Works Supply Insurance Type';
            DataClassification = ToBeClassified;
            Description = 'Linked to Insurance Types Table. It is used to define the default Insurance Type that shall be picked by the IFS in case insurance policy cover is a requireemnt for all biddders';
            TableRelation = "Insurance Type".Code;
        }
        field(40; "Service Supply Insurance Type"; Code[30])
        {
            Caption = 'Default Services Supply Insurance Type';
            DataClassification = ToBeClassified;
            Description = 'Linked to Insurance Types Table. It is used to define the default Insurance Type that shall be picked by the IFS in case insurance policy cover is a requireemnt for all biddders';
            TableRelation = "Insurance Type".Code;
        }
        field(41; "Default Arbitrator Appointer"; Text[50])
        {
            DataClassification = ToBeClassified;
            Description = 'Details of the default Arbitrator who shall be cited in the IFS and contracts (Amendments can be done for specific transactions)';
        }
        field(42; "Infinite Bid Value Limit"; Decimal)
        {
            DataClassification = ToBeClassified;
            Description = 'Limit used during capping of Max Bid Value field on the Bid Score Criteria Line Table';
        }
        field(43; "YES Bid Rating Response Value"; Code[30])
        {
            Caption = 'Default YES Bid Rating Response Value';
            DataClassification = ToBeClassified;
            Description = 'Default YES Text that is suggested by the system for YES/NO Response values in the bid scoring criteria table. When an evaluator selects this value during the scoring process, the system shall assign the Default Yes Rating Score %';
        }
        field(44; "Default YES Bid Rating Score %"; Decimal)
        {
            DataClassification = ToBeClassified;
            Description = 'Default YES Bid Rating Score %';
            MaxValue = 100;
            MinValue = 0;
        }
        field(45; "NO Bid Rating Response Value"; Code[30])
        {
            DataClassification = ToBeClassified;
            Description = 'Default NO Text that is suggested by the system for YES/NO Response values in the bid scoring criteria table. When an evaluator selects this value during the scoring process, the system shall assign the Default NO Rating Score %';
        }
        field(46; "Default NO Bid Rating Score %"; Decimal)
        {
            DataClassification = ToBeClassified;
            MaxValue = 100;
            MinValue = 0;
        }
        field(47; "1-POOR Option Text Bid Score %"; Decimal)
        {
            DataClassification = ToBeClassified;
            Description = 'Default Score % that shall be assigned when an evaluator selects the POOR Response value during bid scoring';
            MaxValue = 100;
            MinValue = 0;
        }
        field(48; "2-FAIR Option Text Bid Score %"; Decimal)
        {
            DataClassification = ToBeClassified;
            MaxValue = 100;
            MinValue = 0;
        }
        field(49; "3-GOOD Option Text Bid Score %"; Decimal)
        {
            DataClassification = ToBeClassified;
            MaxValue = 100;
            MinValue = 0;
        }
        field(50; "4-VERY GOOD  Text Bid Score %"; Decimal)
        {
            Caption = '4-VERY GOOD Option Text Bid Score %';
            DataClassification = ToBeClassified;
            MaxValue = 100;
            MinValue = 0;
        }
        field(51; "5-EXCELLENT Text Bid Score %"; Decimal)
        {
            Caption = '5-EXCELLENT Option Text Bid Score %';
            DataClassification = ToBeClassified;
            MaxValue = 100;
            MinValue = 0;
        }
        field(52; "Vendor Debarment No. series"; Code[10])
        {
            DataClassification = ToBeClassified;
            Description = 'r Debarment & Vendor Reinstatement Voucher No. Series';
            TableRelation = "No. Series";
        }
        field(53; "Vendor Reinstatement Nos"; Code[10])
        {
            DataClassification = ToBeClassified;
            TableRelation = "No. Series";
        }
        field(54; "Project Key Staff Temp Nos"; Code[10])
        {
            DataClassification = ToBeClassified;
            Description = 'Project Key Staff Template No. Series i';
            TableRelation = "No. Series";
        }
        field(55; "IFS Prebid Register"; Code[10])
        {
            DataClassification = ToBeClassified;
            TableRelation = "No. Series";
        }
        field(56; "Supplier Appraisal Template No"; Code[10])
        {
            DataClassification = ToBeClassified;
            TableRelation = "No. Series";
        }
        field(57; "Request For Registration Nos"; Code[10])
        {
            DataClassification = ToBeClassified;
            TableRelation = "No. Series";
        }
        field(58; "Default Procurement Template"; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Procurement Document Template"."Template ID";
        }
        field(59; "IFP Response Nos"; Code[10])
        {
            DataClassification = ToBeClassified;
            TableRelation = "No. Series";
        }
        field(60; "EOI Response Nos"; Code[10])
        {
            DataClassification = ToBeClassified;
            TableRelation = "No. Series";
        }
        field(61; "Prequalification Score Header"; Code[10])
        {
            DataClassification = ToBeClassified;
            TableRelation = "No. Series";
        }
        field(62; "Tender Addendum Notice"; Code[10])
        {
            DataClassification = ToBeClassified;
            TableRelation = "No. Series";
        }
        field(63; "Default Tender Addendum Type"; Code[50])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Tender Addendum Type".Code;
        }
        field(64; "Default PRN Conversion Proc"; Option)
        {
            Caption = 'Default PRN Conversion Procedure';
            DataClassification = ToBeClassified;
            Description = 'Default PRN Conversion Procedure';
            OptionCaption = 'Invitation For Supply,Direct PO';
            OptionMembers = "Invitation For Supply","Direct PO";
        }
        field(65; "Default IFS Bid Charge Code"; Code[20])
        {
            DataClassification = ToBeClassified;
            Description = 'Linked to Bid Charge Code Table. The default charge code is defined here; when the user raises an IFP, the system shall pick the default charge code and insert the amount to be charged for each setup of bid';
            TableRelation = "Bid Charges Schedule";
        }
        field(66; "Default Single Stage Tender"; Code[20])
        {
            Caption = 'Default Single Stage Tender Validity Duration';
            DataClassification = ToBeClassified;
            Description = 'Default Single Stage Tender Validity Duration';
        }
        field(67; "Default Two Stage Tender valid"; Code[20])
        {
            Caption = 'Default Two Stage Tender Validity Duration';
            DataClassification = ToBeClassified;
            Description = 'Default Two Stage Tender Validity Duration';
        }
        field(68; "Default RFQ Validity Duration"; Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(69; "Default LVP Validity Duration"; Code[20])
        {
            DataClassification = ToBeClassified;
            Description = 'Default Low  Value Procurement Validity Duration';
        }
        field(70; "Award Acceptance Deadline"; Code[20])
        {
            Caption = 'Award Acceptance Deadline Duration';
            DataClassification = ToBeClassified;
            Description = 'Award Acceptance Deadline Duration';
        }
        field(71; "Min. Contract Holding Duration"; Code[20])
        {
            Caption = 'Min. Contract Holding/Standstill Duration';
            DataClassification = ToBeClassified;
            Description = 'Min. Contract Holding/Standstill Duration';
        }
        field(72; "Procurement Appeal Review"; Code[20])
        {
            Caption = 'Procurement Appeal Review Board No.';
            DataClassification = ToBeClassified;
            Description = 'Procurement Appeal Review Board No.';
            TableRelation = Contact."No.";
        }
        field(73; "Enforce Strict Proc Budget che"; Boolean)
        {
            Caption = 'Enforce Strict Procurement Budget Checks';
            DataClassification = ToBeClassified;
            Description = 'Enforce Strict Procurement Budget Checks';
        }
        field(74; "Back Alert on PRN Approval"; Boolean)
        {
            Caption = 'Back Alert on PRN Final Approval';
            DataClassification = ToBeClassified;
            Description = 'Back Alert on PRN Final Approval';
        }
        field(75; "Back Alert on IFS Creation"; Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(76; "Default Language Code"; Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = Language;
        }
        field(77; "Tender Cancellation Nos"; Code[10])
        {
            DataClassification = ToBeClassified;
            TableRelation = "No. Series";
        }
        field(78; "Default Tender Evaluation Peri"; Code[20])
        {
            Caption = 'Default Tender Evaluation Period';
            DataClassification = ToBeClassified;
        }
        field(79; "Bid Opening Nos"; Code[10])
        {
            DataClassification = ToBeClassified;
            TableRelation = "No. Series";
        }
        field(80; "Notify Committe Members"; Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(81; "Final Evaluation Report Nos"; Code[10])
        {
            DataClassification = ToBeClassified;
            TableRelation = "No. Series";
        }
        field(82; "Proffesional Opinion Nos"; Code[10])
        {
            DataClassification = ToBeClassified;
            TableRelation = "No. Series";
        }
        field(83; "Notice of Award"; Code[10])
        {
            DataClassification = ToBeClassified;
            TableRelation = "No. Series";
        }
        field(84; "Bid Security Claim Nos"; Code[10])
        {
            DataClassification = ToBeClassified;
            TableRelation = "No. Series";
        }
        field(85; "Bid Security Returned Nos"; Code[10])
        {
            DataClassification = ToBeClassified;
            TableRelation = "No. Series";
        }
        field(86; "Default General Product PG"; Code[10])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Gen. Business Posting Group";
        }
        field(87; "Default Vendor PG"; Code[10])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Vendor Posting Group";
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
