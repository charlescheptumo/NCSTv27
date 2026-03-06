#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Page 70049 Commitee
{
    ApplicationArea = Basic;
    PageType = Card;
    SourceTable = "Procurement Committee";
    UsageCategory = Tasks;

    layout
    {
        area(content)
        {
            repeater(Control1000000000)
            {
                field("Code"; Rec.Code)
                {
                    ApplicationArea = Basic;
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = Basic;
                }
                field("Minimum Members"; Rec."Minimum Members")
                {
                    ApplicationArea = Basic;
                }
                field("Process Type"; Rec."Process Type")
                {
                    ApplicationArea = Basic;
                }
                field("RFQ Same Openinng_ Evaluation"; Rec."RFQ Same Openinng_ Evaluation")
                {
                    ApplicationArea = Basic;
                }
                field("RFP Same Openinng_ Evaluation"; Rec."RFP Same Openinng_ Evaluation")
                {
                    ApplicationArea = Basic;
                }
                field("Tend Same Openinng_ Evaluation"; Rec."Tend Same Openinng_ Evaluation")
                {
                    ApplicationArea = Basic;
                }
                field("Evaluation Opening"; Rec."Evaluation Opening")
                {
                    ApplicationArea = Basic;
                }
                field("Evaluation Process"; Rec."Evaluation Process")
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
