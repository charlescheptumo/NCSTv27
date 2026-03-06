#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
PageExtension 50033 pageextension50033 extends "Posted Purchase Receipts"
{
    actions
    {

        //Unsupported feature: Code Modification on ""&Print"(Action 9).OnAction".

        //trigger OnAction()
        //Parameters and return type have not been exported.
        //>>>> ORIGINAL CODE:
        //begin
        /*
        CurrPage.SETSELECTIONFILTER(PurchRcptHeader);
        PurchRcptHeader.PrintRecords(TRUE);
        */
        //end;
        //>>>> MODIFIED CODE:
        //begin
        /*
        {CurrPage.SETSELECTIONFILTER(PurchRcptHeader);
        PurchRcptHeader.PrintRecords(TRUE);}


        RESET;
        SETFILTER("No.", "No.");
        REPORT.RUN(70010,TRUE,FALSE,Rec);
        */
        //end;
    }
}
