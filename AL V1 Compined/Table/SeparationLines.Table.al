#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Table 69046 "Separation Lines"
{

    fields
    {
        field(1; "Employee No"; Code[20])
        {
        }
        field(2; "Line No"; Integer)
        {
        }
        field(3; "Item Description"; Text[80])
        {
        }
        field(4; Cleared; Boolean)
        {
        }
        field(5; "Cleared Date"; Date)
        {
        }
        field(6; "Department Code"; Code[10])
        {
            TableRelation = "Dimension Value".Code where("Global Dimension No." = const(1));
        }
        field(7; Remarks; Text[80])
        {
        }
    }

    keys
    {
        key(Key1; "Employee No", "Line No")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}
