#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Table 69107 "Position Supervisedx"
{

    fields
    {
        field(1; "Job ID"; Code[20])
        {
            NotBlank = true;
            TableRelation = "Company Jobs"."Job ID";
        }
        field(2; "Position Supervised"; Code[20])
        {
            NotBlank = true;
            TableRelation = "Company Jobs"."Job ID";

            trigger OnValidate()
            begin
                if Jobs.Get("Position Supervised") then
                    Description := Jobs."Job Description";
            end;
        }
        field(3; Description; Text[250])
        {
        }
        field(4; Remarks; Text[250])
        {
        }
    }

    keys
    {
        key(Key1; "Job ID", "Position Supervised")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }

    var
        Jobs: Record "Company Jobs";
}
