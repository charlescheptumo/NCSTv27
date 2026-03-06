#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Page 70075 "Technica Evaluation Checklist"
{
    PageType = List;
    SourceTable = "RFQ Evaluation Lists";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("RFP No."; Rec."RFP No.")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field("Evaluation Type"; Rec."Evaluation Type")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field("Line No"; Rec."Line No")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = Basic;
                }
                field(Score; Rec.Score)
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field("Maximum Score"; Rec."Maximum Score")
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
        Rec."Evaluation Type" := Rec."evaluation type"::Technical;
    end;
}
