#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Page 70114 "Disposal Sub Page"
{
    PageType = ListPart;
    SourceTable = "Disposal Lines";
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
                field("Disposal Item No"; Rec."Disposal Item No")
                {
                    ApplicationArea = Basic;
                }
                field("Fixed Asset/Item No."; Rec."Fixed Asset/Item No.")
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
                field("Estimated current value"; Rec."Estimated current value")
                {
                    ApplicationArea = Basic;
                }
                field("Description of Item"; Rec."Description of Item")
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
                field("FA Name"; Rec."FA Name")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field(Location; Rec.Location)
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    Visible = false;
                }
                field("Global Dimension 1 Code"; Rec."Global Dimension 1 Code")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Global Dimension 2 Code"; Rec."Global Dimension 2 Code")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
            }
        }
    }

    actions
    {
    }
}
