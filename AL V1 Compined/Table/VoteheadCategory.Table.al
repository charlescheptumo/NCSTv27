#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Table 70005 "Votehead Category"
{
    // DrillDownPageID = UnknownPage51511880;
    //LookupPageID = UnknownPage51511880;

    fields
    {
        field(1; "Votehead Type"; Code[20])
        {
            TableRelation = "Votehead Types";
        }
        field(2; "Code"; Code[20])
        {
            TableRelation = "G/L Account" where("Account Type" = const("Begin-Total"));

            trigger OnValidate()
            begin
                if GLAccount.Get(Code) then
                    "Votehead Category" := GLAccount.Name;
            end;
        }
        field(3; "Votehead Category"; Text[250])
        {
        }
    }

    keys
    {
        key(Key1; "Votehead Type", "Code")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
        fieldgroup(DropDown; "Votehead Type", "Code", "Votehead Category")
        {
        }
    }

    var
        GLAccount: Record "G/L Account";
}
