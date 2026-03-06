#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Table 70145 "IFS Insurance Requirement"
{

    fields
    {
        field(1; "IFS Code"; Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Standard Purchase Code";
        }
        field(2; "Insurance Type"; Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Insurance Type".Code;
        }
        field(3; "Policy Cover Type"; Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = 'Third Party,Comprehensive';
            OptionMembers = "Third Party",Comprehensive;
        }
        field(4; Description; Text[100])
        {
            DataClassification = ToBeClassified;
        }
        field(5; "Minimum Policy Coverage (LCY)"; Decimal)
        {
            DataClassification = ToBeClassified;
        }
    }

    keys
    {
        key(Key1; "IFS Code")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}
