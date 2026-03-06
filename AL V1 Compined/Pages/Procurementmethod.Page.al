#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Page 70008 "Procurement method"
{
    ApplicationArea = Basic;
    PageType = Card;
    SourceTable = "Procurement Method";
    UsageCategory = Administration;

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
                field("Process Type"; Rec."Process Type")
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
