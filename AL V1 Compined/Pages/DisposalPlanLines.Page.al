#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Page 70109 "Disposal Plan Lines"
{
    PageType = ListPart;
    SourceTable = "Disposal Plan Lines";
    ApplicationArea = All;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field(Type; Rec.Type)
                {
                    ApplicationArea = Basic;
                }
                field("Item No."; Rec."Item No.")
                {
                    ApplicationArea = Basic;
                }
                field("Description of Item"; Rec."Description of Item")
                {
                    ApplicationArea = Basic;
                }
                field("Unit of Issue"; Rec."Unit of Issue")
                {
                    ApplicationArea = Basic;
                }
                field(Quantity; Rec.Quantity)
                {
                    ApplicationArea = Basic;
                }
                field("Date Of Purchase"; Rec."Date Of Purchase")
                {
                    ApplicationArea = Basic;
                }
                field("Purchase Unit Price"; Rec."Purchase Unit Price")
                {
                    ApplicationArea = Basic;
                }
                field("Total Purchase Price"; Rec."Total Purchase Price")
                {
                    ApplicationArea = Basic;
                }
                field("General Condition"; Rec."General Condition")
                {
                    ApplicationArea = Basic;
                }
                field("Disposal committee Recommend"; Rec."Disposal committee Recommend")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field("Estimated current value"; Rec."Estimated current value")
                {
                    ApplicationArea = Basic;
                }
                field("Accounting Officer Decision"; Rec."Accounting Officer Decision")
                {
                    ApplicationArea = Basic;
                }
                field("Disposal Type"; Rec."Disposal Type")
                {
                    ApplicationArea = Basic;
                    Caption = 'Disposal Method';
                }
                field("Disposal Methods"; Rec."Disposal Methods")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
            }
        }
    }

    actions
    {
    }
}
