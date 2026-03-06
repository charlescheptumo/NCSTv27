#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Table 70041 "Procurement Evaluators"
{

    fields
    {
        field(1; tenderno; Code[20])
        {
        }
        field(2; "Evaluator 1"; Code[50])
        {
            TableRelation = "User Setup";
        }
        field(3; "Evaluator 2"; Code[50])
        {
            TableRelation = "User Setup";
        }
        field(4; "Evaluator 3"; Code[50])
        {
            TableRelation = "User Setup";
        }
        field(5; "Evaluator 5"; Code[50])
        {
            TableRelation = "User Setup";
        }
        field(6; "Evaluator 6"; Code[50])
        {
            TableRelation = "User Setup";
        }
        field(7; "Evaluator 7"; Code[50])
        {
            TableRelation = "User Setup";
        }
        field(8; "Evaluator 8"; Code[50])
        {
            TableRelation = "User Setup";
        }
        field(9; "Evaluator 4"; Code[50])
        {
            TableRelation = "User Setup";
        }
    }

    keys
    {
        key(Key1; tenderno)
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}
