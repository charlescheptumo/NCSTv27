#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Table 69639 "Commitee Appointed Member"
{

    fields
    {
        field(1; "Document No."; Code[30])
        {
            DataClassification = ToBeClassified;
        }
        field(2; "Document Type"; Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = 'Appointment,Termination';
            OptionMembers = Appointment,Termination;
        }
        field(3; "Line No"; Integer)
        {
            AutoIncrement = true;
            DataClassification = ToBeClassified;
        }
        field(4; "Member No."; Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = Resource."No." where(Type = const(Person));

            trigger OnValidate()
            begin
                Resource.Reset;
                Resource.SetRange("No.", "Member No.");
                if Resource.FindSet then begin
                    Employee.Reset;
                    Employee.SetRange("No.", Resource."No.");
                    if Employee.FindSet then begin
                        "Member Name" := Employee."First Name" + ' ' + Employee."Middle Name" + ' ' + Employee."Last Name";
                        "Member Email" := Employee."E-Mail";
                        "Telephone No." := Employee."Phone No.";
                        "Staff No." := Employee."No.";
                        "ID/Passport No" := Employee."ID Number";
                        // Employee.CalcFields("Job Title");
                        Designation := Employee."Job Title";
                        "Tax Registration (PIN) No." := Employee."PIN Number";

                    end;
                end;
            end;
        }
        field(5; Role; Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = 'Member,Chairperson,Secretary,Consultant';
            OptionMembers = Member,Chairperson,Secretary,Consultant;
        }
        field(6; "Member Name"; Text[50])
        {
            DataClassification = ToBeClassified;
        }
        field(7; "Member Email"; Text[50])
        {
            DataClassification = ToBeClassified;
            ExtendedDatatype = EMail;
        }
        field(8; "Telephone No."; Text[30])
        {
            DataClassification = ToBeClassified;
            ExtendedDatatype = PhoneNo;
        }
        field(9; Designation; Text[100])
        {
            DataClassification = ToBeClassified;
        }
        field(10; "Staff No."; Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = Employee;

            trigger OnValidate()
            begin
                Employee.Reset;
                Employee.SetRange("No.", "Staff No.");
                if Employee.FindFirst then begin
                    "ID/Passport No" := Employee."ID Number";
                    "Member Name" := Employee."First Name" + ' ' + Employee."Middle Name" + ' ' + Employee."Last Name";
                    "Member Email" := Employee."E-Mail";
                end
            end;
        }
        field(11; "ID/Passport No"; Code[15])
        {
            DataClassification = ToBeClassified;
        }
        field(12; "Tax Registration (PIN) No."; Code[15])
        {
            DataClassification = ToBeClassified;
        }
        field(13; "Notified on Email"; Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(14; "Date/Time Notified"; DateTime)
        {
            DataClassification = ToBeClassified;
        }
        field(15; "Effective Date"; Date)
        {
            DataClassification = ToBeClassified;
        }
        field(16; "Expiry Date"; Date)
        {
            DataClassification = ToBeClassified;
        }
    }

    keys
    {
        key(Key1; "Document No.", "Member No.", "Document Type")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }

    var
        Employee: Record Employee;
        Resource: Record Resource;
}

