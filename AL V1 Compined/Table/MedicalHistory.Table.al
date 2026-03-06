#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Table 69116 "Medical History"
{

    fields
    {
        field(1; "Employee No"; Code[20])
        {
            NotBlank = true;
        }
        field(2; Description; Text[150])
        {
            NotBlank = true;
            TableRelation = "Medical Information".Description;
        }
        field(3; Results; Text[200])
        {
        }
        field(4; Date; Date)
        {
        }
        field(5; Remarks; Text[200])
        {
        }
    }

    keys
    {
        key(Key1; "Employee No", Description)
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}
