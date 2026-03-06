#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Table 80002 "Annual Reporting Codes"
{
    DrillDownPageID = "Annual Reporting Codes";
    LookupPageID = "Annual Reporting Codes";

    fields
    {
        field(1; "Code"; Code[100])
        {
            DataClassification = ToBeClassified;
        }
        field(2; Description; Text[100])
        {
            DataClassification = ToBeClassified;
        }
        field(3; "Reporting Start Date"; Date)
        {
            DataClassification = ToBeClassified;
        }
        field(4; "Reporting End Date"; Date)
        {
            DataClassification = ToBeClassified;
        }
        field(5; "Current Year"; Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(6; "Annual Procurement Plan"; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Procurement Header".No where(Status = const(Approved));
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
