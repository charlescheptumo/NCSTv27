#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Table 65032 "AdminTeam Members"
{
    Caption = 'AdminTeam Members';

    fields
    {
        field(1; "Team Code"; Code[10])
        {
            Caption = 'Team Code';
            NotBlank = true;
            TableRelation = "Grant Admin Team".Code;
        }
        field(2; "Admin Code"; Code[20])
        {
            Caption = 'Admin Code';
            NotBlank = true;
            TableRelation = Resource."No." where(Admin = const(true));
        }
        field(3; "Team Name"; Text[50])
        {
            CalcFormula = lookup(Team.Name where(Code = field("Team Code")));
            Caption = 'Team Name';
            Editable = false;
            FieldClass = FlowField;
        }
        field(4; "Admin Name"; Text[50])
        {
            CalcFormula = lookup(Resource.Name where("No." = field("Admin Code"),
                                                      Admin = const(true)));
            Caption = 'Admin Name';
            Editable = false;
            FieldClass = FlowField;
        }
    }

    keys
    {
        key(Key1; "Team Code", "Admin Code")
        {
            Clustered = true;
        }
        key(Key2; "Admin Code")
        {
        }
    }

    fieldgroups
    {
    }
}
