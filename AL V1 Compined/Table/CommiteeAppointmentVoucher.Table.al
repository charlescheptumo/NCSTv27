#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Table 69638 "Commitee Appointment Voucher"
{
    //DrillDownPageID = "HR Committee Appointment List";
    //LookupPageID = "HR Committee Appointment List";

    fields
    {
        field(1; "Document No."; Code[30])
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(2; "Document Type"; Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = 'Appointment,Termination';
            OptionMembers = Appointment,Termination;
        }
        field(3; "Committee Type ID"; Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Committee Type";
            Caption = 'Committee Type';

            trigger OnValidate()
            begin
                CommitteeType.Reset;
                CommitteeType.SetRange(Code, "Committee Type ID");
                if CommitteeType.FindFirst then begin
                    if "Document Type" = "document type"::Appointment then begin
                        Description := Format("document type"::Appointment) + ' ' + 'of' + ' ' + CommitteeType.Description;
                        "Appointing Authority" := CommitteeType."Title of Appointing Officer";
                    end;
                    if "Document Type" = "document type"::Termination then begin
                        Description := Format("document type"::Termination) + ' ' + 'of' + ' ' + CommitteeType.Description;
                        "Appointing Authority" := CommitteeType."Title of Appointing Officer";
                    end
                end
            end;
        }
        field(4; "Original Appointment No."; Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Commitee Appointment Voucher" where("Document Type" = filter(Appointment));
        }
        field(5; "Termination Category"; Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = ' ,Normal Staff Exit,Tenure Expiry,Other';
            OptionMembers = " ","Normal Staff Exit","Tenure Expiry",Other;
        }
        field(6; "Termination Details"; Text[100])
        {
            DataClassification = ToBeClassified;
        }
        field(7; "Document Date"; Date)
        {
            DataClassification = ToBeClassified;
        }
        field(8; Description; Text[100])
        {
            DataClassification = ToBeClassified;
        }
        field(9; "Appointment Effective Date"; Date)
        {
            DataClassification = ToBeClassified;
        }
        field(10; "Tenure End Date"; Date)
        {
            DataClassification = ToBeClassified;
        }
        field(11; "Appointing Authority"; Code[30])
        {
            DataClassification = ToBeClassified;
        }
        field(12; "Raised By"; Code[30])
        {
            DataClassification = ToBeClassified;
        }
        field(13; "Staff ID"; Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = Employee;
        }
        field(14; Name; Text[50])
        {
            DataClassification = ToBeClassified;
        }
        field(15; Region; Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Responsibility Center" where("Operating Unit Type" = filter(Region));
        }
        field(16; "Branch/Centre"; Code[30])
        {
            DataClassification = ToBeClassified;
        }
        field(17; Directorate; Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Responsibility Center" where("Operating Unit Type" = filter(Directorate));
        }
        field(18; Department; Code[30])
        {
            DataClassification = ToBeClassified;
            //muga
            //TableRelation = "Responsibility Center" where ("Operating Unit Type"=filter("Department/Center"));
        }
        field(19; "Approval Status"; Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = 'Open,Pending Approval,Released';
            OptionMembers = Open,"Pending Approval",Released;
        }
        field(20; "Required No. of Members"; Integer)
        {
            Caption = 'Minimimum Required No. of Members';
            DataClassification = ToBeClassified;
        }
        field(21; "Appointed Members"; Integer)
        {
            Caption = 'Actual No. of Appointed Members';
            DataClassification = ToBeClassified;
        }
        field(22; "Terminated Members"; Integer)
        {
            Caption = 'Actual No. of Terminated Members';
            DataClassification = ToBeClassified;
        }
        field(23; "No. Series"; Code[30])
        {
            DataClassification = ToBeClassified;
        }
        field(24; "Vacancy ID"; Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Recruitment Requisition Header"."Document No." where("Document Type" = const("Job Vacancy"));

            trigger OnValidate()
            begin
                RecruitmentRequisitionHeader.Reset;
                RecruitmentRequisitionHeader.SetRange("Document No.", "Vacancy ID");
                if RecruitmentRequisitionHeader.FindSet then begin
                    "Vacancy Name" := RecruitmentRequisitionHeader."Job Title/Designation";
                end;
            end;
        }
        field(25; "Vacancy Name"; Text[250])
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
        fieldgroup(DropDown; "Document No.", "Committee Type ID", Description)
        {
        }
    }

    trigger OnInsert()
    begin
        if "Document Type" = "document type"::Appointment then begin
            if "Document No." = '' then begin
                HumanResourcesSetup.Get;
                //muga
                //HumanResourcesSetup.TestField("Committee Terminate Nos.");
                //NoSeriesMgt.InitSeries(HumanResourcesSetup."Committee Terminate Nos.",xRec."No. Series",0D,"Document No.","No. Series");
            end;
        end;

        if "Document Type" = "document type"::Termination then begin
            if "Document No." = '' then begin
                HumanResourcesSetup.Get;
                //muga
                //HumanResourcesSetup.TestField("Committee Terminate Nos.");
                //NoSeriesMgt.InitSeries(HumanResourcesSetup."Committee Terminate Nos.",xRec."No. Series",0D,"Document No.","No. Series");
            end;
        end;

        "Document Date" := Today;
        "Raised By" := UserId;
        UserSetup.Reset;
        if UserSetup.Get(UserId) then begin
            UserSetup.TestField("Employee No.");
            Employee.Reset;
            Employee.SetRange("No.", UserSetup."Employee No.");
            if Employee.FindFirst then begin
                Name := Employee."First Name" + ' ' + Employee."Middle Name" + ' ' + Employee."Last Name";
                "Staff ID" := Employee."No.";
                Department := Employee."Department Code";
                Directorate := Employee."Directorate Code";
                //Region:=Employee."Region Name";
            end;
        end;
    end;

    var
        CommitteeType: Record "Committee Type";
        HumanResourcesSetup: Record "Human Resources Setup";
        NoSeriesMgt: Codeunit "No. Series";
        UserSetup: Record "User Setup";
        Employee: Record Employee;
        RecruitmentRequisitionHeader: Record "Recruitment Requisition Header";
}

