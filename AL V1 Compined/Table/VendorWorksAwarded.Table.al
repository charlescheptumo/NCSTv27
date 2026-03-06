#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Table 70079 "Vendor Works Awarded"
{

    fields
    {
        field(1; "Entry No"; Integer)
        {
            DataClassification = ToBeClassified;
        }
        field(2; "Vendor No"; Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(3; "Document Type"; Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = ' ,Payment,Invoice,Credit Memo,Finance Charge Memo,Reminder,Refund';
            OptionMembers = " ",Payment,Invoice,"Credit Memo","Finance Charge Memo",Reminder,Refund;
        }
        field(4; "Posting Date"; Date)
        {
            DataClassification = ToBeClassified;
        }
        field(5; Description; Text[100])
        {
            DataClassification = ToBeClassified;
        }
        field(6; Amount; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(7; "Amount (LCY)"; Decimal)
        {
            DataClassification = ToBeClassified;
        }
    }

    keys
    {
        key(Key1; "Entry No", "Vendor No")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}
