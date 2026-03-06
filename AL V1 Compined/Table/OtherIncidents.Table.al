#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Table 69142 "Other Incidents"
{

    fields
    {
        field(1; "Employee No"; Code[20])
        {
            NotBlank = true;
            TableRelation = Employee."No.";
        }
        field(2; "Incident Date"; Date)
        {
            NotBlank = true;
        }
        field(3; Incident; Text[200])
        {
            NotBlank = true;
        }
        field(4; Comments; Text[250])
        {
        }
    }

    keys
    {
        key(Key1; "Employee No", "Incident Date", Incident)
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}
