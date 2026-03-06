#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Table 59077 "Registry File  Entry"
{

    fields
    {
        field(1; "Entry No"; Integer)
        {
            AutoIncrement = true;
            DataClassification = ToBeClassified;
        }
        field(2; "Global Dimension 1 Code"; Code[20])
        {
            CaptionClass = '1,1,1';
            DataClassification = ToBeClassified;
            TableRelation = "Dimension Value".Code where("Global Dimension No." = const(1));
        }
        field(3; "Global Dimension 2 Code"; Code[20])
        {
            CaptionClass = '1,1,2';
            DataClassification = ToBeClassified;
            TableRelation = "Dimension Value".Code where("Global Dimension No." = const(2));
        }
        field(4; Custody; Code[30])
        {
            Caption = 'Employee No';
            DataClassification = ToBeClassified;
            TableRelation = Employee."No." where(Status = const(Active),
                                                  "Global Dimension 1 Code" = field("Global Dimension 1 Code"));

            trigger OnValidate()
            begin
                Employees.Reset;
                Employees.SetRange("No.", Custody);
                if Employees.FindSet then
                    "Employee Name" := Employees."First Name" + ' ' + Employees."Last Name";
                "Assigned Employee" := Employees."User ID";
            end;
        }
        field(5; "Employee Name"; Text[250])
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(6; Status; Option)
        {
            DataClassification = ToBeClassified;
            Editable = false;
            OptionCaption = 'Open,Submitted,Assigned';
            OptionMembers = Open,Submitted,Assigned;
        }
        field(7; "Assigned Employee"; Code[50])
        {
            DataClassification = ToBeClassified;
            Editable = false;
            TableRelation = "User Setup"."User ID";

            trigger OnValidate()
            begin
                UserSetup.Reset;
                UserSetup.SetRange("User ID", "Assigned Employee");
                if UserSetup.FindSet then begin
                    Custody := UserSetup."Employee No.";
                    "Employee Name" := UserSetup."Employee Name";
                end;
            end;
        }
        field(8; "File No"; Code[50])
        {
            DataClassification = ToBeClassified;
        }
        field(9; Posted; Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(10; "Posted By"; Code[50])
        {
            DataClassification = ToBeClassified;
        }
        field(11; "Posted On"; DateTime)
        {
            DataClassification = ToBeClassified;
        }
    }

    keys
    {
        key(Key1; "Entry No", "File No")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }

    var
        Employees: Record Employee;
        UserSetup: Record "User Setup";
        RC: Record "Responsibility Center";
}
