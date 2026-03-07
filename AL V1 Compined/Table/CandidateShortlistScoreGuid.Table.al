#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Table 69675 "Candidate Shortlist Score Guid"
{

    fields
    {
        field(1;"Document Type";Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = 'Candidate Shortlisting,Interview Invitation';
            OptionMembers = "Candidate Shortlisting","Interview Invitation";
        }
        field(2;"Document No.";Code[30])
        {
            DataClassification = ToBeClassified;
        }
        field(3;"Requirement ID";Integer)
        {
            DataClassification = ToBeClassified;
        }
        field(4;"Score Code";Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Shortlisting Score Code";

            trigger OnValidate()
            begin
                ShortlistingScore.Reset;
                ShortlistingScore.SetRange(Code,"Score Code");
                if ShortlistingScore.FindFirst then begin
                  Description:=ShortlistingScore.Description;
                  Points:=ShortlistingScore.Points;
                end
            end;
        }
        field(5;Description;Text[350])
        {
            DataClassification = ToBeClassified;
        }
        field(6;Points;Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(7;"Requirement Name";Text[300])
        {
            DataClassification = ToBeClassified;
        }
    }

    keys
    {
        key(Key1;"Document Type","Requirement ID","Document No.","Score Code")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }

    var
        PostCode: Record "Post Code";
        JobApplications: Record "Job Applications";
        ShortlistingScore: Record "Shortlisting Score Code";
}

