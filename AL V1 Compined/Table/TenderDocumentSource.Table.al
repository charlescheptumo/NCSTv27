#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Table 70120 "Tender Document Source"
{

    fields
    {
        field(1; "Code"; Code[30])
        {
            DataClassification = ToBeClassified;
            Description = 'Linked to Tender Site table';
        }
        field(2; Description; Text[60])
        {
            DataClassification = ToBeClassified;
        }
        field(3; "Url Link"; Text[60])
        {
            DataClassification = ToBeClassified;
        }
        field(4; "Default IFS Bid Charge Code"; Code[30])
        {
            DataClassification = ToBeClassified;
            Description = 'Linked to Bid Charge Schedule to determine default charges for accessing/obtaining tender documents';
            TableRelation = "Bid Charges Schedule".Code;
        }
        field(5; Blocked; Boolean)
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
