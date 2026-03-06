#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Table 70179 "Bid Evaluation Committee"
{

    fields
    {
        field(1; "Document No."; Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(2; "Line No"; Integer)
        {
            AutoIncrement = true;
            DataClassification = ToBeClassified;
        }
        field(3; "Appointed Bid Opening Com"; Code[30])
        {
            Caption = 'Appointed Bid Opening Committee';
            DataClassification = ToBeClassified;
            Description = 'Appointed Bid Opening Committee';
        }
        field(4; "Role Type"; Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = 'Member,Chairperson,Secretary,Consultant';
            OptionMembers = Member,Chairperson,Secretary,Consultant;
        }
        field(5; "Member No."; Code[30])
        {
            DataClassification = ToBeClassified;
            Description = 'Linked to Resource Table (This shall support definition of both staff and non-staff (e.g. Experts and Consultants) who form the committee';
            TableRelation = Resource."No.";

            trigger OnValidate()
            begin
                Resources.Get;
                Resources.SetRange("No.", "Member No.");
                if Resources.FindSet then begin
                    "Member Name" := Resources.Name;
                    Emp.Reset;
                    Emp.SetRange("No.", "Member No.");
                    if Emp.FindSet then begin
                        "Staff  No." := Emp."No.";
                    end;

                end;
            end;
        }
        field(6; "Member Name"; Text[60])
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(7; Designation; Text[60])
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(8; "ID/Passport No"; Code[30])
        {
            DataClassification = ToBeClassified;
        }
        field(9; "Tax Registration (PIN) No."; Code[30])
        {
            DataClassification = ToBeClassified;
        }
        field(10; Email; Text[80])
        {
            DataClassification = ToBeClassified;
        }
        field(11; "Telephone No."; Text[50])
        {
            DataClassification = ToBeClassified;
        }
        field(12; "Staff  No."; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = Employee;

            trigger OnValidate()
            begin
                Emp.Reset;
                Emp.SetRange("No.", "Staff  No.");
                if Emp.FindSet then begin
                    Emp.CalcFields("Job Title");
                    Designation := Emp."Job Title";
                    "ID/Passport No" := Emp."ID Number";
                    "Tax Registration (PIN) No." := Emp."P.I.N";
                end;
            end;
        }
        field(13; "IFS Code"; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Standard Purchase Code".Code;
        }
        field(14; "Notified on Email"; Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(15; "Date/Time Notified"; DateTime)
        {
            DataClassification = ToBeClassified;
        }
        field(16; Type; Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = 'Bid Opening,Evaluation';
            OptionMembers = "Bid Opening",Evaluation;
        }
    }

    keys
    {
        key(Key1; "Document No.", "Line No")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }

    var
        ProcurementSetup: Record "Procurement Setup";
        NoMgt: Codeunit "No. Series";
        Resources: Record Resource;
        Emp: Record Employee;
}
