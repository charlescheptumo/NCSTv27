#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
TableExtension 50009 tableextension50009 extends "Invoice Post. Buffer"
{
    fields
    {
        field(50000; "Posting Description"; Text[250])
        {
            DataClassification = ToBeClassified;
        }
        field(50001; "Line No."; Integer)
        {
            DataClassification = ToBeClassified;
        }
        field(70000; "Procurement Plan"; Code[10])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Procurement Header".No;
        }
        field(70001; "Procurement Plan Item"; Code[10])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Procurement Plan 1"."Plan Item No" where("Plan Year" = field("Procurement Plan"));

            trigger OnValidate()
            begin

                /* ProcurementPlan.RESET;
                ProcurementPlan.SETRANGE(ProcurementPlan."Plan Item No","Procurement Plan Item");
               IF ProcurementPlan.FIND('-') THEN BEGIN
               IF ProcurementPlan."Procurement Type"=ProcurementPlan."Procurement Type"::Goods THEN BEGIN
                 Type:=Type::Item;
                 No:=ProcurementPlan."No.";
               END;
               IF ProcurementPlan."Procurement Type"<>ProcurementPlan."Procurement Type"::Service THEN BEGIN
                Type:=Type::"Non Stock";
                No:=ProcurementPlan."Source of Funds";
               END;
                 "Budget Line":=ProcurementPlan."Source of Funds";
                  Description:=ProcurementPlan."Item Description";
                 "Unit of Measure":=ProcurementPlan."Unit of Measure";
                 "Unit Price":=ProcurementPlan."Unit Price";
               END;
              */

            end;
        }
        field(70002; "Responsibility Center"; Code[10])
        {
            Caption = 'Responsibility Center';
            DataClassification = ToBeClassified;
            TableRelation = "Responsibility Center";
        }
    }
    keys
    {
        // Unsupported feature: Key containing base fields
        // 
        // //Unsupported feature: Deletion (KeyCollection) on ""Type,""G/L Account"",""Gen. Bus. Posting Group"",""Gen. Prod. Posting Group"",""VAT Bus. Posting Group"",""VAT Prod. Posting Group"",""Tax Area Code"",""Tax Group Code"",""Tax Liable"",""Use Tax"",""Dimension Set ID"",""Job No."",""Fixed Asset Line No."",""Deferral Code"",""Additional Grouping Identifier"""(Key)".
        // 
        // key(Key1;Type,"G/L Account","Gen. Bus. Posting Group","Gen. Prod. Posting Group","VAT Bus. Posting Group","VAT Prod. Posting Group","Tax Area Code","Tax Group Code","Tax Liable","Use Tax","Dimension Set ID","Job No.","Fixed Asset Line No.","Deferral Code","Additional Grouping Identifier","Line No.")
        // {
        // Clustered = true;
        // }
    }


    //Unsupported feature: Code Modification on "PrepareSales(PROCEDURE 1)".

    //procedure PrepareSales();
    //Parameters and return type have not been exported.
    //>>>> ORIGINAL CODE:
    //begin
    /*
    CLEAR(Rec);
    Type := SalesLine.Type;
    "System-Created Entry" := TRUE;
    #4..11
    "Job No." := SalesLine."Job No.";
    "VAT %" := SalesLine."VAT %";
    "VAT Difference" := SalesLine."VAT Difference";
    IF Type = Type::"Fixed Asset" THEN BEGIN
      "FA Posting Date" := SalesLine."FA Posting Date";
      "Depreciation Book Code" := SalesLine."Depreciation Book Code";
    #18..32
    END;

    OnAfterInvPostBufferPrepareSales(SalesLine,Rec);
    */
    //end;
    //>>>> MODIFIED CODE:
    //begin
    /*
    #1..14
    "Posting Description":=SalesLine.Description;
    #15..35
    */
    //end;


    //Unsupported feature: Code Modification on "PreparePurchase(PROCEDURE 6)".

    //procedure PreparePurchase();
    //Parameters and return type have not been exported.
    //>>>> ORIGINAL CODE:
    //begin
    /*
    CLEAR(Rec);
    Type := PurchLine.Type;
    "System-Created Entry" := TRUE;
    #4..11
    "Job No." := PurchLine."Job No.";
    "VAT %" := PurchLine."VAT %";
    "VAT Difference" := PurchLine."VAT Difference";
    IF Type = Type::"Fixed Asset" THEN BEGIN
      "FA Posting Date" := PurchLine."FA Posting Date";
      "Depreciation Book Code" := PurchLine."Depreciation Book Code";
    #18..39
    END;

    OnAfterInvPostBufferPreparePurchase(PurchLine,Rec);
    */
    //end;
    //>>>> MODIFIED CODE:
    //begin
    /*
    #1..14

     // *************************************************************************************************
      // Following Code Added By Eric Daudi 18/03/2020 To Pass Actual Line Description Through To GL Entry
      IF (PurchLine.Type = PurchLine.Type::"G/L Account") OR (PurchLine.Type = PurchLine.Type::Item) THEN BEGIN
         "Posting Description" := PurchLine.Comment;
         "Line No." := PurchLine."Line No.";
      END;
      // *************************************************************************************************

    //added by daudi
    "Procurement Plan":=PurchLine."Procurement Plan";
    "Procurement Plan Item":=PurchLine."Procurement Plan Item";
    "Responsibility Center":=PurchLine."Responsibility Center";

    #15..42
    */
    //end;
}
