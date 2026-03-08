#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Table 56900 portalusers
{

    fields
    {
        field(1; "customer No"; Code[20])
        {
        }
        field(2; Password; Text[30])
        {
        }
        field(3; "Last Login"; Date)
        {
        }
        field(4; status; Integer)
        {
        }
        field(5; changedPassword; Integer)
        {
        }
        field(6; validated; Boolean)
        {
        }
        field(7; usertype; Integer)
        {
            Description = '0 for customers, 1 for directors';
        }
        field(8; isAdmin; Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(9; Email; Text[100])
        {
            DataClassification = ToBeClassified;
        }
        field(10; ActivatedAsVendor; Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(11; IDNoorRegNo; Code[30])
        {
            DataClassification = ToBeClassified;
        }
        field(12; VendorNo; Code[20])
        {
            DataClassification = ToBeClassified;
        }
    }

    keys
    {
        key(Key1; "customer No")
        {
            Clustered = true;
        }
    }

    fieldgroups
    
    {
    }
}
