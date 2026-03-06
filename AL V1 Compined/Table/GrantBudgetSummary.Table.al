#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Table 65026 "Grant Budget Summary"
{
    DrillDownPageID = "Grant Budget Summary List";
    LookupPageID = "Grant Budget Summary List";

    fields
    {
        field(1; "Entry No"; Integer)
        {
            AutoIncrement = true;
            DataClassification = ToBeClassified;
        }
        field(2; "Grant Application ID"; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Grant Funding Application";
        }
        field(3; "Code"; Code[50])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Job Budget Templates";
        }
        field(4; "Budget Currency"; Code[50])
        {
            DataClassification = ToBeClassified;
            TableRelation = Currency;
        }
        field(5; "Budget Amount"; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(6; "Budget Amount(LCY)"; Decimal)
        {
            DataClassification = ToBeClassified;
        }
    }

    keys
    {
        key(Key1; "Entry No", "Grant Application ID")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}
