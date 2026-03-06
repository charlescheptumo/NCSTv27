#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Table 70205 "Tender Addendum Amendment"
{

    fields
    {
        field(1; "Addendum Notice No."; Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Tender Addendum Notice"."Addendum Notice No.";
        }
        field(2; "Line No."; Code[30])
        {
            DataClassification = ToBeClassified;
        }
        field(3; "Amended Section of Tender Doc"; Text[100])
        {
            Caption = 'Amended Section of Tender Document';
            DataClassification = ToBeClassified;
            Description = 'Amended Section of Tender Document';
        }
        field(4; "Amendment Type"; Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Tender Addendum Type".Code;
        }
        field(5; "Amendment Description"; Text[250])
        {
            DataClassification = ToBeClassified;
        }
    }

    keys
    {
        key(Key1; "Addendum Notice No.")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}
