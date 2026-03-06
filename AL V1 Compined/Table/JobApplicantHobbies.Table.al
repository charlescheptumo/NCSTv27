#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Table 56907 "Job Applicant Hobbies"
{

    fields
    {
        field(1; "Id No"; Code[20])
        {
            TableRelation = "Hr Jobs Applicants"."ID Number";
        }
        field(2; Hobby; Text[200])
        {
        }
        field(3; "Code"; Integer)
        {
            AutoIncrement = true;
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
