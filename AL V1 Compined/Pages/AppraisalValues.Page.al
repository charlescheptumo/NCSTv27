#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Page 56216 "Appraisal Values"
{
    PageType = ListPart;
    SourceTable = "Values Appraisal";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Appraisal No"; Rec."Appraisal No")
                {
                    ApplicationArea = Basic;
                }
                field("Line No."; Rec."Line No.")
                {
                    ApplicationArea = Basic;
                }
                field("Code"; Rec.Code)
                {
                    ApplicationArea = Basic;
                }
                field("Competency/Skills"; Rec."Competency/Skills")
                {
                    ApplicationArea = Basic;
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = Basic;
                }
                field("Demonstrated application"; Rec."Demonstrated application")
                {
                    ApplicationArea = Basic;
                }
                field("Self Rating"; Rec."Self Rating")
                {
                    ApplicationArea = Basic;
                }
            }
        }
    }

    actions
    {
    }
}
