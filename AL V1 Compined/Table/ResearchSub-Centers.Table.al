#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Table 65001 "Research Sub-Centers"
{
    DrillDownPageID = "Research Sub-Center List";
    LookupPageID = "Research Sub-Center List";

    fields
    {
        field(1; "Code"; Code[50])
        {
            DataClassification = ToBeClassified;
        }
        field(2; "Research Centre"; Code[50])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Responsibility Center" where("Operating Unit Type" = const(Department),
                                                           "Research Center?" = const(true));
        }
        field(3; Name; Code[100])
        {
            DataClassification = ToBeClassified;
        }
        field(4; Contact; Code[100])
        {
            DataClassification = ToBeClassified;
        }
        field(5; Email; Code[100])
        {
            DataClassification = ToBeClassified;
        }
        field(6; Blocked; Boolean)
        {
            DataClassification = ToBeClassified;
        }
    }

    keys
    {
        key(Key1; "Code", "Research Centre")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}
