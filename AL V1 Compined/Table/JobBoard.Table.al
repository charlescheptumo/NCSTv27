#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Table 69627 "Job Board"
{

    fields
    {
        field(1;"Code";Code[30])
        {
            DataClassification = ToBeClassified;
        }
        field(2;Name;Text[100])
        {
            DataClassification = ToBeClassified;
        }
        field(3;"Channel Category";Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = 'Online,Print Media,TV,Radio,Internal Advert,Other';
            OptionMembers = Online,"Print Media",TV,Radio,"Internal Advert",Other;
        }
        field(4;"Home Page";Text[600])
        {
            DataClassification = ToBeClassified;
        }
        field(5;"Vendor No.";Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = Vendor;
        }
        field(6;"No. of Vacancy Announcements";Integer)
        {
            DataClassification = ToBeClassified;
        }
        field(7;Blocked;Boolean)
        {
            DataClassification = ToBeClassified;
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

