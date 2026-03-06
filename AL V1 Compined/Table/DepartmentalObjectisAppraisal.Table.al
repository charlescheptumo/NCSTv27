#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Table 56211 "Departmental ObjectisAppraisal"
{

    fields
    {
        field(1; "Appraisal No"; Code[20])
        {
            Editable = false;
        }
        field(2; "Line No."; Integer)
        {
            AutoIncrement = true;
            Editable = false;
        }
        field(3; Objectives; Text[250])
        {
        }
        field(4; Description; Text[250])
        {
        }
        field(5; Rating; Text[250])
        {
        }
        field(6; "Rating %"; Code[100])
        {
        }
        field(7; Rate; Boolean)
        {
        }
    }

    keys
    {
        key(Key1; "Appraisal No", "Line No.")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}
