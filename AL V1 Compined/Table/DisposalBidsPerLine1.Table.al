#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Table 70050 "Disposal Bids Per Line 1"
{
    DrillDownPageID = "Quotation Bids Per vendor";
    LookupPageID = "Quotation Bids Per vendor";

    fields
    {
        field(1; "Disposal No"; Code[50])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Procurement Request";
        }
        field(2; "Document No."; Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(3; Type; Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = ' ,Non Stock Item,Item,G/L Account,Fixed Asset';
            OptionMembers = " ","Non Stock Item",Item,"G/L Account","Fixed Asset";
        }
        field(4; No; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = if (Type = const("Non Stock Item")) "G/L Account"
            else if (Type = const(Item)) Item
            else if (Type = const("Fixed Asset")) "Fixed Asset";
        }
        field(5; Description; Text[250])
        {
            DataClassification = ToBeClassified;
        }
        field(6; Quantity; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(7; Amount; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(8; Award; Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(9; Customer; Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = Customer;
        }
        field(10; "Quoted Amount"; Decimal)
        {
            DataClassification = ToBeClassified;
        }
    }

    keys
    {
        key(Key1; "Disposal No", "Document No.")
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
