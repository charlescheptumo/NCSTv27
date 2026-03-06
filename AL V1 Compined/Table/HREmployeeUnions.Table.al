#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Table 69120 "HR Employee Unions"
{
    //LookupPageID = UnknownPage69145;

    fields
    {
        field(1; "Employee No."; Code[20])
        {
            TableRelation = Employee."No.";

            trigger OnValidate()
            begin
                OK := Employee.Get("Employee No.");
                if OK then begin
                    "Employee First Name" := Employee."Known As";
                    "Employee Last Name" := Employee."Last Name";
                end;
            end;
        }
        field(2; "Union Name"; Code[20])
        {
            TableRelation = "HR Union Names".Code;
        }
        field(3; "Shop Steward"; Text[150])
        {
        }
        field(4; "Union Join Date"; Date)
        {
        }
        field(5; "Union Number"; Text[150])
        {
        }
        field(11; "Union Contact Number"; Text[20])
        {
        }
        field(12; "Union Contact Are Code"; Text[10])
        {
        }
        field(13; "Union Contact Person"; Text[150])
        {
        }
        field(14; "Employee First Name"; Text[30])
        {
            CalcFormula = lookup(Employee."Known As" where("No." = field("Employee No.")));
            FieldClass = FlowField;
        }
        field(15; "Employee Last Name"; Text[30])
        {
            CalcFormula = lookup(Employee."Last Name" where("No." = field("Employee No.")));
            FieldClass = FlowField;
        }
        field(16; Comment; Boolean)
        {
            Editable = false;
            FieldClass = Normal;
        }
    }

    keys
    {
        key(Key1; "Employee No.")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }

    trigger OnInsert()
    begin
        OK := Employee.Get("Employee No.");
        if OK then begin
            "Employee First Name" := Employee."Known As";
            "Employee Last Name" := Employee."Last Name";
        end;
    end;

    var
        Employee: Record Employee;
        OK: Boolean;
}
