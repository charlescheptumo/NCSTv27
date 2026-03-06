#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Table 69121 "Document Link"
{

    fields
    {
        field(1; "Employee No"; Code[20])
        {
            NotBlank = true;
            TableRelation = Employee."No.";
        }
        field(2; "Document Description"; Text[100])
        {
            NotBlank = true;
        }
        field(3; "Document Link"; Text[200])
        {
        }
        field(5; ggg; Text[30])
        {
        }
        field(6; "Attachment No."; Integer)
        {
        }
        field(7; "Language Code (Default)"; Code[10])
        {
            TableRelation = Language;
        }
        field(8; Attachement; Option)
        {
            OptionMembers = No,Yes;
        }
    }

    keys
    {
        key(Key1; "Employee No", "Document Description")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}
