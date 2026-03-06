#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Table 70051 "Quotation Bids Per Line 1"
{
    DrillDownPageID = "Quotation Bids Per vendor";
    LookupPageID = "Quotation Bids Per vendor";

    fields
    {
        field(1; "Requisition No"; Code[50])
        {
            TableRelation = "Procurement Request";
        }
        field(2; "Line No"; Integer)
        {
        }
        field(3; Type; Option)
        {
            OptionCaption = ' ,Non Stock Item,Item,G/L Account,Fixed Asset';
            OptionMembers = " ","Non Stock Item",Item,"G/L Account","Fixed Asset";
        }
        field(4; No; Code[20])
        {
            TableRelation = if (Type = const("Non Stock Item")) "G/L Account"
            else if (Type = const(Item)) Item
            else if (Type = const("Fixed Asset")) "Fixed Asset";
        }
        field(5; Description; Text[250])
        {
        }
        field(6; Quantity; Decimal)
        {
        }
        field(7; "Unit of Measure"; Code[10])
        {
            TableRelation = "Unit of Measure";
        }
        field(8; "Unit Price"; Decimal)
        {

            trigger OnValidate()
            begin

                Amount := Quantity * "Unit Price";
            end;
        }
        field(9; Amount; Decimal)
        {
        }
        field(10; "Budget Line"; Code[10])
        {
        }
        field(12; "Global Dimension 1 Code"; Code[20])
        {
            CaptionClass = '1,1,1';
            Caption = 'Department';
            TableRelation = "Dimension Value".Code where("Global Dimension No." = const(1));

            trigger OnValidate()
            begin
                //ValidateShortcutDimCode(1,"Global Dimension 1 Code");

                /*PurchaseReqDet.RESET;
                PurchaseReqDet.SETRANGE(PurchaseReqDet."Requistion No.","Requisition No.");
                
                IF PurchaseReqDet.FIND('-') THEN BEGIN
                REPEAT
                PurchaseReqDet."Global Dimension 1 Code":="Global Dimension 1 Code";
                PurchaseReqDet.MODIFY;
                UNTIL PurchaseReqDet.NEXT=0;
                END;
                
                PurchaseReqDet.VALIDATE(PurchaseReqDet."No."); */

            end;
        }
        field(13; "Amount LCY"; Decimal)
        {
        }
        field(14; "Request Generated"; Boolean)
        {
        }
        field(15; "Supplier Category"; Code[20])
        {
            TableRelation = "Supplier Category";
        }
        field(16; "Vendor No"; Code[30])
        {
            TableRelation = Vendor;
        }
        field(17; "Quoted Amount"; Decimal)
        {
            DataClassification = ToBeClassified;
        }
    }

    keys
    {
        key(Key1; "Requisition No", "Line No")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }

    var
        ReqHeader: Record "Requisition Header1";
        ProcurementPlan: Record "Procurement Header";
        RFQHDR: Record "Requisition Header1";
}
