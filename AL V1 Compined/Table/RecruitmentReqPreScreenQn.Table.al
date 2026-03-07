#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Table 69683 "Recruitment Req Pre-Screen Qn"
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
        field(5;Description;Text[800])
        {
            DataClassification = ToBeClassified;
        }
        field(6;"Question Type";Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = 'Open-ended,Closed-ended,Number';
            OptionMembers = "Open-ended","Closed-ended",Number;
        }
        field(7;"Closed-ended Question Sub-Type";Code[50])
        {
            DataClassification = ToBeClassified;
        }
        field(8;LineNo;Integer)
        {
            AutoIncrement = true;
            DataClassification = ToBeClassified;
        }
    }

    keys
    {
        key(Key1;"Document No.",LineNo)
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

