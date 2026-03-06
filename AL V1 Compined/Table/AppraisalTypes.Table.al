#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Table 69144 "Appraisal Types"
{
    // // DrillDownPageID = UnknownPage69184;
    //   //LookupPageID = UnknownPage69184;

    fields
    {
        field(1; "Code"; Code[20])
        {
            NotBlank = true;
        }
        field(2; Description; Text[150])
        {
            NotBlank = true;
        }
        field(3; "Use Template"; Boolean)
        {
        }
        field(4; "Template Link"; Text[200])
        {
        }
        field(5; Remarks; Text[250])
        {
        }
        field(6; "Max. Weighting"; Decimal)
        {
        }
        field(7; "Max. Score"; Decimal)
        {
        }
        field(8; "Minimum Job Group"; Code[10])
        {
            TableRelation = "Salary Scales";
        }
        field(9; "Maximum Job Group"; Code[10])
        {
            TableRelation = "Salary Scales";
        }
    }

    keys
    {
        key(Key1; "Code")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}
