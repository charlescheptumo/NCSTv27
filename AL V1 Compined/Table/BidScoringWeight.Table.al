#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Table 70069 "Bid Scoring Weight"
{
    DrillDownPageID = "Grant Types List";
    LookupPageID = "Grant Types List";

    fields
    {
        field(1; "Bid Scoring Template ID"; Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(2; "Score Section ID"; Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(3; "Total Weight %"; Decimal)
        {
            DataClassification = ToBeClassified;
            MaxValue = 100;
            MinValue = 0;
        }
    }

    keys
    {
        key(Key1; "Bid Scoring Template ID", "Score Section ID")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}
