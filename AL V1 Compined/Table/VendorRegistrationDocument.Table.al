#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Table 70103 "Vendor Registration Document"
{

    fields
    {
        field(1; "Code"; Code[50])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Procurement Document Type".Code;
        }
        field(2; Description; Text[100])
        {
            DataClassification = ToBeClassified;
        }
        field(3; "Global Requirement"; Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(4; "Special Group Requirement"; Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(5; "Contractor (Works Requirement)"; Boolean)
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
