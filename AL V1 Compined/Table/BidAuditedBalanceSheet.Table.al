#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Table 70163 "Bid Audited Balance Sheet"
{

    fields
    {
        field(1; "Document Type"; Option)
        {
            Caption = 'Document Type';
            DataClassification = ToBeClassified;
            OptionCaption = 'Quote,Order,Invoice,Credit Memo,Blanket Order,Return Order,Store Requisition,Purchase Requisition,,,,,,IEC Materials';
            OptionMembers = Quote,"Order",Invoice,"Credit Memo","Blanket Order","Return Order","Store Requisition","Purchase Requisition",,,,,,"IEC Materials";
        }
        field(2; "No."; Code[20])
        {
            Caption = 'No.';
            DataClassification = ToBeClassified;
            TableRelation = "Purchase Header"."No.";
        }
        field(3; "Audit Year Code Reference"; Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Calendar Year Code".Code;
        }
        field(4; "Vendor No."; Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = Vendor."No.";
        }
        field(5; "Current Assets (LCY)"; Decimal)
        {
            DataClassification = ToBeClassified;

            trigger OnValidate()
            begin
                //"Current Assets (LCY)"+="Audit Year Code Reference";
            end;
        }
        field(6; "Fixed Assets (LCY)"; Decimal)
        {
            DataClassification = ToBeClassified;
            Description = 'Long-term assets such as Investments, Tangible assets (e.g. Property, Land, F&F etc) and Intangible assets (e.g. Patent, Copyright etc)';

            trigger OnValidate()
            begin
                //"Current Assets (LCY)"+="Vendor No.";
            end;
        }
        field(7; "Total Assets (LCY)"; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(8; "Current Liabilities (LCY)"; Decimal)
        {
            DataClassification = ToBeClassified;
            Description = 'Obligations to be paid in the short-term such as Accounts payables, Short-term loans, tax payables, wages, unearned revenue etc';

            trigger OnValidate()
            begin
                /*"Current Liabilities (LCY)"+="Fixed Assets (LCY)";
                "Total Liabilities & Equity(LCY":="Audit Year Code Reference"/"Fixed Assets (LCY)";
                "Debt Ratio":="Audit Year Code Reference"-"Fixed Assets (LCY)";
                "Current Ratio":="Current Assets (LCY)"/"Total Liabilities & Equity(LCY";
                "Working Capital (LCY)":="Current Liabilities (LCY)"/"Total Liabilities & Equity(LCY";*/

            end;
        }
        field(9; "Long-term Liabilities (LCY)"; Decimal)
        {
            DataClassification = ToBeClassified;
            Description = 'Long-term debt (e.g. loans, mortgages, lease payments etc) and other payment obligations (e.g. deferred income tax)';

            trigger OnValidate()
            begin
                "Current Liabilities (LCY)" += "Total Assets (LCY)"
            end;
        }
        field(10; "Total Liabilities (LCY)"; Decimal)
        {
            DataClassification = ToBeClassified;

            trigger OnValidate()
            begin
                //"Owners Equity (LCY)":="Current Liabilities (LCY)"/"Current Assets (LCY)";
            end;
        }
        field(11; "Owners Equity (LCY)"; Decimal)
        {
            DataClassification = ToBeClassified;
            Description = 'It includes the Owners investment and retained earnings. The Owners Equity is generally computed by subtracting Total Liabilities from Total Assets';

            trigger OnValidate()
            begin
                //"Total Liabilities (LCY)":="Current Liabilities (LCY)"+"Long-term Liabilities (LCY)";
            end;
        }
        field(12; "Total Liabilities & Equity(LCY"; Decimal)
        {
            DataClassification = ToBeClassified;
            Description = 'Total Liabilities & Owners Equity (LCY)';
        }
        field(13; "Debt Ratio"; Decimal)
        {
            DataClassification = ToBeClassified;
            DecimalPlaces = 9 : 9;
            Description = 'Total Liabilities/Total Assets';
        }
        field(14; "Current Ratio"; Decimal)
        {
            DataClassification = ToBeClassified;
            DecimalPlaces = 9 : 9;
            Description = 'Current Assets/Current Liabilities';
        }
        field(15; "Working Capital (LCY)"; Decimal)
        {
            DataClassification = ToBeClassified;
            DecimalPlaces = 6 : 6;
            Description = 'Current Assets-Current Liabilities';
        }
        field(16; "Assets-To-Equity Ratio"; Decimal)
        {
            DataClassification = ToBeClassified;
            DecimalPlaces = 9 : 9;
            Description = 'Total Assets/Owners Equity';
        }
        field(17; "Debt-To-Equity Ratio"; Decimal)
        {
            DataClassification = ToBeClassified;
            DecimalPlaces = 9 : 9;
            Description = 'Total Liabilities/Owners Equity';
        }
    }

    keys
    {
        key(Key1; "Document Type", "No.", "Audit Year Code Reference")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}
