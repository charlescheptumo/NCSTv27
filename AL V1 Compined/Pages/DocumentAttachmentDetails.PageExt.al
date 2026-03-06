#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
PageExtension 50049 pageextension50049 extends "Document Attachment Details"
{

    //Unsupported feature: Property Modification (SourceTableView) on ""Document Attachment Details"(Page 1173)".


    //Unsupported feature: Code Modification on "OpenForRecRef(PROCEDURE 3)".

    //procedure OpenForRecRef();
    //Parameters and return type have not been exported.
    //>>>> ORIGINAL CODE:
    //begin
    /*
    RESET;

    FromRecRef := RecRef;
    #4..23
      DATABASE::"Purch. Inv. Header",
      DATABASE::"Purch. Inv. Line",
      DATABASE::"Purch. Cr. Memo Hdr.",
      DATABASE::"Purch. Cr. Memo Line":
        PurchaseDocumentFlow := TRUE;
    END;

    #31..34
      DATABASE::Employee,
      DATABASE::"Fixed Asset",
      DATABASE::Job,
      DATABASE::Resource:
        BEGIN
          FieldRef := RecRef.FIELD(1);
    #41..103
    END;

    OnAfterOpenForRecRef(Rec,RecRef);
    */
    //end;
    //>>>> MODIFIED CODE:
    //begin
    /*
    #1..26
      DATABASE::"Procurement Request",
      //Added Custom document by Morris
      DATABASE::"Grant Funding Application",
      DATABASE::"Imprest Memo",
      DATABASE::"HR Leave Application",
      //End Custom document Morris
      DATABASE::"Purch. Cr. Memo Line":

     // DATABASE::"Procurement Request":
    #28..37
      //Added Custom document by Morris
      DATABASE::"Grant Funding Application",
      DATABASE::Payments,
      DATABASE::"Procurement Request",
      DATABASE::"Imprest Memo",
      DATABASE::"HR Leave Application",
      //End Custom document Morris
    #38..106
    */
    //end;
}
