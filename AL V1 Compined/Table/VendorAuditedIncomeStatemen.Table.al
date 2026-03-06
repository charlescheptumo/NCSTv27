#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Table 70114 "Vendor Audited Income Statemen"
{
    Caption = 'Vendor Audited Income Statement';

    fields
    {
        field(1; "Vendor No."; Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = Vendor."No.";
        }
        field(2; "Audit Year Code Reference"; Code[30])
        {
            DataClassification = ToBeClassified;
        }
        field(3; "Total Revenue (LCY)"; Decimal)
        {
            DataClassification = ToBeClassified;
            Description = 'Total Revenue made up of Sales revenue, Service revenue, Interest revenue  and Other revenue';

            trigger OnValidate()
            begin
                "Gross Margin (LCY)" += "Total Revenue (LCY)";
            end;
        }
        field(4; "Total COGS (LCY)"; Decimal)
        {
            DataClassification = ToBeClassified;
            Description = 'Long-term assets such as Investments, Tangible assets (e.g. Property, Land, F&F etc) and Intangible assets (e.g. Patent, Copyright etc)';

            trigger OnValidate()
            begin
                "Gross Margin (LCY)" -= "Total COGS (LCY)";
            end;
        }
        field(5; "Gross Margin (LCY)"; Decimal)
        {
            DataClassification = ToBeClassified;
            Description = 'Cost of Goods Sold';
        }
        field(6; "Total Operating Expenses (LCY)"; Decimal)
        {
            DataClassification = ToBeClassified;
            Description = 'Total Business operation expenses';

            trigger OnValidate()
            begin
                "Operating Income/EBIT (LCY)" := "Gross Margin (LCY)" - "Total Operating Expenses (LCY)";
            end;
        }
        field(7; "Operating Income/EBIT (LCY)"; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(8; "Other Non-operating Re/Exp LCY"; Decimal)
        {
            Caption = 'Other Non-operating Revenues/Expenses (LCY)';
            DataClassification = ToBeClassified;

            trigger OnValidate()
            begin
                "Income Before Taxes (LCY)" := "Operating Income/EBIT (LCY)" + "Other Non-operating Re/Exp LCY";
            end;
        }
        field(9; "Interest Expense (LCY)"; Decimal)
        {
            DataClassification = ToBeClassified;

            trigger OnValidate()
            begin
                "Income Before Taxes (LCY)" -= "Interest Expense (LCY)";
            end;
        }
        field(10; "Income Before Taxes (LCY)"; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(11; "Income Tax Expense (LCY)"; Decimal)
        {
            DataClassification = ToBeClassified;
            DecimalPlaces = 6 : 6;

            trigger OnValidate()
            begin
                "Net Income from Ops  (LCY)" := "Income Before Taxes (LCY)" - "Income Tax Expense (LCY)";
            end;
        }
        field(12; "Net Income from Ops  (LCY)"; Decimal)
        {
            Caption = 'Net Income from Continuing Operations (LCY)';
            DataClassification = ToBeClassified;
            DecimalPlaces = 6 : 6;
        }
        field(13; "Below-the-line Items (LCY)"; Decimal)
        {
            DataClassification = ToBeClassified;
            DecimalPlaces = 6 : 6;

            trigger OnValidate()
            begin
                "Net Income" := "Net Income from Ops  (LCY)" + "Below-the-line Items (LCY)";
            end;
        }
        field(14; "Net Income"; Decimal)
        {
            DataClassification = ToBeClassified;
            DecimalPlaces = 6 : 6;
        }
    }

    keys
    {
        key(Key1; "Vendor No.", "Audit Year Code Reference")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}
