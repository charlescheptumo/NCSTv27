#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Table 69615 "Recruitment Plan Position"
{

    fields
    {
        field(1;"Recruitment Plan ID";Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Recruitment Plan";
        }
        field(2;"Position ID";Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Company Positions"."Position ID";

            trigger OnValidate()
            begin
                RecruitmentPlan.Reset;
                RecruitmentPlan.SetRange("Document No.","Recruitment Plan ID");
                if RecruitmentPlan.FindSet then begin
                if RecruitmentPlan."Recruitment Plan Type"=RecruitmentPlan."recruitment plan type"::"Functional Plan"
                   then begin
                    CompanyPositions.Reset;
                     CompanyPositions.SetRange("Position ID","Position ID");
                     if CompanyPositions.FindFirst then begin

                       "Job Title/Designation":=CompanyPositions."Job Title";
                       "Current Headcount":=CompanyPositions."No of Active Contracts";
                       "Staff Establishment":=CompanyPositions."Approved Establishment";
                       end;
                    end else begin
                EstablishmentPlanPosition.Reset;
                EstablishmentPlanPosition.SetRange("Job ID","Position ID");
                EstablishmentPlanPosition.CalcFields("Actual Terminated","Actual Active");
                //EstablishmentPlanPosition.SETFILTER("Department Code",'>%1',EstablishmentPlanPosition."Actual Terminated");
                if EstablishmentPlanPosition.FindSet then begin
                  EstablishmentPlanPosition.CalcFields("Actual Active");
                   EstablishmentPlanPosition.CalcFields("Job Title");
                     "Job Title/Designation":=EstablishmentPlanPosition."Job Title";
                  "Staff Establishment":=EstablishmentPlanPosition."Approved No.";
                 "Current Headcount":=EstablishmentPlanPosition."Actual Active";
                 Department:=EstablishmentPlanPosition."Department Code";
                 Directorate:=EstablishmentPlanPosition."Directorate Code";
                 end;
                end;
                end;
                Validate("Recruitment Plan ID");
            end;
        }
        field(3;"Job Title/Designation";Text[100])
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(4;"Designation Group";Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Designation Groups";
        }
        field(5;Directorate;Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Responsibility Center" where ("Operating Unit Type"=filter(Directorate));
        }
        field(6;Department;Code[30])
        {
            DataClassification = ToBeClassified;
            //muga
            //TableRelation = "Responsibility Center" where ("Operating Unit Type"=filter("Department/Center"));
        }
        field(7;"Staff Establishment";Integer)
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(8;"Current Headcount";Integer)
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(9;"Total Planned New Hires";Integer)
        {
            CalcFormula = sum("Recruitment Planning Line"."No. of Planned New Hires" where ("Recruitment Plan ID"=field("Recruitment Plan ID"),
                                                                                            "Position ID"=field("Position ID")));
            FieldClass = FlowField;
        }
        field(10;"Recruitment Budget Cost (LCY)";Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(13;"Target Candidate Source";Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = 'Open,Limited-Internal Staff,Limited-External Candidates';
            OptionMembers = Open,"Limited-Internal Staff","Limited-External Candidates";
        }
    }

    keys
    {
        key(Key1;"Recruitment Plan ID","Position ID")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }

    var
        EstablishmentPlanPosition: Record "Establishment Plan Position";
        RecruitmentPlan: Record "Recruitment Plan";
        CompanyPositions: Record "Company Positions";
        Employee: Record Employee;
}

