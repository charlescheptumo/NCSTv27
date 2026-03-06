#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
PageExtension 50010 pageextension50010 extends "Item Card"
{

    //Unsupported feature: Property Insertion (DeleteAllowed) on ""Item Card"(Page 30)".

    layout
    {

        //Unsupported feature: Property Deletion (Visible) on ""No."(Control 2)".

        addafter("No.")
        {
            field("No. 2"; Rec."No. 2")
            {
                ApplicationArea = Basic;
                Caption = 'EABL No.';
                Visible = false;
            }
        }
        addafter("Cost is Posted to G/L")
        {
            field("Vote Item"; Rec."Vote Item")
            {
                ApplicationArea = Basic;
            }
        }
    }
}
