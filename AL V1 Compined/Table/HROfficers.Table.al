#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Table 69664 "HR Officers"
{

    fields
    {
        field(1;"Employee No.";Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = Employee where (Status=filter(Active));

            trigger OnValidate()
            begin
                if Employee.Get("Employee No.") then
                  begin
                    "First Name":=Employee."First Name";
                    "Last Name":=Employee."Last Name";
                    "Middle Name":=Employee."Middle Name";
                    Status:=Employee.Status;
                  end
            end;
        }
        field(2;"First Name";Text[30])
        {
            DataClassification = ToBeClassified;
        }
        field(3;"Last Name";Text[30])
        {
            DataClassification = ToBeClassified;
        }
        field(4;"Middle Name";Text[30])
        {
            DataClassification = ToBeClassified;
        }
        field(5;Status;Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = 'Active,Inactive,Terminated';
            OptionMembers = Active,Inactive,Terminated;
        }
    }

    keys
    {
        key(Key1;"Employee No.")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }

    var
        Employee: Record Employee;
}

