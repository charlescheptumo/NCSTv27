#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Table 69687 "Hr Screening Qn Group"
{

    fields
    {
        field(1;"Header No.";Code[30])
        {
            DataClassification = ToBeClassified;
        }
        field(2;"Question Category";Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Candidate Interview Qn Group"."Question Category";

            //muga
            // trigger OnValidate()
            // begin
            //     CloseEndedQnType.Reset;
            //     CloseEndedQnType.SetRange("Type ID","Question Category");
            //     if CloseEndedQnType.FindFirst then begin
            //       Description:=CloseEndedQnType.Description;
            //     end
            // end;
        }
        field(3;Description;Text[200])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Candidate Interview Qn Group".Description;
        }
        field(4;"No. of Questions";Integer)
        {
            CalcFormula = count("Hr Screening Template Line" where ("Template ID"=field("Header No."),
                                                                    "Question Category"=field("Question Category")));
            FieldClass = FlowField;
        }
        field(5;"Total Weight";Decimal)
        {
            CalcFormula = sum("Hr Screening Template Line".Weight where ("Template ID"=field("Header No."),
                                                                         "Question Category"=field("Question Category")));
            FieldClass = FlowField;
        }
        field(6;"Entry No.";Integer)
        {
            AutoIncrement = true;
            DataClassification = ToBeClassified;
        }
        field(7;"Template Type";Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = 'Application Submission,Phone Pre-Screening Interview,Interview Scoresheet';
            OptionMembers = "Application Submission","Phone Pre-Screening Interview","Interview Scoresheet";
        }
    }

    keys
    {
        key(Key1;"Header No.","Entry No.","Question Category")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }

    var
        CloseEndedQnType: Record "Close Ended Qn Type";
}

