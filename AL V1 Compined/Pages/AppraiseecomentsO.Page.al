#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Page 56238 "Appraisee comentsO"
{
    PageType = ListPart;
    SourceTable = "Appraisal Comments";
    SourceTableView = where(Type = filter(Appraisee));
    ApplicationArea = All;

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
                field(Comment; Rec.Comment)
                {
                    ApplicationArea = Basic;
                }
                field("Comment By"; Rec."Comment By")
                {
                    ApplicationArea = Basic;
                }
                field("Commment date"; Rec."Commment date")
                {
                    ApplicationArea = Basic;
                }
                field("Comment time"; Rec."Comment time")
                {
                    ApplicationArea = Basic;
                }
            }
        }
    }

    actions
    {
    }

    trigger OnInsertRecord(BelowxRec: Boolean): Boolean
    begin
        Rec.Type := Rec.Type::Appraisee;
        Rec."Comment By" := UserId;
        Rec."Comment time" := Time;
        Rec."Commment date" := Today;
        Rec."Overall Performance" := true;
    end;
}
