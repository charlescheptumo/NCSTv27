#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Table 69138 "Disciplinary Case Ratings"
{
    //LookupPageID = UnknownPage69176;

    fields
    {
        field(1; "Code"; Code[50])
        {
            NotBlank = true;
        }
        field(2; Description; Text[100])
        {
        }
        field(3; Comments; Text[200])
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
