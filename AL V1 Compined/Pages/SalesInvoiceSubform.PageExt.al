#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
PageExtension 50014 pageextension50014 extends "Sales Invoice Subform"
{
    layout
    {
        addafter("Document No.")
        {
            field("Gen. Bus. Posting Groups"; Rec."Gen. Bus. Posting Group")
            {
                ApplicationArea = Basic;
            }
            field("Gen. Prod. Posting Groups"; Rec."Gen. Prod. Posting Group")
            {
                ApplicationArea = Basic;
            }
        }
    }
}
