#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
PageExtension 50061 pageextension50061 extends "Responsibility Center Card"
{

    //Unsupported feature: Property Insertion (DeleteAllowed) on ""Responsibility Center Card"(Page 5714)".

    layout
    {
        modify(Address)
        {
            Caption = 'Postal Adress';
        }
        modify("Address 2")
        {
            Caption = 'Physical Address';
        }

        //Unsupported feature: Property Modification (Level) on "Contact(Control 14)".


        //Unsupported feature: Property Modification (ControlType) on "Contact(Control 14)".


        //Unsupported feature: Property Modification (Name) on "Contact(Control 14)".


        //Unsupported feature: Property Insertion (SubPageLink) on "Contact(Control 14)".


        //Unsupported feature: Property Insertion (PagePartID) on "Contact(Control 14)".


        //Unsupported feature: Property Insertion (PartType) on "Contact(Control 14)".


        //Unsupported feature: Property Insertion (Visible) on ""Fax No."(Control 26)".


        //Unsupported feature: Property Deletion (ToolTipML) on "Contact(Control 14)".


        //Unsupported feature: Property Deletion (ApplicationArea) on "Contact(Control 14)".


        //Unsupported feature: Property Deletion (SourceExpr) on "Contact(Control 14)".

        modify("Global Dimension 2 Code")
        {
            Visible = false;
        }
        addafter("Location Code")
        {
            field("Operating Unit Type"; Rec."Operating Unit Type")
            {
                ApplicationArea = Basic;
            }
            field("Direct Reports To"; Rec."Direct Reports To")
            {
                ApplicationArea = Basic;
            }
            field("Indirect Reports To"; Rec."Indirect Reports To")
            {
                ApplicationArea = Basic;
            }
            field("Hierarchical  Level ID"; Rec."Hierarchical  Level ID")
            {
                ApplicationArea = Basic;
            }
            field("Headed By (Title)"; Rec."Headed By (Title)")
            {
                ApplicationArea = Basic;
            }
            field("Current Head"; Rec."Current Head")
            {
                ApplicationArea = Basic;
            }
        }
        moveafter("Country/Region Code"; "Global Dimension 1 Code")
    }
}
