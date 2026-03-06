#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Table 70064 "Procurement Document Template"
{
    Caption = 'Procurement Document Template';
    DrillDownPageID = "Procurement Document Template";
    LookupPageID = "Procurement Document Template";

    fields
    {
        field(1; "Template ID"; Code[50])
        {
            DataClassification = ToBeClassified;
        }
        field(2; Description; Text[100])
        {
            DataClassification = ToBeClassified;
        }
        field(3; "Procurement Type"; Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Procurement Types".Code;
        }
        field(4; "Effective Date"; Date)
        {
            DataClassification = ToBeClassified;
        }
        field(5; Blocked; Boolean)
        {
            DataClassification = ToBeClassified;
        }
    }

    keys
    {
        key(Key1; "Template ID")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}
