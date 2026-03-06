#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Table 69108 "Job Responsiblities"
{
    DrillDownPageID = "Job Responsibilites";
    LookupPageID = "Job Responsibilites";

    fields
    {
        field(1; "Job ID"; Code[20])
        {
            NotBlank = true;
            TableRelation = "Company Jobs"."Job ID";
        }
        field(2; Responsibility; Text[220])
        {
            NotBlank = true;
        }
        field(3; Remarks; Text[80])
        {
        }
        field(4; "Entry No."; Integer)
        {
        }
    }

    keys
    {
        key(Key1; "Job ID", Responsibility)
        {
            Clustered = true;
        }
        key(Key2; "Entry No.")
        {
        }
    }

    fieldgroups
    {
    }
}
