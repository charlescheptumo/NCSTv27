#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Table 69609 "Establishment Planning Line"
{
    //DrillDownPageID = "Establishment Planning Lines";
    //LookupPageID = "Establishment Planning Lines";

    fields
    {
        field(1; "Entry No."; Integer)
        {
            AutoIncrement = true;
            DataClassification = ToBeClassified;
        }
        field(2; "Task No"; Integer)
        {
            DataClassification = ToBeClassified;

            trigger OnValidate()
            begin
                if StaffEstablishmentTaskLines.Get("Task No") then begin
                    "No. of Active Employees" := StaffEstablishmentTaskLines."Actual Active";
                    "Position ID" := StaffEstablishmentTaskLines."Job ID";
                end
            end;
        }
        field(3; "Primary Key"; Code[30])
        {
            DataClassification = ToBeClassified;
        }
        field(4; "Position ID"; Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Company Positions";

            trigger OnValidate()
            begin
                if CompanyPositions.Get("Position ID") then begin
                    "Department Code" := CompanyPositions.Department;
                    "Directorate Code" := CompanyPositions.Directorate;
                    "Job Title/Designation" := CompanyPositions."Job Title";

                end
            end;
        }
        field(5; "Job Title/Designation"; Text[100])
        {
            Editable = false;
        }
        field(6; "Department Code"; Code[20])
        {
            DataClassification = ToBeClassified;
            //muga
            //TableRelation = "Responsibility Center".Code where("Operating Unit Type" = filter("Department/Center"));
        }
        field(7; "Directorate Code"; Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Responsibility Center".Code where("Operating Unit Type" = filter(Directorate));
        }
        field(8; "Optimal Staffing"; Integer)
        {
            DataClassification = ToBeClassified;
        }
        field(9; "No. of Active Employees"; Integer)
        {
            //muga
            //CalcFormula = count(Employee where("Current Position ID" = field("Position ID")));
            Editable = true;
            FieldClass = FlowField;
        }
        field(10; Justification; Text[100])
        {
            DataClassification = ToBeClassified;
        }
        field(11; "Dimension Set ID"; Code[30])
        {
            DataClassification = ToBeClassified;
        }
        field(12; "Region Code"; Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Responsibility Center".Code where("Operating Unit Type" = filter(Region));
        }
        field(13; "Duty Station ID"; Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Duty Station";

            trigger OnValidate()
            begin
                if DutyStation.Get("Duty Station ID") then begin
                    "Work Location Details" := DutyStation.Description;
                    "Region Code" := DutyStation."Region ID";
                end
            end;
        }
        field(14; "Work Location Details"; Text[300])
        {
            DataClassification = ToBeClassified;
        }
        field(15; "Designation Group"; Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Designation Groups";
        }
        field(16; Blcoked; Boolean)
        {
            DataClassification = ToBeClassified;
        }
    }

    keys
    {
        key(Key1; "Entry No.", "Task No", "Position ID")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
        fieldgroup(DropDown; "Position ID", "Department Code", "Optimal Staffing")
        {
        }
    }

    var
        Employee: Record Employee;
        OK: Boolean;
        TrainingNeeds: Record "Advertisement Channels";
        Qualifications: Record Qualification;
        EmpQualifications: Record "Employee Qualification";
        TrainingReq: Record "Training Request";
        StaffEstablishmentTaskLines: Record "Staff Establishment Task Lines";
        CompanyPositions: Record "Company Positions";
        DutyStation: Record "Duty Station";
}

