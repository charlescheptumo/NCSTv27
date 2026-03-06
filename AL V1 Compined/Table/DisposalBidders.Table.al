#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Table 70049 "Disposal Bidders"
{

    fields
    {
        field(1; "Disposal No."; Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(2; Name; Text[30])
        {
            DataClassification = ToBeClassified;
        }
        field(3; "Email Address"; Text[30])
        {
            DataClassification = ToBeClassified;
        }
        field(4; Amount; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(5; "Phone No."; Text[30])
        {
            DataClassification = ToBeClassified;
        }
        field(6; "Contact Person"; Text[30])
        {
            DataClassification = ToBeClassified;
        }
        field(7; "Physical Addess"; Text[30])
        {
            DataClassification = ToBeClassified;
        }
        field(8; Award; Boolean)
        {
            DataClassification = ToBeClassified;
        }
    }

    keys
    {
        key(Key1; "Disposal No.", Name)
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}
