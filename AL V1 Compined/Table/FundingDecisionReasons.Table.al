#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Table 65024 "Funding Decision Reasons"
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
        }
        field(2; Description; Text[50])
        {
            Caption = 'Description';
        }
        field(3; "No. of Grant Applications"; Integer)
        {
            CalcFormula = count("GFA Opportunity Entry" where("Close Opportunity Code" = field(Code)));
            Caption = 'No. of Grant Applications';
            Editable = false;
            FieldClass = FlowField;
        }
        field(4; Type; Option)
        {
            Caption = 'Type';
            OptionCaption = 'Succesful,Non Successful';
            OptionMembers = Won,Lost;
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
        fieldgroup(DropDown; "Code", Description, Type)
        {
        }
    }
}
