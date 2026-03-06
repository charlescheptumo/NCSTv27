#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Table 70132 "Tender Cancel Reason Code"
{
    Caption = 'Tender Cancel Reason Code';
    DataCaptionFields = "Code", Description;
    LookupPageID = "Tender Cancel Reason Code";

    fields
    {
        field(1; "Code"; Code[50])
        {
            Caption = 'Code';
            NotBlank = true;
        }
        field(2; Description; Text[250])
        {
            Caption = 'Description';
        }
        field(3; "No. of Cancelled IFSs"; Integer)
        {
            Caption = 'No. of Cancelled IFSs';
            Editable = false;
        }
        field(4; Blocked; Boolean)
        {
            DataClassification = ToBeClassified;
        }
    }

    keys
    {
        key(Key1; "Code")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
        fieldgroup(DropDown; "Code", Description, Blocked)
        {
        }
    }
}
