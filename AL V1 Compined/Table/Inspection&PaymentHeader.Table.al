#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Table 72174 "Inspection & Payment Header"
{

    fields
    {
        field(1; "Document No"; Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(2; "Document Type"; Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = ' ,Measurement Sheeet,Works Inspection,Payment Certificate';
            OptionMembers = " ","Measurement Sheeet","Works Inspection","Payment Certificate";
        }
        field(3; "Document Date"; Date)
        {
            DataClassification = ToBeClassified;
        }
        field(4; "Purchase Contract ID"; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Purchase Header"."No." where("Document Type" = filter("Blanket Order"),
                                                           Status = const(Released));

            trigger OnValidate()
            begin
                PurchaseHeader.Reset;
                PurchaseHeader.SetRange(PurchaseHeader."No.", "Purchase Contract ID");
                if PurchaseHeader.FindSet then begin
                    "Contract Sum" := PurchaseHeader."Read-out Bid Price (A)";
                    "Contractor No." := PurchaseHeader."Buy-from Vendor No.";
                    Validate("Contractor No.");
                    "Project ID" := PurchaseHeader.Job;
                    Validate("Project ID");

                end;
            end;
        }
        field(5; "Project ID"; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = Job."No.";

            trigger OnValidate()
            begin
                Job.Reset;
                Job.SetRange(Job."No.", "Project ID");
                if Job.FindSet then begin
                    "Project Name" := Job.Description;
                    "Project Start Date" := Job."Starting Date";
                    "Project End Date" := Job."Ending Date";
                end;

                Description := Format("Document Type") + ' ' + 'for' + "Purchase Contract ID" + ' ' + 'Project ID' + ' ' + "Project ID";
            end;
        }
        field(6; Description; Text[250])
        {
            DataClassification = ToBeClassified;
        }
        field(7; "Contractor No."; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = Vendor."No.";

            trigger OnValidate()
            begin
                Vendor.Reset;
                Vendor.SetRange("No.", "Contractor No.");
                if Vendor.FindSet then begin
                    "Contractor Name" := Vendor.Name;
                end;
            end;
        }
        field(8; "Contractor Name"; Text[250])
        {
            DataClassification = ToBeClassified;
        }
        field(9; "Contract Sum"; Decimal)
        {
            DataClassification = ToBeClassified;
            Description = 'Award Tender Sum Inc Taxes (LCY)';
        }
        field(10; "Project Name"; Text[250])
        {
            DataClassification = ToBeClassified;
        }
        field(11; "Project Start Date"; Date)
        {
            DataClassification = ToBeClassified;
        }
        field(12; "Project End Date"; Date)
        {
            DataClassification = ToBeClassified;
        }
        field(13; Status; Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = ' ,Open,Pending Approval,Released,Rejected';
            OptionMembers = " ",Open,"Pending Approval",Released,Rejected;
        }
        field(14; Posted; Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(15; "Created By"; Code[100])
        {
            DataClassification = ToBeClassified;
        }
        field(16; "Created DateTime"; DateTime)
        {
            DataClassification = ToBeClassified;
        }
        field(17; "No Series"; Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(18; "Line No"; Integer)
        {
            DataClassification = ToBeClassified;
        }
        field(19; "Measurement Sheet No"; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Inspection & Payment Header"."Document No" where("Document Type" = filter("Measurement Sheeet"));
        }
        field(20; "Inspection Sheet No"; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Inspection & Payment Header"."Document No" where("Document Type" = filter("Works Inspection"));
        }
        field(21; "Inspection Committee No."; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "IFS Tender Committee";
        }
        field(22; "Rejection Comments"; Text[250])
        {
            DataClassification = ToBeClassified;
        }
    }

    keys
    {
        key(Key1; "Document No", "Document Type")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }

    trigger OnInsert()
    begin
        "Created By" := UserId;
        "Created DateTime" := CreateDatetime(Today, Time);
        "Document Date" := Today;
        Status := Status::Open;

        //cc//  RoadManagementSetup.Get;
        if "Document No" = '' then begin
            if "Document Type" = "document type"::"Measurement Sheeet" then begin
                //cc//  RoadManagementSetup.TestField("Measurement Sheet Nos");
                //cc//       NoSeriesManagement.InitSeries(RoadManagementSetup."Measurement Sheet Nos", xRec."No Series", Today, "Document No", Rec."No Series");
            end;
        end;

        if "Document No" = '' then begin
            if "Document Type" = "document type"::"Works Inspection" then begin
                //cc//   RoadManagementSetup.TestField("Inspection Nos");
                //cc//     NoSeriesManagement.InitSeries(RoadManagementSetup."Inspection Nos", xRec."No Series", Today, "Document No", Rec."No Series");
            end;
        end;

        if "Document No" = '' then begin
            if "Document Type" = "document type"::"Payment Certificate" then begin
                //cc//   RoadManagementSetup.TestField("Payment Certificate Nos");
                //cc//      NoSeriesManagement.InitSeries(RoadManagementSetup."Payment Certificate Nos", xRec."No Series", Today, "Document No", Rec."No Series");
            end;
        end;
    end;

    var
        //cc//  RoadManagementSetup: Record UnknownRecord72102;
        NoSeriesManagement: Codeunit "No. Series";
        PurchaseHeader: Record "Purchase Header";
        Job: Record Job;
        Vendor: Record Vendor;
        JobPlanningLine: Record "Job Planning Line";
    //cc//   InspectionPaymentLine: Record UnknownRecord72175;


    procedure FnPopulateLines()
    begin
    end;
}
