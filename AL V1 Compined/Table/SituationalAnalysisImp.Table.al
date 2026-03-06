#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Table 80026 "Situational Analysis Imp"
{

    fields
    {
        field(1; "Matrix ID"; Code[50])
        {
            DataClassification = ToBeClassified;
        }
        field(2; "Line No"; Integer)
        {
            DataClassification = ToBeClassified;
        }
        field(3; "Entry No"; Integer)
        {
            DataClassification = ToBeClassified;
        }
        field(4; Description; Text[255])
        {
            DataClassification = ToBeClassified;
        }
    }

    keys
    {
        key(Key1; "Matrix ID", "Line No", "Entry No")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}
