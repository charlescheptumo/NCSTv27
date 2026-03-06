#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Table 65011 "Research Output Authorship"
{
    DrillDownPageID = "Research Authorship List";
    LookupPageID = "Research Authorship List";

    fields
    {
        field(1; "Research Output Id"; Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Research Output Register";
        }
        field(2; "Author No"; Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = Resource;
        }
        field(3; "Author Name"; Code[100])
        {
            DataClassification = ToBeClassified;
        }
        field(4; "Author Contribution(%)"; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(5; "Author Category"; Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = 'Internal,External';
            OptionMembers = Internal,External;
        }
    }

    keys
    {
        key(Key1; "Research Output Id", "Author No")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}
