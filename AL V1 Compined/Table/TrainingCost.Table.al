#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Table 69222 "Training Cost"
{

    fields
    {
        field(1; "Training ID"; Code[50])
        {
            Editable = false;
        }
        field(2; "Cost Item"; Code[30])
        {
            TableRelation = "HR Models".Code where(Type = filter("Training Item Cost"));
        }
        field(3; Cost; Decimal)
        {
        }
        field(4; "Cost Item Description"; Text[100])
        {
        }
    }

    keys
    {
        key(Key1; "Training ID", "Cost Item")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}
