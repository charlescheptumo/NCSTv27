#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Table 69737 "Screening Template Score Guide"
{

    fields
    {
        field(1;"Template Type";Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = 'Application Submission,Phone Pre-Screening Interview,Interview Scoresheet';
            OptionMembers = "Application Submission","Phone Pre-Screening Interview","Interview Scoresheet";
        }
        field(2;"Template ID";Code[30])
        {
            DataClassification = ToBeClassified;
        }
        field(3;"Question Category";Code[30])
        {
            DataClassification = ToBeClassified;
        }
        field(4;"Question ID";Code[30])
        {
            DataClassification = ToBeClassified;
        }
        field(5;"Default Rating Scale";Code[30])
        {
            DataClassification = ToBeClassified;
        }
        field(6;"Option Code";Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Closed Qn Response Option"."Option Code";

            trigger OnValidate()
            begin
                ClosedQnResponseOption.Reset;
                ClosedQnResponseOption.SetRange("Option Code","Option Code");
                if ClosedQnResponseOption.FindFirst then begin
                  Description:=ClosedQnResponseOption.Description;
                  "Default Points":=ClosedQnResponseOption."Default Points";
                end
            end;
        }
        field(7;Description;Text[300])
        {
            DataClassification = ToBeClassified;
        }
        field(8;"Default Points";Decimal)
        {
            DataClassification = ToBeClassified;
        }
    }

    keys
    {
        key(Key1;"Template Type","Template ID","Question Category","Question ID","Option Code")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }

    var
        ClosedQnResponseOption: Record "Closed Qn Response Option";
}

