#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Table 59056 "Strategic KPI"
{
    DrillDownPageID = "KPI List";
    LookupPageID = "KPI List";

    fields
    {
        field(1; No; Code[250])
        {
            DataClassification = ToBeClassified;
            Description = 'Number';
        }
        field(2; Name; Text[200])
        {
            DataClassification = ToBeClassified;
            Description = 'Name';
        }
        field(3; Description; Text[200])
        {
            DataClassification = ToBeClassified;
            Description = 'Description';
        }
        field(4; "Activities Code"; Code[100])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Strategic Activities";
        }
    }

    keys
    {
        key(Key1; No, "Activities Code")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}
