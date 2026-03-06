#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
TableExtension 50032 tableextension50032 extends "Change Log Entry"
{
    fields
    {

        //Unsupported feature: Code Modification on ""User ID"(Field 4).OnLookup".

        //trigger OnLookup(var Text: Text): Boolean
        //>>>> ORIGINAL CODE:
        //begin
        /*
       UserMgt.DisplayUserInformation("User ID");
        */
        //end;
        //>>>> MODIFIED CODE:
        //begin
        /*
        //UserMgt.LookupUserID("User ID");
        */
        //end;
    }
}
