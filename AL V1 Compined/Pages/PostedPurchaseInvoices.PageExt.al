#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
PageExtension 50034 pageextension50034 extends "Posted Purchase Invoices"
{

    //Unsupported feature: Property Insertion (DeleteAllowed) on ""Posted Purchase Invoices"(Page 146)".


    //Unsupported feature: Property Insertion (ModifyAllowed) on ""Posted Purchase Invoices"(Page 146)".

    layout
    {

        //Unsupported feature: Property Deletion (Visible) on ""Posting Date"(Control 105)".

    }
    var
        UserSetup: Record "User Setup";


    //Unsupported feature: Code Modification on "OnOpenPage".

    //trigger OnOpenPage()
    //>>>> ORIGINAL CODE:
    //begin
    /*
    HasFilters := GETFILTERS <> '';
    SetSecurityFilterOnRespCenter;
    IF HasFilters THEN
      IF FINDFIRST THEN;
    IsOfficeAddin := OfficeMgt.IsAvailable;
    IsFoundationEnabled := ApplicationAreaMgmtFacade.IsFoundationEnabled;
    */
    //end;
    //>>>> MODIFIED CODE:
    //begin
    /*
    IF UserSetup.GET(USERID) THEN BEGIN
    IF UserSetup."Accounts User"OR UserSetup."Procurement officer"=FALSE THEN
    SETRANGE("User ID",USERID);
    END;

    #1..6
    */
    //end;
}
