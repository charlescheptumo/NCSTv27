#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Table 70214 "Purchase Contract Documents"
{

    fields
    {
        field(1; "Document Type"; Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = 'Quote,Order,Invoice,Credit Memo,Blanket Order,Return Order,Store Requisition,Purchase Requisition,,,,,,IEC Materials';
            OptionMembers = Quote,"Order",Invoice,"Credit Memo","Blanket Order","Return Order","Store Requisition","Purchase Requisition",,,,,,"IEC Materials";
        }
        field(2; "No."; Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(3; "Document Type ID"; Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Procurement Doc Template Line"."Procurement Document Type" where("Procurement Process" = filter("Contract Issuance"));
        }
        field(4; Description; Text[80])
        {
            DataClassification = ToBeClassified;
        }
    }

    keys
    {
        key(Key1; "Document Type", "No.", "Document Type ID")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}
