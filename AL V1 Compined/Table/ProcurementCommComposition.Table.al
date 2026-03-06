#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Table 70134 "Procurement Comm Composition"
{
    DrillDownPageID = "Procurement Comm Composition";
    LookupPageID = "Procurement Comm Composition";

    fields
    {
        field(1; "Committee Type"; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Procurement Committee Types"."Committee Type";
        }
        field(2; "Entry No."; Integer)
        {
            AutoIncrement = true;
            DataClassification = ToBeClassified;
        }
        field(3; Role; Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = 'Member,Chairperson,Secretary,Consultant';
            OptionMembers = Member,Chairperson,Secretary,Consultant;
        }
        field(4; Description; Text[100])
        {
            DataClassification = ToBeClassified;
        }
        field(5; "Minimum No. of Members"; Decimal)
        {
            DataClassification = ToBeClassified;
        }
    }

    keys
    {
        key(Key1; "Committee Type", "Entry No.")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}
