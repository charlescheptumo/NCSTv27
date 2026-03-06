#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Table 80003 "Quarterly Reporting Periods"
{
    DrillDownPageID = "Quarterly Reporting Periods";
    LookupPageID = "Quarterly Reporting Periods";

    fields
    {
        field(1; "Code"; Code[100])
        {
            DataClassification = ToBeClassified;
        }
        field(2; "Year Code"; Code[100])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Annual Reporting Codes";
        }
        field(3; Description; Code[100])
        {
            DataClassification = ToBeClassified;
        }
        field(4; "Reporting Start Date"; Date)
        {
            DataClassification = ToBeClassified;
        }
        field(5; "Reporting End Date"; Date)
        {
            DataClassification = ToBeClassified;
        }
        field(6; "Current Year?"; Boolean)
        {
            DataClassification = ToBeClassified;
        }
    }

    keys
    {
        key(Key1; "Code")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}
