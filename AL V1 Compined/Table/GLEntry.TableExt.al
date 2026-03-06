#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
TableExtension 90011 tableextension90011 extends "G/L Entry"
{
    fields
    {
        field(5700; "Responsibility Center"; Code[10])
        {
            Caption = 'Responsibility Center';
            DataClassification = ToBeClassified;
            TableRelation = "Responsibility Center";
        }
        field(50000; "Vendor Name"; Text[100])
        {
            CalcFormula = lookup(Vendor.Name where("No." = field("Source No.")));
            FieldClass = FlowField;
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
    }


    //Unsupported feature: Code Modification on "CopyFromGenJnlLine(PROCEDURE 4)".

    //procedure CopyFromGenJnlLine();
    //Parameters and return type have not been exported.
    //>>>> ORIGINAL CODE:
    //begin
    /*
    "Posting Date" := GenJnlLine."Posting Date";
    "Document Date" := GenJnlLine."Document Date";
    "Document Type" := GenJnlLine."Document Type";
    #4..33
    "No. Series" := GenJnlLine."Posting No. Series";
    "IC Partner Code" := GenJnlLine."IC Partner Code";

    OnAfterCopyGLEntryFromGenJnlLine(Rec,GenJnlLine);
    */
    //end;
    //>>>> MODIFIED CODE:
    //begin
    /*
    #1..36
    //added for procurement plan
    "Procurement Plan":=GenJnlLine."Procurement Plan";
    "Procurement Plan Item":=GenJnlLine."Procurement Plan Item";


    OnAfterCopyGLEntryFromGenJnlLine(Rec,GenJnlLine);
    */
    //end;
}
