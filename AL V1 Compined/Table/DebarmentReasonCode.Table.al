#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Table 70115 "Debarment Reason Code"
{
    LookupPageID = "Debarment Reason Code";

    fields
    {
        field(1; "Code"; Code[30])
        {
            DataClassification = ToBeClassified;
        }
        field(2; "Reason Category"; Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = 'Debarment,Reinstatement';
            OptionMembers = Debarment,Reinstatement;
        }
        field(3; Description; Text[60])
        {
            DataClassification = ToBeClassified;
        }
        field(4; "No. of Vendors"; Decimal)
        {
            DataClassification = ToBeClassified;
            Description = 'Sum calcfield mapped to the Vendor Debarment Entry Table';
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
