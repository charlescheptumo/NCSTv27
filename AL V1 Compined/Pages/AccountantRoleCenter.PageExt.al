#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
PageExtension 50069 pageextension50069 extends "Accountant Role Center"
{
    layout
    {

        //Unsupported feature: Property Insertion (Visible) on "Control122(Control 122)".

    }
    actions
    {
        addafter("Dimensions")
        {
            action(" Employee PGroups")
            {
                ApplicationArea = Basic;
                RunObject = Page "Employee PGroups";
            }
        }
        addafter("Bank Account Posting Groups")
        {
            action("Member Ledger Entries")
            {
                ApplicationArea = Basic;
                RunObject = Page "Vendor Ledger Entries";
                RunPageView = where("Vendor Posting Group" = const('DIRECTOR'));
            }
        }
    }
}
