#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Page 70057 "Inspection Lines"
{
    PageType = ListPart;
    SourceTable = "Inspection Lines1";
    ApplicationArea = All;

    layout
    {
        area(content)
        {
            repeater(Control1000000000)
            {
                field(Description; Rec.Description)
                {
                    ApplicationArea = Basic;
                }
                field("Unit of Measure"; Rec."Unit of Measure")
                {
                    ApplicationArea = Basic;
                }
                field("Quantity Ordered"; Rec."Quantity Ordered")
                {
                    ApplicationArea = Basic;
                }
                field("Quantity Received"; Rec."Quantity Received")
                {
                    ApplicationArea = Basic;
                }
                field("Inspection Decision"; Rec."Inspection Decision")
                {
                    ApplicationArea = Basic;
                }
                field("Reasons for Rejection"; Rec."Reasons for Rejection")
                {
                    ApplicationArea = Basic;
                }
                field("Rejected Quantity"; Rec."Rejected Quantity")
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
