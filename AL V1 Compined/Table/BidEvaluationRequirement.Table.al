#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Table 70090 "Bid Evaluation Requirement"
{

    fields
    {
        field(1; "Bid Scoring Document No."; Code[30])
        {
            DataClassification = ToBeClassified;
        }
        field(2; "Bid Scoring Document Type"; Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = 'Bid Score Template,Bid Score Voucher';
            OptionMembers = "Bid Score Template","Bid Score Voucher";
        }
        field(3; "Criteria Group/Category"; Code[50])
        {
            DataClassification = ToBeClassified;
            Description = 'This refers to the Criteria Group applicable in the Template. A simple scoring sheet may have 1 Group of all General criteria, generally adding upto 100%. Some score sheets may be split into different Criteria Groups e.g. Technical proposal at 80% and Financial proposal at 20%';
        }
        field(4; "Requirement ID"; Integer)
        {
            DataClassification = ToBeClassified;
        }
        field(5; "Evaluation Requirement"; Text[250])
        {
            DataClassification = ToBeClassified;
        }
        field(6; "Bidder Response"; Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = 'Required,Optional,Display Only';
            OptionMembers = Required,Optional,"Display Only";
        }
        field(7; "Rating Type"; Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = 'Number,Yes/No,Options Text,Date';
            OptionMembers = Number,"Yes/No","Options Text",Date;
        }
        field(8; "Target Value"; Text[80])
        {
            DataClassification = ToBeClassified;
        }
        field(9; "Assigned Weight %"; Decimal)
        {
            DataClassification = ToBeClassified;
            MaxValue = 100;
            MinValue = 0;
        }
        field(10; "Evaluation Type"; Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = 'Preliminary Evaluation,Technical Evaluation,Financial Evaluation';
            OptionMembers = "Preliminary Evaluation","Technical Evaluation","Financial Evaluation";
        }
        field(11; "Equipment Type"; Text[50])
        {
            DataClassification = ToBeClassified;
        }
        field(12; "Unit of Measure"; Code[30])
        {
            DataClassification = ToBeClassified;
        }
        field(13; "Target Qty"; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(14; "Desired Perfomance Direction"; Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = 'Increasing KPI,Decreasing KPI,Not Applicable';
            OptionMembers = "Increasing KPI","Decreasing KPI","Not Applicable";
        }
    }

    keys
    {
        key(Key1; "Bid Scoring Document No.", "Bid Scoring Document Type", "Criteria Group/Category", "Requirement ID")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}
