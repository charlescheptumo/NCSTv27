#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Table 59101 "Rules & Regulations"
{

    fields
    {
        field(1; "Code"; Code[20])
        {
        }
        field(2; Date; Date)
        {
        }
        field(3; "Rules & Regulations"; Text[250])
        {
        }
        field(4; "Document Link"; Text[200])
        {
        }
        field(5; Remarks; Text[200])
        {
            NotBlank = true;
        }
        field(6; "Language Code (Default)"; Code[10])
        {
        }
        field(7; Attachement; Option)
        {
            OptionMembers = No,Yes;
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
    }
}
