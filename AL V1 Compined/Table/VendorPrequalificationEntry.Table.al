#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Table 70111 "Vendor Prequalification Entry"
{

    fields
    {
        field(1; "Entry No"; Integer)
        {
            DataClassification = ToBeClassified;
        }
        field(2; "IFP No."; Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(3; "Vendor No."; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = Vendor;
        }
        field(4; "Procurement Type"; Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Procurement Types".Code;
        }
        field(5; "Procurement Category Code"; Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Procurement Category".Code;
        }
        field(6; Description; Text[250])
        {
            DataClassification = ToBeClassified;
        }
        field(7; "Start Date"; Date)
        {
            DataClassification = ToBeClassified;
        }
        field(8; "End Date"; Date)
        {
            DataClassification = ToBeClassified;
        }
        field(9; Blocked; Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(10; "Date Blocked"; Date)
        {
            DataClassification = ToBeClassified;
        }
        field(11; "Document Type"; Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = 'IFP Response,EOI Response';
            OptionMembers = "IFP Response","EOI Response";
        }
        field(12; "Posting Date"; Date)
        {
            DataClassification = ToBeClassified;
        }
        field(13; "Document No."; Code[30])
        {
            DataClassification = ToBeClassified;
        }
    }

    keys
    {
        key(Key1; "Entry No")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}
