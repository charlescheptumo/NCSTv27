#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Table 70004 "Votehead Types"
{
    // DrillDownPageID = UnknownPage51511879;
    //LookupPageID = UnknownPage51511879;

    fields
    {
        field(1; "Code"; Code[20])
        {
        }
        field(2; "Votehead Type"; Text[250])
        {
        }
        field(3; "Votehead Category Filter"; Code[20])
        {
            FieldClass = FlowFilter;
            TableRelation = "Votehead Category".Code;
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
        fieldgroup(DropDown; "Code", "Votehead Type")
        {
        }
    }
}
