#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Table 65028 "Grant Admin Team"
{
    DrillDownPageID = "Grant Admin Teams List";
    LookupPageID = "Grant Admin Teams List";

    fields
    {
        field(1; "Entry No"; Integer)
        {
            AutoIncrement = true;
            DataClassification = ToBeClassified;
        }
        field(2; "Code"; Code[50])
        {
            DataClassification = ToBeClassified;
        }
        field(3; Name; Text[100])
        {
            DataClassification = ToBeClassified;
        }
        field(4; "Next Task"; Code[10])
        {
            DataClassification = ToBeClassified;
        }
    }

    keys
    {
        key(Key1; "Entry No", "Code")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }

    var
        Res: Record Resource;
}
