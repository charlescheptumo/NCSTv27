#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Table 69159 "Appraisal Lines"
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
        field(12; "Line No"; Integer)
        {
        }
        field(13; "Appraiser's Comments"; Text[150])
        {
        }
        field(14; "Appraisee's comments"; Text[150])
        {
        }
        field(15; Description; Text[80])
        {
        }
        field(16; "Appraisal Heading Type"; Option)
        {
            OptionMembers = " ",Objectives,"Core Values","Core Competencies","Managerial and Supervisory";
        }
        field(17; "Appraisal Header"; Text[50])
        {
            TableRelation = "Appraisal Format Header";
        }
        field(18; Bold; Boolean)
        {
        }
        field(19; "Appraisal No"; Code[20])
        {
        }
    }

    keys
    {
        key(Key1; "Appraisal No", "Line No")
        {
        }
        key(Key2; "Employee No", "Appraisal Type", "Appraisal Period", "Line No")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}
