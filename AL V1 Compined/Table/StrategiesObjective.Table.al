#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Table 59054 "Strategies Objective"
{
    DrillDownPageID = "Strategic Obj List";
    LookupPageID = "Strategic Obj List";

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
        field(4; "Theme Code"; Code[100])
        {
            DataClassification = ToBeClassified;
            TableRelation = Themes;
        }
    }

    keys
    {
        key(Key1; No, "Theme Code")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}
