#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Table 69223 "Training Applications Group"
{
    // DrillDownPageID = UnknownPage39005690;
    //LookupPageID = UnknownPage39005690;

    fields
    {
        field(1; "Line No."; Integer)
        {
            AutoIncrement = true;
        }
        field(2; "Application No."; Code[20])
        {
        }
        field(3; "Employee No."; Code[20])
        {
            Editable = false;
            TableRelation = Employee."No." where(Status = const(Active));

            trigger OnValidate()
            begin
                HREmployees.Reset;
                if HREmployees.Get("Employee No.") then begin
                    Name := HREmployees.FullName;
                    "Job Title" := HREmployees.Position;
                    "Job Description" := HREmployees."Job Title";
                end else begin
                    Name := '';
                    "Job Title" := '';
                    "Job Description" := '';
                end;
            end;
        }
        field(4; Name; Text[50])
        {
        }
        field(5; Objectives; Text[250])
        {
        }
        field(6; "Job Title"; Code[10])
        {
        }
        field(7; "Job Description"; Text[50])
        {
        }
        field(8; Notified; Boolean)
        {
        }
        field(9; Suggested; Boolean)
        {
            Editable = false;
        }
        field(10; Attended; Boolean)
        {
        }
    }

    keys
    {
        key(Key1; "Line No.")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }

    var
        HREmployees: Record Employee;
}
