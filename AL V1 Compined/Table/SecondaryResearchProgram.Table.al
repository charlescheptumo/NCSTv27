#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Table 65043 "Secondary Research Program"
{

    fields
    {
        field(1; "GFA No"; Code[50])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Grant Funding Application"."Application No";
        }
        field(2; "Research Center"; Code[50])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Responsibility Center" where("Operating Unit Type" = const(Department),
                                                           "Research Center?" = const(true));
        }
        field(3; "Research Program"; Code[100])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Research Center Programs"."Program Code" where("Center Code" = field("Research Center"));
        }
    }

    keys
    {
        key(Key1; "GFA No", "Research Center", "Research Program")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}
