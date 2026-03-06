#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Table 70213 "Purchase Contract Template"
{

    fields
    {
        field(1; "Code"; Code[30])
        {
            DataClassification = ToBeClassified;
        }
        field(2; Description; Text[80])
        {
            DataClassification = ToBeClassified;
        }
        field(3; "Procurement Type"; Code[30])
        {
            DataClassification = ToBeClassified;
        }
        field(4; "Procurement Doc Template ID"; Code[30])
        {
            DataClassification = ToBeClassified;
            Description = 'Procurement Document Template ID';
            TableRelation = "Procurement Document Template"."Template ID";
        }
        field(5; "Default Language Code"; Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = Language.Code;
        }
        field(6; "Governing Laws"; Text[50])
        {
            DataClassification = ToBeClassified;
        }
        field(7; "Max Contract Variation %"; Decimal)
        {
            DataClassification = ToBeClassified;
            MaxValue = 100;
            MinValue = 0;
        }
        field(8; "Defects Liability Period"; DateFormula)
        {
            Caption = 'Default Defects Liability Period';
            DataClassification = ToBeClassified;
        }
        field(9; "Daily Liquidated Unit Cost"; Decimal)
        {
            Caption = 'Daily Liquidated Damages Unit Cost (LCY)';
            DataClassification = ToBeClassified;
            Description = 'Daily Liquidated Damages Unit Cost (LCY)';
        }
        field(10; "Liquidated Damages Limit %"; Decimal)
        {
            Caption = 'Liquidated Damages Limit % (Contract Value)';
            DataClassification = ToBeClassified;
            Description = 'Liquidated Damages Limit % (Contract Value)';
            MaxValue = 100;
            MinValue = 0;
        }
        field(11; "Payment Retention %"; Decimal)
        {
            DataClassification = ToBeClassified;
            MaxValue = 100;
            MinValue = 0;
        }
        field(12; "Retention Amount Limit %"; Decimal)
        {
            Caption = 'Retention Amount Limit % (Contract Value)';
            DataClassification = ToBeClassified;
            Description = 'Retention Amount Limit % (Contract Value)';
        }
        field(13; "Minimum Interim Certificate"; Decimal)
        {
            Caption = 'Minimum Interim Certificate Amount (LCY)';
            DataClassification = ToBeClassified;
            Description = 'Minimum Interim Certificate Amount (LCY)';
        }
        field(14; "Written Consent for 3rd Party"; Boolean)
        {
            Caption = 'Written Consent for 3rd Party Assignment';
            DataClassification = ToBeClassified;
            Description = 'Written Consent for 3rd Party Assignment';
        }
        field(15; "Limitation of Liability Clause"; Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(16; "Idemnification Clause"; Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(17; "Full Transfer of Ownership"; Boolean)
        {
            Caption = 'Full Transfer of Ownership  on Completion';
            DataClassification = ToBeClassified;
            Description = 'Full Transfer of Ownership  on Completion';
        }
        field(18; "Written Consent for Subcontr"; Boolean)
        {
            Caption = 'Written Consent for Subcontracting';
            DataClassification = ToBeClassified;
            Description = 'Written Consent for Subcontracting';
        }
        field(19; "Max Subcontractor Value %"; Decimal)
        {
            DataClassification = ToBeClassified;
            MaxValue = 100;
            MinValue = 0;
        }
        field(20; "Amicable Dispute Settlement"; Boolean)
        {
            Caption = 'Amicable Dispute Settlement Allowed';
            DataClassification = ToBeClassified;
            Description = 'Amicable Dispute Settlement Allowed';
        }
        field(21; "Appointer of Arbitrator"; Text[80])
        {
            DataClassification = ToBeClassified;
        }
        field(22; "Min Termination Notice Period"; Date)
        {
            DataClassification = ToBeClassified;
            Description = 'Minimum Termination Notice Period';
        }
        field(23; Blocked; Boolean)
        {
            DataClassification = ToBeClassified;
        }
    }

    keys
    {
        key(Key1; "Code")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}
