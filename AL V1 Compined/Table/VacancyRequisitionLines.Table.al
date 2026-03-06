#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Table 69107 "Vacancy Requisition Lines"
{

    fields
    {
        field(1;"Line No.";Integer)
        {
            AutoIncrement = true;
            DataClassification = ToBeClassified;
        }
        field(2;"Requisition No.";Code[30])
        {
            DataClassification = ToBeClassified;

            trigger OnValidate()
            begin
                if VacancyRequisitionsTable.Get("Requisition No.") then
                   "Manpower Plan ID":=VacancyRequisitionsTable."Manpower Plan ID";
            end;
        }
        field(3;"Job Id";Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = "ManPower Planning Lines"."Job Id";

            trigger OnValidate()
            begin
                VacancyRequisitionsTable.Reset;
                VacancyRequisitionsTable.SetRange("No.","Requisition No.");
                if VacancyRequisitionsTable.FindSet then begin
                   ManpowerPlanCode:=VacancyRequisitionsTable."Manpower Plan ID";
                    ManPowerPlanningLines.Reset;
                    ManPowerPlanningLines.SetRange("Manpower Plan Code",ManpowerPlanCode);
                    CalcFields("Responsibility Center");
                    ManPowerPlanningLines.SetRange("Responsibility Center Code","Responsibility Center");
                    ManPowerPlanningLines.SetRange("Job Id","Job Id");
                    if ManPowerPlanningLines.FindSet then
                       "Planned Qty":=ManPowerPlanningLines."Quarter 1 Target"+ManPowerPlanningLines."Quarter 2 Target"+ManPowerPlanningLines."Quarter 3 Target"+ManPowerPlanningLines."Quarter 4 Target";

                end
            end;
        }
        field(4;"Job Description";Text[100])
        {
            CalcFormula = lookup(Positions."Job Title" where ("Position ID"=field("Job Id")));
            FieldClass = FlowField;
        }
        field(5;"Responsibility Center";Code[30])
        {
            CalcFormula = lookup("Vacancy  Requisitions Table"."Department Code" where ("No."=field("Requisition No.")));
            FieldClass = FlowField;
        }
        field(6;"Planned Qty";Integer)
        {
            DataClassification = ToBeClassified;
        }
        field(7;"Requested Qty";Integer)
        {
            DataClassification = ToBeClassified;

            trigger OnValidate()
            begin
                if "Requested Qty">"Planned Qty" then
                  Error(TXT001);
            end;
        }
        field(8;"Planned Start Date";Date)
        {
            DataClassification = ToBeClassified;
        }
        field(9;"Planned End Date";Date)
        {
            DataClassification = ToBeClassified;
        }
        field(10;"Actual Start Date";Date)
        {
            DataClassification = ToBeClassified;
        }
        field(11;"Actual End Date";Date)
        {
            DataClassification = ToBeClassified;
        }
        field(12;"Applications End Time";Time)
        {
            DataClassification = ToBeClassified;
        }
        field(13;"Applications End Date";Date)
        {
            DataClassification = ToBeClassified;
        }
        field(14;"Applications Start Date";Date)
        {
            DataClassification = ToBeClassified;
        }
        field(15;Advertise;Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(16;"Advertised By";Code[10])
        {
            DataClassification = ToBeClassified;
        }
        field(17;"Advertised Date";Date)
        {
            DataClassification = ToBeClassified;
        }
        field(18;"Requisition Type";Option)
        {
            DataClassification = ToBeClassified;
            OptionMembers = Internal,External,Both;
        }
        field(19;Status;Option)
        {
            DataClassification = ToBeClassified;
            OptionMembers = Open,Advertised,Oral,Written,Apptitude,Closed;
        }
        field(20;"Closed Date";Date)
        {
            DataClassification = ToBeClassified;
        }
        field(21;"Closed By";Code[30])
        {
            DataClassification = ToBeClassified;
        }
        field(22;"Manpower Plan ID";Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Manpower Plan Header" where (Blocked=filter(false));
        }
        field(23;"Type of Contract";Option)
        {
            DataClassification = ToBeClassified;
            OptionMembers = Internship,Attachment,"Fixed-Term","Short-Term";
        }
        field(24;Salary;Text[30])
        {
            DataClassification = ToBeClassified;
        }
        field(25;"Job Function";Text[30])
        {
            DataClassification = ToBeClassified;
        }
        field(26;"Seniority Level";Option)
        {
            DataClassification = ToBeClassified;
            OptionMembers = "Entry-Level",Senior;
        }
        field(27;"Location Code";Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Service Zone";

            trigger OnValidate()
            begin
                if ServiceZone.Get("Location Code") then begin
                  Location:=ServiceZone.Description;
                end;
            end;
        }
        field(28;Location;Text[30])
        {
            DataClassification = ToBeClassified;
        }
        field(29;"Vacancy No";Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = Vacancyx."Requisition No." where (Status=filter(Open));

            trigger OnValidate()
            begin
                Vacancy.Reset;
                Vacancy.SetRange("Requisition No.","Vacancy No");
                if Vacancy.FindSet then begin
                  "Type of Contract":=Vacancy."Type of Contract";
                  "Requisition Type":=Vacancy."Requisition Type";
                  "Job Id":=Vacancy."Job Id";
                  Validate("Job Id");
                  "Requested Qty":=Vacancy."Requested Qty";
                  "Planned Qty":=Vacancy."Planned Qty";
                  "Planned Start Date":=Vacancy."Planned Start Date";
                  "Planned End Date":=Vacancy."Planned End Date";
                  "Applications Start Date":=Vacancy."Applications Start Date";
                  "Applications End Date":=Vacancy."Applications End Date";
                  "Applications End Time":=Vacancy."Applications End Time";
                end;
            end;
        }
    }

    keys
    {
        key(Key1;"Line No.","Requisition No.","Job Id")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }

    var
        ManPowerPlanningLines: Record "ManPower Planning Lines";
        VacancyRequisitionsTable: Record "Vacancy  Requisitions Table";
        ManpowerPlanCode: Code[30];
        ServiceZone: Record "Service Zone";
        TXT001: label 'The requested quantity field should no be greater than the planned quantity';
        Vacancy: Record Vacancyx;
}

