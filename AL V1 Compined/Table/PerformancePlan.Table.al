#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Table 69148 "Performance Plan"
{

    fields
    {
        field(1; "Employee No"; Code[20])
        {
            TableRelation = Employee;
        }
        field(2; "Appraisal Type"; Code[20])
        {
        }
        field(3; "Appraisal Period"; Code[20])
        {
        }
        field(4; "Key Responsibility"; Text[120])
        {
            NotBlank = true;
            TableRelation = "Job Responsiblities".Responsibility where("Job ID" = field("Job ID"));
        }
        field(5; "No."; Code[20])
        {
            NotBlank = true;
        }
        field(6; "Key Indicators"; Text[250])
        {
        }
        field(7; "Agreed Target Date"; Text[100])
        {
        }
        field(8; Weighting; Integer)
        {
        }
        field(9; "Results Achieved Comments"; Text[250])
        {
        }
        field(10; "Score/Points"; Decimal)
        {
        }
        field(11; "Job ID"; Code[20])
        {
            TableRelation = "Company Jobs"."Job ID";
        }
    }

    keys
    {
        key(Key1; "Employee No", "Appraisal Type", "Appraisal Period", "Key Responsibility", "No.", "Job ID")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}
