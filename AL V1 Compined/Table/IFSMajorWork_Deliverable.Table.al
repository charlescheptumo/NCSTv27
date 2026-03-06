#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Table 70107 "IFS Major Work_Deliverable"
{

    fields
    {
        field(1; "Document No"; Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Standard Purchase Code".Code;
        }
        field(2; "Entry No"; Integer)
        {
            DataClassification = ToBeClassified;
        }
        field(3; "Major Activity Description"; Text[250])
        {
            DataClassification = ToBeClassified;
        }
    }

    keys
    {
        key(Key1; "Document No", "Entry No")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}
