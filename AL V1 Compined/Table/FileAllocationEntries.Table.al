#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Table 59081 "File Allocation Entries"
{

    fields
    {
        field(1; "Entry No"; Integer)
        {
            AutoIncrement = true;
            DataClassification = ToBeClassified;
        }
        field(2; "Document No"; Code[50])
        {
            DataClassification = ToBeClassified;
        }
        field(3; "File No"; Code[50])
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(4; "Assign User ID"; Code[50])
        {
            DataClassification = ToBeClassified;
        }
        field(5; "Employee No"; Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = Employee."No." where(Status = const(Active));

            trigger OnValidate()
            begin
                Employee.Reset;
                Employee.SetRange("No.", "Employee No");
                if Employee.FindSet then
                    "Employee Name" := Employee."First Name" + ' ' + Employee."Last Name";
                "Assign User ID" := Employee."User ID";
            end;
        }
        field(6; "Employee Name"; Text[250])
        {
            DataClassification = ToBeClassified;
        }
        field(7; Posted; Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(8; "Posted By"; Code[50])
        {
            DataClassification = ToBeClassified;
        }
        field(9; "Posted On"; DateTime)
        {
            DataClassification = ToBeClassified;
        }
        field(10; "File Name"; Text[250])
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(11; "Folio No"; Code[30])
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(12; "Folio Name"; Text[250])
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(13; Remarks; Text[2000])
        {
            DataClassification = ToBeClassified;
        }
    }

    keys
    {
        key(Key1; "Entry No", "Document No")
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
