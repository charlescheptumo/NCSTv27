#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Table 69042 "Training Evaluation Lines 1"
{

    fields
    {
        field(1; "Line No"; Integer)
        {
        }
        field(2; Question; Text[250])
        {
        }
        field(3; "Evaluation No"; Code[20])
        {
        }
        field(4; Answer; Option)
        {
            OptionMembers = " ",Excellent,Good,Fair,Poor;
        }
        field(5; Bold; Boolean)
        {
        }
        field(6; "Answer Type"; Option)
        {
            OptionMembers = " ",Selection,Narrative;
        }
    }

    keys
    {
        key(Key1; "Line No", "Evaluation No")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}
