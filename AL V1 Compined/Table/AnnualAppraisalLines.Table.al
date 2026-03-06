#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Table 56205 "Annual  Appraisal Lines"
{

    fields
    {
        field(1; "Appraisal No"; Code[20])
        {
        }
        field(2; "Line No."; Integer)
        {
            AutoIncrement = true;
            Editable = false;
        }
        field(3; "Performance Objectives"; Text[250])
        {
            Caption = 'Performance Objectives';
        }
        field(4; "Achieved targets of annual"; Text[250])
        {
        }
        field(5; "Performance Indicator"; Text[250])
        {
        }
        field(6; "Performance Target (%)"; Decimal)
        {
            Caption = 'Performance Target (%)';
        }
        field(7; "Rating Supervisor (%)"; Decimal)
        {

            trigger OnValidate()
            begin
                "Actual of Eighty" := ("Rating Supervisor (%)" / 100) * 80;
            end;
        }
        field(8; "Targets changed or added"; Text[250])
        {
        }
        field(9; Remarks; Text[250])
        {
            Caption = 'Remarks (Indicate level of achievement)';
        }
        field(10; "Actual Achieved (%)"; Decimal)
        {
        }
        field(11; "Rating Self (%)"; Decimal)
        {
        }
        field(12; "Actual of Eighty"; Decimal)
        {
        }
        field(13; "Mid Year"; Boolean)
        {
        }
        field(14; "Actual Achieved"; Text[250])
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
