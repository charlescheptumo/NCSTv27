#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Table 70185 "Supplier Rating Requirement"
{
    LookupPageID = "Supplier Rating Requirement";

    fields
    {
        field(1; "Appraisal Template ID"; Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Supplier Rating Template".Code;
        }
        field(2; "Template Type"; Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = 'Vendor Due Diligence,Supplier Performance Review,Prequalification Scoring,EOI Scoring';
            OptionMembers = "Vendor Due Diligence","Supplier Performance Review","Prequalification Scoring","EOI Scoring";
        }
        field(3; "Criteria Group"; Code[50])
        {
            DataClassification = ToBeClassified;
            Description = 'This refers to the Criteria Group applicable in the Template. A simple scoring sheet may have 1 Group of all General criteria, generally adding upto 100%. Some appraisal/due diligence sheets may be split into different Criteria Groups e.g. Technical proposal at 80% and Financial proposal at 20%';
        }
        field(4; "Checklist ID"; Integer)
        {
            AutoIncrement = true;
            DataClassification = ToBeClassified;
        }
        field(5; "Evaluation Requirement"; Text[250])
        {
            DataClassification = ToBeClassified;
        }
        field(6; "Rating Type"; Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = 'Number,Yes/No,Options Text,Date';
            OptionMembers = Number,"Yes/No","Options Text",Date;
        }
        field(7; "Assigned Weight %"; Decimal)
        {
            DataClassification = ToBeClassified;
            MaxValue = 100;
            MinValue = 0;
        }
        field(8; "Target Qty"; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(9; "Desired Perfomance Direction"; Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = 'Increasing KPI,Decreasing KPI,Not Applicable';
            OptionMembers = "Increasing KPI","Decreasing KPI","Not Applicable";
        }
        field(10; "Target Value"; Decimal)
        {
            DataClassification = ToBeClassified;
        }
    }

    keys
    {
        key(Key1; "Appraisal Template ID", "Template Type", "Criteria Group", "Checklist ID")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}
