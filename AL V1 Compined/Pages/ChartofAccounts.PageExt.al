#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
PageExtension 50003 pageextension50003 extends "Chart of Accounts"
{

    //Unsupported feature: Property Insertion (DeleteAllowed) on ""Chart of Accounts"(Page 16)".

    layout
    {

        //Unsupported feature: Property Modification (Visible) on ""Account Category"(Control 9)".

        modify("Account Subcategory Descript.")
        {
            Editable = true;
        }
        addafter("Account Category")
        {
            field("Account Subcategory Entry No."; Rec."Account Subcategory Entry No.")
            {
                ApplicationArea = Basic;
            }
        }
    }
}
