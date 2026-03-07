#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Table 69643 "HR Document Type"
{

    fields
    {
        field(1;"Code";Code[30])
        {
            DataClassification = ToBeClassified;
        }
        field(2;Description;Text[250])
        {
            DataClassification = ToBeClassified;
        }
        field(3;"Issuing Agency Code";Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = Contact;
        }
        field(4;Blocked;Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(5;"Local Verification URL";Text[100])
        {
            DataClassification = ToBeClassified;
            ExtendedDatatype = URL;
        }
    }

    keys
    {
        key(Key1;"Code")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

