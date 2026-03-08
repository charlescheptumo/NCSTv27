#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Table 69669 "Applications Prescreening Ques"
{

    fields
    {
        field(1;"Application No.";Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Job Applications";
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
            AutoIncrement = true;
            DataClassification = ToBeClassified;
        }
        field(5;Description;Text[400])
        {
            DataClassification = ToBeClassified;
        }
        field(6;"Question Type";Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = 'Open-ended,Closed-ended,Number';
            OptionMembers = "Open-ended","Closed-ended",Number;
        }
        field(7;"Close Ended Sub-type";Code[30])
        {
            DataClassification = ToBeClassified;
        }
        field(8;"Response Option";Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Application Qsn Options"."Option Code" where ("Application No."=field("Application No."),
                                                                           "Question ID"=field("Question ID"));
        }
        field(9;"Number Response";Integer)
        {
            DataClassification = ToBeClassified;
        }
    }

    keys
    {
        key(Key1;"Application No.","Question ID")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

