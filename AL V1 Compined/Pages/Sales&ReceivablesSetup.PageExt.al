#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
PageExtension 50040 pageextension50040 extends "Sales & Receivables Setup"
{
    layout
    {
        addafter("Posted Prepmt. Cr. Memo Nos.")
        {
            field("ICT Helpdesk Nos."; Rec."ICT Helpdesk Nos.")
            {
                ApplicationArea = Basic;
            }
        }
        addafter("Direct Debit Mandate Nos.")
        {
            field("Disposal No."; Rec."Disposal No.")
            {
                ApplicationArea = Basic;
            }
        }
    }
}
