#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Table 56063 "ICT Asset Category"
{
    DrillDownPageID = "ICT Category";
    LookupPageID = "ICT Category";

    fields
    {
        field(1; "Code"; Code[10])
        {
            DataClassification = ToBeClassified;
        }
        field(2; Name; Text[250])
        {
            DataClassification = ToBeClassified;
        }
        field(3; "FA Class Code"; Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = "FA Class".Code;
        }
        field(4; "FA SubClass"; Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = "FA Subclass".Code where("FA Class Code" = field("FA Class Code"));
        }
        field(5; Category; Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = ' ,Hardware,Software';
            OptionMembers = " ",Hardware,Software;
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
