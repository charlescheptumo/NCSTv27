#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Table 70025 users
{

    fields
    {
        field(1; UserID; Integer)
        {
            AutoIncrement = true;
        }
        field(2; UserName; Text[45])
        {
        }
        field(3; LastName; Text[45])
        {
        }
        field(4; OtherNames; Text[45])
        {
        }
        field(5; Password; Text[128])
        {
        }
        field(6; Email; Text[100])
        {
        }
        field(7; Mobile; Text[45])
        {
        }
        field(8; UserTypeID; Integer)
        {
        }
        field(9; CreatedDate; DateTime)
        {
        }
        field(10; UserStatusID; Integer)
        {
        }
        field(11; UserGroupID; Integer)
        {
        }
        field(12; Salt; Text[128])
        {
        }
        field(13; DepartmentID; Integer)
        {
        }
        field(14; ApplicantID; Text[50])
        {
        }
        field(15; JobID; Text[50])
        {
        }
        field(16; NeedID; Text[30])
        {
        }
        field(17; Status; Integer)
        {
        }
    }

    keys
    {
        key(Key1; UserID)
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}
