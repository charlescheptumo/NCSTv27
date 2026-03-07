#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Table 69651 "Hobby Type"
{

    fields
    {
        field(1;"Code";Code[30])
        {
            DataClassification = ToBeClassified;
        }
        field(2;"Hobby Categgory";Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = 'Travel/Sports/Adventure,Games,Arts & Creatives,Food & Cooking,Collecting,Others';
            OptionMembers = "Travel/Sports/Adventure",Games,"Arts & Creatives","Food & Cooking",Collecting,Others;
        }
        field(3;Description;Text[200])
        {
            DataClassification = ToBeClassified;
        }
        field(4;"No. of Employees";Integer)
        {
            DataClassification = ToBeClassified;
        }
        field(5;"No. of Job Applicants";Integer)
        {
            DataClassification = ToBeClassified;
        }
        field(6;Blocked;Boolean)
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

