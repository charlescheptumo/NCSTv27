#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Table 56202 "Quarterly  Appraisal Lines"
{

    fields
    {
        field(1; "Appraisal No"; Code[20])
        {
        }
        field(2; "Line No."; Integer)
        {
            AutoIncrement = true;
        }
        field(3; "Agreed Performance Targets"; Text[250])
        {
        }
        field(4; "Acheived Targets for the Quart"; Text[250])
        {
            Caption = 'Acheived Targets for the Quarter';
        }
        field(5; "Performance Indicator"; Text[250])
        {
        }
        field(6; "Percentage Cumulative Achievem"; Decimal)
        {
            Caption = 'Percentage Cumulative Achievement';
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
