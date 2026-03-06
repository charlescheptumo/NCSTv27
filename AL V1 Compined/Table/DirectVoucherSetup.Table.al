#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Table 57013 "Direct Voucher Setup"
{

    fields
    {
        field(1; "Code"; Integer)
        {
            AutoIncrement = true;
            DataClassification = ToBeClassified;
        }
        field(2; "Customer Posting Group"; Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Customer Posting Group";
        }
        field(3; "Income Account"; Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = "G/L Account";
        }
    }

    keys
    {
        key(Key1; "Code")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}
