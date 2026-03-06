#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Table 70225 "Funding Agency"
{

    fields
    {
        field(1; "Code"; Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(2; Name; Text[100])
        {
            DataClassification = ToBeClassified;
        }
        field(3; Address; Text[100])
        {
            DataClassification = ToBeClassified;
        }
        field(4; "Address 2"; Text[40])
        {
            DataClassification = ToBeClassified;
        }
        field(5; City; Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(6; "Post Code"; Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(7; "Country/Region Code"; Code[50])
        {
            DataClassification = ToBeClassified;
        }
        field(8; "Phone No."; Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(9; "Primary Contact Name"; Text[50])
        {
            DataClassification = ToBeClassified;
        }
        field(10; Email; Text[100])
        {
            DataClassification = ToBeClassified;
        }
        field(11; "Home Page"; Text[100])
        {
            DataClassification = ToBeClassified;
        }
        field(12; "Balance (LCY)"; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(13; "Total Awarded Grants (LCY)"; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(14; "Total Invoiced Grants (LCY)"; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(15; "Total Disbursed Amounts (LCY)"; Decimal)
        {
            DataClassification = ToBeClassified;
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

