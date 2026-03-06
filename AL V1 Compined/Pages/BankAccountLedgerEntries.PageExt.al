#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
PageExtension 50037 pageextension50037 extends "Bank Account Ledger Entries"
{
    layout
    {
        addafter("Bank Account No.")
        {
            field("External Document No."; Rec."External Document No.")
            {
                ApplicationArea = Basic;
            }
        }
    }
}
