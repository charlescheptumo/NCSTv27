#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Table 56906 "Job Applicant Referees"
{

    fields
    {
        field(1; "Id Number"; Code[20])
        {
            TableRelation = "Hr Jobs Applicants"."ID Number";
        }
        field(2; Names; Text[200])
        {
        }
        field(3; Designation; Text[100])
        {
        }
        field(4; Institution; Text[100])
        {
        }
        field(5; Address; Text[200])
        {
        }
        field(6; "Telephone No"; Text[100])
        {
        }
        field(7; "E-Mail"; Text[100])
        {
        }
        field(8; "Employee No"; Code[30])
        {
        }
        field(9; Id; Integer)
        {
            AutoIncrement = true;
        }
    }

    keys
    {
        key(Key1; Id)
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}
