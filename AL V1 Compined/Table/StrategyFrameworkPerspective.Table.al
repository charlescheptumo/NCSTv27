#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Table 80009 "Strategy Framework Perspective"
{
    DrillDownPageID = "Strategy Framework Perspective";
    LookupPageID = "Strategy Framework Perspective";

    fields
    {
        field(1; "Code"; Code[50])
        {
            DataClassification = ToBeClassified;
        }
        field(2; "Strategy Framework"; Code[100])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Strategy Framework";
        }
        field(3; Perspective; Code[100])
        {
            DataClassification = ToBeClassified;
        }
        field(4; Description; Text[255])
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
        key(Key2; "Strategy Framework")
        {
        }
    }

    fieldgroups
    {
    }
}
