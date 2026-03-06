#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Table 70196 "Prequalification Score Line"
{

    fields
    {
        field(1; "Evaluation Voucher ID"; Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Prequalification Score Header".Code;
        }
        field(2; "Line No"; Integer)
        {
            AutoIncrement = true;
            DataClassification = ToBeClassified;
        }
        field(3; "Rating Template ID"; Code[50])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Supplier Rating Requirement"."Appraisal Template ID";
        }
        field(4; "Template Type"; Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = 'Vendor Due Diligence,Supplier Performance Review,Prequalification Scoring,EOI Scoring';
            OptionMembers = "Vendor Due Diligence","Supplier Performance Review","Prequalification Scoring","EOI Scoring";
        }
        field(5; "Criteria Group"; Code[50])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Supplier Rating Requirement"."Criteria Group";
        }
        field(6; "Checklist ID"; Integer)
        {
            DataClassification = ToBeClassified;
            TableRelation = "Supplier Rating Requirement"."Checklist ID";
        }
        field(7; "Evaluation Requirement"; Text[250])
        {
            DataClassification = ToBeClassified;
        }
        field(8; "Rating Type"; Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = 'Number,Yes/No,Options Text';
            OptionMembers = Number,"Yes/No","Options Text";
        }
        field(9; "Response Value"; Code[60])
        {
            DataClassification = ToBeClassified;
            TableRelation = if ("Rating Type" = filter("Yes/No" | "Options Text")) "Supplier Rating Score Guide"."Response Value" where("Appraisal Template ID" = field("Rating Template ID"),
                                                                                                                                     "Template Type" = field("Template Type"),
                                                                                                                                     "Criteria Group" = field("Criteria Group"),
                                                                                                                                     "Checklist ID" = field("Checklist ID"));
        }
        field(10; "Bid Response Actual Qty"; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(11; "Score %"; Decimal)
        {
            DataClassification = ToBeClassified;
            MaxValue = 100;
            MinValue = 0;
        }
        field(12; "Assigned Weight %"; Decimal)
        {
            DataClassification = ToBeClassified;
            MaxValue = 100;
            MinValue = 0;
        }
        field(13; "Weighted Line Score"; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(14; "Target Qty"; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(15; "Desired Perfomance Direction"; Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = 'Increasing KPI,Decreasing KPI,Not Applicable';
            OptionMembers = "Increasing KPI","Decreasing KPI","Not Applicable";
        }
        field(16; "Target Value"; Decimal)
        {
            DataClassification = ToBeClassified;
        }
    }

    keys
    {
        key(Key1; "Evaluation Voucher ID", "Line No")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}
