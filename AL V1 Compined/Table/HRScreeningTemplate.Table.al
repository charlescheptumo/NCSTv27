#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Table 69686 "HR Screening Template"
{

    fields
    {
        field(1;"Template Type";Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = 'Application Submission,Phone Pre-Screening Interview,Interview Scoresheet';
            OptionMembers = "Application Submission","Phone Pre-Screening Interview","Interview Scoresheet";
        }
        field(2;"Code";Code[30])
        {
            DataClassification = ToBeClassified;
        }
        field(3;Description;Text[150])
        {
            DataClassification = ToBeClassified;
        }
        field(4;"Effective Date";Date)
        {
            DataClassification = ToBeClassified;
        }
        field(5;"No. of Questions";Integer)
        {
            CalcFormula = count("Hr Screening Template Line" where ("Template ID"=field(Code)));
            Editable = false;
            FieldClass = FlowField;
        }
        field(6;"Total Weight";Decimal)
        {
            CalcFormula = sum("Hr Screening Template Line".Weight where ("Template ID"=field(Code)));
            Editable = false;
            FieldClass = FlowField;
        }
        field(7;"Created By";Code[30])
        {
            DataClassification = ToBeClassified;
        }
        field(8;"Created On";Date)
        {
            DataClassification = ToBeClassified;
        }
        field(9;"Created Time";Time)
        {
            DataClassification = ToBeClassified;
        }
        field(10;Blocked;Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(11;"No. Series";Code[30])
        {
            DataClassification = ToBeClassified;
        }
    }

    keys
    {
        key(Key1;"Template Type","Code")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }

    trigger OnInsert()
    begin
        //muga
        //     HRSetup.Get;
        //     if "Template Type"="template type"::"Application Submission" then begin
        //         HRSetup.TestField("Phone Template Nos.");
        //       if Code='' then
        //       NoSeriesMgt.InitSeries(HRSetup."Phone Template Nos.",xRec."No. Series",0D,Code,"No. Series");
        //   end;
        //    if "Template Type"="template type"::"Phone Pre-Screening Interview" then begin
        //         HRSetup.TestField("Applicant Template Nos.");
        //       if Code='' then
        //       NoSeriesMgt.InitSeries(HRSetup."Applicant Template Nos.",xRec."No. Series",0D,Code,"No. Series");
        //   end;
        //      if "Template Type"="template type"::"Interview Scoresheet" then begin
        //         HRSetup.TestField("Scoresheet Template Nos.");
        //       if Code='' then
        //       NoSeriesMgt.InitSeries(HRSetup."Scoresheet Template Nos.",xRec."No. Series",0D,Code,"No. Series");
        //   end;
        "Created By":=UserId;
        "Created On":=Today;
        "Created Time":=Time;
    end;

    var
        HRSetup: Record "Human Resources Setup";
        NoSeriesMgt: Codeunit "No. Series";
}

