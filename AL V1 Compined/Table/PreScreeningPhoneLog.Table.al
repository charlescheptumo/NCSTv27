#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Table 69703 "PreScreening Phone Log"
{

    fields
    {
        field(1;"Document Type";Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = 'Ability Test Invitation,Phone Interview Report';
            OptionMembers = "Ability Test Invitation","Phone Interview Report";
        }
        field(2;"Document No.";Code[30])
        {
            DataClassification = ToBeClassified;
        }
        field(3;"Vacancy ID";Code[30])
        {
            DataClassification = ToBeClassified;
        }
        field(4;"Application No.";Code[30])
        {
            DataClassification = ToBeClassified;
        }
        field(5;"Phone Interview Template ID";Code[30])
        {
            DataClassification = ToBeClassified;
        }
        field(6;"Question ID";Code[30])
        {
            DataClassification = ToBeClassified;
        }
        field(7;"Question Asked";Text[250])
        {
            DataClassification = ToBeClassified;
        }
        field(8;"General Rating";Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = '1-POOR,2-FAIR,3-GOOD,4-VERY GOOD,5-EXCELLENT';
            OptionMembers = "1-POOR","2-FAIR","3-GOOD","4-VERY GOOD","5-EXCELLENT";
        }
        field(9;"Response Rating %";Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(10;"Comments/Notes";Text[400])
        {
            DataClassification = ToBeClassified;
        }
    }

    keys
    {
        key(Key1;"Document Type","Document No.","Vacancy ID","Application No.")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

