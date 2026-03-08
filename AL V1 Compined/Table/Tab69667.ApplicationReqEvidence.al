#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Table 69667 "Application Req.  Evidence"
{

    fields
    {
        field(1;"Application No.";Code[30])
        {
            DataClassification = ToBeClassified;
        }
        field(2;"Vacancy No.";Code[30])
        {
            DataClassification = ToBeClassified;
        }
        field(3;"Requirement ID";Integer)
        {
            DataClassification = ToBeClassified;
        }
        field(4;"Line No.";Integer)
        {
            AutoIncrement = true;
            DataClassification = ToBeClassified;
        }
        field(5;"Remarks/Evidence/Comment";Text[800])
        {
            DataClassification = ToBeClassified;
        }
    }

    keys
    {
        key(Key1;"Application No.","Line No.")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

