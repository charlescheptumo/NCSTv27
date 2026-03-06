#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Table 70006 Voteheads
{
    // DrillDownPageID = UnknownPage51511881;
    //LookupPageID = UnknownPage51511881;

    fields
    {
        field(1; "Votehead Type"; Code[20])
        {
            TableRelation = "Votehead Types";
        }
        field(2; "Votehead Category"; Code[20])
        {
            TableRelation = "Votehead Category".Code;
        }
        field(3; "Code"; Code[20])
        {
        }
        field(4; "Votehead Description"; Text[250])
        {
        }
        field(5; "G/L Account"; Code[20])
        {
            TableRelation = "G/L Account" where("Account Type" = const(Posting));
        }
    }

    keys
    {
        key(Key1; "Votehead Type", "Votehead Category", "Code")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
        fieldgroup(DropDown; "Votehead Type", "Votehead Category", "Code", "Votehead Description")
        {
        }
    }
}
