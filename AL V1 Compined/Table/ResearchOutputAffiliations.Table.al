#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Table 65012 "Research Output Affiliations"
{
    DrillDownPageID = "Research Collaboration List";
    LookupPageID = "Research Collaboration List";

    fields
    {
        field(1; "Research Output ID"; Code[50])
        {
            DataClassification = ToBeClassified;
        }
        field(2; "Contact ID"; Code[50])
        {
            DataClassification = ToBeClassified;
            TableRelation = Contact;
        }
        field(3; "Affiliation Details"; Text[150])
        {
            DataClassification = ToBeClassified;
        }
    }

    keys
    {
        key(Key1; "Research Output ID", "Contact ID")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}
