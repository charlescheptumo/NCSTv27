#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Table 69110 "Job Responsibilities Lines"
{

    fields
    {
        field(1; "Employee No."; Code[20])
        {
            NotBlank = true;
        }
        field(2; Responsibility; Text[150])
        {
            NotBlank = true;
        }
        field(3; Date; Date)
        {
        }
        field(4; Remarks; Text[250])
        {
        }
    }

    keys
    {
        key(Key1; "Employee No.", Responsibility, Date)
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}
