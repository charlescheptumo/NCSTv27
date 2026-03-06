#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
PageExtension 50074 pageextension50074 extends "Purchase Order List"
{
    actions
    {

        //Unsupported feature: Code Modification on "Print(Action 55).OnAction".

        //trigger OnAction()
        //Parameters and return type have not been exported.
        //>>>> ORIGINAL CODE:
        //begin
        /*
        PurchaseHeader := Rec;
        CurrPage.SETSELECTIONFILTER(PurchaseHeader);
        PurchaseHeader.PrintRecords(TRUE);
        */
        //end;
        //>>>> MODIFIED CODE:
        //begin
        /*
        {PurchaseHeader := Rec;
        CurrPage.SETSELECTIONFILTER(PurchaseHeader);
        PurchaseHeader.PrintRecords(TRUE);}

        IF "Order types" = "Order types"::LPO THEN BEGIN
        RESET;
        SETFILTER("No.","No.");
        REPORT.RUN(70033,TRUE,FALSE,Rec);
        END;

        IF "Order types" = "Order types"::LSO THEN BEGIN
        RESET;
        SETFILTER("No.","No.");
        REPORT.RUN(70029,TRUE,FALSE,Rec);
        END;
        */
        //end;
    }
}
