#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Table 55016 Blog_Replies
{

    fields
    {
        field(1; "Entry Id"; Integer)
        {
            AutoIncrement = true;
            DataClassification = ToBeClassified;
        }
        field(2; BlogIdCode; Integer)
        {
            DataClassification = ToBeClassified;
        }
        field(3; "Blog Reply"; Text[250])
        {
            DataClassification = ToBeClassified;
        }
        field(4; "Replier Name"; Text[250])
        {
            DataClassification = ToBeClassified;
        }
        field(5; "Replier DirNo"; Code[30])
        {
            DataClassification = ToBeClassified;
        }
        field(6; "Date Replied"; Date)
        {
            DataClassification = ToBeClassified;
        }
        field(7; "Time Replied"; Time)
        {
            DataClassification = ToBeClassified;
        }
    }

    keys
    {
        key(Key1; "Entry Id")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}
