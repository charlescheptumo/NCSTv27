#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
TableExtension 50011 tableextension50011 extends "Gen. Journal Line"
{
    fields
    {
        field(50000; "JV Creator USER ID"; Code[20])
        {
            Editable = false;
        }
        field(50001; "Shortcut Dimension 3 Code"; Code[20])
        {
            CaptionClass = '1,2,3';
            Caption = 'Shortcut Dimension 3 Code';
            TableRelation = "Dimension Value".Code where("Global Dimension No." = const(3));

            trigger OnValidate()
            begin
                Rec.ValidateShortcutDimCode(1, Rec."Shortcut Dimension 1 Code");
            end;
        }
        field(50002; "Shortcut Dimension 4 Code"; Code[20])
        {
            CaptionClass = '1,2,4';
            Caption = 'Shortcut Dimension 4 Code';
            TableRelation = "Dimension Value".Code where("Global Dimension No." = const(4));

            trigger OnValidate()
            begin
                Rec.ValidateShortcutDimCode(2, Rec."Shortcut Dimension 2 Code");
            end;
        }
        field(50003; "Shortcut Dimension 5 Code"; Code[20])
        {
            CaptionClass = '1,2,5';
            Caption = 'Shortcut Dimension 5 Code';
            TableRelation = "Dimension Value".Code where("Global Dimension No." = const(5));

            trigger OnValidate()
            begin
                Rec.ValidateShortcutDimCode(2, Rec."Shortcut Dimension 2 Code");
            end;
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


    //Unsupported feature: Code Modification on "CopyFromInvoicePostBuffer(PROCEDURE 112)".

    //procedure CopyFromInvoicePostBuffer();
    //Parameters and return type have not been exported.
    //>>>> ORIGINAL CODE:
    //begin
    /*
    "Account No." := InvoicePostBuffer."G/L Account";
    "System-Created Entry" := InvoicePostBuffer."System-Created Entry";
    "Gen. Bus. Posting Group" := InvoicePostBuffer."Gen. Bus. Posting Group";
    #4..23
    "VAT Difference" := InvoicePostBuffer."VAT Difference";
    "VAT Base Before Pmt. Disc." := InvoicePostBuffer."VAT Base Before Pmt. Disc.";

    OnAfterCopyGenJnlLineFromInvPostBuffer(InvoicePostBuffer,Rec);
    */
    //end;
    //>>>> MODIFIED CODE:
    //begin
    /*
    #1..26
    // *************************************************************************************************
    // Following Field Assignment Modified By E.Daudi 18/03/2020 To Post Actual Line Description To GL
     Description := InvoicePostBuffer."Posting Description";
    // *************************************************************************************************

    //added by daudi for procurement plan
    "Procurement Plan":=InvoicePostBuffer."Procurement Plan";
    "Procurement Plan Item":=InvoicePostBuffer."Procurement Plan Item";
    "Responsibility Center":=InvoicePostBuffer."Responsibility Center";

    OnAfterCopyGenJnlLineFromInvPostBuffer(InvoicePostBuffer,Rec);
    */
    //end;
}
