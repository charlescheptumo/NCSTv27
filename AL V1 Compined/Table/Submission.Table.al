#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Table 70023 Submission
{

    fields
    {
        field(1; SubidID; Integer)
        {
            AutoIncrement = true;
        }
        field(2; CompID; Code[60])
        {
        }
        field(3; username; Text[100])
        {
        }
        field(4; TenderID; Code[70])
        {
            TableRelation = "Procurement Request".No where(No = field(TenderID));
        }
        field(5; Submitted; Boolean)
        {
        }
        field(6; namecomp; Text[150])
        {
        }
        field(7; SubmissionDate; DateTime)
        {
        }
        field(8; Companyname; Text[150])
        {
        }
        field(9; validated; Text[30])
        {
        }
        field(10; named2; Text[100])
        {
        }
        field(11; ENDDATE; Date)
        {
        }
        field(12; Downloaddate; DateTime)
        {
        }
        field(13; verifydate; DateTime)
        {
        }
    }

    keys
    {
        key(Key1; SubidID)
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}
