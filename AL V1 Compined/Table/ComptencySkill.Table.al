#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Table 56212 "Comptency/Skill"
{
    DrillDownPageID = "Competency/skill";
    LookupPageID = "Competency/skill";

    fields
    {
        field(1; No; Code[20])
        {
        }
        field(2; Name; Text[250])
        {
        }
        field(3; Description; Text[250])
        {
        }
        field(4; Managerial; Boolean)
        {
        }
    }

    keys
    {
        key(Key1; No)
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}
