#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Table 70123 "Works Equipment Category"
{
    DrillDownPageID = "Works Equipment Category";
    LookupPageID = "Works Equipment Category";

    fields
    {
        field(1; "Code"; Code[30])
        {
            DataClassification = ToBeClassified;
        }
        field(2; Description; Text[60])
        {
            DataClassification = ToBeClassified;
        }
        field(3; "No. of Equipment Types"; Integer)
        {
            DataClassification = ToBeClassified;
        }
        field(4; "No. of Equipment (Ongoing)"; Integer)
        {
            Caption = 'No. of Equipment (Ongoing Projects)';
            DataClassification = ToBeClassified;
            Description = 'No. of Equipment (Ongoing Projects)';
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
