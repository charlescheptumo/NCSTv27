#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Table 69600 "Company Positions"
{
    DrillDownPageID = Positions;
    LookupPageID = Positions;

    fields
    {
        field(1; "Position ID"; Code[200])
        {
            NotBlank = true;
        }
        field(2; "Job Title"; Text[250])
        {
        }
        field(3; "Directly Reports To"; Code[30])
        {
            Caption = 'Hierarchically (Directly) Reports To';
            DataClassification = ToBeClassified;
            TableRelation = "Company Positions";

            trigger OnValidate()
            begin
                CompanyPositions.Reset;
                CompanyPositions.SetRange("Position ID", "Directly Reports To");
                if CompanyPositions.FindSet then begin
                    "Directly Reports des" := CompanyPositions."Job Title";

                end;
            end;
        }
        field(4; "Indirectly Reports To"; Code[30])
        {
            Caption = 'Functionally (Indirectly) Reports To';
            DataClassification = ToBeClassified;
            TableRelation = "Company Positions";
        }
        field(5; "Executive Summary/Job Purpose"; Text[300])
        {
            DataClassification = ToBeClassified;
        }
        field(6; "Designation Group"; Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Designation Groups";
        }
        field(7; "Job Grade ID"; Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Salary Scales";
        }
        field(8; "Overall Appointment Authority"; Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Responsibility Center".Code where("Operating Unit Type" = filter(Directorate), "Hierarchical  Level ID" = filter('Level 1'));
        }
        field(9; "Seniority Level"; Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = ',Entry-Level,Mid-Level,Senior Level,Executive';
            OptionMembers = ,"Entry-Level","Mid-Level","Senior Level",Executive;
        }
        field(10; "Default Terms of Service"; Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Terms of Service";
        }
        field(11; "Employment Type"; Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = 'Permanent,Contract,Casual,Secondment,Internship,Attachment,Volunteer';
            OptionMembers = Permanent,Contract,Casual,Secondment,Internship,Attachment,Volunteer;
        }
        field(12; Directorate; Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Responsibility Center" where("Operating Unit Type" = filter(Directorate));
        }
        field(13; Department; Code[30])
        {
            DataClassification = ToBeClassified;
            //muga
            //TableRelation = "Responsibility Center" where("Operating Unit Type" = filter("Department/Center"));
        }
        field(14; "Minimum Academic Qualification"; Code[30])
        {
            DataClassification = ToBeClassified;
            //muga
            // TableRelation = Qualification where("Qualification Category" = filter(Academic),
            //                                      Blocked = filter(false));

            // trigger OnValidate()
            // begin
            //     if Qualification.Get("Minimum Academic Qualification") then
            //         "Academic Hierarchy Code" := Qualification."Academic Hierachy Code";
            // end;
        }
        field(15; "Minimum Work Experience"; Integer)
        {
            DataClassification = ToBeClassified;
        }
        field(16; "Minimum Mngmnt Experience"; Integer)
        {
            Caption = 'Minimum Management Experience';
            DataClassification = ToBeClassified;
        }
        field(17; "Default Probation Period"; DateFormula)
        {
            DataClassification = ToBeClassified;
        }
        field(18; "Default Duty Station"; Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Duty Station";
        }
        field(19; "Effective Date"; Date)
        {
            DataClassification = ToBeClassified;
        }
        field(20; "Travel Frequency"; Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = 'None,Occassional,Frequent';
            OptionMembers = "None",Occassional,Frequent;
        }
        field(21; "Default Work Shift"; Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Employee Work Shift";

            trigger OnValidate()
            begin
                //   if EmployeeWorkShift.Get("Default Work Shift") then
                //    "Work Shift Description" := EmployeeWorkShift.Description;
            end;
        }
        field(22; "Work Shift Description"; Text[100])
        {
            DataClassification = ToBeClassified;
        }
        field(23; "Additional Responsibilities"; Boolean)
        {
            Caption = 'Additional Responsibilities may be added';
            DataClassification = ToBeClassified;
        }
        field(24; "Loc Relocation/Transfers"; Boolean)
        {
            Caption = 'Local Relocation/Transfers Apply';
            DataClassification = ToBeClassified;
        }
        field(25; "Int Relocation/Transfers"; Boolean)
        {
            Caption = 'International Relocation/Transfers Apply';
            DataClassification = ToBeClassified;
        }
        field(26; "Qualifies for Overtime"; Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(27; "Direct Hire Unit Cost"; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(28; "Average Monthly Salary (LCY)"; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(29; "Approved Establishment"; Integer)
        {
            DataClassification = ToBeClassified;
        }
        field(30; "No of Active Contracts"; Integer)
        {
            DataClassification = ToBeClassified;
        }
        field(31; "No. of Terminated Contracts"; Integer)
        {
            DataClassification = ToBeClassified;
        }
        field(32; "Dimension Set ID"; Integer)
        {
            DataClassification = ToBeClassified;

            trigger OnLookup()
            begin
                ShowDimensions;
            end;

            trigger OnValidate()
            begin
                DimMgt.UpdateGlobalDimFromDimSetID("Dimension Set ID", Directorate, Department);
            end;
        }
        field(33; Blocked; Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(34; "Academic Hierarchy Code"; Integer)
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(35; "Directly Reports des"; Text[250])
        {
            DataClassification = ToBeClassified;
        }
        field(36; "Current Head email"; Text[100])
        {
        }
    }

    keys
    {
        key(Key1; "Position ID")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
        fieldgroup(DropDown; "Position ID", "Job Title")
        {
        }
    }

    var
        NoOfPosts: Decimal;
        HREmp: Record Employee;
        SalaryScales: Record "Salary Scales";
        // EmployeeWorkShift: Record "Employee Work Shift";
        DimMgt: Codeunit DimensionManagement;
        Qualification: Record Qualification;
        CompanyPositions: Record "Company Positions";

    procedure ShowDimensions()
    var
        DimMgt: Codeunit DimensionManagement;
    begin
        DimMgt.ShowDimensionSet("Dimension Set ID", StrSubstNo('%1 %2', TableCaption, "Position ID"));
    end;
}

