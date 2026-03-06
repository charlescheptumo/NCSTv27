#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Table 65046 "Billable Project Lines"
{

    fields
    {
        field(1; "Project Billable ID"; Code[50])
        {
            DataClassification = ToBeClassified;
        }
        field(2; "Job No."; Code[20])
        {
            Caption = 'Job No.';
            DataClassification = ToBeClassified;
            NotBlank = true;
            TableRelation = Job;
        }
        field(3; "Job Task No."; Code[20])
        {
            Caption = 'Job Task No.';
            DataClassification = ToBeClassified;
            NotBlank = true;
            TableRelation = "Job Planning Line"."Job Task No." where("Job No." = field("Job No."));

            trigger OnValidate()
            begin
                JobPlanningLines.Reset;
                JobPlanningLines.SetRange("Job No.", "Job No.");
                JobPlanningLines.SetRange("Job Task No.", "Job Task No.");
                if JobPlanningLines.Find('-') then begin
                    Init;
                    "Line Number" := JobPlanningLines."Line No.";
                    "Original Line Type" := "original line type"::Budget;
                    "Original Type" := "original type"::Resource;
                    "Billing Line Type" := "billing line type"::Billable;
                    "Billing Type" := "billing type"::"G/L Account";
                    Qty := JobPlanningLines.Quantity;
                    "Unit Price" := JobPlanningLines."Unit Cost";
                    "Unit Price (LCY)" := JobPlanningLines."Unit Cost (LCY)";
                    "Billing Price" := JobPlanningLines."Unit Cost";
                    "Billing Price(LCY)" := JobPlanningLines."Unit Cost (LCY)";
                    "Original Description" := JobPlanningLines.Description;
                    Insert(true);
                end;
            end;
        }
        field(4; "Original Line Type"; Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = 'Budget,Billable,Both Budget and Billable';
            OptionMembers = Budget,Billable,"Both Budget and Billable";
        }
        field(5; "Billing Line Type"; Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = 'Budget,Billable,Both Budget and Billable';
            OptionMembers = Budget,Billable,"Both Budget and Billable";
        }
        field(6; "Original Type"; Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = 'Resource,Item,G/L Account,Text';
            OptionMembers = Resource,Item,"G/L Account",Text;
        }
        field(7; "Billing Type"; Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = 'Resource,Item,G/L Account,Text';
            OptionMembers = Resource,Item,"G/L Account",Text;
        }
        field(8; "Original Description"; Code[100])
        {
            DataClassification = ToBeClassified;
        }
        field(9; "Billing Description"; Code[100])
        {
            DataClassification = ToBeClassified;
        }
        field(10; Qty; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(11; "Unit Price"; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(12; "Billing Price"; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(20; "Project Type"; Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = 'Fixed Price Billing,Time & Material';
            OptionMembers = "Fixed Price Billing","Time & Material";
        }
        field(21; "Line Number"; Integer)
        {
            DataClassification = ToBeClassified;
        }
        field(22; "Document No."; Code[20])
        {
            Caption = 'Document No.';
            DataClassification = ToBeClassified;

            trigger OnValidate()
            begin
                //ValidateModification(xRec."Document No." <> "Document No.");
            end;
        }
        field(23; "Unit Price (LCY)"; Decimal)
        {
            AutoFormatType = 2;
            Caption = 'Unit Price (LCY)';
            DataClassification = ToBeClassified;
            Editable = false;

            trigger OnValidate()
            begin
                /*ValidateModification(xRec."Unit Price (LCY)" <> "Unit Price (LCY)");
                
                InitRoundingPrecisions;
                "Unit Price" := ROUND(
                    CurrExchRate.ExchangeAmtLCYToFCY(
                      "Currency Date","Currency Code",
                      "Unit Price (LCY)","Currency Factor"),
                    UnitAmountRoundingPrecisionFCY);
                UpdateAllAmounts;
                */

            end;
        }
        field(24; "Budget Type"; Option)
        {
            DataClassification = ToBeClassified;
            Description = 'Added for Project Procurement Plan';
            OptionCaption = 'Original,Revised,Suplementary';
            OptionMembers = Original,Revised,Suplementary;
        }
        field(25; "Job Budget Templates"; Code[100])
        {
            DataClassification = ToBeClassified;
            Description = 'Added for Project Procurement Plan';
            TableRelation = "Job Budget Templates";
        }
        field(26; "Billing Price(LCY)"; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(27; "No."; Code[20])
        {
            Caption = 'No.';
            DataClassification = ToBeClassified;
            TableRelation = if ("Billing Type" = const("G/L Account")) "G/L Account"."No." where(Blocked = const(false),
                                                                                                "Direct Posting" = const(true));
        }
    }

    keys
    {
        key(Key1; "Project Billable ID", "Job No.", "Job Task No.", "Project Type", "Line Number")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }

    var
        JobPlanningLines: Record "Job Planning Line";
}
