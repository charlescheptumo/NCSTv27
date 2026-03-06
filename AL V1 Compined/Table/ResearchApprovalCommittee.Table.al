#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Table 65014 "Research Approval Committee"
{

    fields
    {
        field(1; "Contact  ID"; Code[50])
        {
            DataClassification = ToBeClassified;
            TableRelation = Contact;
        }
        field(2; Name; Text[100])
        {
            DataClassification = ToBeClassified;
        }
        field(3; "Core Mandate"; Text[100])
        {
            DataClassification = ToBeClassified;
        }
        field(4; "No of Research Submissions"; Decimal)
        {
        }
    }

    keys
    {
        key(Key1; "Contact  ID")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}
