#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Table 55716 "Recruitment Planning Lines"
{

    fields
    {
        field(1; "Recruitment Plan ID"; Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Recruitment Plan";

            trigger OnValidate()
            begin
                RecruitmentPlan.Reset;
                RecruitmentPlan.SetRange("Document No.", Rec."Recruitment Plan ID");
                if RecruitmentPlan.FindFirst then begin
                    "Recruitment Plan Type" := RecruitmentPlan."Recruitment Plan Type";
                    if RecruitmentPlan."Recruitment Plan Type" = RecruitmentPlan."recruitment plan type"::"Functional Plan" then begin
                        //auto-populate department
                        Employee.Reset;
                        Employee.SetRange("User ID", RecruitmentPlan."Created BY");
                        if Employee.FindFirst then begin
                            Department := Employee."Department Code";
                            Directorate := Employee."Directorate Code";
                        end;
                    end;
                end;
            end;
        }
        field(2; "Position ID"; Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Establishment Planning Line"."Position ID";// where("Department Code" = field(Department),
                                                                        // Blcoked = const(false));

            trigger OnValidate()
            begin
                RecruitmentPlan.Reset;
                RecruitmentPlan.SetRange("Document No.", "Recruitment Plan ID");
                if RecruitmentPlan.FindSet then begin
                    if RecruitmentPlan."Recruitment Plan Type" = RecruitmentPlan."recruitment plan type"::"Special Recruitment"
                        then begin
                        CompanyPositions.Reset;
                        CompanyPositions.SetRange("Position ID", Rec."Position ID");
                        if CompanyPositions.FindFirst then begin
                            "Job Title/Designation" := CompanyPositions."Job Title";
                            "Job Grade ID" := CompanyPositions."Job Grade ID";
                            "Duty Station ID" := CompanyPositions."Default Duty Station";
                            "Average Monthly Salary (LCY)" := CompanyPositions."Average Monthly Salary (LCY)";
                            "Current Headcount" := CompanyPositions."No of Active Contracts";
                            "Staff Establishment" := CompanyPositions."Approved Establishment";
                            "Hierarchically Reports To" := CompanyPositions."Directly Reports To";
                            "Functionally  Reports To" := CompanyPositions."Indirectly Reports To";
                        end;
                    end;
                    if RecruitmentPlan."Recruitment Plan Type" = RecruitmentPlan."recruitment plan type"::"Functional Plan"
                       then begin
                        PlanningLine.Reset;
                        PlanningLine.SetRange("Position ID", "Position ID");
                        PlanningLine.SetRange("Department Code", Department);
                        if PlanningLine.FindSet then begin
                            CompanyPositions.Reset;
                            CompanyPositions.SetRange("Position ID", "Position ID");
                            if CompanyPositions.FindFirst then begin
                                "Job Title/Designation" := CompanyPositions."Job Title";
                                "Job Grade ID" := CompanyPositions."Job Grade ID";
                                "Duty Station ID" := CompanyPositions."Default Duty Station";
                                "Average Monthly Salary (LCY)" := CompanyPositions."Average Monthly Salary (LCY)";
                                "Current Headcount" := CompanyPositions."No of Active Contracts";
                                "Staff Establishment" := CompanyPositions."Approved Establishment";
                                "Hierarchically Reports To" := CompanyPositions."Directly Reports To";
                                "Functionally  Reports To" := CompanyPositions."Indirectly Reports To";
                            end;
                            PlanningLine.CalcFields("No. of Active Employees");
                            "Job Title/Designation" := PlanningLine."Job Title/Designation";
                            "Staff Establishment" := PlanningLine."Optimal Staffing";
                            "Current Headcount" := PlanningLine."No. of Active Employees";
                            Department := PlanningLine."Department Code";
                            Directorate := PlanningLine."Directorate Code";
                            "Duty Station ID" := PlanningLine."Duty Station ID";
                            "Work Location Details" := PlanningLine."Work Location Details";

                        end;
                    end;
                    if RecruitmentPlan."Recruitment Plan Type" = RecruitmentPlan."recruitment plan type"::"Annual HR Plan"
                        then begin
                        PlanningLine.Reset;
                        PlanningLine.SetRange("Position ID", "Position ID");
                        if PlanningLine.FindSet then begin
                            CompanyPositions.Reset;
                            CompanyPositions.SetRange("Position ID", "Position ID");
                            if CompanyPositions.FindFirst then begin
                                "Job Title/Designation" := CompanyPositions."Job Title";
                                "Job Grade ID" := CompanyPositions."Job Grade ID";
                                "Duty Station ID" := CompanyPositions."Default Duty Station";
                                "Average Monthly Salary (LCY)" := CompanyPositions."Average Monthly Salary (LCY)";
                                "Current Headcount" := CompanyPositions."No of Active Contracts";
                                "Staff Establishment" := CompanyPositions."Approved Establishment";
                                "Hierarchically Reports To" := CompanyPositions."Directly Reports To";
                                "Functionally  Reports To" := CompanyPositions."Indirectly Reports To";
                            end;
                            PlanningLine.CalcFields("No. of Active Employees");
                            "Job Title/Designation" := PlanningLine."Job Title/Designation";
                            "Staff Establishment" := PlanningLine."Optimal Staffing";
                            "Current Headcount" := PlanningLine."No. of Active Employees";
                            Department := PlanningLine."Department Code";
                            Directorate := PlanningLine."Directorate Code";
                        end;
                    end;
                end;
                Validate("Recruitment Plan ID");
            end;
        }
        field(3; "Duty Station ID"; Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Duty Station";
        }
        field(4; "Staff Establishment"; Integer)
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(5; "Current Headcount"; Integer)
        {
            //muga
            // CalcFormula = count(Employee where("Current Position ID" = field("Position ID"),
            //                                     "Current Duty Station" = field("Duty Station ID")));
            Editable = false;
            FieldClass = FlowField;
        }
        field(6; "No. of Planned New Hires"; Integer)
        {
            DataClassification = ToBeClassified;

            //trigger OnValidate()
            //muga
            // begin
            //     HumanResourcesSetup.Get;
            //     if HumanResourcesSetup."Strict Manpower Planning" = true then begin
            //         if "No. of Planned New Hires" > "Staff Establishment" then
            //             Error(TXT001, "Staff Establishment");
            //     end;
            // end;
        }
        field(7; "Sourcing Method"; Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = 'Open,Recruitment Agency,Direct Hire';
            OptionMembers = "Open","Recruitment Agency","Direct Hire";
        }
        field(8; "Recruitment Cycle Type"; Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = ', Standard, Expedited ';
            OptionMembers = ," Standard"," Expedited ";

            //trigger OnValidate()
            //muga
            // begin
            //     HumanResourcesSetup.Get;
            //     if "Recruitment Cycle Type" = "recruitment cycle type"::" Standard" then begin
            //         "Recruitment Lead Time" := HumanResourcesSetup."Expe Recruitment Lead Time";
            //     end else
            //         "Recruitment Lead Time" := HumanResourcesSetup."Standard Recruitment Lead Time";
            // end;
        }
        field(9; "Recruitment Lead Time"; DateFormula)
        {
            DataClassification = ToBeClassified;
        }
        field(10; "Planned Start Date"; Date)
        {
            DataClassification = ToBeClassified;

            trigger OnValidate()
            begin
                "Planned End Date" := CalcDate("Recruitment Lead Time", "Planned Start Date");
            end;
        }
        field(11; "Planned End Date"; Date)
        {
            DataClassification = ToBeClassified;
        }
        field(12; "Primary Recruitment Reason"; Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Recruitment Reason Code";
        }
        field(13; "Target Candidate Source"; Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = 'Open,Limited-Internal Staff,Limited-External Candidates';
            OptionMembers = Open,"Limited-Internal Staff","Limited-External Candidates";
        }
        field(14; "Direct Hire Unit Cost"; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(15; "Average Monthly Salary (LCY)"; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(16; "No. of Months Recruiter Fees"; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(17; "Recruiter Fees %"; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(18; "Rec Line Budget Cost (LCY)"; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(19; "Designation Group"; Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Designation Groups";
        }
        field(20; Directorate; Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Responsibility Center" where("Operating Unit Type" = filter(Directorate));
        }
        field(21; Department; Code[30])
        {
            DataClassification = ToBeClassified;
            //muga
            //TableRelation = "Responsibility Center" where("Operating Unit Type" = filter("Department/Center"));
        }
        field(22; "Region ID"; Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Responsibility Center" where("Operating Unit Type" = filter(Region));
        }
        field(23; "Line No"; Integer)
        {
            AutoIncrement = true;
            DataClassification = ToBeClassified;
        }
        field(24; "Planned Employment Start Date"; Date)
        {
            DataClassification = ToBeClassified;
        }
        field(25; "Planned Employment End Date"; Date)
        {
            DataClassification = ToBeClassified;
        }
        field(26; "Job No."; Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = Job;
        }
        field(27; "Job Task No."; Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Job Task"."Job Task No." where("Job No." = field("Job No."));

            trigger OnValidate()
            begin
                Job.Reset;
                Job.SetRange("Job No.", "Job No.");
                Job.SetRange("Job Task No.", "Job Task No.");
                if Job.FindFirst then;
            end;

        }
        field(28; "Funding Source ID"; Code[30])
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(29; "Recruitment Line Budget Cost"; Decimal)
        {
            Caption = 'Recruitment Line Budget Cost(LCY)';
            DataClassification = ToBeClassified;
        }
        field(30; "Average Cost/Hire"; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(31; "Estimate Annual Salary"; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(32; "Hierarchically Reports To"; Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Company Positions";
        }
        field(33; "Functionally  Reports To"; Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Company Positions";
        }
        field(34; "Job Grade ID"; Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Salary Scales";
        }
        field(35; "Overall Appointment Authority"; Code[30])
        {
            DataClassification = ToBeClassified;
        }
        field(36; "Seniority Level"; Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = ',Entry-Level,Mid-Level,Senior-Level,Executive';
            OptionMembers = ,"Entry-Level","Mid-Level","Senior-Level",Executive;
        }
        field(37; "Default Terms of Service Code"; Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Terms of Service";
        }
        field(38; "Employment Type"; Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = 'Permanent,Contract,Casual,Internship,Attachment';
            OptionMembers = Permanent,Contract,Casual,Internship,Attachment;
        }
        field(39; "Job Title/Designation"; Text[50])
        {
            DataClassification = ToBeClassified;
        }
        field(40; "Work Location Details"; Text[50])
        {
            DataClassification = ToBeClassified;
        }
        field(41; "Recruitment Justification"; Text[100])
        {
            DataClassification = ToBeClassified;
        }
        field(42; "Recruitment Plan Type"; Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = 'Annual HR Plan,Special Recruitment,Project Recruitment,Manpower Forecast,Functional Plan';
            OptionMembers = "Annual HR Plan","Special Recruitment","Project Recruitment","Manpower Forecast","Functional Plan";
        }
        field(43; "Dimension Set ID"; Code[10])
        {
            DataClassification = ToBeClassified;
        }
        field(44; "Plan Line No"; Integer)
        {
            DataClassification = ToBeClassified;
            TableRelation = "Establishment Planning Line"."Entry No.";

            trigger OnValidate()
            begin
                PlanningLine.Reset;
                PlanningLine.SetRange("Position ID", "Position ID");
                PlanningLine.SetRange("Entry No.", "Plan Line No");
                if PlanningLine.FindSet then begin
                    "Duty Station ID" := PlanningLine."Duty Station ID";
                    "Staff Establishment" := PlanningLine."Optimal Staffing";
                    Department := PlanningLine."Department Code";
                    Directorate := PlanningLine."Directorate Code";
                end
            end;
        }
    }

    keys
    {
        key(Key1; "Recruitment Plan ID", "Line No", "Position ID")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
        fieldgroup(DropDown; "Position ID", Department, "No. of Planned New Hires")
        {
        }
    }

    var
        PlanningLine: Record "Establishment Planning Line";
        HumanResourcesSetup: Record "Human Resources Setup";
        TXT001: label 'The maximum allowable no for this position is %1';
        Employee: Record Employee;
        EstablishmentPlanPosition: Record "Establishment Plan Position";
        RecruitmentPlan: Record "Recruitment Plan";
        CompanyPositions: Record "Company Positions";
        Job: Record "Job Task";
}

