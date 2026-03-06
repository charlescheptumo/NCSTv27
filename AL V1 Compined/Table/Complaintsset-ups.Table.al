#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Table 56026 "Complaints set-ups"
{

    fields
    {
        field(1; "Code"; Code[10])
        {
        }
        field(2; Type; Option)
        {
            OptionCaption = 'Complaint,Feedback,Suggestion,Complimemnt';
            OptionMembers = Complaint,Feedback,Suggestion,Complimemnt;
        }
        field(3; Description; Text[50])
        {
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
    }
}
