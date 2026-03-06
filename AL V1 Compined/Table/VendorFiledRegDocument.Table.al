#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Table 70189 "Vendor Filed Reg Document"
{

    fields
    {
        field(1; "Vendor No"; Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = Vendor;
        }
        field(2; "Entry No"; Integer)
        {
            AutoIncrement = true;
            DataClassification = ToBeClassified;
        }
        field(3; "Procurement Document Type ID"; Code[30])
        {
            DataClassification = ToBeClassified;
            Description = 'Linked to Procurement Document Type table';
            TableRelation = "Procurement Document Type".Code;
        }
        field(4; "Date Filed"; Date)
        {
            DataClassification = ToBeClassified;
        }
        field(5; Description; Text[250])
        {
            DataClassification = ToBeClassified;
        }
        field(6; "Certificate No."; Code[30])
        {
            Caption = 'External Document/Certificate No.';
            DataClassification = ToBeClassified;
            Description = 'External Document/Certificate No.';
        }
        field(7; "Issue Date"; Date)
        {
            DataClassification = ToBeClassified;
        }
        field(8; "Expiry Date"; Date)
        {
            DataClassification = ToBeClassified;
        }
        field(9; "File Name"; Text[50])
        {
            Caption = 'Specialized Provider Requirement';
            DataClassification = ToBeClassified;
        }
        field(10; "File Type"; Text[30])
        {
            DataClassification = ToBeClassified;
        }
        field(11; "File Extension"; Text[30])
        {
            DataClassification = ToBeClassified;
        }
        field(12; "Procurement Process"; Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = ',Registration,EOI Response,RFQ Response,ITT Response,Negotiations/Contract,Transactional';
            OptionMembers = ,Registration,"EOI Response","RFQ Response","ITT Response","Negotiations/Contract",Transactional;
        }
    }

    keys
    {
        key(Key1; "Vendor No", "Entry No")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}
