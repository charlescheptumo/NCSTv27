#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Table 70083 "RFI Category Requirement"
{

    fields
    {
        field(1; "Category ID"; Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Procurement Category".Code;
        }
        field(2; "Requirement Code"; Code[30])
        {
            DataClassification = ToBeClassified;
        }
        field(3; Description; Text[250])
        {
            DataClassification = ToBeClassified;
        }
        field(4; "Requirement Type"; Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = ',Mandatory,Supporting';
            OptionMembers = ,Mandatory,Supporting;
        }
    }

    keys
    {
        key(Key1; "Category ID", "Requirement Code")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}
