#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Page 70007 "Procurement Plan Listing"
{
    DeleteAllowed = false;
    Editable = false;
    PageType = List;
    SourceTable = "Procurement Plan 1";
    ApplicationArea = All;

    layout
    {
        area(content)
        {
            repeater(Control1000000000)
            {
                field("Plan Item No"; Rec."Plan Item No")
                {
                    ApplicationArea = Basic;
                }
                field("Procurement Type"; Rec."Procurement Type")
                {
                    ApplicationArea = Basic;
                }
                field("Item Description"; Rec."Item Description")
                {
                    ApplicationArea = Basic;
                }
                field(Quantity; Rec.Quantity)
                {
                    ApplicationArea = Basic;
                }
                field("Unit of Measure"; Rec."Unit of Measure")
                {
                    ApplicationArea = Basic;
                }
                field("Unit Cost"; Rec."Unit Cost")
                {
                    ApplicationArea = Basic;
                }
                field("Estimated Cost"; Rec."Estimated Cost")
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
