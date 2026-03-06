#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
PageExtension 50009 pageextension50009 extends "Vendor List"
{

    //Unsupported feature: Property Insertion (DeleteAllowed) on ""Vendor List"(Page 27)".

    layout
    {

        //Unsupported feature: Property Insertion (Visible) on ""Responsibility Center"(Control 41)".


        //Unsupported feature: Property Insertion (Visible) on ""Location Code"(Control 59)".

        modify("Vendor Posting Group")
        {
            Editable = false;
        }
        modify("Gen. Bus. Posting Group")
        {
            Editable = false;
        }

        //Unsupported feature: Property Insertion (Visible) on ""Search Name"(Control 12)".


        //Unsupported feature: Property Insertion (Visible) on ""Balance (LCY)"(Control 32)".


        //Unsupported feature: Property Insertion (Visible) on ""Balance Due (LCY)"(Control 34)".


        //Unsupported feature: Property Insertion (Visible) on ""Payments (LCY)"(Control 61)".


        //Unsupported feature: Property Deletion (Visible) on ""Vendor Posting Group"(Control 39)".


        //Unsupported feature: Property Deletion (Visible) on ""Gen. Bus. Posting Group"(Control 51)".

        addafter("Balance Due (LCY)")
        {
            field("onboarded Year"; Rec."onboarded Year")
            {
                ApplicationArea = Basic;
            }
        }
        moveafter(Name; "Balance (LCY)")
        moveafter("Balance Due (LCY)"; "Vendor Posting Group")
    }
    actions
    {

        //Unsupported feature: Property Modification (RunPageLink) on "PayVendor(Action 60)".

    }
}
