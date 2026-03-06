#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
PageExtension 50038 pageextension50038 extends "Bank Acc. Reconciliation"
{

    //Unsupported feature: Property Modification (PromotedActionCategoriesML) on ""Bank Acc. Reconciliation"(Page 379)".

    layout
    {

        //Unsupported feature: Property Deletion (ApplicationArea) on "Control1900383207(Control 1900383207)".


        //Unsupported feature: Property Deletion (ApplicationArea) on "Control1905767507(Control 1905767507)".

    }
    actions
    {

        //Unsupported feature: Property Insertion (Visible) on "ImportBankStatement(Action 3)".


        //Unsupported feature: Property Modification (PromotedCategory) on "Post(Action 17)".


        //Unsupported feature: Property Modification (PromotedCategory) on "PostAndPrint(Action 9)".

        addfirst("Ba&nk")
        {
            action("Import Bank Statement")
            {
                ApplicationArea = Basic;
                Image = Import;
                Promoted = true;
                PromotedCategory = Category4;
                PromotedIsBig = true;
                RunObject = Page "Config. Packages";
            }
        }
    }
}
