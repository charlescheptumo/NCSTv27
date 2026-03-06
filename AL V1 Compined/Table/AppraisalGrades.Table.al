#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Table 69146 "Appraisal Grades"
{
    //   //LookupPageID = UnknownPage69186;

    fields
    {
        field(1; Grade; Code[20])
        {
            NotBlank = true;
        }
        field(2; Description; Text[200])
        {
        }
        field(3; Points; Decimal)
        {
        }
    }

    keys
    {
        key(Key1; Grade)
        {
            Clustered = true;
        }
        key(Key2; Points)
        {
        }
    }

    fieldgroups
    {
    }
}
