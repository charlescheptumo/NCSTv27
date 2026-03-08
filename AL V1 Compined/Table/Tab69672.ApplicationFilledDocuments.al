#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Table 69672 "Application Filled Documents"
{

    fields
    {
        field(1;"Line No.";Integer)
        {
            AutoIncrement = true;
            DataClassification = ToBeClassified;
        }
        field(2;"Application No.";Code[30])
        {
            DataClassification = ToBeClassified;
        }
        field(3;"Vacancy No.";Code[30])
        {
            DataClassification = ToBeClassified;
        }
        field(4;"HR Document Type";Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = "HR Document Type";
        }
        field(5;Description;Text[600])
        {
            DataClassification = ToBeClassified;
        }
        field(6;"Requirement Type";Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = 'Mandatory,Optional';
            OptionMembers = Mandatory,Optional;
        }
        field(7;"File Name";Text[30])
        {
            DataClassification = ToBeClassified;
        }
        field(8;"File Type";Text[30])
        {
            DataClassification = ToBeClassified;
        }
        field(9;"File Extension";Text[30])
        {
            DataClassification = ToBeClassified;
        }
    }

    keys
    {
        key(Key1;"Line No.","Application No.")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

