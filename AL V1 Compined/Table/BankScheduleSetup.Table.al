#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Table 57023 "Bank Schedule Setup"
{

    fields
    {
        field(1; "No."; Integer)
        {
            DataClassification = ToBeClassified;
        }
        field(2; Addressee; Text[100])
        {
            DataClassification = ToBeClassified;
        }
        field(3; "Bank Name"; Text[100])
        {
            DataClassification = ToBeClassified;
        }
        field(4; Location; Text[100])
        {
            DataClassification = ToBeClassified;
        }
        field(5; City; Text[100])
        {
            DataClassification = ToBeClassified;
        }
        field(6; "Reference To"; Text[100])
        {
            DataClassification = ToBeClassified;
        }
        field(7; "Body Msg 1"; Text[100])
        {
            DataClassification = ToBeClassified;
        }
        field(8; "Body Msg 2"; Text[100])
        {
            DataClassification = ToBeClassified;
        }
        field(9; "Body Msg 3"; Text[100])
        {
            DataClassification = ToBeClassified;
        }
        field(10; "DG Approver Name"; Text[100])
        {
            DataClassification = ToBeClassified;
        }
        field(11; "DG  Approver Designation"; Code[100])
        {
            DataClassification = ToBeClassified;
        }
        field(12; "Finance Approver Name"; Text[100])
        {
            DataClassification = ToBeClassified;
        }
        field(13; "Finance Approver Designation"; Code[100])
        {
            DataClassification = ToBeClassified;
        }
        field(14; "File No"; Code[100])
        {
            DataClassification = ToBeClassified;
        }
        field(15; Currency; Text[30])
        {
            DataClassification = ToBeClassified;
        }
    }

    keys
    {
        key(Key1; "No.")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}
