#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Table 69660 "Application Language"
{

    fields
    {
        field(1;"Application No.";Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Job Applications";
        }
        field(2;"Candidate No.";Code[30])
        {
            DataClassification = ToBeClassified;
        }
        field(3;"Language Code";Code[30])
        {
            DataClassification = ToBeClassified;
        }
        field(4;Description;Text[150])
        {
            DataClassification = ToBeClassified;
        }
        field(5;"Proficiency Level";Text[30])
        {
            DataClassification = ToBeClassified;
        }
        field(6;"Line No.";Integer)
        {
            AutoIncrement = true;
            DataClassification = ToBeClassified;
        }
    }

    keys
    {
        key(Key1;"Application No.","Candidate No.","Line No.")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

