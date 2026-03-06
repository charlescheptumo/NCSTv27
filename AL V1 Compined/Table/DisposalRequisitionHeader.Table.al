#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Table 70045 "Disposal Requisition Header"
{
    // DrillDownPageID = UnknownPage51511209;
    //LookupPageID = UnknownPage51511209;

    fields
    {
        field(1; "No."; Code[22])
        {
        }
        field(2; "Employee Code"; Code[50])
        {
            Editable = true;
            TableRelation = Employee;

            trigger OnValidate()
            begin
                /*IF Empl.GET("Employee Code") THEN
                "Employee Name":=Empl."First Name"+' '+Empl."Last Name"
                ELSE
                "Employee Name":='';
                MODIFY;

               IF Empl.GET("Employee Code") THEN
               BEGIN
                "Global Dimension 1 Code":=Empl."Global Dimension 1 Code";
                "Global Dimension 2 Code":=Empl."Global Dimension 2 Code";
               END;
               */


                if Empl.Get("Employee Code") then begin
                    "Employee Name" := Empl."First Name" + ' ' + Empl."Middle Name" + ' ' + Empl."Last Name";
                    "Global Dimension 1 Code" := Empl."Global Dimension 1 Code";
                    "Global Dimension 2 Code" := Empl."Global Dimension 2 Code";
                end else begin
                    "Employee Name" := '';
                    Modify;
                end;

            end;
        }
        field(3; "Employee Name"; Text[50])
        {
        }
        field(5; Reason; Text[100])
        {
        }
        field(6; "Requisition Date"; Date)
        {
        }
        field(7; Status; Option)
        {
            Caption = 'Status';
            Editable = true;
            OptionCaption = 'Open,Released,Pending Approval,Pending Prepayment,Rejected';
            OptionMembers = Open,Released,"Pending Approval","Pending Prepayment",Rejected,Archived;
        }
        field(10; "Raised by"; Code[50])
        {
        }
        field(14; "No. Series"; Code[10])
        {
            Caption = 'No. Series';
            Editable = false;
            TableRelation = "No. Series";
        }
        field(18; "Purchase?"; Boolean)
        {
        }
        field(20; "MA Approval"; Boolean)
        {
        }
        field(21; Rejected; Boolean)
        {
        }
        field(22; "Process Type"; Option)
        {
            OptionMembers = " ",Direct,RFQ,RFP,Tender;
        }
        field(23; "Global Dimension 1 Code"; Code[20])
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
        field(37; Ordered; Boolean)
        {
        }
        field(38; User; Code[50])
        {
            TableRelation = User;
        }
        field(39; "Global Dimension 2 Code"; Code[20])
        {
            CaptionClass = '1,1,2';
            Caption = 'Global Dimension 1 Code';
            TableRelation = "Dimension Value".Code where("Global Dimension No." = const(2));

            trigger OnValidate()
            begin
                //ValidateShortcutDimCode(1,"Global Dimension 1 Code");

                /*PurchaseReqDet.RESET;
                PurchaseReqDet.SETRANGE(PurchaseReqDet."Requistion No.","Requisition No.");
                
                IF PurchaseReqDet.FIND('-') THEN  BEGIN
                REPEAT
                PurchaseReqDet."Global Dimension 2 Code":="Global Dimension 2 Code";
                PurchaseReqDet.MODIFY;
                UNTIL PurchaseReqDet.NEXT=0;
                 END;*/

            end;
        }
        field(40; "Global Dimension 3 Code"; Code[20])
        {
            CaptionClass = '1,2,3';
            Caption = 'Global Dimension 3 Code';

            trigger OnValidate()
            begin
                Dimen := "Global Dimension 3 Code";
                Dimen := CopyStr(Dimen, 1, 3);
                "Global Dimension 2 Code" := Dimen;
                Dimens := "Global Dimension 3 Code";
                Dimens := CopyStr(Dimens, 1, 1);
                "Global Dimension 1 Code" := Dimens;

                /*PurchaseReqDet.RESET;
                PurchaseReqDet.SETRANGE(PurchaseReqDet."Requistion No.","Requisition No.");
                
                IF PurchaseReqDet.FIND('-') THEN BEGIN
                REPEAT
                PurchaseReqDet."Global Dimension 3 Code":="Global Dimension 3 Code";
                PurchaseReqDet.MODIFY;
                UNTIL PurchaseReqDet.NEXT=0;
                
                 END;
                
                {IF "Global Dimension 2 Code" = '' THEN
                  EXIT;
                GetGLSetup;
                ValidateDimValue(GLSetup."Global Dimension 2 Code","Global Dimension 2 Code");
                
                }  */

            end;
        }
        field(41; "Procurement Plan"; Code[10])
        {
            TableRelation = "Procurement Header".No where(Status = const(Approved));
        }
        field(42; "Purchaser Code"; Code[10])
        {
        }
        field(43; "Document Type"; Option)
        {
            OptionCaption = 'Quote,Order,Invoice,Credit Memo,Blanket Order,Return Order,None,Purchase Requisition,Store Requisition,Imprest,Claim-Accounting,Appointment,Payment Voucher';
            OptionMembers = Quote,"Order",Invoice,"Credit Memo","Blanket Order","Return Order","None","Purchase Requisition","Store Requisition",Imprest,"Claim-Accounting",Appointment,"Payment Voucher";
        }
        field(44; "Currency Code"; Code[10])
        {
            TableRelation = Currency;
        }
        field(45; "Date of Use"; Date)
        {
        }
        field(46; "Requisition Type"; Option)
        {
            OptionCaption = 'Quote,Order,Invoice,Credit Memo,Blanket Order,Return Order,None,Purchase Requisition,Store Requisition,Imprest,Claim-Accounting,Appointment,Payment Voucher';
            OptionMembers = Quote,"Order",Invoice,"Credit Memo","Blanket Order","Return Order","None","Purchase Requisition","Store Requisition",Imprest,"Claim-Accounting",Appointment,"Payment Voucher";
        }
        field(47; Posted; Boolean)
        {
        }
        field(48; "No of Approvals"; Integer)
        {
            CalcFormula = count("Approval Entry" where("Table ID" = const(70019),
                                                        "Document No." = field("No.")));
            FieldClass = FlowField;
        }
        field(49; "Global Dimension 4 Code"; Code[20])
        {
            CaptionClass = '1,2,4';
        }
        field(50; "Purchase Type"; Code[30])
        {
        }
        field(51; "Language Code (Default)"; Code[10])
        {
        }
        field(52; Attachment; Option)
        {
            OptionMembers = No,Yes;
        }
        field(53; "Posted By"; Code[50])
        {
            TableRelation = "User Setup";
        }
        field(54; "Date Posted"; Date)
        {
        }
        field(55; Issued; Boolean)
        {
            Editable = false;
        }
        field(56; "Issued By"; Code[50])
        {
        }
        field(57; Received; Boolean)
        {
        }
        field(58; "Received By"; Code[50])
        {
        }
        field(59; "Date Issued"; DateTime)
        {
        }
        field(60; "Date Received"; DateTime)
        {
        }
        field(61; Supplier; Text[100])
        {
        }
        field(62; "Supplier Code"; Code[20])
        {
            TableRelation = Vendor;

            trigger OnValidate()
            begin
                if Vend.Get("Supplier Code") then
                    Supplier := Vend.Name;
            end;
        }
        field(63; "Amount LCY"; Decimal)
        {
        }
        field(64; "FSC Code"; Code[10])
        {
        }
        field(65; Total; Decimal)
        {
            CalcFormula = sum("Requisition Lines1".Amount where("Requisition No" = field("No.")));
            FieldClass = FlowField;
        }
        field(66; "Activity No"; Code[10])
        {
        }
    }

    keys
    {
        key(Key1; "No.")
        {
            Clustered = true;
        }
        key(Key2; "Employee Code")
        {
        }
        key(Key3; "Employee Name")
        {
        }
    }

    fieldgroups
    {
        fieldgroup(DropDown; "No.", "Raised by", "Employee Code", "Employee Name")
        {
        }
    }

    trigger OnDelete()
    begin
        if Status <> Status::Open then
            Error('You cannot delete a document that is already approved or pending approval');
    end;

    trigger OnInsert()
    begin
        if "No." = '' then begin
            if "Requisition Type" = "requisition type"::"Purchase Requisition" then begin
                PurchSetup.Get;
                PurchSetup.TestField("Purchase Req No");
              //  NoSeriesMgt.InitSeries(PurchSetup."Purchase Req No", xRec."No.", 0D, "No.", "No. Series");
                    "No." := NoSeriesMgt.GetNextNo(PurchSetup."Purchase Req No", Today, true);
                //NoSeriesMgt.InitSeries(SalesSetup."File Movement Numbers",xRec."File Movement Code",0D,"File Movement Code","No. Series");
            end;

            if "Requisition Type" = "requisition type"::"Store Requisition" then begin
                PurchSetup.Get;
                PurchSetup.TestField(PurchSetup."Store Requisition Nos.");
             //   NoSeriesMgt.InitSeries(PurchSetup."Store Requisition Nos.", xRec."No.", 0D, "No.", "No. Series");
                    "No." := NoSeriesMgt.GetNextNo(PurchSetup."Store Requisition Nos.", Today, true);
                //NoSeriesMgt.InitSeries(SalesSetup."File Movement Numbers",xRec."File Movement Code",0D,"File Movement Code","No. Series");
            end;


        end;

        "Raised by" := UserId;
        "Date of Use" := Today;
        if UsersRec.Get(UserId) then begin
            if Empl.Get(UsersRec."Employee No.") then begin
                "Employee Code" := Empl."No.";
                "Employee Name" := Empl."First Name" + ' ' + Empl."Last Name";
                "Global Dimension 1 Code" := Empl."Global Dimension 1 Code";
                "Global Dimension 2 Code" := Empl."Global Dimension 2 Code";

                "Procurement Plan" := PurchSetup."Effective Procurement Plan";
            end;
        end;

        "Requisition Date" := Today;
        "Procurement Plan" := PurchSetup."Effective Procurement Plan";
    end;

    trigger OnModify()
    begin
        //IF Status<>Status::Open THEN
        //ERROR('You cannot modify a document that is already approved or pending approval');
    end;

    var
        Empl: Record Employee;
        PurchSetup: Record "Purchases & Payables Setup";
        NoSeriesMgt: Codeunit "No. Series";
        UsersRec: Record "User Setup";
        PurchLine: Record "Requisition Lines1";
        Vend: Record Vendor;
        PurchaseHeader: Record "Purchase Header";
        PurchaseLine: Record "Purchase Line";
        PurchaseRecLine: Record "Requisition Lines1";
        Text000: label 'Please Select the Supplier';
        Text001: label 'Purchase Order No %1 has been created';
        Dimen: Text;
        Dimens: Text;


    procedure PurchLinesExist(): Boolean
    begin
        PurchLine.Reset;
        //PurchLine.SETRANGE("Document Type","Document Type");
        PurchLine.SetRange("Requisition No", "No.");
        exit(PurchLine.FindFirst);
    end;


    procedure QuantityExist(): Boolean
    begin
        PurchLine.Reset;
        PurchLine.SetRange("Requisition No", "No.");
        if PurchLine.Find('-') then
            repeat
                if PurchLine.Quantity <= 0 then
                    exit(false)
                else
                    exit(true);
            until
            PurchLine.Next = 0;
    end;


    procedure LocationCodeExist() LocationExist: Boolean
    begin
        PurchLine.Reset;
        PurchLine.SetRange("Requisition No", "No.");
        if PurchLine.Find('-') then
            repeat
                if PurchLine."Location Code" = '' then
                    LocationExist := false
                else
                    LocationExist := true;
            until
            PurchLine.Next = 0;
        exit(LocationExist);
    end;


    procedure CreatePurchaseOrder(var PurchaseRec: Record "Requisition Header1")
    begin

        begin

            if PurchaseRec."Supplier Code" = '' then
                Error(Text000);


            //Purchase Header
            PurchaseHeader.Init;
            PurchaseHeader."Document Type" := PurchaseHeader."document type"::Order;
            PurchaseHeader."No." := '';
            PurchaseHeader."Buy-from Vendor No." := PurchaseRec."Supplier Code";
            PurchaseHeader.Validate(PurchaseHeader."Buy-from Vendor No.");
            //IF NOT PurchaseHeader.GET(PurchaseHeader."No.") THEN
            PurchaseHeader.Insert(true);


            PurchaseRecLine.Reset;
            PurchaseRecLine.SetRange("Requisition No", PurchaseRec."No.");
            if PurchaseRecLine.Find('-') then begin
                repeat
                    //Purchase Lines
                    PurchaseLine.Reset;
                    PurchaseLine.SetRange(PurchaseLine."Document Type", PurchaseLine."document type"::Order);
                    PurchaseLine.SetRange(PurchaseLine."Document No.", PurchaseHeader."No.");
                    PurchaseLine.SetRange(PurchaseLine."Line No.", PurchaseRecLine."Line No");
                    PurchaseLine.SetRange(PurchaseLine."Buy-from Vendor No.", PurchaseRec."Supplier Code");
                    if not PurchaseLine.FindFirst then begin
                        PurchaseLine.Init;
                        PurchaseLine."Document Type" := PurchaseLine."document type"::Order;
                        PurchaseLine."Document No." := PurchaseHeader."No.";
                        PurchaseLine."Line No." := PurchaseRecLine."Line No";//PurchaseLine.VALIDATE(PurchaseLine."No.");
                        PurchaseLine."Buy-from Vendor No." := PurchaseRec."Supplier Code";
                        PurchaseLine.Type := PurchaseRecLine.Type;
                        PurchaseLine."No." := PurchaseRecLine.No;
                        PurchaseLine.Description := PurchaseRecLine.Description;
                        PurchaseLine."Unit of Measure" := PurchaseRecLine."Unit of Measure";
                        PurchaseLine.Quantity := PurchaseRecLine.Quantity;
                        PurchaseLine."Direct Unit Cost" := PurchaseRecLine."Unit Cost";
                        PurchaseLine.Validate(PurchaseLine."Direct Unit Cost");
                        PurchaseLine."Location Code" := PurchaseRecLine."Location Code";
                        PurchaseLine."Procurement Plan" := PurchaseRecLine."Procurement Plan";
                        PurchaseLine."Procurement Plan Item" := PurchaseRecLine."Procurement Plan Item";
                        if not PurchaseLine.Get(PurchaseLine."document type"::Order, PurchaseHeader."No.", PurchaseRecLine."Line No") then
                            PurchaseLine.Insert(true);
                    end;
                until PurchaseRecLine.Next = 0;
                //CODEUNIT.RUN(CODEUNIT::"Purch.-Quote to Order",PurchaseHeader);
            end;

            Message(Text001, PurchaseHeader."No.");


        end;
    end;
}
