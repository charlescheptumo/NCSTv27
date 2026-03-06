#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Table 70032 "Purchases Types"
{
    DrillDownPageID = "Purchases Types";
    LookupPageID = "Purchases Types";

    fields
    {
        field(1; "Purchase Type"; Code[20])
        {
        }
        field(2; "Purchase Type Description"; Text[150])
        {
        }
        field(3; Remarks; Text[150])
        {
        }
    }

    keys
    {
        key(Key1; "Purchase Type")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}
