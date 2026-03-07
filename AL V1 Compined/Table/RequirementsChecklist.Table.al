#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Table 69661 "Requirements Checklist"
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
        field(4;"Qualification Category";Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = ',Academic,Professional,Skills & Competencies,Experience,Ethics & Integrity,Physical Attributes';
            OptionMembers = ,Academic,Professional,"Skills & Competencies",Experience,"Ethics & Integrity","Physical Attributes";
        }
        field(5;"Qualification Code";Code[30])
        {
            DataClassification = ToBeClassified;
        }
        field(6;Description;Text[250])
        {
            DataClassification = ToBeClassified;
        }
        field(7;"Requirement Type";Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = 'Mandatory,Added Advantage';
            OptionMembers = Mandatory,"Added Advantage";
        }
        field(8;"Rating Type";Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = 'Yes/No,Number,Options Text,Date';
            OptionMembers = "Yes/No",Number,"Options Text",Date;
        }
        field(9;"Candidates Response";Text[30])
        {
            DataClassification = ToBeClassified;

            trigger OnValidate()
            begin
                if "Rating Type"="rating type"::"Yes/No" then
                  if ("Candidates Response"<>'Yes') or ("Candidates Response"<>'No') then
                    Error('The response must be either Yes or No');
            end;
        }
    }

    keys
    {
        key(Key1;"Application No.","Vacancy No.","Requirement ID")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

