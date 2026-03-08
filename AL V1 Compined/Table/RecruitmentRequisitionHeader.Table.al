#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Table 69619 "Recruitment Requisition Header"
{

    fields
    {
        field(1; "Document No."; Code[30])
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(2; "Document Date"; Date)
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(3; "Recruitment Plan ID"; Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Recruitment Plan"."Document No." where("Recruitment Plan Type" = field("Recruitment Plan Type"));
        }
        field(4; "Recruitment Plan Type"; Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = 'Annual HR Plan,Special Recruitment,Project Recruitment,Functional Plan';
            OptionMembers = "Annual HR Plan","Special Recruitment","Project Recruitment","Functional Plan";
        }
        field(5; "Position ID"; Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = if ("Recruitment Plan Type" = const("Annual HR Plan")) "Recruitment Planning Line"."Position ID" where("Recruitment Plan ID" = field("Recruitment Plan ID"),
                                                                                                                                  "Recruitment Plan Type" = const("Annual HR Plan"))
            else if ("Recruitment Plan Type" = const("Functional Plan")) "Recruitment Planning Line"."Position ID" where("Recruitment Plan ID" = field("Recruitment Plan ID"),
                                                                                                                                  "Recruitment Plan Type" = const("Functional Plan"));

            trigger OnValidate()
            begin
                CompanyPositions.Reset;
                CompanyPositions.SetRange("Position ID", "Position ID");
                if CompanyPositions.FindFirst then begin
                    "Hierarchically Reports To" := CompanyPositions."Directly Reports To";
                    "Directly reports to" := CompanyPositions."Directly Reports des";
                    "Functionally  Reports To" := CompanyPositions."Indirectly Reports To";
                    "Job Grade ID" := CompanyPositions."Job Grade ID";
                    "Job Title/Designation" := CompanyPositions."Job Title";
                    "Duty Station ID" := CompanyPositions."Default Duty Station";
                    "Overall Appointment Authority" := CompanyPositions."Overall Appointment Authority";
                    "Seniority Level" := CompanyPositions."Seniority Level";
                    //  Department:=CompanyPositions.Department;
                    //  Directorate:=CompanyPositions.Directorate;
                    "Default Terms of Service Code" := CompanyPositions."Default Terms of Service";
                    "Current Headcount" := CompanyPositions."No of Active Contracts";
                    "Staff Establishment" := CompanyPositions."Approved Establishment";

                end;
                PlanningLine.Reset;
                PlanningLine.SetRange("Recruitment Plan ID", Rec."Recruitment Plan ID");
                PlanningLine.SetRange("Position ID", Rec."Position ID");
                if PlanningLine.FindSet then begin

                    "No of Openings" := PlanningLine."No. of Planned New Hires";
                    "Sourcing Method" := PlanningLine."Sourcing Method";
                    "Primary Recruitment Reason" := PlanningLine."Primary Recruitment Reason";
                    "Recruitment Cycle Type" := PlanningLine."Recruitment Cycle Type";
                    "Recruitment Justification" := PlanningLine."Recruitment Justification";
                    "Recruitment Lead Time" := PlanningLine."Recruitment Lead Time";
                    "Recruitment Line Budget Cost" := PlanningLine."Recruitment Line Budget Cost";
                    "Planned Recruitment Start Date" := PlanningLine."Planned Start Date";
                    "Average Cost/Hire" := PlanningLine."Average Cost/Hire";
                    "Planned Recruitment End Date" := PlanningLine."Planned End Date";
                    "Planned Employment Start Date" := PlanningLine."Planned Employment Start Date";
                    "Planned Employment End Date" := PlanningLine."Planned Employment End Date";
                    "Target Candidate Source" := PlanningLine."Target Candidate Source";
                    "Recruitment Cycle Type" := PlanningLine."Recruitment Cycle Type";
                    //Message('Recruitment Cycle Type:%1', PlanningLine."Recruitment Cycle Type");
                    //  Department:=PlanningLine.Department;
                    //  Directorate:=PlanningLine.Directorate;
                    //  Region:=PlanningLine."Region ID";
                    "Estimate Annual Salary" := PlanningLine."Estimate Annual Salary";
                    "Job No." := PlanningLine."Job No.";
                    "Job Task No." := PlanningLine."Job Task No.";
                    "Funding Source ID" := PlanningLine."Funding Source ID";
                    //Message('Recruitment Cycle Type:%1', "Recruitment Cycle Type");
                    Rec.Modify();

                end
            end;
        }
        field(6; "Requester ID"; Code[30])
        {
            DataClassification = ToBeClassified;
            Editable = false;
            TableRelation = "User Setup";
        }
        field(7; "Requester Staff No"; Code[30])
        {
            DataClassification = ToBeClassified;
            Editable = false;
            TableRelation = Employee;
        }
        field(8; "Requester Name"; Text[50])
        {
            DataClassification = ToBeClassified;
            Editable = false;
            TableRelation = Employee;
            ValidateTableRelation = false;
        }
        field(9; Directorate; Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Responsibility Center" where("Operating Unit Type" = filter(Directorate));
        }
        field(10; Department; Code[30])
        {
            DataClassification = ToBeClassified;
            //muga
            //TableRelation = "Responsibility Center" where("Operating Unit Type" = filter("Department/Center"));
        }
        field(11; Region; Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Responsibility Center" where("Operating Unit Type" = filter(Region));
        }
        field(12; "Finacial Year Code"; Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Financial Year Code";
        }
        field(13; "Approval Status"; Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = 'Open,Pending Approval,Released';
            OptionMembers = Open,"Pending Approval",Released;
            Editable = false;
        }
        field(14; "Created By"; Code[30])
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(15; "Created On"; Date)
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(16; "Created Time"; Time)
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(17; "Staff Establishment"; Integer)
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(18; "Current Headcount"; Integer)
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(19; "No of Openings"; Integer)
        {
            DataClassification = ToBeClassified;
        }
        field(20; "Primary Recruitment Reason"; Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Recruitment Reason Code";
        }
        field(21; "Recruitment Justification"; Text[100])
        {
            DataClassification = ToBeClassified;
        }
        field(22; "Target Candidate Source"; Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = 'Open,Limited-Internal Staff,Limited-External Staff';
            OptionMembers = Open,"Limited-Internal Staff","Limited-External Staff";
        }
        field(23; "Sourcing Method"; Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = 'Recruitment Agency,Direct Hire';
            OptionMembers = "Recruitment Agency","Direct Hire";
        }
        field(24; "Recruitment Cycle Type"; Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = 'Standard,Expedited';
            OptionMembers = Standard,Expedited;
        }
        field(25; "Recruitment Lead Time"; DateFormula)
        {
            DataClassification = ToBeClassified;
        }
        field(26; "Planned Recruitment Start Date"; Date)
        {
            DataClassification = ToBeClassified;
        }
        field(27; "Planned Recruitment End Date"; Date)
        {
            DataClassification = ToBeClassified;
        }
        field(28; "Planned Employment Start Date"; Date)
        {
            DataClassification = ToBeClassified;
        }
        field(29; "Planned Employment End Date"; Date)
        {
            DataClassification = ToBeClassified;
        }
        field(30; "Job No."; Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = Job;
        }
        field(31; "Job Task No."; Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Job Task"."Job Task No." where("Job No." = field("Job No."));

            trigger OnValidate()
            begin
                Job.Reset;
                Job.SetRange("Job No.", "Job No.");
                Job.SetRange("Job Task No.", "Job Task No.");
                if Job.FindFirst then;
            end
;
        }
        field(32; "Funding Source ID"; Code[30])
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(33; "Recruitment Line Budget Cost"; Decimal)
        {
            Caption = 'Recruitment Line Budget Cost(LCY)';
            DataClassification = ToBeClassified;
        }
        field(34; "Average Cost/Hire"; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(35; "Estimate Annual Salary"; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(36; "Hierarchically Reports To"; Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Company Positions";

            trigger OnValidate()
            begin
                CompanyPositions.Reset;
                CompanyPositions.SetRange("Directly Reports To", "Hierarchically Reports To");
                if CompanyPositions.FindSet then begin
                    "Directly reports to" := CompanyPositions."Directly Reports des";
                end;
            end;
        }
        field(37; "Functionally  Reports To"; Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Company Positions";
        }
        field(38; "Job Grade ID"; Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Salary Scales";
        }
        field(39; "Overall Appointment Authority"; Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Responsibility Center";
        }
        field(40; "Seniority Level"; Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = ',Entry-Level,Mid-Level,Senior-Level,Executive';
            OptionMembers = ,"Entry-Level","Mid-Level","Senior-Level",Executive;
        }
        field(41; "Default Terms of Service Code"; Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Terms of Service";
        }
        field(42; "Employment Type"; Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = 'Permanent,Temporary,Contract,Casual,Internship,Attachment';
            OptionMembers = Permanent,"Temporary",Contract,Casual,Internship,Attachment;
        }
        field(43; "Dimension Set ID"; Code[30])
        {
            DataClassification = ToBeClassified;
        }
        field(44; "Vacancy No"; Code[30])
        {
            DataClassification = ToBeClassified;
        }
        field(45; "Vacancy Status"; Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = 'Draft,Published,Evaluation,Closed,Cancelled';
            OptionMembers = Draft,Published,Evaluation,Closed,Cancelled;
        }
        field(46; "Vacancy Announcement ID"; Code[30])
        {
            DataClassification = ToBeClassified;
        }
        field(47; "Date Published"; Date)
        {
            DataClassification = ToBeClassified;
        }
        field(48; "Application Closing Date"; Date)
        {
            DataClassification = ToBeClassified;
        }
        field(49; "Application Closing Time"; Time)
        {
            DataClassification = ToBeClassified;
        }
        field(50; "No. of Applications"; Integer)
        {
            CalcFormula = count("Job Applications" where("Vacancy Id" = field("Document No.")));
            Editable = false;
            FieldClass = FlowField;
        }
        field(51; "No of Filled Posts"; Integer)
        {
            DataClassification = ToBeClassified;
        }
        field(52; "Job Title/Designation"; Text[50])
        {
            DataClassification = ToBeClassified;
        }
        field(53; "Duty Station ID"; Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Duty Station";
        }
        field(54; "Work Location Details"; Text[300])
        {
            DataClassification = ToBeClassified;
        }
        field(55; "Document Type"; Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = 'Recruitment Requisition,Job Vacancy';
            OptionMembers = "Recruitment Requisition","Job Vacancy";
        }
        field(56; Published; Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(57; "No. Series"; Code[30])
        {
            DataClassification = ToBeClassified;
        }
        field(58; "Vacancy Created"; Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(59; "Requisition ID"; Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Recruitment Requisition Header" where("Document Type" = filter("Recruitment Requisition"));
        }
        field(60; "Directly reports to"; Text[250])
        {
            DataClassification = ToBeClassified;
        }
    }

    keys
    {
        key(Key1; "Document No.")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
        fieldgroup(DropDown; "Document No.", "Job Title/Designation", Department, "Planned Employment Start Date")
        {
        }
    }

    trigger OnInsert()
    begin
        //muga
        // if "Document Type" = "document type"::"Job Vacancy" then begin
        //     HumanResourcesSetup.Get;
        //     HumanResourcesSetup.TestField("HQ Responsibility Center");
        //     if "Document No." = '' then
        //         NoSeriesMgt.InitSeries(HumanResourcesSetup."HQ Responsibility Center", xRec."No. Series", 0D, "Document No.", "No. Series");

        // end;

        // muga
        // if "Document Type" = "document type"::"Recruitment Requisition" then begin
        //     HumanResourcesSetup.Get;
        //     HumanResourcesSetup.TestField("Recruitment Requsition Nos.");
        //     if "Document No." = '' then
        //         NoSeriesMgt.InitSeries(HumanResourcesSetup."Recruitment Requsition Nos.", xRec."No. Series", 0D, "Document No.", "No. Series");

        // end;


        UserSetup.Reset;
        if UserSetup.Get(UserId) then begin
            UserSetup.TestField("Employee No.");
            Employee.Reset;
            Employee.SetRange("No.", UserSetup."Employee No.");
            if Employee.FindFirst then begin
                "Requester Name" := Employee."First Name" + ' ' + Employee."Middle Name" + ' ' + Employee."Last Name";
                "Requester Staff No" := Employee."No.";
                Department := Employee."Department Code";
                Directorate := Employee."Directorate Code";

            end;
        end;
        "Requester ID" := UserId;
        "Created On" := Today;
        "Created Time" := Time;
        "Created By" := UserId;
        "Document Date" := Today;


        // FinancialYearCode.Reset();
        // FinancialYearCode.FindLast;
        // "Finacial Year Code" := FinancialYearCode.Code;
    end;

    var
        UserSetup: Record "User Setup";
        Employee: Record Employee;
        PlanningLine: Record "Recruitment Planning Line";
        CompanyPositions: Record "Company Positions";
        HumanResourcesSetup: Record "Human Resources Setup";
        NoSeriesMgt: Codeunit "No. Series";
        Job: Record "Job Task";
        FinancialYearCode: Record "Financial Year Code";
}

