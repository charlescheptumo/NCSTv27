#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Table 69024 "Advance Payment"
{

    fields
    {
        field(2; Date; Date)
        {
        }
        field(3; "Employee No."; Code[20])
        {
            TableRelation = Employee;
        }
        field(4; Amount; Decimal)
        {
        }
        field(5; "First Name"; Text[30])
        {
            CalcFormula = lookup(Employee."First Name" where("No." = field("Employee No.")));
            Caption = 'First Name';
            FieldClass = FlowField;
        }
        field(6; "Middle Name"; Text[30])
        {
            CalcFormula = lookup(Employee."Middle Name" where("No." = field("Employee No.")));
            Caption = 'Middle Name';
            FieldClass = FlowField;
        }
        field(7; "Last Name"; Text[30])
        {
            CalcFormula = lookup(Employee."Last Name" where("No." = field("Employee No.")));
            Caption = 'Last Name';
            FieldClass = FlowField;
        }
    }

    keys
    {
        key(Key1; Date, "Employee No.")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}
