#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
PageExtension 50020 pageextension50020 extends "Purch. Invoice Subform"
{
    layout
    {

        //Unsupported feature: Property Insertion (Visible) on ""Location Code"(Control 58)".


        //Unsupported feature: Property Insertion (Visible) on ""Line Discount %"(Control 16)".


        //Unsupported feature: Property Insertion (Visible) on ""Line Amount"(Control 52)".


        //Unsupported feature: Property Insertion (Visible) on ""Qty. to Assign"(Control 44)".


        //Unsupported feature: Property Insertion (Visible) on ""Qty. Assigned"(Control 42)".


        //Unsupported feature: Property Deletion (Visible) on ""Job No."(Control 38)".


        //Unsupported feature: Property Deletion (Visible) on ""Job Task No."(Control 90)".

        modify("Job Unit Price")
        {
            Visible = false;
        }
        modify("Job Total Price")
        {
            Visible = false;
        }
        modify("Job Unit Price (LCY)")
        {
            Visible = false;
        }
        modify("Job Total Price (LCY)")
        {
            Visible = false;
        }

        //Unsupported feature: Property Deletion (Visible) on ""Shortcut Dimension 1 Code"(Control 62)".


        //Unsupported feature: Property Deletion (Visible) on ""Shortcut Dimension 2 Code"(Control 60)".


        //Unsupported feature: Property Deletion (Visible) on "ShortcutDimCode3(Control 300)".


        //Unsupported feature: Property Deletion (Visible) on "ShortcutDimCode4(Control 302)".

        addafter("IC Partner Reference")
        {
            field("Gen. Prod. Posting Groups"; Rec."Gen. Prod. Posting Group")
            {
                ApplicationArea = Basic;
                Visible = false;
            }
        }
        addafter(Description)
        {
            field(Comment; Rec.Comment)
            {
                ApplicationArea = Basic;
                Caption = 'Specifications';
            }
            field(Specifications; Rec.Specifications)
            {
                ApplicationArea = Basic;
                Visible = false;
            }
        }
        addafter("Unit Cost (LCY)")
        {
            field("VAT Identifier"; Rec."VAT Identifier")
            {
                ApplicationArea = Basic;
                Editable = true;
            }
            field("VAT %"; Rec."VAT %")
            {
                ApplicationArea = Basic;
                Editable = true;
            }
        }
        addafter("Line Discount %")
        {
            field(Amount; Rec.Amount)
            {
                ApplicationArea = Basic;
            }
        }
        addafter("Line Amount")
        {
            field("Amount Including VAT"; Rec."Amount Including VAT")
            {
                ApplicationArea = Basic;
            }
        }
        addafter("Qty. Assigned")
        {
            field("Directorate Code"; Rec."Directorate Code")
            {
                ApplicationArea = Basic;
            }
            field("Department Code"; Rec."Department Code")
            {
                ApplicationArea = Basic;
            }
        }
    }
}
