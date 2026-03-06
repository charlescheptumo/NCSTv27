#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Table 69014 "Salary Pointers"
{
    DrillDownPageID = "Salary pointers";
    LookupPageID = "Salary pointers";

    fields
    {
        field(1; "Salary Pointer"; Code[10])
        {
            NotBlank = true;
        }
        field(2; "Basic Pay int"; Integer)
        {
        }
        field(3; "Basic Pay"; Decimal)
        {
        }
        field(4; "Salary Scale"; Code[10])
        {
            TableRelation = "Salary Scales";
        }
        field(5; "Pointer Int"; Integer)
        {
            DataClassification = ToBeClassified;
        }
        field(6; Description; Text[50])
        {
            DataClassification = ToBeClassified;
        }
        field(7; "Min Salary"; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(8; "Max Salary"; Decimal)
        {
            DataClassification = ToBeClassified;
        }
    }

    keys
    {
        key(Key1; "Salary Scale", "Salary Pointer", "Basic Pay int")
        {
            Clustered = true;
        }
        key(Key2; "Basic Pay int")
        {
        }
    }

    fieldgroups
    {
    }
}
