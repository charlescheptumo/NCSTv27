#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Table 69008 "Bracket Tablesx"
{
    DrillDownPageID = "Brackets Table";
    LookupPageID = "Brackets Table";

    fields
    {
        field(1; "Bracket Code"; Code[10])
        {
            NotBlank = true;
        }
        field(2; "Bracket Description"; Text[80])
        {
        }
        field(3; "Effective Starting Date"; Date)
        {
        }
        field(4; "Effective End Date"; Date)
        {
        }
        field(5; Annual; Boolean)
        {
        }
        field(6; Gratuity; Boolean)
        {
            DataClassification = ToBeClassified;
        }
    }

    keys
    {
        key(Key1; "Bracket Code")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}
