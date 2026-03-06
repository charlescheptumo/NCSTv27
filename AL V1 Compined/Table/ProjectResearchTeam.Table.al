#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Table 65020 "Project Research Team"
{
    Caption = 'Project Research Team';
    DrillDownPageID = "Project Research Team List";
    LookupPageID = "Project Research Team List";

    fields
    {
        field(1; "Entry No"; Integer)
        {
            AutoIncrement = true;
            DataClassification = ToBeClassified;
        }
        field(2; "Job No"; Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = Job;

            trigger OnValidate()
            begin
                if Project.Get("Job No") then begin
                    "Project Name" := Project.Description;
                end;
            end;
        }
        field(3; "Project Name"; Text[200])
        {
            DataClassification = ToBeClassified;
        }
        field(4; "Researcher ID"; Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = Resource where("Researcher?" = filter(true));

            trigger OnValidate()
            begin
                if Researcher.Get("Researcher ID") then begin
                    Name := Researcher.Name;
                end;
            end;
        }
        field(5; Name; Code[100])
        {
            DataClassification = ToBeClassified;
        }
        field(6; "Primary Role"; Code[50])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Research Team Roles";

            trigger OnValidate()
            begin
                if RTMRoles.Get("Primary Role") then begin
                    "Role Description" := RTMRoles.Description;
                end;
            end;
        }
        field(7; "Role Description"; Code[200])
        {
            DataClassification = ToBeClassified;
        }
        field(8; "Start Date"; Date)
        {
            DataClassification = ToBeClassified;
        }
        field(9; "End Date"; Date)
        {
            DataClassification = ToBeClassified;
        }
        field(10; Blocked; Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(11; "Default Payment Mentod"; Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = 'Payroll,Vendor Invoice';
            OptionMembers = Payroll,"Vendor Invoice";
        }
    }

    keys
    {
        key(Key1; "Entry No", "Job No", "Researcher ID")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }

    var
        Project: Record Job;
        Researcher: Record Resource;
        RTMRoles: Record "Research Team Roles";
}
