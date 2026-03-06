#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
PageExtension 50019 pageextension50019 extends "Purchase Order Subform"
{
    layout
    {

        //Unsupported feature: Property Modification (Visible) on ""VAT Prod. Posting Group"(Control 14)".

        modify(Description)
        {
            Caption = 'Vote Item';
        }

        //Unsupported feature: Property Insertion (Visible) on ""Location Code"(Control 74)".


        //Unsupported feature: Property Modification (SourceExpr) on ""Reserved Quantity"(Control 42)".


        //Unsupported feature: Property Modification (Name) on ""Reserved Quantity"(Control 42)".


        //Unsupported feature: Property Insertion (Visible) on ""Reserved Quantity"(Control 42)".

        modify("Job Remaining Qty.")
        {
            ApplicationArea = Basic;

            //Unsupported feature: Property Modification (SourceExpr) on ""Job Remaining Qty."(Control 9)".


            //Unsupported feature: Property Modification (Name) on ""Job Remaining Qty."(Control 9)".

        }

        //Unsupported feature: Property Insertion (Visible) on ""Direct Unit Cost"(Control 12)".


        //Unsupported feature: Property Insertion (Visible) on ""Line Amount"(Control 44)".


        //Unsupported feature: Property Modification (Visible) on ""Job Task No."(Control 128)".


        //Unsupported feature: Property Modification (Visible) on "ShortcutDimCode4(Control 302)".


        //Unsupported feature: Property Modification (Visible) on "ShortcutDimCode5(Control 304)".


        //Unsupported feature: Property Deletion (BlankZero) on ""Reserved Quantity"(Control 42)".


        //Unsupported feature: Property Deletion (ToolTipML) on ""Job Remaining Qty."(Control 9)".


        //Unsupported feature: Property Deletion (BlankZero) on ""Job Remaining Qty."(Control 9)".


        //Unsupported feature: Property Deletion (Visible) on ""Job Remaining Qty."(Control 9)".


        //Unsupported feature: Property Deletion (Visible) on ""Job No."(Control 126)".


        //Unsupported feature: Property Deletion (Visible) on ""Shortcut Dimension 1 Code"(Control 78)".


        //Unsupported feature: Property Deletion (Visible) on "ShortcutDimCode3(Control 300)".

        addafter("Job No.")
        {
            field("Workplan Task No."; Rec."Workplan Task No.")
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
                Caption = 'Description';
            }
            field(Specifications; Rec.Specifications)
            {
                ApplicationArea = Basic;
            }
        }
        addafter("Unit Price (LCY)")
        {
            field("Direct Unit Cost Inc. VAT"; Rec."Direct Unit Cost Inc. VAT")
            {
                ApplicationArea = Basic;
            }
            field(Amount; Rec.Amount)
            {
                ApplicationArea = Basic;
            }
            field("Amount Including VAT"; Rec."Amount Including VAT")
            {
                ApplicationArea = Basic;
            }
            field("Directorate Code"; Rec."Directorate Code")
            {
                ApplicationArea = Basic;
            }
            field("Department Code"; Rec."Department Code")
            {
                ApplicationArea = Basic;
            }
        }
        addafter("Line Amount")
        {
            field("Procurement Plan"; Rec."Procurement Plan")
            {
                ApplicationArea = Basic;
            }
            field("Procurement Plan Item"; Rec."Procurement Plan Item")
            {
                ApplicationArea = Basic;
            }
        }
        addafter(ShortcutDimCode4)
        {
            field("Gen. Prod. Posting Groups"; Rec."Gen. Prod. Posting Group")
            {
                ApplicationArea = Basic;
            }
        }
        moveafter("IC Partner Ref. Type"; "Job No.")
        moveafter(Quantity; "Unit of Measure Code")
        moveafter("Unit Price (LCY)"; "Line Amount")
      //  moveafter("Available Funds"; "Line Discount %")
        moveafter("Line Discount %"; "Line Discount Amount")
        moveafter("Qty. Assigned"; "Job Planning Line No.")
    }
}
