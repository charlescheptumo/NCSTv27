#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
PageExtension 50043 pageextension50043 extends "Purchase Lines"
{
    layout
    {
        addafter(Quantity)
        {
            field("VAT %"; Rec."VAT %")
            {
                ApplicationArea = Basic;
                Editable = true;
                Visible = true;
            }
        }
    }
}
