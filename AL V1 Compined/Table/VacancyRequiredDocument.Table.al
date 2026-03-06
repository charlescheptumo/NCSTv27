#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Table 69259 "Vacancy Required Document"
{
    //DrillDownPageID = "Vacancy Required Document";
    //LookupPageID = "Vacancy Required Document";

    fields
    {
        field(1;"Vacancy ID";Code[30])
        {
            DataClassification = ToBeClassified;
        }
        field(2;"Document Type";Code[30])
        {
            DataClassification = ToBeClassified;
        }
        field(3;Description;Text[100])
        {
            DataClassification = ToBeClassified;
        }
        field(4;"Requirement Type";Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = 'Mandatory,Optional';
            OptionMembers = Mandatory,Optional;
        }
    }

    keys
    {
        key(Key1;"Vacancy ID","Document Type")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

