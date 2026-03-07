#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Table 69106 "Vacancy  Requisitions Table"
{

    fields
    {
        field(1; "No."; Code[30])
        {
            DataClassification = ToBeClassified;
        }
        field(2; Description; Text[100])
        {
            DataClassification = ToBeClassified;
        }
        field(3; "Manpower Plan ID"; Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Manpower Plan Header" where(Blocked = filter(false));
        }
        field(4; "Manpower Plan Name"; Text[100])
        {
            CalcFormula = lookup("Manpower Plan Header".Description where(No = field("Manpower Plan ID")));
            FieldClass = FlowField;
        }
        field(7; "Department Code"; Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Responsibility Center";
        }
        field(8; "Department Name"; Text[100])
        {
            CalcFormula = lookup("Responsibility Center".Name where(Code = field("Department Code")));
            FieldClass = FlowField;
        }
        field(9; "Global Dimension 1"; Code[30])
        {
            CaptionClass = '1,2,1';
            DataClassification = ToBeClassified;
            TableRelation = "Dimension Value".Code where("Global Dimension No." = const(1),
                                                          Blocked = const(false));
        }
        field(10; "Global Dimension 1 Name"; Text[100])
        {
            CalcFormula = lookup("Dimension Value".Name where(Code = field("Global Dimension 1")));
            CaptionClass = '1,2,1';
            FieldClass = FlowField;
        }
        field(11; "Global Dimension 2"; Code[30])
        {
            CaptionClass = '1,2,2';
            DataClassification = ToBeClassified;
            TableRelation = "Dimension Value".Code where("Global Dimension No." = const(2),
                                                          Blocked = const(false));
        }
        field(12; "Global Dimension 2 Name"; Text[100])
        {
            CalcFormula = lookup("Dimension Value".Name where(Code = field("Global Dimension 2")));
            CaptionClass = '1,2,2';
            FieldClass = FlowField;
        }
        field(13; "No. Series"; Code[30])
        {
            DataClassification = ToBeClassified;
        }
        field(14; Status; Option)
        {
            DataClassification = ToBeClassified;
            OptionMembers = Open,"Pending Approval",Released,Advertised,Completed;
        }
        field(15; "Created By"; Code[30])
        {
            DataClassification = ToBeClassified;
        }
        field(16; "Created On"; Date)
        {
            DataClassification = ToBeClassified;
        }
        field(17; "Document Type"; Option)
        {
            DataClassification = ToBeClassified;
            OptionMembers = Recruitment,Advert,Ammendment,Cancellation;
        }
        field(18; Advertised; Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(19; "Advertised By"; Code[30])
        {
            DataClassification = ToBeClassified;
        }
        field(20; "Advertised On"; DateTime)
        {
            DataClassification = ToBeClassified;
        }
    }

    keys
    {
        key(Key1; "No.")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
        fieldgroup(DropDown; Status, Description)
        {
        }
    }

    trigger OnInsert()
    begin
        //GENERATE DOCUMENT NUMBER
        if "No." = '' then begin
            HRSetup.Get;
            HRSetup.TestField(HRSetup."Employee Requisition Nos.");
            //MUGA
            //NoSeriesMgt.InitSeries(HRSetup."Employee Requisition Nos.", xRec."No. Series", 0D, "No.", "No. Series");
        end;

        "Created By" := UserId;
        "Created On" := Today;
    end;

    var
        HRSetup: Record "Human Resources Setup";
        NoSeriesMgt: Codeunit "No. Series";
        HRJobs: Record Positions;
        HREmployeeReq: Record "Employee Requisitions";
        userSetup: Record "User Setup";
        mDivision: Code[50];
        mResponsibility: Code[50];
        CompanyJobsDimensions: Record "Staff Establishment Header";
        VacancyRequisitionsLines: Record "Vacancy  Requisitions Table";
        HumanResourcesSetup: Record "Human Resources Setup";
}

