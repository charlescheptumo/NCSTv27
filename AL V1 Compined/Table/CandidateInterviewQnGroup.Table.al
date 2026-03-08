#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Table 69717 "Candidate Interview Qn Group"
{

    fields
    {
        field(1;"Document No.";Code[30])
        {
            DataClassification = ToBeClassified;
        }
        field(2;"Interview Scoresheet Template";Code[30])
        {
            DataClassification = ToBeClassified;
        }
        field(3;"Question Category";Code[30])
        {
            DataClassification = ToBeClassified;
        }
        field(4;Description;Text[300])
        {
            DataClassification = ToBeClassified;
        }
        field(5;"Total Weight";Decimal)
        {
            CalcFormula = sum("Candidate Interview Question".Weight where ("Document No."=field("Document No.")));
            FieldClass = FlowField;
        }
        field(6;"No. of Questions";Integer)
        {
            CalcFormula = count("Candidate Interview Question" where ("Document No."=field("Document No.")));
            FieldClass = FlowField;
        }
    }

    keys
    {
        key(Key1;"Document No.","Interview Scoresheet Template","Question Category")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

