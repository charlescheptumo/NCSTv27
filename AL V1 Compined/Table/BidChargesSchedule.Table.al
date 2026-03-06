#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Table 70066 "Bid Charges Schedule"
{
    DrillDownPageID = "Bid Charges Schedule";
    LookupPageID = "Bid Charges Schedule";

    fields
    {
        field(1; "Code"; Code[50])
        {
            DataClassification = ToBeClassified;
        }
        field(2; Description; Text[100])
        {
            DataClassification = ToBeClassified;
        }
        field(3; "Currency Code"; Code[20])
        {
            TableRelation = Currency;
        }
        field(4; Amount; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(5; "Effective Date"; Date)
        {
            DataClassification = ToBeClassified;
        }
        field(6; Blocked; Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(7; "Document Type"; Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = 'IFP,IFS';
            OptionMembers = IFP,IFS;
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
