#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Table 70078 "Vendor Staff Employment"
{

    fields
    {
        field(1; "Entry No"; Integer)
        {
            AutoIncrement = true;
            DataClassification = ToBeClassified;
        }
        field(2; "Staff ID"; Code[10])
        {
            DataClassification = ToBeClassified;
        }
        field(3; "Vendor No"; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = Vendor;
        }
        field(4; "Previous Employer"; Text[30])
        {
            DataClassification = ToBeClassified;
        }
        field(5; "Title Held"; Text[30])
        {
            DataClassification = ToBeClassified;
        }
        field(6; "Start Year"; Date)
        {
            DataClassification = ToBeClassified;
        }
        field(7; "End Year"; Date)
        {
            DataClassification = ToBeClassified;
        }
        field(8; Country; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Country/Region";
        }
        field(9; Location; Text[30])
        {
            DataClassification = ToBeClassified;
        }
    }

    keys
    {
        key(Key1; "Entry No", "Staff ID")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}
