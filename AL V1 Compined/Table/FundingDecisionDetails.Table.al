#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Table 65044 "Funding Decision Details"
{
    Caption = 'Close Opportunity Code';
    DataCaptionFields = "Code", Description;
    DrillDownPageID = "Funding Decision Reasons List";
    LookupPageID = "Funding Decision Reasons List";

    fields
    {
        field(1; "Code"; Code[10])
        {
            Caption = 'Code';
            NotBlank = true;
            TableRelation = "Funding Decision Reasons";
        }
        field(2; "Decision Code"; Code[50])
        {
            DataClassification = ToBeClassified;
        }
        field(3; Description; Text[100])
        {
            Caption = 'Description';
        }
    }

    keys
    {
        key(Key1; "Code", "Decision Code")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
        fieldgroup(DropDown; "Code", "Decision Code")
        {
        }
    }
}
