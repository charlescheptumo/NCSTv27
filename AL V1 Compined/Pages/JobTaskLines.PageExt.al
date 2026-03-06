#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
PageExtension 50048 pageextension50048 extends "Job Task Lines"
{
    layout
    {

        //Unsupported feature: Property Insertion (Visible) on "Totaling(Control 34)".


        //Unsupported feature: Property Insertion (Visible) on ""Schedule (Total Price)"(Control 42)".


        //Unsupported feature: Property Insertion (Visible) on ""Usage (Total Price)"(Control 8)".


        //Unsupported feature: Property Insertion (Visible) on ""Contract (Total Cost)"(Control 12)".


        //Unsupported feature: Property Insertion (Visible) on ""Contract (Total Price)"(Control 47)".


        //Unsupported feature: Property Insertion (Visible) on ""Contract (Invoiced Cost)"(Control 37)".


        //Unsupported feature: Property Insertion (Visible) on ""Contract (Invoiced Price)"(Control 51)".


        //Unsupported feature: Property Insertion (Visible) on ""Remaining (Total Cost)"(Control 5)".


        //Unsupported feature: Property Insertion (Visible) on ""Remaining (Total Price)"(Control 71)".

        modify("EAC (Total Cost)")
        {
            Caption = 'Remaining Total';
        }
        moveafter("Usage (Total Price)"; "EAC (Total Cost)")
    }
}
