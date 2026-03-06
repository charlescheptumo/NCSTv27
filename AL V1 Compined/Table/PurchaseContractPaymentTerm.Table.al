#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Table 70219 "Purchase Contract Payment Term"
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
            TableRelation = "Purchase Header"."No." where("Document Type" = const("Blanket Order"));
        }
        field(3; "Instalment Code"; Code[50])
        {
            DataClassification = ToBeClassified;
        }
        field(4; "Payment Certificate Type"; Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = ',Advance,Interim,Final';
            OptionMembers = ,Advance,Interim,Final;
        }
        field(5; Description; Text[100])
        {
            DataClassification = ToBeClassified;
        }
        field(6; "Payment %"; Decimal)
        {
            DataClassification = ToBeClassified;
            MaxValue = 100;
            MinValue = 0;
        }
        field(7; "Currency Code"; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = Currency.Code;
        }
        field(8; "Planned Amount"; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(9; "Planned Amount (LCY)"; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(10; "Paid Amount"; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(11; "Paid Amount (LCY)"; Decimal)
        {
            DataClassification = ToBeClassified;
        }
    }

    keys
    {
        key(Key1; "Document Type", "No.", "Instalment Code")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}
