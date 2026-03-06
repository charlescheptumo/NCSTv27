#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Table 70105 "Solicitation Activity Schedule"
{
    Caption = 'Procurement Activity Schedule';

    fields
    {
        field(1; "Solicitation Type ID"; Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Solicitation Type".Code;
        }
        field(2; "Activity Code"; Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Procurement Activity Code"."Activity Code";
        }
        field(3; Description; Text[50])
        {
            DataClassification = ToBeClassified;
        }
        field(4; "Default Planned Duration"; Decimal)
        {
            DataClassification = ToBeClassified;
            Description = 'Default Planned Duration (Days)';
        }
    }

    keys
    {
        key(Key1; "Solicitation Type ID", "Activity Code")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}
