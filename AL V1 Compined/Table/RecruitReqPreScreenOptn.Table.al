#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Table 69684 "Recruit Req Pre Screen Optn"
{

    fields
    {
        field(1;"Document No.";Code[50])
        {
            DataClassification = ToBeClassified;
        }
        field(2;"Document Type";Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = 'Recruitment Requisition,Job Vacancy';
            OptionMembers = "Recruitment Requisition","Job Vacancy";
        }
        field(3;"Pre-Screening Stage";Option)
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
        field(6;Description;Text[100])
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
        key(Key1;"Document No.","Line No.")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

