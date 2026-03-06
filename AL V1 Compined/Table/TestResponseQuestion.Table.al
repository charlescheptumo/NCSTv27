#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Table 69705 "Test Response Question"
{

    fields
    {
        field(1;"Response ID";Code[30])
        {
            DataClassification = ToBeClassified;
        }
        field(2;"Test ID";Code[50])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Ability Test";
        }
        field(3;"Question ID";Code[50])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Ability Test Question" where ("Test ID"=field("Test ID"));

            trigger OnValidate()
            begin
                AbilityTestQuestion.Reset;
                AbilityTestQuestion.SetRange("Question ID","Question ID");
                if AbilityTestQuestion.FindFirst then begin
                  Question:=AbilityTestQuestion.Question;
                end
            end;
        }
        field(4;Question;Text[2000])
        {
            DataClassification = ToBeClassified;
        }
        field(5;"Selected Answer";Code[30])
        {
            DataClassification = ToBeClassified;
        }
        field(6;"Pass/Fail";Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = ' ,PASS,FAIL';
            OptionMembers = " ",PASS,FAIL;
        }
    }

    keys
    {
        key(Key1;"Response ID","Test ID","Question ID")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }

    var
        AbilityTestQuestion: Record "Ability Test Question";
}

