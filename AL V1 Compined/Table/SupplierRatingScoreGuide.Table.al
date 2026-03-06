#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Table 70187 "Supplier Rating Score Guide"
{
    LookupPageID = "Supplier Rating Score Guide";

    fields
    {
        field(1; "Appraisal Template ID"; Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Supplier Rating Template";
        }
        field(2; "Template Type"; Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = 'Vendor Due Diligence,Supplier Performance Review';
            OptionMembers = "Vendor Due Diligence","Supplier Performance Review";
        }
        field(3; "Criteria Group"; Code[30])
        {
            DataClassification = ToBeClassified;
        }
        field(4; "Checklist ID"; Integer)
        {
            AutoIncrement = true;
            DataClassification = ToBeClassified;
        }
        field(5; "Entry No"; Integer)
        {
            DataClassification = ToBeClassified;
        }
        field(6; "Target Qty"; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(7; "Rating Type"; Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = 'Number,Yes/No,Options Text,Date';
            OptionMembers = Number,"Yes/No","Options Text",Date;
        }
        field(9; "Desired Perfomance Direction"; Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = 'Increasing KPI,Decreasing KPI,Not Applicable';
            OptionMembers = "Increasing KPI","Decreasing KPI","Not Applicable";
        }
        field(10; "Response Value"; Text[30])
        {
            DataClassification = ToBeClassified;
        }
        field(11; "Min Bid Value"; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(12; "Max Bid Value"; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(13; "Min Date Value"; Date)
        {
            DataClassification = ToBeClassified;
        }
        field(14; "Max Date Value"; Date)
        {
            DataClassification = ToBeClassified;
        }
        field(15; "Score %"; Decimal)
        {
            DataClassification = ToBeClassified;
            MaxValue = 100;
            MinValue = 0;
        }
    }

    keys
    {
        key(Key1; "Appraisal Template ID", "Template Type", "Criteria Group", "Checklist ID", "Entry No")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}
