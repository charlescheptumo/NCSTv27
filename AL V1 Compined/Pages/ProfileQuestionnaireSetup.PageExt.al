#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
PageExtension 50053 pageextension50053 extends "Profile Questionnaire Setup"
{
    layout
    {
        modify("Auto Contact Classification")
        {
            Visible = false;
        }
        modify("From Value")
        {
            Visible = false;
        }
        modify("To Value")
        {
            Visible = false;
        }
        addafter(Description)
        {
            field("Customer Class. Field"; Rec."Customer Class. Field")
            {
                ApplicationArea = Basic;
            }
            field("Answer Option"; Rec."Answer Option")
            {
                ApplicationArea = Basic;
            }
        }
        addafter("Multiple Answers")
        {
            field("Answer Description"; Rec."Answer Description")
            {
                ApplicationArea = Basic;
            }
        }
    }
    actions
    {


        //Unsupported feature: Code Modification on ""Question Details"(Action 25).OnAction".

        //trigger OnAction()
        //Parameters and return type have not been exported.
        //>>>> ORIGINAL CODE:
        //begin
        /*
        CASE Type OF
          Type::Question:
            PAGE.RUNMODAL(PAGE::"Profile Question Details",Rec);
          Type::Answer:
            ERROR(Text000);
        END;
        */
        //end;
        //>>>> MODIFIED CODE:
        //begin
        /*
        CASE Type OF
          Type::" ":
            PAGE.RUNMODAL(PAGE::"Profile Question Details",Rec);
          Type::Question:
            ERROR(Text000);
        END;
        */
        //end;


        //Unsupported feature: Code Modification on ""Answer Where-Used"(Action 21).OnAction".

        //trigger OnAction()
        //Parameters and return type have not been exported.
        //>>>> ORIGINAL CODE:
        //begin
        /*
        CASE Type OF
          Type::Question:
            ERROR(Text001);
          Type::Answer:
            BEGIN
              Rating.SETRANGE("Rating Profile Quest. Code","Profile Questionnaire Code");
              Rating.SETRANGE("Rating Profile Quest. Line No.","Line No.");
              PAGE.RUNMODAL(PAGE::"Answer Where-Used",Rating);
            END;
        END;
        */
        //end;
        //>>>> MODIFIED CODE:
        //begin
        /*
        CASE Type OF
          Type::" ":
            ERROR(Text001);
          Type::Question:
        #5..10
        */
        //end;
    }


    //Unsupported feature: Code Modification on "OnAfterGetRecord".

    //trigger OnAfterGetRecord()
    //>>>> ORIGINAL CODE:
    //begin
    /*
    PriorityHideValue := FALSE;
    StyleIsStrong := FALSE;
    DescriptionIndent := 0;

    IF Type = Type::Question THEN BEGIN
      StyleIsStrong := TRUE;
      PriorityHideValue := TRUE;
    END ELSE
      DescriptionIndent := 1;
    */
    //end;
    //>>>> MODIFIED CODE:
    //begin
    /*
    #1..4
    IF Type = Type::" " THEN BEGIN
    #6..9
    */
    //end;


    //Unsupported feature: Code Modification on "OnNewRecord".

    //trigger OnNewRecord(BelowxRec: Boolean)
    //>>>> ORIGINAL CODE:
    //begin
    /*
    "Profile Questionnaire Code" := CurrentQuestionsChecklistCode;
    Type := Type::Answer;
    */
    //end;
    //>>>> MODIFIED CODE:
    //begin
    /*
    "Profile Questionnaire Code" := CurrentQuestionsChecklistCode;
    Type := Type::Question;
    */
    //end;
}
