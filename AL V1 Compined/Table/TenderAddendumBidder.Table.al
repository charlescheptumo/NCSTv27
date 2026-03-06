#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Table 70209 "Tender Addendum Bidder"
{

    fields
    {
        field(1; "Addendum Notice No."; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Tender Addendum Notice"."Addendum Notice No.";
        }
        field(2; "IFS No."; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Standard Purchase Code".Code;
        }
        field(3; "Vendor No."; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = Vendor."No.";
        }
        field(4; "Vendor Name"; Text[100])
        {
            DataClassification = ToBeClassified;
        }
        field(5; "Primary Email"; Text[80])
        {
            DataClassification = ToBeClassified;
        }
        field(6; "Addendum e-Notice Sent"; Boolean)
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(7; "e-Notice Sent Date/Time"; DateTime)
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
    }

    keys
    {
        key(Key1; "Addendum Notice No.", "Vendor No.")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}
