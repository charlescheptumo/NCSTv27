#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Table 80006 "Organization Hierarchy"
{

    fields
    {
        field(1; Level; Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = ' ,Level 1,Level 2,Level 3,Level 4,Level 5';
            OptionMembers = " ","Level 1","Level 2","Level 3","Level 4","Level 5";
        }
        field(2; Description; Text[50])
        {
            DataClassification = ToBeClassified;
        }
    }

    keys
    {
        key(Key1; Level)
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}
