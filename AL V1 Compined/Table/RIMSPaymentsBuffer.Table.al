#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Table 57024 "RIMS Payments Buffer"
{

    fields
    {
        field(1; "RIMS Ref No"; Text[30])
        {
            DataClassification = ToBeClassified;
        }
        field(2; "NAV Receipt No"; Text[30])
        {
            DataClassification = ToBeClassified;
        }
        field(3; "Customer Code"; Text[30])
        {
            DataClassification = ToBeClassified;
        }
        field(4; "Full Name"; Text[150])
        {
            DataClassification = ToBeClassified;
        }
        field(5; "Customer Details"; Text[255])
        {
            DataClassification = ToBeClassified;
        }
        field(6; "Paid Amount"; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(7; "Bank Code"; Code[10])
        {
            DataClassification = ToBeClassified;
        }
        field(8; "Payment Date"; Date)
        {
            DataClassification = ToBeClassified;
        }
        field(9; Posted; Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(10; "Entry No"; Integer)
        {
            AutoIncrement = true;
            DataClassification = ToBeClassified;
        }
        field(11; "Pay Mode"; Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(12; "Currency Code"; Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(13; "Funding Source Code"; Code[50])
        {
            DataClassification = ToBeClassified;
        }
        field(14; "Payment Reference No"; Code[100])
        {
            DataClassification = ToBeClassified;
        }
    }

    keys
    {
        key(Key1; "RIMS Ref No")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}
