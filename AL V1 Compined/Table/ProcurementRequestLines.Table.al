#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Table 70014 "Procurement Request Lines"
{

    fields
    {
        field(1; "Requisition No"; Code[50])
        {
            TableRelation = "Procurement Request";

            trigger OnValidate()
            begin

                if ReqHeader.Get("Requisition No") then begin
                    "Procurement Plan" := ReqHeader."Procurement Plan";
                    "Global Dimension 1 Code" := ReqHeader."Global Dimension 1 Code";

                end;
            end;
        }
        field(2; "Line No"; Integer)
        {

            trigger OnValidate()
            begin
                if ReqHeader.Get("Requisition No") then begin
                    "Procurement Plan" := ReqHeader."Procurement Plan";
                    "Global Dimension 1 Code" := ReqHeader."Global Dimension 1 Code";

                end;
            end;
        }
        field(3; Type; Option)
        {
            OptionCaption = ' ,Non Stock Item,Item,,Fixed Asset';
            OptionMembers = " ","Non Stock Item",Item,,"Fixed Asset";
        }
        field(4; No; Code[10])
        {
            TableRelation = if (Type = const("Non Stock Item")) "G/L Account"
            else if (Type = const(Item)) Item
            else if (Type = const("Fixed Asset")) "Fixed Asset";

            trigger OnValidate()
            begin
                items.Reset;
                if items.Get(No) then begin
                    Description := items.Description;
                end;
            end;
        }
        field(5; Description; Text[250])
        {
        }
        field(6; Quantity; Decimal)
        {
        }
        field(7; "Unit of Measure"; Code[50])
        {
            TableRelation = "Unit of Measure";
        }
        field(8; "Unit Price"; Decimal)
        {

            trigger OnValidate()
            begin
                Amount := Quantity * "Unit Price";
                "Amount LCY" := Quantity * "Unit Price";
            end;
        }
        field(9; Amount; Decimal)
        {
        }
        field(10; "Procurement Plan"; Code[10])
        {
            TableRelation = "Procurement Header";
        }
        field(11; "Procurement Plan Item"; Code[10])
        {
            TableRelation = "Procurement Plan 1"."Plan Item No" where("Plan Year" = field("Procurement Plan"));

            trigger OnValidate()
            begin
                if ProcurementPlan.Get("Procurement Plan", "Global Dimension 1 Code", "Procurement Plan Item") then begin
                    if ProcurementPlan."Procurement Type" = ProcurementPlan."procurement type"::Goods then begin
                        Type := Type::Item;
                    end;
                    /*
                    IF ProcurementPlan."Procurement Type"=ProcurementPlan."Procurement Type"::Goods THEN
                    BEGIN
                     Type:=Type::"Fixed Asset";
                    END;
                     */
                    if ProcurementPlan."Procurement Type" <> ProcurementPlan."procurement type"::Goods then begin
                        Type := Type::"Non Stock Item";
                        No := ProcurementPlan."Source of Funds";
                    end;
                    "Budget Line" := ProcurementPlan."Source of Funds";
                    Description := ProcurementPlan."Item Description";
                end;

            end;
        }
        field(12; "Budget Line"; Code[10])
        {
        }
        field(13; "Global Dimension 1 Code"; Code[20])
        {
            CaptionClass = '1,1,1';
            Caption = 'Department';
            TableRelation = "Dimension Value".Code where("Global Dimension No." = const(1));

            trigger OnValidate()
            begin
                //ValidateShortcutDimCode(1,"Global Dimension 1 Code");

                /*PurchaseReqDet.RESET;
                PurchaseReqDet.SETRANGE(PurchaseReqDet."Requistion No.","Requisition No.");
                
                IF PurchaseReqDet.FIND('-') THEN BEGIN
                REPEAT
                PurchaseReqDet."Global Dimension 1 Code":="Global Dimension 1 Code";
                PurchaseReqDet.MODIFY;
                UNTIL PurchaseReqDet.NEXT=0;
                END;
                
                PurchaseReqDet.VALIDATE(PurchaseReqDet."No."); */

            end;
        }
        field(14; "Amount LCY"; Decimal)
        {
        }
        field(15; Select; Boolean)
        {
        }
        field(16; "Request Generated"; Boolean)
        {
        }
        field(17; "Supplier Category"; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Supplier Category";
        }
        field(18; "Vendor No"; Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = Vendor;
        }
        field(19; Ordered; Boolean)
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(20; "Order Date"; Date)
        {
            DataClassification = ToBeClassified;
        }
        field(34; "Activity Type"; Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = ',WorkPlan,Admin & PE,Proc Plan';
            OptionMembers = ,WorkPlan,"Admin & PE","Proc Plan";

            trigger OnValidate()
            begin
                if ReqHeader.Get("Requisition No") then begin
                    if ReqHeader.Status <> ReqHeader.Status::Open then
                        Error('You cannot Modify the Activity Type at this stage');
                end;
            end;
        }
        field(35; "Current Budget"; Code[100])
        {
            DataClassification = ToBeClassified;
            TableRelation = "G/L Budget Name";
        }
        field(36; Activity; Code[20])
        {
            DataClassification = ToBeClassified;

            trigger OnValidate()
            begin
                /*
                    IF ReqHeader.GET("Requisition No") THEN BEGIN
                  IF ReqHeader.Status<>ReqHeader.Status::Open THEN
                  ERROR('You cannot Modify the Activity at this stage');
                  END;
                
                GLSetup.GET;
                
                CASE "Activity Type" OF
                 "Activity Type"::WorkPlan:
                  BEGIN
                  WorkPlan.RESET;
                  WorkPlan.SETRANGE(Code,Activity);
                  WorkPlan.SETFILTER("Budget Filter",GLSetup."Current Budget");
                  IF WorkPlan.FIND('+') THEN BEGIN
                    Activity:=WorkPlan.Code;
                    Type:=Type::"G/L Account";
                    No:=WorkPlan."G/L Account";
                     VALIDATE(No);
                     //Description:=WorkPlan.Name;
                   // "Global Dimension 1 Code":=WorkPlan."Global Dimension 1 Code";
                    //"Global Dimension 2 Code":=WorkPlan."Global Dimension 2 Code";
                     "Available amount":=WorkPlan.Amount;
                   END;
                  END;
                  "Activity Type"::"Admin & PE":
                   BEGIN
                
                   AdminPlan.RESET;
                   AdminPlan.SETRANGE("PE Activity Code",Activity);
                   AdminPlan.SETFILTER("Budget Filter",GLSetup."Current Budget");
                   IF AdminPlan.FIND('+') THEN BEGIN
                    Activity:=AdminPlan."PE Activity Code";
                    Type:=Type::"G/L Account";
                    No:=AdminPlan."G/L Account";
                     VALIDATE(No);
                     //Description:=AdminPlan.Name;
                    //"Global Dimension 1 Code":=AdminPlan."Global Dimension 1 Code";
                    //"Global Dimension 2 Code":=AdminPlan."Global Dimension 2 Code";
                    "Available amount":=AdminPlan.Amount;
                   END;
                   END;
                  "Activity Type"::"Proc Plan":
                   BEGIN
                   ProcurementPlan.RESET;
                   ProcurementPlan.SETRANGE("Plan Item No",Activity);
                   //ProcurementPlan.SETRANGE(Type,"Procurement Type"); //Add Department Filter
                   ProcurementPlan.SETFILTER("Budget Filter",GLSetup."Current Budget");
                   IF ProcurementPlan.FIND('+') THEN BEGIN
                    Activity:=ProcurementPlan."Plan Item No";
                    No:=ProcurementPlan."No.";
                    VALIDATE(No);
                     Description:=ProcurementPlan."Item Description";
                     //"Commitment Amount":=;
                     "Unit Price":=ProcurementPlan."Unit Price";
                    //"Global Dimension 1 Code":=ProcurementPlan."Global Dimension 1 Code";
                    //"Global Dimension 2 Code":=ProcurementPlan."Global Dimension 2 Code";
                    "Available amount":=ProcurementPlan."Estimated Cost";
                   END;
                   END;
                
                 END;
                 */

            end;
        }
        field(70029; Specifications; Text[250])
        {
            FieldClass = Normal;
        }
        field(70030; "Requisition No."; Code[20])
        {
            CalcFormula = lookup("Procurement Request"."Requisition No" where(No = field("Requisition No")));
            FieldClass = FlowField;

            trigger OnValidate()
            begin
                purcHeader.Reset;
                if purcHeader.Get("Requisition No.") then begin
                    Specifications := purcHeader.Description;
                end;
            end;
        }
        field(70031; "Job No."; Code[20])
        {
            Caption = 'Job No.';
            DataClassification = ToBeClassified;
            Description = 'Job No from PRN to RFQ 28.11.2019';
            TableRelation = Job;

            trigger OnValidate()
            var
                Job: Record Job;
            begin
                /*TESTFIELD("Drop Shipment",FALSE);
                TESTFIELD("Special Order",FALSE);
                TESTFIELD("Receipt No.",'');
                IF "Document Type" = "Document Type"::Order THEN
                  TESTFIELD("Quantity Received",0);
                
                IF ReservEntryExist THEN
                  TESTFIELD("Job No.",'');
                
                IF "Job No." <> xRec."Job No." THEN BEGIN
                  VALIDATE("Job Task No.",'');
                  VALIDATE("Job Planning Line No.",0);
                END;
                
                IF "Job No." = '' THEN BEGIN
                  CreateDim(
                    DATABASE::Job,"Job No.",
                    DimMgt.TypeToTableID3(Type),"No.",
                    DATABASE::"Responsibility Center","Responsibility Center",
                    DATABASE::"Work Center","Work Center No.");
                  EXIT;
                END;
                
                IF NOT (Type IN [Type::Item,Type::"G/L Account"]) THEN
                  FIELDERROR("Job No.",STRSUBSTNO(Text012,FIELDCAPTION(Type),Type));
                Job.GET("Job No.");
                Job.TestBlocked;
                "Job Currency Code" := Job."Currency Code";
                
                CreateDim(
                  DATABASE::Job,"Job No.",
                  DimMgt.TypeToTableID3(Type),"No.",
                  DATABASE::"Responsibility Center","Responsibility Center",
                  DATABASE::"Work Center","Work Center No.");
                  */

            end;
        }
        field(70032; "Job Task No."; Code[20])
        {
            Caption = 'Job Task No.';
            DataClassification = ToBeClassified;
            Description = 'Job Task no from PRN to RFQ 28.11.2019';

            trigger OnValidate()
            begin
                /*TESTFIELD("Receipt No.",'');
                
                IF "Job Task No." <> xRec."Job Task No." THEN BEGIN
                  VALIDATE("Job Planning Line No.",0);
                  IF "Document Type" = "Document Type"::Order THEN
                    TESTFIELD("Quantity Received",0);
                END;
                
                IF "Job Task No." = '' THEN BEGIN
                  CLEAR(TempJobJnlLine);
                  "Job Line Type" := "Job Line Type"::" ";
                  UpdateJobPrices;
                  CreateDim(
                    DimMgt.TypeToTableID3(Type),"No.",
                    DATABASE::Job,"Job No.",
                    DATABASE::"Responsibility Center","Responsibility Center",
                    DATABASE::"Work Center","Work Center No.");
                  EXIT;
                END;
                
                JobSetCurrencyFactor;
                IF JobTaskIsSet THEN BEGIN
                  CreateTempJobJnlLine(TRUE);
                  UpdateJobPrices;
                END;
                UpdateDimensionsFromJobTask;*/

            end;
        }
    }

    keys
    {
        key(Key1; "Requisition No", "Line No")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }

    trigger OnInsert()
    begin
        if ReqHeader.Get("Requisition No") then begin
            "Procurement Plan" := ReqHeader."Procurement Plan";
            "Global Dimension 1 Code" := ReqHeader."Global Dimension 1 Code";

            //added by Shawn for Portal
            "Requisition No." := procRequests."Requisition No";
        end;
    end;

    var
        ReqHeader: Record "Requisition Header1";
        ProcurementPlan: Record "Procurement Plan 1";
        procRequests: Record "Procurement Request";
        items: Record Item;
        purcHeader: Record "Purchase Header";
}
