#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Table 69701 "PreScreen Header"
{

    fields
    {
        field(1; "Document Type"; Option)
        {
            DataClassification = ToBeClassified;
            Editable = false;
            OptionCaption = 'Ability Test Invitation,Phone Interview Report';
            OptionMembers = "Ability Test Invitation","Phone Interview Report";
        }
        field(2; "Document No."; Code[30])
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(3; "Document Date"; Date)
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(4; "Vacancy ID"; Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Recruitment Requisition Header" where("Document Type" = filter("Job Vacancy"));

            trigger OnValidate()
            begin
                RequisitionHeader.Reset;
                RequisitionHeader.SetRange("Document No.", "Vacancy ID");
                if RequisitionHeader.FindFirst then begin
                    "Position ID" := RequisitionHeader."Position ID";
                    "Job Title/Designation" := RequisitionHeader."Job Title/Designation";
                    "No. of Openings" := RequisitionHeader."No of Openings";
                    Directorate := RequisitionHeader.Directorate;
                    Department := RequisitionHeader.Department;
                    "Region ID" := RequisitionHeader.Region;
                end
            end;
        }
        field(5; "Lead HR Officer"; Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = "HR Officers";
        }
        field(6; Description; Text[250])
        {
            DataClassification = ToBeClassified;
        }
        field(7; "Ability Test ID"; Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Ability Test";
        }
        field(8; "Maximum Test Duration(Min)"; Integer)
        {
            DataClassification = ToBeClassified;
        }
        field(9; "Phone Interview Template ID"; Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Pre-Screen Template" where("Pre-Screening Stage" = filter("Interview-Invitation"));
        }
        field(10; "Position ID"; Code[30])
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(11; "Job Title/Designation"; Text[150])
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(12; "No. of Openings"; Integer)
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(13; Directorate; Code[30])
        {
            DataClassification = ToBeClassified;
            Editable = false;
            TableRelation = "Responsibility Center" where("Operating Unit Type" = filter(Directorate));
        }
        field(14; Department; Code[30])
        {
            DataClassification = ToBeClassified;
            Editable = false;
            //muga
            //TableRelation = "Responsibility Center" where ("Operating Unit Type"=filter("Department/Center"));
        }
        field(15; "Region ID"; Code[30])
        {
            DataClassification = ToBeClassified;
            Editable = false;
            TableRelation = "Responsibility Center" where("Operating Unit Type" = filter(Region));
        }
        field(16; "Planned Start Date"; Date)
        {
            DataClassification = ToBeClassified;
        }
        field(17; "Planned End Date"; Date)
        {
            DataClassification = ToBeClassified;
        }
        field(18; "Document Status"; Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = 'Active,Cancelled';
            OptionMembers = Active,Cancelled;
        }
        field(19; "Created By"; Code[30])
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(20; "Created On"; DateTime)
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(21; Posted; Boolean)
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(22; "No. Series"; Code[10])
        {
            DataClassification = ToBeClassified;
        }
    }

    keys
    {
        key(Key1; "Document Type", "Document No.")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }

    trigger OnInsert()
    begin
        HRSetup.Get();
        //muga
        // if ("Document Type"="document type"::"Phone Interview Report")then begin
        //   HRSetup.TestField("Phone Interview Report Nos.");
        //   if "Document No."='' then
        //   NoSeriesMgt.InitSeries(HRSetup."Phone Interview Report Nos.",xRec."No. Series",0D,"Document No.","No. Series");
        // end;
        // if ("Document Type"="document type"::"Ability Test Invitation")then begin
        //   HRSetup.TestField("Ability Test Invitation Nos.");
        //   if "Document No."='' then
        //   NoSeriesMgt.InitSeries(HRSetup."Ability Test Invitation Nos.",xRec."No. Series",0D,"Document No.","No. Series");
        // end;
        "Created By" := UserId;
        "Created On" := CurrentDatetime;
        "Document Date" := Today;
    end;

    var
        NoSeriesMgt: Codeunit "No. Series";
        HRSetup: Record "Human Resources Setup";
        RequisitionHeader: Record "Recruitment Requisition Header";
}

