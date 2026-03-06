#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Table 70125 "Project Role Code"
{
    DrillDownPageID = "Project Role Code";
    LookupPageID = "Project Role Code";

    fields
    {
        field(1; "Project Role Code"; Code[30])
        {
            DataClassification = ToBeClassified;
        }
        field(2; "Title/Designation Description"; Text[100])
        {
            DataClassification = ToBeClassified;
        }
        field(3; Blocked; Boolean)
        {
            DataClassification = ToBeClassified;
        }
    }

    keys
    {
        key(Key1; "Project Role Code")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}
