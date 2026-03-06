#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Table 70137 "Proc Standing Committee Member"
{

    fields
    {
        field(1; "Document No."; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Procurement Standing Committee";
        }
        field(2; "Committee Type"; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Procurement Committee Types"."Committee Type";
        }
        field(3; "Line No"; Integer)
        {
            AutoIncrement = true;
            DataClassification = ToBeClassified;
        }
        field(4; Role; Option)
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
                        Designation := Emp."Job Title";
                        "ID/Passport No" := Emp."ID Number";
                        "Tax Registration (PIN) No." := Emp."P.I.N";
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
    }

    keys
    {
        key(Key1; "Document No.", "Committee Type", "Line No")
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
