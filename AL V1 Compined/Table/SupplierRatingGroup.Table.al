#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Table 70184 "Supplier Rating Group"
{
    LookupPageID = "Supplier Rating Group";

    fields
    {
        field(1; "Appraisal Template ID"; Code[20])
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
        field(3; "Criteria Group"; Code[20])
        {
            DataClassification = ToBeClassified;
            Description = 'This refers to the Criteria Group applicable in the Template. A simple scoring sheet may have 1 Group of all General criteria, generally adding upto 100%. Some appraisal/due diligence sheets may be split into different Criteria Groups e.g. Technical proposal at 80% and Financial proposal at 20%';
        }
        field(4; Description; Text[250])
        {
            DataClassification = ToBeClassified;
        }
        field(5; "Total Weight %"; Decimal)
        {
            DataClassification = ToBeClassified;
            MaxValue = 100;
            MinValue = 0;
        }
    }

    keys
    {
        key(Key1; "Appraisal Template ID", "Template Type", "Criteria Group")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}
