#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
PageExtension 50016 pageextension50016 extends "Purchase Invoice"
{

    //Unsupported feature: Property Insertion (DeleteAllowed) on ""Purchase Invoice"(Page 51)".

    layout
    {

        //Unsupported feature: Property Insertion (Visible) on ""Purchaser Code"(Control 10)".


        //Unsupported feature: Property Insertion (Visible) on ""Campaign No."(Control 1102601000)".


        //Unsupported feature: Property Insertion (Visible) on ""Order Address Code"(Control 84)".


        //Unsupported feature: Property Insertion (Visible) on ""Assigned User ID"(Control 65)".

        addafter("Posting Description")
        {
            field("Archive Document"; Rec."Archive Document")
            {
                ApplicationArea = Basic;
            }
        }
        addafter("Assigned User ID")
        {
            field("Request-By Name"; Rec."Request-By Name")
            {
                ApplicationArea = Basic;
            }
            field("Request-By No."; Rec."Request-By No.")
            {
                ApplicationArea = Basic;
                Visible = false;
            }
        }
    }
    actions
    {


        //Unsupported feature: Code Modification on "SendApprovalRequest(Action 142).OnAction".

        //trigger OnAction()
        //Parameters and return type have not been exported.
        //>>>> ORIGINAL CODE:
        //begin
        /*
        //cc//if ApprovalsMgmt.CheckPurchaseApprovalPossible(Rec) THEN
          //cc//ApprovalsMgmt.OnSendPurchaseDocForApproval(Rec);
        */
        //end;
        //>>>> MODIFIED CODE:
        //begin
        /*
        //Added for control Business
        PVLines.RESET;
        PVLines.SETRANGE("Document No.","No.");
        IF PVLines.FIND('-') THEN BEGIN
           REPEAT
             PVLines.TESTFIELD("Gen. Prod. Posting Group");
             //PVLines.TESTFIELD("Job No.");
             //PVLines.TESTFIELD("Job Task No.");
             UNTIL PVLines.NEXT=0;
          END;
        //End Added for control Business
        //cc//if ApprovalsMgmt.CheckPurchaseApprovalPossible(Rec) THEN
          //cc//ApprovalsMgmt.OnSendPurchaseDocForApproval(Rec);
        */
        //end;
    }

    var
        PVLines: Record "Purchase Line";
}
