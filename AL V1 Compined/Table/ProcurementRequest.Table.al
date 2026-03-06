#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Table 70002 "Procurement Request"
{
    Caption = 'Procurement Request';
    DrillDownPageID = "Procurement Requests";
    LookupPageID = "Procurement Requests";

    fields
    {
        field(1; No; Code[50])
        {
        }
        field(2; Title; Text[250])
        {
        }
        field(3; "Requisition No"; Code[20])
        {
            TableRelation = "Purchase Header" where(Status = const(Released),
                                                     "Document Type" = const("Purchase Requisition"));

            trigger OnValidate()
            begin
                RequisitionLines.Reset;
                RequisitionLines.SetRange(RequisitionLines."Requisition No", "Requisition No");
                if RequisitionLines.Find('-') then begin
                    repeat
                        RFQLines.Init;
                        RFQLines."Requisition No" := No;
                        RFQLines."Line No" := RFQLines."Line No" + 1000;
                        RFQLines.Type := RequisitionLines.Type;
                        RFQLines.No := RequisitionLines."Requisition No";
                        RFQLines.Description := RequisitionLines.Description;
                        RFQLines.Quantity := RequisitionLines.Quantity;
                        RFQLines."Unit of Measure" := RequisitionLines."Unit of Measure";
                        RFQLines."Unit Price" := RequisitionLines."Unit Cost";
                        RFQLines.Amount := RequisitionLines.Amount;
                        RFQLines."Procurement Plan" := RequisitionLines."Procurement Plan";
                        RFQLines."Procurement Plan Item" := RequisitionLines."Procurement Plan Item";
                        RFQLines."Budget Line" := RequisitionLines."Procurement Plan Item";
                        RFQLines."Global Dimension 1 Code" := RequisitionLines."Global Dimension 1 Code";
                        RFQLines."Amount LCY" := RequisitionLines."Amount LCY";
                        if not RFQLines.Get(RFQLines."Requisition No", RFQLines."Line No") then
                            RFQLines.Insert;
                    // MESSAGE('INSERT');
                    until RequisitionLines.Next = 0;
                end;

                ReqTechnicalSpecs.Reset;
                ReqTechnicalSpecs.SetRange(ReqTechnicalSpecs."Requisition No", "Requisition No");
                if ReqTechnicalSpecs.Find('-') then begin
                    repeat
                        TenderTechnicalSpecs.Init;
                        TenderTechnicalSpecs."Requisition No" := No;
                        TenderTechnicalSpecs."Line No" := ReqTechnicalSpecs."Line No";
                        TenderTechnicalSpecs.Type := ReqTechnicalSpecs.Type;
                        TenderTechnicalSpecs.No := ReqTechnicalSpecs.No;
                        TenderTechnicalSpecs.Description := ReqTechnicalSpecs.Description;
                        TenderTechnicalSpecs.Specification := ReqTechnicalSpecs.Specification;
                        TenderTechnicalSpecs.Remarks := ReqTechnicalSpecs.Remarks;
                        TenderTechnicalSpecs.Insert;
                    until ReqTechnicalSpecs.Next = 0;
                end;

                ReqMandatoryRequirements.Reset;
                ReqMandatoryRequirements.SetRange(ReqMandatoryRequirements."Tender No", "Requisition No");
                if ReqMandatoryRequirements.Find('-') then begin
                    repeat
                        TenderMandatoryRequirements.Init;
                        TenderMandatoryRequirements."Tender No" := No;
                        TenderMandatoryRequirements.Specification := ReqMandatoryRequirements.Specification;
                        TenderMandatoryRequirements.Type := ReqMandatoryRequirements.Type;
                        TenderMandatoryRequirements.No := ReqMandatoryRequirements.No;
                        TenderMandatoryRequirements.Description := ReqMandatoryRequirements.Description;
                        TenderMandatoryRequirements.Remarks := ReqMandatoryRequirements.Remarks;
                        TenderMandatoryRequirements.Insert;
                    until ReqMandatoryRequirements.Next = 0;
                end;
            end;
        }
        field(4; "Procurement Plan No"; Code[20])
        {
            TableRelation = "Procurement Plan 1";

            trigger OnValidate()
            begin
                if "Process Type" = "process type"::RFQ then begin
                    "Document No" := 'KEMRI/RFQ/' + CopyStr(No, 4, 3) + '/' + "Procurement Plan No";
                end;

                if "Process Type" = "process type"::RFP then begin
                    "Document No" := 'KEMRI/RFP/' + CopyStr(No, 4, 3) + '/' + "Procurement Plan No";
                end;
                if "Process Type" = "process type"::EOI then begin
                    "Document No" := 'KEMRI/' + No + '/' + "Procurement Plan No";
                end;

                if "Process Type" = "process type"::Direct then begin
                    "Document No" := 'KEMRI/DIR/' + CopyStr(No, 4, 3) + '/' + "Procurement Plan No";
                end;

                if "Process Type" = "process type"::"Specially Permitted" then begin
                    "Document No" := 'KEMRI/SP/' + CopyStr(No, 4, 3) + '/' + "Procurement Plan No";
                end;
            end;
        }
        field(5; "Creation Date"; Date)
        {
            Editable = false;
        }
        field(6; "User ID"; Code[30])
        {
            Editable = false;
        }
        field(7; "Procurement Method"; Code[20])
        {
            TableRelation = "Procurement Plan 1";
        }
        field(8; "No.Series"; Code[100])
        {
        }
        field(9; "Process Type"; Option)
        {
            OptionCaption = ' ,Direct,RFQ,RFP,Tender,Low Value,Specially Permitted,EOI';
            OptionMembers = " ",Direct,RFQ,RFP,Tender,"Low Value","Specially Permitted",EOI;
        }
        field(10; "Procurement Plan Item"; Code[20])
        {
            TableRelation = "Procurement Plan 1"."Plan Item No" where("Plan Year" = field("Procurement Plan No"));
        }
        field(11; "Supplier Category"; Code[20])
        {
            TableRelation = "Supplier Category";

            trigger OnValidate()
            begin
                /*IF "Supplier Category" <>''THEN BEGIN
                PreQualified.RESET;
                PreQualified.SETRANGE(PreQualified.Category,"Supplier Category");
                PreQualified.SETRANGE(PreQualified."Fiscal Year","Procurement Plan No");
                IF PreQualified.FIND('-') THEN BEGIN
                REPEAT
                  Category.RESET;
                  Category.SETRANGE(Category."Reference No.",No);
                  Category.SETRANGE(Category."Supplier Name",PreQualified.Name);
                  IF Category.FINDSET =FALSE THEN BEGIN
                Category.INIT;
                Category."Reference No.":=No;
                Category."Supplier Name":=PreQualified.Name;
                Category."Supplier Category":=PreQualified.Category;
                Category.Awarded:=FALSE;
                Category.INSERT;
                END;
                UNTIL PreQualified.NEXT=0;
                END;
                END;*/

            end;
        }
        field(12; "Global Dimension 1 Code"; Code[20])
        {
            CaptionClass = '1,1,1';
            Caption = 'Global Dimension 1 Code';
            TableRelation = "Dimension Value".Code where("Global Dimension No." = const(1));

            trigger OnValidate()
            begin
                //ValidateShortcutDimCode(1,"Global Dimension 1 Code");

                /*
                PurchaseReqDet.RESET;
                PurchaseReqDet.SETRANGE(PurchaseReqDet."Requistion No.","Requisition No.");
                
                IF PurchaseReqDet.FIND('-') THEN  BEGIN
                REPEAT
                PurchaseReqDet."Global Dimension 2 Code":="Global Dimension 2 Code";
                PurchaseReqDet.MODIFY;
                UNTIL PurchaseReqDet.NEXT=0;
                END;
                */

            end;
        }
        field(13; "Global Dimension 2 Code"; Code[20])
        {
            CaptionClass = '1,1,2';
            Caption = 'Global Dimension 3 Code';
            TableRelation = "Dimension Value".Code where("Global Dimension No." = const(2));

            trigger OnValidate()
            begin
                /*
                PurchaseReqDet.RESET;
                PurchaseReqDet.SETRANGE(PurchaseReqDet."Requistion No.","Requisition No.");
                
                IF PurchaseReqDet.FIND('-') THEN BEGIN
                REPEAT
                PurchaseReqDet."Global Dimension 3 Code":="Global Dimension 3 Code";
                PurchaseReqDet.MODIFY;
                UNTIL PurchaseReqDet.NEXT=0;
                
                 END;
                
                {
                IF "Global Dimension 2 Code" = '' THEN
                  EXIT;
                GetGLSetup;
                ValidateDimValue(GLSetup."Global Dimension 2 Code","Global Dimension 2 Code");
                
                }
                */

            end;
        }
        field(14; "Tender Opening Date"; Date)
        {
        }
        field(15; "Tender Status"; Option)
        {
            OptionCaption = ' ,New Tender,Retender,Approved,Cancelled,Postponed';
            OptionMembers = " ","New Tender",Retender,Approved,Cancelled,Postponed;
        }
        field(16; "Tender Closing Date"; Date)
        {
        }
        field(18; Addedum; Text[30])
        {
        }
        field(19; SiteView; DateTime)
        {
        }
        field(20; Status; Option)
        {
            OptionCaption = 'Open,Pending Approval,Released,Canceled,Rejected';
            OptionMembers = Open,"Pending Approval",Released,Canceled,Rejected;
        }
        field(21; "Return Date"; Date)
        {
            Editable = true;

            trigger OnValidate()
            begin


                Validity := "Return Date" - "Issued Date";
                "Validity Period" := Format(Validity) + ' ' + 'Days';
            end;
        }
        field(22; "Return Time"; Time)
        {
        }
        field(23; "Tender Type"; Option)
        {
            OptionCaption = ' ,Open National,Open International,Restricted';
            OptionMembers = " ","Open National","Open International",Restricted;

            trigger OnValidate()
            begin

                if "Process Type" = "process type"::Tender then begin
                    if "Tender Type" = "tender type"::"Open National" then
                        // "Document No":='KEMRI/NT/'+No+'/'+"Procurement Plan No"
                        "Document No" := No + '/' + "Procurement Plan No"
                    else if "Tender Type" = "tender type"::"Open International" then
                        "Document No" := 'KEMRI/OI/' + No + '/' + "Procurement Plan No"
                    else if "Tender Type" = "tender type"::Restricted then
                        "Document No" := 'KEMRI/RT/' + No + '/' + "Procurement Plan No"
                    else
                        "Document No" := '';
                end;
            end;
        }
        field(24; "Document No"; Code[30])
        {
        }
        field(25; "No of Tender Documents"; Integer)
        {
            CalcFormula = count(Bidders where("Ref No." = field(No)));
            Editable = false;
            FieldClass = FlowField;
        }
        field(26; "Extended Date"; Date)
        {
        }
        field(27; "Currency Code"; Code[20])
        {
            TableRelation = Currency;
        }
        field(28; "Tender Amount"; Decimal)
        {
        }
        field(29; "Validity Period"; Text[30])
        {

            trigger OnValidate()
            begin
                /*
                IF "Tender Opening Date"<>0DT THEN BEGIN
                  "Return Date":=CALCDATE("Validity Period",DT2DATE("Tender Opening Date"));
                
                END;
                */

            end;
        }
        field(30; "Issued Date"; Date)
        {
        }
        field(31; Closed; Boolean)
        {
        }
        field(32; "RFQ Sent"; Boolean)
        {
        }
        field(33; "Vendor No"; Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = Vendor;
        }
        field(34; "Procurement Amount"; Decimal)
        {
            CalcFormula = sum("Procurement Request Lines".Amount where("Requisition No" = field(No)));
            FieldClass = FlowField;
        }
        field(35; "Generate Multiple LPO"; Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(36; "Approval Status"; Integer)
        {
            CalcFormula = count("Approval Entry" where("Document No." = field(No)));
            FieldClass = FlowField;
        }
        field(37; "Tender Committee"; Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Tender Commitee Appointment1";
        }
        field(38; "Tender Number"; Text[50])
        {
            DataClassification = ToBeClassified;
        }
        field(50000; "Minutes Path"; Text[250])
        {
            DataClassification = ToBeClassified;
        }
        field(50001; "Evaluation Started?"; Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(50002; "Technical started?"; Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(50003; "Financial Started?"; Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(50004; "Technical Score"; Integer)
        {
            DataClassification = ToBeClassified;

            trigger OnValidate()
            begin
                if ("Technical Score" > 100) or ("Technical Score" < 0) then begin
                    Error('Score can only be between 0 and 100!!!');
                end;
                "Financial Score" := 100 - "Technical Score";
            end;
        }
        field(50005; "Financial Score"; Integer)
        {
            DataClassification = ToBeClassified;
        }
        field(50006; "Award Started"; Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(50007; minutesbeforeproceedtoaward; Text[250])
        {
            DataClassification = ToBeClassified;
        }
        field(50008; minutesafterproceedtoaward; Text[250])
        {
            DataClassification = ToBeClassified;
        }
        field(50009; "Awarded?"; Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(50010; "Successful Bidder"; Text[250])
        {
            CalcFormula = lookup(Bidders.Name where("Ref No." = field(No),
                                                     "Recommended Winner" = const(true)));
            FieldClass = FlowField;
        }
        field(50011; "Select Bidder Vendor No"; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = Vendor;
        }
        field(50012; "Selected Bidder Name"; Text[250])
        {
            CalcFormula = lookup(Vendor.Name where("No." = field("Select Bidder Vendor No")));
            FieldClass = FlowField;
        }
        field(50013; "No. Series"; Code[50])
        {
            DataClassification = ToBeClassified;
        }
        field(50014; "Evaluation Admin"; Code[40])
        {
            DataClassification = ToBeClassified;
            TableRelation = "User Setup";
        }
        field(50015; "Mandatory started?"; Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(50016; "Mandatory in progress?"; Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(50017; "Technical in Progress?"; Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(50018; "Financial in Progress?"; Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(50019; "Awarding in Progress?"; Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(50020; "LPO Generated"; Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(50021; "Current Budget"; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "G/L Budget Name";
        }
        field(50022; "TOR Attached"; Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(50023; "Approval Path"; Integer)
        {
            CalcFormula = count("Approval Entry" where("Document No." = field(No)));
            FieldClass = FlowField;
        }
        field(50024; "TOR File Name"; Text[100])
        {
            DataClassification = ToBeClassified;
        }
        field(50025; "Quotation Pending Opening"; Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(50026; "Opening Person 1"; Code[30])
        {
            DataClassification = ToBeClassified;
            ExtendedDatatype = Masked;

            trigger OnValidate()
            begin
                if ((("Opening Person 1" <> '') and ("Opening Person 2" <> '')) and ("Opening Person 3" <> '')) then begin
                    "Quotation Evaluation" := true;
                    Message('Moved to Quotation Evalutaion...');
                end;
            end;
        }
        field(50027; "Opening Person 2"; Code[30])
        {
            DataClassification = ToBeClassified;
            ExtendedDatatype = Masked;

            trigger OnValidate()
            begin
                if ((("Opening Person 1" <> '') and ("Opening Person 2" <> '')) and ("Opening Person 3" <> '')) then begin
                    "Quotation Evaluation" := true;
                    Message('Moved to Quotation Evalutaion...');
                end;
            end;
        }
        field(50028; "Opening Person 3"; Code[30])
        {
            DataClassification = ToBeClassified;
            ExtendedDatatype = Masked;

            trigger OnValidate()
            begin
                if ((("Opening Person 1" <> '') and ("Opening Person 2" <> '')) and ("Opening Person 3" <> '')) then begin
                    "Quotation Evaluation" := true;
                    Message('Moved to Quotation Evalutaion...');
                end;
            end;
        }
        field(50029; "Asigned User"; Code[50])
        {
            DataClassification = ToBeClassified;
            TableRelation = "User Setup";
        }
        field(50030; "Quotation Evaluation"; Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(50031; "In Financial?"; Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(50032; "In Technical?"; Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(50033; "In Award?"; Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(50034; "Pending LPO?"; Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(50035; "Minutes File"; Text[250])
        {
            DataClassification = ToBeClassified;
        }
        field(50036; "Quotation Finished?"; Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(50037; "Technical Minutes"; Text[250])
        {
            DataClassification = ToBeClassified;
        }
        field(50038; "Does Not Require TOR"; Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(50039; "Justification Memo"; Text[250])
        {
            DataClassification = ToBeClassified;
        }
        field(50040; "Direct?"; Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(50061; "PO Type"; Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = ' ,LSO,LPO';
            OptionMembers = " ",LSO,LPO;

            trigger OnValidate()
            begin
                //Decision := Decision::Order;
            end;
        }
        field(50062; "Opening Committee"; Code[50])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Tender Commitee Appointment1"."Appointment No";
        }
        field(50063; "Evaluation Committee"; Code[50])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Tender Commitee Appointment1"."Appointment No";
        }
    }

    keys
    {
        key(Key1; No)
        {
            Clustered = true;
        }
        key(Key2; Title)
        {
        }
    }

    fieldgroups
    {
        fieldgroup(test; No, Title)
        {
        }
    }

    trigger OnInsert()
    begin

        if No = '' then begin

            //MESSAGE('No is empty');

            TestField("Process Type");

            if "Process Type" = "process type"::RFQ then begin
                PurchSetup.Get;
                PurchSetup.TestField(PurchSetup."Request for Quotation Nos.");
              //  NoSeriesMgt.InitSeries(PurchSetup."Request for Quotation Nos.", xRec."No.Series", 0D, No, "No.Series");
                No:=NoSeriesMgt.GetNextNo(PurchSetup."Request for Quotation Nos.",WorkDate(),true);
                //NoSeriesMgt.InitSeries(DefaultNoSeriesCode,OldNoSeriesCode,NewDate,NewNo,NewNoSeriesCode)

                //NoSeriesMgt.InitSeries(SalesSetup."File Movement Numbers",xRec."File Movement Code",0D,"File Movement Code","No. Series");
            end;

            if "Process Type" = "process type"::RFP then
            // MESSAGE('%1',PurchSetup."Direct Prcmnt Nos");
            begin
                PurchSetup.Get;
                PurchSetup.TestField(PurchSetup."Request for Proposals Nos.");
              //  NoSeriesMgt.InitSeries(PurchSetup."Request for Proposals Nos.", xRec."No.Series", 0D, No, "No.Series");
                    No:=NoSeriesMgt.GetNextNo(PurchSetup."Request for Proposals Nos.",WorkDate(),true);
                //NoSeriesMgt.InitSeries(SalesSetup."File Movement Numbers",xRec."File Movement Code",0D,"File Movement Code","No. Series");
            end;

            if "Process Type" = "process type"::EOI then
            // MESSAGE('%1',PurchSetup."Direct Prcmnt Nos");
            begin
                PurchSetup.Get;
                PurchSetup.TestField(PurchSetup."Expression of Interest Nos.");
              //  NoSeriesMgt.InitSeries(PurchSetup."Expression of Interest Nos.", xRec."No.Series", 0D, No, "No.Series");
                No:=NoSeriesMgt.GetNextNo(PurchSetup."Expression of Interest Nos.",WorkDate(),true);
                //NoSeriesMgt.InitSeries(SalesSetup."File Movement Numbers",xRec."File Movement Code",0D,"File Movement Code","No. Series");
            end;


            if "Process Type" = "process type"::Tender then begin
                PurchSetup.Get;
                PurchSetup.TestField(PurchSetup."Tenders Nos");
              //  NoSeriesMgt.InitSeries(PurchSetup."Tenders Nos", xRec."No.Series", 0D, No, "No.Series");
                No:=NoSeriesMgt.GetNextNo(PurchSetup."Tenders Nos",WorkDate(),true);
                //NoSeriesMgt.InitSeries(SalesSetup."File Movement Numbers",xRec."File Movement Code",0D,"File Movement Code","No. Series");
            end;

            if "Process Type" = "process type"::Direct then begin
                PurchSetup.Get;
                PurchSetup.TestField(PurchSetup."Direct Prcmnt Nos");
                No:=NoSeriesMgt.GetNextNo(PurchSetup."Direct Prcmnt Nos",WorkDate(),true);
                //NoSeriesMgt.InitSeries(SalesSetup."File Movement Numbers",xRec."File Movement Code",0D,"File Movement Code","No. Series");
            end;

            if "Process Type" = "process type"::"Specially Permitted" then begin
                PurchSetup.Get;
                PurchSetup.TestField(PurchSetup."Specially Permitted Prcmnt Nos");
                No:=NoSeriesMgt.GetNextNo(PurchSetup."Specially Permitted Prcmnt Nos",WorkDate(),true);
                // NoSeriesMgt.InitSeries(DefaultNoSeriesCode,OldNoSeriesCode,NewDate,NewNo,NewNoSeriesCode)
                //NoSeriesMgt.InitSeries(SalesSetup."File Movement Numbers",xRec."File Movement Code",0D,"File Movement Code","No. Series");
            end;

            if "Process Type" = "process type"::"Low Value" then begin
                PurchSetup.Get;
                PurchSetup.TestField(PurchSetup."Low Value Prcmnt Nos");
                No:=NoSeriesMgt.GetNextNo(PurchSetup."Low Value Prcmnt Nos",WorkDate(),true);
                //NoSeriesMgt.InitSeries(SalesSetup."File Movement Numbers",xRec."File Movement Code",0D,"File Movement Code","No. Series");
            end;

        end;

        "User ID" := UserId;
        "Creation Date" := Today;
    end;

    trigger OnModify()
    begin
        if Closed = true then
            Error('The Tender details cannot be edited after it has been closed!');
    end;

    var
        PurchSetup: Record "Purchases & Payables Setup";
        NoSeriesMgt: Codeunit "No. Series";
        RequisitionHeader: Record "Requisition Header1";
        RequisitionLines: Record "Requisition Lines1";
        RFQLines: Record "Procurement Request Lines";
        CurrExchRate: Record "Currency Exchange Rate";
        Validity: Integer;
        Category: Record "Supplier Selection1";
        PreQualified: Record "Prequalified Suppliers1";
        ReqTechnicalSpecs: Record "Tender Specifications";
        ReqMandatoryRequirements: Record "Tender Mandatory Requirements";
        TenderTechnicalSpecs: Record "Tender Specifications";
        TenderMandatoryRequirements: Record "Tender Mandatory Requirements";
        Text001: label 'Purchase Order No %1 has been Created';
        PurchLine: Record "Procurement Request Lines";


    procedure CreatePurchaseOrder(var PurchaseRec: Record "Procurement Request"; var Lineno: Integer; var Amountbd: Decimal)
    var
        reqlines: Record "Procurement Request Lines";
        PurchaseHeader: Record "Purchase Header";
        vend: Record Vendor;
        PurchaseRecLine: Record "Purchase Line";
        PurchaseLine: Record "Purchase Line";
        PurchSetup: Record "Purchases & Payables Setup";
        NoSeriesMgt: Codeunit "No. Series";
    begin
        reqlines.Reset;
        if reqlines.Get(PurchaseRec.No, Lineno) then begin

        end;

        //WITH PurchaseRec DO BEGIN


        if PurchaseRec."Vendor No" = '' then
            Error('Wrong Vendor No!!!');


        //Purchase Header
        PurchaseHeader.Init;
        PurchaseHeader."Document Type" := PurchaseHeader."document type"::Order;
        PurchaseHeader."No." := '';

        PurchSetup.Reset;
        PurchSetup.Get;
        //NoSeriesMgt.InitSeries(PurchSetup."Order Nos.",PurchaseHeader."No. Series",TODAY,PurchaseHeader."No.",PurchaseHeader."No. Series");

        PurchaseHeader."Buy-from Vendor No." := PurchaseRec."Vendor No";
        PurchaseHeader.Validate(PurchaseHeader."Buy-from Vendor No.");
        if vend.Get(PurchaseRec."Vendor No") then
            PurchaseHeader."Supplier Type" := vend."Supplier Type 1";


        PurchaseHeader."Requisition No" := PurchaseRec."Requisition No";
        //PurchaseHeader.VALIDATE(PurchaseHeader."Requisition No");
        PurchaseHeader."Contract No." := PurchaseRec.No;
        //IF NOT PurchaseHeader.GET(PurchaseHeader."No.") THEN
        //error('x1...');
        PurchaseHeader.Insert(true);


        //{                      //error(
        reqlines.Reset;
        if reqlines.Get(PurchaseRec.No, Lineno) then begin
            //error('%1..%2',PurchaseRec.No,Lineno);
            //Purchase Lines
            PurchaseLine.Reset;
            PurchaseLine.Init;
            PurchaseLine."Document Type" := PurchaseLine."document type"::Order;
            PurchaseLine."Document No." := PurchaseHeader."No.";
            PurchaseLine."Line No." := Lineno;//PurchaseLine.VALIDATE(PurchaseLine."No.");
            PurchaseLine."Buy-from Vendor No." := PurchaseRec."Vendor No";
            PurchaseLine.Type := reqlines.Type;
            PurchaseLine."No." := reqlines.No;//PurchaseRecLine.No;
            PurchaseLine.Validate(PurchaseLine."No.");
            PurchaseLine.Description := reqlines.Description;
            PurchaseLine."Unit of Measure" := PurchaseRecLine."Unit of Measure";
            PurchaseLine.Quantity := reqlines.Quantity;
            PurchaseLine.Validate(PurchaseLine.Quantity);
            PurchaseLine."Qty. to Receive" := reqlines.Quantity;
            PurchaseLine."Direct Unit Cost" := Amountbd;//PurchaseRecLine."Unit Price";
            PurchaseLine.Validate(PurchaseLine."Direct Unit Cost");
            PurchaseLine."Location Code" := PurchaseRecLine."Location Code";
            //PurchaseLine."Contract No":=PurchaseRec."Contract No.";
            //IF NOT PurchaseLine.GET(PurchaseLine."Document Type"::Order,PurchaseHeader."No.",PurchaseRecLine."Line No") THEN
            PurchaseLine."Activity Type" := reqlines."Activity Type";
            PurchaseLine.Activity := reqlines.Activity;
            PurchaseLine."Current Budget" := reqlines."Current Budget";
            PurchaseLine.Insert(true);

        end;

        Message(Text001, PurchaseHeader."No.");

        //}
    end;

    procedure PurchLinesExist(): Boolean
    begin
        PurchLine.Reset;
        PurchLine.SetRange("Requisition No", No);
        exit(not PurchLine.IsEmpty);
    end;


    procedure CreatePurchaseOrderRFQ(var PurchaseRec: Record "Procurement Request"; var Lineno: Integer; var Amountbd: Decimal; var TenderBids: Record "Tender Bids")
    var
        reqlines: Record "Procurement Request Lines";
        PurchaseHeader: Record "Purchase Header";
        vend: Record Vendor;
        PurchaseRecLine: Record "Purchase Line";
        PurchaseLine: Record "Purchase Line";
        PurchSetup: Record "Purchases & Payables Setup";
        NoSeriesMgt: Codeunit "No. Series";
    begin
        reqlines.Reset;
        if reqlines.Get(PurchaseRec.No, Lineno) then begin

        end;

        //WITH PurchaseRec DO BEGIN


        if PurchaseRec."Vendor No" = '' then
            Error('Wrong Vendor No!!!');


        //Purchase Header
        PurchaseHeader.Init;
        PurchaseHeader."Document Type" := PurchaseHeader."document type"::Order;
        PurchaseHeader."No." := '';

        PurchSetup.Reset;
        PurchSetup.Get;
        //NoSeriesMgt.InitSeries(PurchSetup."Order Nos.",PurchaseHeader."No. Series",TODAY,PurchaseHeader."No.",PurchaseHeader."No. Series");

        PurchaseHeader."Buy-from Vendor No." := PurchaseRec."Vendor No";
        PurchaseHeader.Validate(PurchaseHeader."Buy-from Vendor No.");
        if vend.Get(PurchaseRec."Vendor No") then
            PurchaseHeader."Supplier Type" := vend."Supplier Type 1";


        PurchaseHeader."Requisition No" := PurchaseRec."Requisition No";
        //PurchaseHeader.VALIDATE(PurchaseHeader."Requisition No");
        PurchaseHeader."Contract No." := PurchaseRec.No;
        //IF NOT PurchaseHeader.GET(PurchaseHeader."No.") THEN
        //error('x1...');
        PurchaseHeader.Insert(true);


        //{                      //error(
        reqlines.Reset;
        if reqlines.Get(PurchaseRec.No, Lineno) then begin
            //error('%1..%2',PurchaseRec.No,Lineno);
            //Purchase Lines
            // reqlines.CALCFIELDS(Specifications);
            PurchaseLine.Reset;
            PurchaseLine.Init;
            PurchaseLine."Document Type" := PurchaseLine."document type"::Order;
            PurchaseLine."Document No." := PurchaseHeader."No.";
            PurchaseLine."Line No." := Lineno;//PurchaseLine.VALIDATE(PurchaseLine."No.");
            PurchaseLine."Buy-from Vendor No." := PurchaseRec."Vendor No";
            PurchaseLine.Type := reqlines.Type;
            if TenderBids."Item No" = '' then
                PurchaseLine."No." := reqlines.No //PurchaseRecLine.No;
            else
                PurchaseLine."No." := TenderBids."Item No";
            PurchaseLine.Validate(PurchaseLine."No.");
            PurchaseLine.Description := reqlines.Description;
            PurchaseLine.Specifications := reqlines.Specifications;
            PurchaseLine."Job No." := reqlines."Job No."; //****Hunaina 28.11.2019 Job No from RFQ to PO
            PurchaseLine."Job Task No." := reqlines."Job Task No."; //****Hunaina 28.11.2019 Job Task No from RFQ to PO
            PurchaseLine."Unit of Measure" := PurchaseRecLine."Unit of Measure";
            //PurchaseLine.Quantity:=reqlines.Quantity;
            PurchaseLine.Quantity := TenderBids.Quantity;
            PurchaseLine.Validate(PurchaseLine.Quantity);
            PurchaseLine."Direct Unit Cost" := TenderBids."Unit Price";
            PurchaseLine."Qty. to Receive" := TenderBids.Quantity;
            //PurchaseLine."Direct Unit Cost":=Amountbd;//PurchaseRecLine."Unit Price";
            PurchaseLine.Validate(PurchaseLine."Direct Unit Cost");
            PurchaseLine."Location Code" := PurchaseRecLine."Location Code";
            //PurchaseLine."Contract No":=PurchaseRec."Contract No.";
            //IF NOT PurchaseLine.GET(PurchaseLine."Document Type"::Order,PurchaseHeader."No.",PurchaseRecLine."Line No") THEN
            PurchaseLine."Activity Type" := reqlines."Activity Type";
            PurchaseLine.Activity := reqlines.Activity;
            PurchaseLine."Current Budget" := reqlines."Current Budget";
            PurchaseLine.Insert(true);

        end;

        Message(Text001, PurchaseHeader."No.");

        //}
    end;
}
