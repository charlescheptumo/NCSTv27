#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
TableExtension 50039 tableextension50039 extends "Profile Questionnaire Line"
{
    fields
    {

        //Unsupported feature: Property Modification (OptionString) on "Type(Field 3)".


        //Unsupported feature: Code Modification on "Type(Field 3).OnValidate".

        //trigger OnValidate()
        //Parameters and return type have not been exported.
        //>>>> ORIGINAL CODE:
        //begin
        /*
        CASE Type OF
          Type::Question:
            BEGIN
              CALCFIELDS("No. of Contacts");
              TESTFIELD("No. of Contacts",0);
              TESTFIELD("From Value",0);
              TESTFIELD("To Value",0);
            END;
          Type::Answer:
            BEGIN
              TESTFIELD("Multiple Answers",FALSE);
              TESTFIELD("Auto Contact Classification",FALSE);
        #13..19
              TESTFIELD("No. of Decimals",0);
            END;
        END;
        */
        //end;
        //>>>> MODIFIED CODE:
        //begin
        /*
        CASE Type OF
          Type::" ":
        #3..8
          Type::Question:
        #10..22
        */
        //end;


        //Unsupported feature: Code Modification on ""Multiple Answers"(Field 5).OnValidate".

        //trigger OnValidate()
        //Parameters and return type have not been exported.
        //>>>> ORIGINAL CODE:
        //begin
        /*
        IF "Multiple Answers" THEN
          TESTFIELD(Type,Type::Question);
        */
        //end;
        //>>>> MODIFIED CODE:
        //begin
        /*
        IF "Multiple Answers" THEN
          TESTFIELD(Type,Type::" ");
        */
        //end;


        //Unsupported feature: Code Modification on ""Auto Contact Classification"(Field 6).OnValidate".

        //trigger OnValidate()
        //Parameters and return type have not been exported.
        //>>>> ORIGINAL CODE:
        //begin
        /*
        IF "Auto Contact Classification" THEN
          TESTFIELD(Type,Type::Question)
        ELSE BEGIN
          TESTFIELD("Customer Class. Field","Customer Class. Field"::" ");
          TESTFIELD("Vendor Class. Field","Vendor Class. Field"::" ");
        #6..8
          TESTFIELD("Classification Method","Classification Method"::" ");
          TESTFIELD("Sorting Method","Sorting Method"::" ");
        END;
        */
        //end;
        //>>>> MODIFIED CODE:
        //begin
        /*
        IF "Auto Contact Classification" THEN
          TESTFIELD(Type,Type::" ")
        #3..11
        */
        //end;


        //Unsupported feature: Code Modification on ""Customer Class. Field"(Field 7).OnValidate".

        //trigger  Field"(Field 7)()
        //Parameters and return type have not been exported.
        //>>>> ORIGINAL CODE:
        //begin
        /*
        IF "Customer Class. Field" <> "Customer Class. Field"::" " THEN BEGIN
          TESTFIELD(Type,Type::Question);
          CLEAR("Vendor Class. Field");
          CLEAR("Contact Class. Field");
          IF "Classification Method" = "Classification Method"::" " THEN
            "Classification Method" := "Classification Method"::"Defined Value";
        END ELSE
          ResetFields;
        */
        //end;
        //>>>> MODIFIED CODE:
        //begin
        /*
        IF "Customer Class. Field" <> "Customer Class. Field"::" " THEN BEGIN
          TESTFIELD(Type,Type::" ");
        #3..8
        */
        //end;


        //Unsupported feature: Code Modification on ""Vendor Class. Field"(Field 8).OnValidate".

        //trigger  Field"(Field 8)()
        //Parameters and return type have not been exported.
        //>>>> ORIGINAL CODE:
        //begin
        /*
        IF "Vendor Class. Field" <> "Vendor Class. Field"::" " THEN BEGIN
          TESTFIELD(Type,Type::Question);
          CLEAR("Customer Class. Field");
          CLEAR("Contact Class. Field");
          IF "Classification Method" = "Classification Method"::" " THEN
            "Classification Method" := "Classification Method"::"Defined Value";
        END ELSE
          ResetFields;
        */
        //end;
        //>>>> MODIFIED CODE:
        //begin
        /*
        IF "Vendor Class. Field" <> "Vendor Class. Field"::" " THEN BEGIN
          TESTFIELD(Type,Type::" ");
        #3..8
        */
        //end;


        //Unsupported feature: Code Modification on ""Contact Class. Field"(Field 9).OnValidate".

        //trigger  Field"(Field 9)()
        //Parameters and return type have not been exported.
        //>>>> ORIGINAL CODE:
        //begin
        /*
        IF xRec."Contact Class. Field" = "Contact Class. Field"::Rating THEN BEGIN
          Rating.SETRANGE("Profile Questionnaire Code","Profile Questionnaire Code");
          Rating.SETRANGE("Profile Questionnaire Line No.","Line No.");
        #4..8
        END;

        IF "Contact Class. Field" <> "Contact Class. Field"::" " THEN BEGIN
          TESTFIELD(Type,Type::Question);
          CLEAR("Customer Class. Field");
          CLEAR("Vendor Class. Field");
          IF ("Classification Method" = "Classification Method"::" ") OR
        #16..23
          END;
        END ELSE
          ResetFields;
        */
        //end;
        //>>>> MODIFIED CODE:
        //begin
        /*
        #1..11
          TESTFIELD(Type,Type::" ");
        #13..26
        */
        //end;


        //Unsupported feature: Code Modification on ""Starting Date Formula"(Field 10).OnValidate".

        //trigger OnValidate()
        //Parameters and return type have not been exported.
        //>>>> ORIGINAL CODE:
        //begin
        /*
        IF FORMAT("Starting Date Formula") <> '' THEN
          TESTFIELD(Type,Type::Question);
        */
        //end;
        //>>>> MODIFIED CODE:
        //begin
        /*
        IF FORMAT("Starting Date Formula") <> '' THEN
          TESTFIELD(Type,Type::" ");
        */
        //end;


        //Unsupported feature: Code Modification on ""Ending Date Formula"(Field 11).OnValidate".

        //trigger OnValidate()
        //Parameters and return type have not been exported.
        //>>>> ORIGINAL CODE:
        //begin
        /*
        IF FORMAT("Ending Date Formula") <> '' THEN
          TESTFIELD(Type,Type::Question);
        */
        //end;
        //>>>> MODIFIED CODE:
        //begin
        /*
        IF FORMAT("Ending Date Formula") <> '' THEN
          TESTFIELD(Type,Type::" ");
        */
        //end;


        //Unsupported feature: Code Modification on ""Classification Method"(Field 12).OnValidate".

        //trigger OnValidate()
        //Parameters and return type have not been exported.
        //>>>> ORIGINAL CODE:
        //begin
        /*
        IF "Classification Method" <> "Classification Method"::" " THEN BEGIN
          TESTFIELD(Type,Type::Question);
          IF "Classification Method" <> "Classification Method"::"Defined Value" THEN
            "Sorting Method" := ProfileQuestnLine."Sorting Method"::Descending
          ELSE
            "Sorting Method" := ProfileQuestnLine."Sorting Method"::" ";
        END ELSE
          "Sorting Method" := ProfileQuestnLine."Sorting Method"::" ";
        */
        //end;
        //>>>> MODIFIED CODE:
        //begin
        /*
        IF "Classification Method" <> "Classification Method"::" " THEN BEGIN
          TESTFIELD(Type,Type::" ");
        #3..8
        */
        //end;


        //Unsupported feature: Code Modification on ""Sorting Method"(Field 13).OnValidate".

        //trigger OnValidate()
        //Parameters and return type have not been exported.
        //>>>> ORIGINAL CODE:
        //begin
        /*
        IF "Sorting Method" <> "Sorting Method"::" " THEN
          TESTFIELD(Type,Type::Question);
        */
        //end;
        //>>>> MODIFIED CODE:
        //begin
        /*
        IF "Sorting Method" <> "Sorting Method"::" " THEN
          TESTFIELD(Type,Type::" ");
        */
        //end;


        //Unsupported feature: Code Modification on ""From Value"(Field 14).OnValidate".

        //trigger OnValidate()
        //Parameters and return type have not been exported.
        //>>>> ORIGINAL CODE:
        //begin
        /*
        IF "From Value" <> 0 THEN
          TESTFIELD(Type,Type::Answer);
        */
        //end;
        //>>>> MODIFIED CODE:
        //begin
        /*
        IF "From Value" <> 0 THEN
          TESTFIELD(Type,Type::Question);
        */
        //end;


        //Unsupported feature: Code Modification on ""To Value"(Field 15).OnValidate".

        //trigger OnValidate()
        //Parameters and return type have not been exported.
        //>>>> ORIGINAL CODE:
        //begin
        /*
        IF "To Value" <> 0 THEN
          TESTFIELD(Type,Type::Answer);
        */
        //end;
        //>>>> MODIFIED CODE:
        //begin
        /*
        IF "To Value" <> 0 THEN
          TESTFIELD(Type,Type::Question);
        */
        //end;


        //Unsupported feature: Code Modification on "Priority(Field 17).OnValidate".

        //trigger OnValidate()
        //Parameters and return type have not been exported.
        //>>>> ORIGINAL CODE:
        //begin
        /*
        TESTFIELD(Type,Type::Answer);
        ContProfileAnswer.SETCURRENTKEY("Profile Questionnaire Code","Line No.");
        ContProfileAnswer.SETRANGE("Profile Questionnaire Code","Profile Questionnaire Code");
        ContProfileAnswer.SETRANGE("Line No.","Line No.");
        ContProfileAnswer.MODIFYALL("Answer Priority",Priority);
        MODIFY;
        */
        //end;
        //>>>> MODIFIED CODE:
        //begin
        /*
        TESTFIELD(Type,Type::Question);
        #2..6
        */
        //end;


        //Unsupported feature: Code Modification on ""No. of Decimals"(Field 18).OnValidate".

        //trigger  of Decimals"(Field 18)()
        //Parameters and return type have not been exported.
        //>>>> ORIGINAL CODE:
        //begin
        /*
        IF "No. of Decimals" <> 0 THEN
          TESTFIELD(Type,Type::Question);
        */
        //end;
        //>>>> MODIFIED CODE:
        //begin
        /*
        IF "No. of Decimals" <> 0 THEN
          TESTFIELD(Type,Type::" ");
        */
        //end;


        //Unsupported feature: Code Modification on ""Min. % Questions Answered"(Field 19).OnValidate".

        //trigger  % Questions Answered"(Field 19)()
        //Parameters and return type have not been exported.
        //>>>> ORIGINAL CODE:
        //begin
        /*
        IF "Min. % Questions Answered" <> 0 THEN BEGIN
          TESTFIELD(Type,Type::Question);
          TESTFIELD("Contact Class. Field","Contact Class. Field"::Rating);
        END;
        */
        //end;
        //>>>> MODIFIED CODE:
        //begin
        /*
        IF "Min. % Questions Answered" <> 0 THEN BEGIN
          TESTFIELD(Type,Type::" ");
          TESTFIELD("Contact Class. Field","Contact Class. Field"::Rating);
        END;
        */
        //end;


        //Unsupported feature: Code Modification on ""Wizard From Value"(Field 9505).OnValidate".

        //trigger OnValidate()
        //Parameters and return type have not been exported.
        //>>>> ORIGINAL CODE:
        //begin
        /*
        IF "From Value" <> 0 THEN
          TESTFIELD(Type,Type::Answer);
        */
        //end;
        //>>>> MODIFIED CODE:
        //begin
        /*
        IF "From Value" <> 0 THEN
          TESTFIELD(Type,Type::Question);
        */
        //end;


        //Unsupported feature: Code Modification on ""Wizard To Value"(Field 9506).OnValidate".

        //trigger OnValidate()
        //Parameters and return type have not been exported.
        //>>>> ORIGINAL CODE:
        //begin
        /*
        IF "To Value" <> 0 THEN
          TESTFIELD(Type,Type::Answer);
        */
        //end;
        //>>>> MODIFIED CODE:
        //begin
        /*
        IF "To Value" <> 0 THEN
          TESTFIELD(Type,Type::Question);
        */
        //end;


        //Unsupported feature: Code Modification on ""Wizard From Line No."(Field 9707).OnValidate".

        //trigger "(Field 9707)()
        //Parameters and return type have not been exported.
        //>>>> ORIGINAL CODE:
        //begin
        /*
        IF "To Value" <> 0 THEN
          TESTFIELD(Type,Type::Answer);
        */
        //end;
        //>>>> MODIFIED CODE:
        //begin
        /*
        IF "To Value" <> 0 THEN
          TESTFIELD(Type,Type::Question);
        */
        //end;
    }


    //Unsupported feature: Code Modification on "OnDelete".

    //trigger OnDelete()
    //>>>> ORIGINAL CODE:
    //begin
    /*
    CALCFIELDS("No. of Contacts");
    TESTFIELD("No. of Contacts",0);

    #4..11
    IF NOT Rating.ISEMPTY THEN
      ERROR(Text003);

    IF Type = Type::Question THEN BEGIN
      ProfileQuestionnaireLine.GET("Profile Questionnaire Code","Line No.");
      IF (ProfileQuestionnaireLine.NEXT <> 0) AND
         (ProfileQuestionnaireLine.Type = ProfileQuestnLine.Type::Answer)
      THEN
        ERROR(Text004);
    END;
    */
    //end;
    //>>>> MODIFIED CODE:
    //begin
    /*
    #1..14
    IF Type = Type::" " THEN BEGIN
      ProfileQuestionnaireLine.GET("Profile Questionnaire Code","Line No.");
      IF (ProfileQuestionnaireLine.NEXT <> 0) AND
         (ProfileQuestionnaireLine.Type = ProfileQuestnLine.Type::Question)
    #19..21
    */
    //end;


    //Unsupported feature: Code Modification on "MoveUp(PROCEDURE 1)".

    //procedure MoveUp();
    //Parameters and return type have not been exported.
    //>>>> ORIGINAL CODE:
    //begin
    /*
    TESTFIELD(Type,Type::Answer);
    UpperProfileQuestnLine.SETRANGE("Profile Questionnaire Code","Profile Questionnaire Code");
    LineNo := "Line No.";
    UpperProfileQuestnLine.GET("Profile Questionnaire Code","Line No.");

    IF UpperProfileQuestnLine.FIND('<') AND
       (UpperProfileQuestnLine.Type = UpperProfileQuestnLine.Type::Answer)
    THEN BEGIN
      UpperRecLineNo := UpperProfileQuestnLine."Line No.";
      RENAME("Profile Questionnaire Code",-1);
      UpperProfileQuestnLine.RENAME("Profile Questionnaire Code",LineNo);
      RENAME("Profile Questionnaire Code",UpperRecLineNo);
    END;
    */
    //end;
    //>>>> MODIFIED CODE:
    //begin
    /*
    TESTFIELD(Type,Type::Question);
    #2..6
       (UpperProfileQuestnLine.Type = UpperProfileQuestnLine.Type::Question)
    #8..13
    */
    //end;


    //Unsupported feature: Code Modification on "MoveDown(PROCEDURE 2)".

    //procedure MoveDown();
    //Parameters and return type have not been exported.
    //>>>> ORIGINAL CODE:
    //begin
    /*
    TESTFIELD(Type,Type::Answer);
    LowerProfileQuestnLine.SETRANGE("Profile Questionnaire Code","Profile Questionnaire Code");
    LineNo := "Line No.";
    LowerProfileQuestnLine.GET("Profile Questionnaire Code","Line No.");

    IF LowerProfileQuestnLine.FIND('>') AND
       (LowerProfileQuestnLine.Type = LowerProfileQuestnLine.Type::Answer)
    THEN BEGIN
      LowerRecLineNo := LowerProfileQuestnLine."Line No.";
      RENAME("Profile Questionnaire Code",-1);
      LowerProfileQuestnLine.RENAME("Profile Questionnaire Code",LineNo);
      RENAME("Profile Questionnaire Code",LowerRecLineNo);
    END;
    */
    //end;
    //>>>> MODIFIED CODE:
    //begin
    /*
    TESTFIELD(Type,Type::Question);
    #2..6
       (LowerProfileQuestnLine.Type = LowerProfileQuestnLine.Type::Question)
    #8..13
    */
    //end;


    //Unsupported feature: Code Modification on "Question(PROCEDURE 4)".

    //procedure Question();
    //Parameters and return type have not been exported.
    //>>>> ORIGINAL CODE:
    //begin
    /*
    ProfileQuestnLine.RESET;
    ProfileQuestnLine.SETRANGE("Profile Questionnaire Code","Profile Questionnaire Code");
    ProfileQuestnLine.SETFILTER("Line No.",'<%1',"Line No.");
    ProfileQuestnLine.SETRANGE(Type,Type::Question);
    IF ProfileQuestnLine.FINDLAST THEN
      EXIT(ProfileQuestnLine.Description);
    */
    //end;
    //>>>> MODIFIED CODE:
    //begin
    /*
    #1..3
    ProfileQuestnLine.SETRANGE(Type,Type::" ");
    IF ProfileQuestnLine.FINDLAST THEN
      EXIT(ProfileQuestnLine.Description);
    */
    //end;


    //Unsupported feature: Code Modification on "FindQuestionLine(PROCEDURE 3)".

    //procedure FindQuestionLine();
    //Parameters and return type have not been exported.
    //>>>> ORIGINAL CODE:
    //begin
    /*
    ProfileQuestnLine.RESET;
    ProfileQuestnLine.SETRANGE("Profile Questionnaire Code","Profile Questionnaire Code");
    ProfileQuestnLine.SETFILTER("Line No.",'<%1',"Line No.");
    ProfileQuestnLine.SETRANGE(Type,Type::Question);
    IF ProfileQuestnLine.FINDLAST THEN
      EXIT(ProfileQuestnLine."Line No.");
    */
    //end;
    //>>>> MODIFIED CODE:
    //begin
    /*
    #1..3
    ProfileQuestnLine.SETRANGE(Type,Type::" ");
    IF ProfileQuestnLine.FINDLAST THEN
      EXIT(ProfileQuestnLine."Line No.");
    */
    //end;


    //Unsupported feature: Code Modification on "CreateAnswer(PROCEDURE 15)".

    //procedure CreateAnswer();
    //Parameters and return type have not been exported.
    //>>>> ORIGINAL CODE:
    //begin
    /*
    TempProfileQuestionnaireLine.INIT;
    TempProfileQuestionnaireLine."Line No." := (TempProfileQuestionnaireLine.COUNT + 1) * 10000;
    TempProfileQuestionnaireLine.Type := TempProfileQuestionnaireLine.Type::Answer;
    TempProfileQuestionnaireLine.Description := AnswerDescription;
    TempProfileQuestionnaireLine.INSERT;
    */
    //end;
    //>>>> MODIFIED CODE:
    //begin
    /*
    TempProfileQuestionnaireLine.INIT;
    TempProfileQuestionnaireLine."Line No." := (TempProfileQuestionnaireLine.COUNT + 1) * 10000;
    TempProfileQuestionnaireLine.Type := TempProfileQuestionnaireLine.Type::Question;
    TempProfileQuestionnaireLine.Description := AnswerDescription;
    TempProfileQuestionnaireLine.INSERT;
    */
    //end;
}
