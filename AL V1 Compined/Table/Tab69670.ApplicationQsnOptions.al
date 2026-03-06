#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Table 69670 "Application Qsn Options"
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
        field(3;"Pre-screening Stage";Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = 'Application Stage,Interview-Invitation';
            OptionMembers = "Application Stage","Interview-Invitation";
        }
        field(4;"Question ID";Integer)
        {
            DataClassification = ToBeClassified;
        }
        field(5;"Option Code";Code[10])
        {
            DataClassification = ToBeClassified;
        }
        field(6;Description;Text[50])
        {
            DataClassification = ToBeClassified;
        }
        field(7;"Line No.";Integer)
        {
            AutoIncrement = true;
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

