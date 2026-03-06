#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Table 59055 "Strategic Activities"
{
    DrillDownPageID = "Activities list";
    LookupPageID = "Activities list";

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
        field(4; "Strategies Code"; Text[50])
        {
            DataClassification = ToBeClassified;
            Description = 'Strategies Code';
            TableRelation = Strategic;
        }
    }

    keys
    {
        key(Key1; No, "Strategies Code")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}
