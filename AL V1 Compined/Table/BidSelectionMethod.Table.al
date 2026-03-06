#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Table 70070 "Bid Selection Method"
{
    DrillDownPageID = "Bid Selection Method";
    LookupPageID = "Bid Selection Method";

    fields
    {
        field(1; "Code"; Code[30])
        {
            DataClassification = ToBeClassified;
        }
        field(2; Description; Text[80])
        {
            DataClassification = ToBeClassified;
        }
        field(3; Overview; Text[250])
        {
            DataClassification = ToBeClassified;
        }
        field(4; "Applies To Goods"; Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(5; "Applies To Works"; Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(6; "Applies To Services"; Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(7; "No. of Invitations For Supply"; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(8; Blocked; Boolean)
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
