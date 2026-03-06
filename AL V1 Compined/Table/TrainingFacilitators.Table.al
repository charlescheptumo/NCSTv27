#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Table 69128 "Training Facilitators"
{

    fields
    {
        field(1; "Training Need"; Code[20])
        {
            NotBlank = true;
            TableRelation = "Training Needs"."No.";
        }
        field(2; "Code"; Code[20])
        {
            NotBlank = true;
            TableRelation = Employee."No.";

            trigger OnValidate()
            begin
                Employees.Reset;
                if Employees.Get(Code) then
                    Names := Employees."First Name" + ' ' + Employees."Middle Name" + ' ' + Employees."Last Name";
            end;
        }
        field(3; Names; Text[200])
        {
        }
        field(4; Remarks; Text[200])
        {
        }
    }

    keys
    {
        key(Key1; "Training Need", "Code")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }

    var
        Employees: Record Employee;
}
