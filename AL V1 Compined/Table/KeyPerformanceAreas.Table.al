#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Table 69154 "Key Performance Areas"
{
    LookupPageID = "Hr Discplinary List";

    fields
    {
        field(1; "Employee No"; Code[20])
        {
            NotBlank = true;
        }
        field(2; Period; Code[20])
        {
            NotBlank = true;
        }
        field(3; "Code"; Code[20])
        {
            NotBlank = true;
        }
        field(4; Description; Text[200])
        {
        }
        field(5; Self; Code[20])
        {
            TableRelation = "Appraisal Grades";
        }
        field(6; Reviewer; Code[20])
        {
            TableRelation = "Appraisal Grades";
        }
        field(7; Comments; Text[250])
        {
        }
        field(8; "KPA Entry No"; Integer)
        {
            AutoIncrement = true;
        }
    }

    keys
    {
        key(Key1; "Employee No", Period, "Code")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }


    procedure GetKPACode() GetKPACode: Code[20]
    begin
        GetKPACode := Code;
    end;
}
