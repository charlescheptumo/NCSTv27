#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Table 57010 "Execution Plan"
{

    fields
    {
        field(1; "Imprest Memo No."; Code[20])
        {
            TableRelation = "Imprest Memo";
        }
        field(2; Period; Code[20])
        {
        }
        field(3; Activity; Text[100])
        {
        }
        field(4; Duration; DateFormula)
        {
        }
        field(5; Output; Text[150])
        {
        }
        field(6; "Task No."; Code[20])
        {
            TableRelation = "Job Task"."Job Task No." where("Job Task Type" = const(Posting));
        }
    }

    keys
    {
        key(Key1; "Imprest Memo No.", Period)
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}
