#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Table 59072 "File Locations Setup"
{

    fields
    {
        field(1; Location; Code[20])
        {
        }
        field(2; Description; Text[100])
        {
        }
        field(3; "Custodian Code"; Code[20])
        {
            TableRelation = Employee."No.";
        }
        field(4; "Custodian Name"; Text[50])
        {
        }
        field(5; "File Disposal No. Series"; Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = "No. Series";
        }
        field(6; "File Receiving Nos"; Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = "No. Series".Code;
        }
    }

    keys
    {
        key(Key1; Location)
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}
