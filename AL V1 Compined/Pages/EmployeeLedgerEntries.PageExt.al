#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
PageExtension 50059 pageextension50059 extends "Employee Ledger Entries"
{
    layout
    {

        //Unsupported feature: Property Deletion (Editable) on "Open(Control 16)".

        addafter("Entry No.")
        {
            field(Reversed; Rec.Reversed)
            {
                ApplicationArea = Basic;
            }
        }
    }
}
