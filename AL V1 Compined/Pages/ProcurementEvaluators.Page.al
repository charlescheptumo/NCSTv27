#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Page 70083 "Procurement Evaluators"
{
    PageType = List;
    SourceTable = "Procurement Evaluators";
    ApplicationArea = All;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field(tenderno; Rec.tenderno)
                {
                    ApplicationArea = Basic;
                }
                field("Evaluator 1"; Rec."Evaluator 1")
                {
                    ApplicationArea = Basic;
                }
                field("Evaluator 2"; Rec."Evaluator 2")
                {
                    ApplicationArea = Basic;
                }
                field("Evaluator 3"; Rec."Evaluator 3")
                {
                    ApplicationArea = Basic;
                }
                field("Evaluator 4"; Rec."Evaluator 4")
                {
                    ApplicationArea = Basic;
                }
                field("Evaluator 5"; Rec."Evaluator 5")
                {
                    ApplicationArea = Basic;
                }
                field("Evaluator 6"; Rec."Evaluator 6")
                {
                    ApplicationArea = Basic;
                }
                field("Evaluator 7"; Rec."Evaluator 7")
                {
                    ApplicationArea = Basic;
                }
                field("Evaluator 8"; Rec."Evaluator 8")
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
