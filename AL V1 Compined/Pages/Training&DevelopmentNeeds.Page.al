#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Page 56211 "Training & Development Needs"
{
    PageType = ListPart;
    SourceTable = "Staff Training Appraisal";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Appraisal No"; Rec."Appraisal No")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Line No."; Rec."Line No.")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Training & Development Need"; Rec."Training & Development Need")
                {
                    ApplicationArea = Basic;
                    TableRelation = "Training Needs".Description;
                }
                field("Duration of training"; Rec."Duration of training")
                {
                    ApplicationArea = Basic;
                }
                field("Comments by Appraisee"; Rec."Comments by Appraisee")
                {
                    ApplicationArea = Basic;
                }
                field("Comments by supervisor"; Rec."Comments by supervisor")
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
