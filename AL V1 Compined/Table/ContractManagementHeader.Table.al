#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Table 70029 "Contract Management Header"
{

    fields
    {
        field(1; "Code"; Code[30])
        {
            Editable = false;

            trigger OnValidate()
            begin
                if Code <> xRec.Code then begin
                    PSetup.Get;
                    NoSeriesMgt.TestManual(PSetup."Contract Nos");
                    "No. Series" := '';
                end;
            end;
        }
        field(2; Date; Date)
        {
        }
        field(3; "User Id"; Code[100])
        {
        }
        field(4; "Contract Description"; Text[250])
        {
        }
        field(5; "Start Date"; Date)
        {
        }
        field(6; "End Date"; Date)
        {
        }
        field(7; "No. Series"; Code[10])
        {
            Caption = 'No. Series';
            Editable = false;
            TableRelation = "No. Series";
        }
        field(8; "Tender No"; Code[30])
        {
            TableRelation = "Procurement Request" where("Process Type" = filter(Tender | RFP));

            trigger OnValidate()
            begin
                Tenderrec.Reset;
                if Tenderrec.Get("Tender No") then begin
                    Tenderlines.Reset;
                    Tenderlines.SetFilter(Tenderlines."Requisition No", Tenderrec.No);
                    if Tenderlines.FindSet then begin
                        if Tenderlines."Vendor No" <> '' then begin
                            Supplier := Tenderlines."Vendor No";
                            Validate(Supplier);
                        end;
                    end;
                end;
            end;
        }
        field(9; "Contract Vol No"; Code[30])
        {
        }
        field(10; "Serial No"; Code[10])
        {
        }
        field(11; "Requires Milestone"; Boolean)
        {
        }
        field(12; Archived; Boolean)
        {
        }
        field(14; Supplier; Code[20])
        {
            TableRelation = Vendor;

            trigger OnValidate()
            begin
                Vend.Get(Supplier);
                "Supplier Name" := Vend.Name;
                "GL Account" := Vend."Vendor Posting Group";
            end;
        }
        field(15; "Supplier Name"; Text[250])
        {
            Editable = false;
        }
        field(20; Duration; Duration)
        {
        }
        field(41; "Contract Price Amt(Words)"; Text[100])
        {
        }
        field(42; "Performance Security(Words)"; Text[100])
        {
        }
        field(44; "Contract Award Date"; Date)
        {
        }
        field(45; "Contract Signing Date"; Date)
        {
        }
        field(50000; "Language Code (Default)"; Code[10])
        {
            Caption = 'Language Code (Default)';
            TableRelation = Language;

            trigger OnLookup()
            var
                SegInteractLanguage: Record "Segment Interaction Language";
            begin
                Modify;
                Commit;

                SegInteractLanguage.SetRange("Segment No.", Code);
                SegInteractLanguage.SetRange("Segment Line No.", 0);
                if "Language Code (Default)" <> '' then
                    SegInteractLanguage.Get(Code, 0, "Language Code (Default)");
                if Page.RunModal(0, SegInteractLanguage) = Action::LookupOK then begin
                    Get(Code);
                    "Language Code (Default)" := SegInteractLanguage."Language Code";
                    "Subject (Default)" := SegInteractLanguage.Subject;
                    Modify;
                end else
                    Get(Code);
                CalcFields("Attachment No.");
            end;

            trigger OnValidate()
            var
                SegInteractLanguage: Record "Segment Interaction Language";
            begin
                if "Language Code (Default)" = xRec."Language Code (Default)" then
                    exit;

                if not SegInteractLanguage.Get(Code, 0, "Language Code (Default)") then begin
                    "Subject (Default)" := '';


                end else
                    "Subject (Default)" := SegInteractLanguage.Subject;
            end;
        }
        field(50002; "Interaction Group Code"; Code[10])
        {
            Caption = 'Interaction Group Code';
            TableRelation = "Interaction Group";
        }
        field(50003; "Subject (Default)"; Text[50])
        {
            Caption = 'Subject (Default)';

            trigger OnValidate()
            var
                SegInteractLanguage: Record "Segment Interaction Language";
                UpdateLines: Boolean;
            begin
            end;
        }
        field(50004; "Attachment No."; Integer)
        {
            Caption = 'Attachment No.';
            Editable = false;

            trigger OnValidate()
            var
                Attachment: Record Attachment;
            begin
            end;
        }
        field(50005; "Interaction Template Code"; Code[10])
        {
            Caption = 'Interaction Template Code';
            TableRelation = "Interaction Template";

            trigger OnValidate()
            begin
                //UpdateSegLines(FIELDCAPTION("Interaction Template Code"),CurrFieldNo <> 0);
            end;
        }
        field(50006; Ordered; Boolean)
        {
        }
        field(50007; "GL Account"; Code[30])
        {
            TableRelation = "G/L Account" where("Income/Balance" = const("Income Statement"));
        }
        field(50008; "Contract Type"; Option)
        {
            OptionCaption = ' ,SLA,MOU,Leases,Merchants';
            OptionMembers = " ",SLA,MOU,Leases,Merchants;
        }
        field(50009; "Assigned User ID"; Code[70])
        {
            TableRelation = "User Setup";
        }
        field(50010; Select; Boolean)
        {
        }
        field(50011; "Date of Assignment"; Date)
        {
        }
        field(50012; Expired; Boolean)
        {
        }
        field(50013; "Expirery Notice Date"; Date)
        {
        }
        field(50014; "Contract Amount"; Decimal)
        {

            trigger OnValidate()
            begin
                if "Contract Amount" > 0 then begin
                    Convertrep.InitTextVariable();
                    Convertrep.FormatNoText(amountwords, "Contract Amount", "Contract Currency");
                    Dotpos := StrPos(Format("Contract Amount"), '.');
                    if Dotpos > 0 then begin
                        Centstxt := CopyStr(Format("Contract Amount"), Dotpos + 1);
                        if StrLen(Centstxt) = 1 then begin
                            Centstxt := Centstxt + '0';
                            Evaluate(Centsdec, Centstxt);
                            Convertrep.InitTextVariable();
                            Convertrep.FormatNoText(Centstxt2, Centsdec, "Contract Currency");
                            Centstxt2[1] := CopyStr(Centstxt2[1], 1, StrPos(Centstxt2[1], ' AND'));
                            Centstxt2[1] := CopyStr(Centstxt2[1], 5);
                        end;

                    end;
                    if amountwords[1] <> '' then begin
                        "Contract Price Amt(Words)" := amountwords[1] + ' ' + amountwords[2];
                        "Contract Price Amt(Words)" := CopyStr("Contract Price Amt(Words)", 1, StrPos("Contract Price Amt(Words)", ' AND'));
                        if Centstxt <> '' then begin
                            "Contract Price Amt(Words)" := "Contract Price Amt(Words)" + ' AND ' + Centstxt2[1] + ' CENTS';
                        end;
                    end;


                    // Convertrep.FormatNoText(amountwords,123000,'USD');
                    // Message('%1',amountwords[1]);
                end;
            end;
        }
        field(50015; Status; Option)
        {
            OptionCaption = 'Open,Pending Approval,Released,Canceled,Rejected';
            OptionMembers = Open,"Pending Approval",Released,Canceled,Rejected;
        }
        field(50016; "Global Dimension 1 Code"; Code[20])
        {
            CaptionClass = '1,1,1';
            Caption = 'Global Dimension 1 Code';
            TableRelation = "Dimension Value".Code where("Global Dimension No." = const(1),
                                                          Blocked = filter(false));

            trigger OnValidate()
            begin
                //ValidateShortcutDimCode(1,"Global Dimension 1 Code");
            end;
        }
        field(50017; "Global Dimension 2 Code"; Code[20])
        {
            CaptionClass = '1,1,2';
            TableRelation = "Dimension Value".Code where("Global Dimension No." = const(2),
                                                          "Dimension Value Type" = const(Standard));

            trigger OnValidate()
            begin
                //ValidateShortcutDimCode(2,"Global Dimension 2 Code");
            end;
        }
        field(50018; "Total Sum LPO Posted"; Decimal)
        {
            //cc//  CalcFormula = sum("Purch. Inv. Line".Amount where("Requisition Date" = field(Code)));
            Editable = false;
            FieldClass = FlowField;
        }
        field(50019; "Contract Status"; Option)
        {
            OptionCaption = ' ,Repudiation, Recession, Renewa,Expired';
            OptionMembers = " ",Repudiation," Recession"," Renewal",Expired;
        }
        field(50099; "Amount in LPO"; Decimal)
        {
            CalcFormula = sum("Purchase Line"."Direct Unit Cost" where("Contract No" = field(Code)));
            FieldClass = FlowField;
        }
        field(50100; "Assigned User"; Code[20])
        {
        }
        field(50101; "Attached Contract"; Text[250])
        {
        }
        field(50102; "Signed Contract File"; Text[250])
        {
        }
        field(50103; "Contract Currency"; Code[20])
        {
            TableRelation = Currency;
        }
        field(50104; "Activity Type"; Option)
        {
            OptionCaption = ',WorkPlan,Admin & PE,Proc Plan';
            OptionMembers = ,WorkPlan,"Admin & PE","Proc Plan";

            trigger OnValidate()
            begin
                CashMngt.Get;
                GLSetup.Get;
                "Current Budget" := GLSetup."Current Budget";
                //message('%1',"Current Budget");
            end;
        }
        field(50105; "Current Budget"; Code[100])
        {
            TableRelation = "G/L Budget Name";
        }
        field(50106; "Available Amount"; Decimal)
        {
        }
        field(50107; "PE Allowed"; Boolean)
        {
        }
        field(50108; Activity_; Code[20])
        {

            trigger OnValidate()
            begin
                /*CashMngt.GET;
                GLSetup.GET;
                "Current Budget":=GLSetup."Current Budget";
                
                GLSetup.GET;
                
                CASE "Activity Type" OF
                 "Activity Type"::WorkPlan:
                  BEGIN
                  WorkPlan.RESET;
                  WorkPlan.SETRANGE(Code,Activity_);
                  IF WorkPlan.FIND('+') THEN BEGIN
                  //Message(format(WorkPlan."G/L Account"));
                    Activity:=WorkPlan.Code;
                    "Account Type":="Account Type"::"G/L Account";
                    "GL Account":=WorkPlan."G/L Account";
                     VALIDATE("GL Account");
                     Description:=WorkPlan.Name;
                    //"Global Dimension 1 Code":=WorkPlan."Global Dimension 1 Code";
                    //"Global Dimension 2 Code":=WorkPlan."Global Dimension 2 Code";
                     "Available Amount":=WorkPlan.Balance;//WorkPlan.Amount;
                
                   END;
                  END;
                  "Activity Type"::"Admin & PE":
                   BEGIN
                   //error('...');
                   AdminPlan.RESET;
                   AdminPlan.SETRANGE("PE Activity Code",Activity_);
                   IF AdminPlan.FIND('+') THEN BEGIN
                    Activity:=AdminPlan."PE Activity Code";
                    "Account Type":="Account Type"::"G/L Account";
                    "GL Account":=AdminPlan."G/L Account";
                     VALIDATE("GL Account");
                     Description:=AdminPlan.Name;
                    //"Global Dimension 1 Code":=AdminPlan."Global Dimension 1 Code";
                    //"Global Dimension 2 Code":=AdminPlan."Global Dimension 2 Code";
                    "Available Amount":=AdminPlan.Balance;//AdminPlan.Amount;
                   END;
                   END;
                
                 "Activity Type"::"Proc Plan":
                   BEGIN
                   ProcurementPlan.RESET;
                   ProcurementPlan.SETRANGE("Plan Item No",Activity_);
                   ProcurementPlan.SETRANGE(Type,ProcurementPlan.Type::"G/L Account"); //Add Department Filter
                   ProcurementPlan.SETFILTER("Budget Filter",GLSetup."Current Budget");
                   IF ProcurementPlan.FIND('+') THEN BEGIN
                    Activity:=ProcurementPlan."Plan Item No";
                    "GL Account":=ProcurementPlan."No.";
                    VALIDATE("GL Account");
                     Description:=ProcurementPlan."Item Description";
                
                     //"Unit Price":=ProcurementPlan."Unit Price";
                    //"Global Dimension 1 Code":=ProcurementPlan."Global Dimension 1 Code";
                    //"Global Dimension 2 Code":=ProcurementPlan."Global Dimension 2 Code";
                    "Available Amount":=ProcurementPlan.Balance;//ProcurementPlan."Estimated Cost";
                   END;
                   END;
                 END;
                 */

            end;
        }
        field(50109; Activity; Code[20])
        {

            trigger OnValidate()
            begin
                /*GLSetup.GET;
                
                CASE "Activity Type" OF
                 "Activity Type"::WorkPlan:
                  BEGIN
                  WorkPlan.RESET;
                  WorkPlan.SETRANGE(Code,Activity);
                  IF WorkPlan.FIND('-') THEN BEGIN
                    Activity:=WorkPlan.Code;
                    "Account Type":="Account Type"::"G/L Account";
                    "GL Account":=WorkPlan."G/L Account";
                     VALIDATE("GL Account");
                     Description:=WorkPlan.Name;
                    "Global Dimension 1 Code":=WorkPlan."Global Dimension 1 Code";
                    "Global Dimension 2 Code":=WorkPlan."Global Dimension 2 Code";
                     "Available Amount":=WorkPlan.Amount;
                   END;
                  END;
                  "Activity Type"::"P&E":
                   BEGIN
                
                   AdminPlan.RESET;
                   AdminPlan.SETRANGE("PE Activity Code",Activity);
                   IF AdminPlan.FIND('-') THEN BEGIN
                    Activity:=AdminPlan."PE Activity Code";
                    "Account Type":="Account Type"::"G/L Account";
                    "GL Account":=AdminPlan."G/L Account";
                     VALIDATE("GL Account");
                     Description:=AdminPlan.Name;
                    "Global Dimension 1 Code":=AdminPlan."Global Dimension 1 Code";
                    "Global Dimension 2 Code":=AdminPlan."Global Dimension 2 Code";
                    "Available Amount":=AdminPlan.Amount;
                   END;
                   END;
                 END;
                 */

            end;
        }
        field(50110; "Account Type"; Option)
        {
            Caption = 'Account Type';
            OptionCaption = 'G/L Account,Customer,Vendor,Bank Account,Fixed Asset,IC Partner';
            OptionMembers = "G/L Account",Customer,Vendor,"Bank Account","Fixed Asset","IC Partner";
        }
        field(50111; Description; Text[130])
        {

            trigger OnValidate()
            begin
                /*
                IF PV.GET("PV No") THEN BEGIN
                  "Account Type":=PV."Account Type";
                  "Account No":=PV."Account No."
                END;
                VALIDATE("Account No");
                */

            end;
        }
    }

    keys
    {
        key(Key1; "Code")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }

    trigger OnInsert()
    begin
        if Code = '' then begin
            PSetup.Get;
            PSetup.TestField("Contract Nos");
           // NoSeriesMgt.InitSeries(PSetup."Contract Nos", xRec."No. Series", 0D, Code, "No. Series");
            Code := NoSeriesMgt.GetNextNo(PSetup."Contract Nos", Today, true);
        end;

        Date := Today;
        "User Id" := UserId;

        CashMngt.Get;
        GLSetup.Get;
        "Current Budget" := GLSetup."Current Budget";
        //message('%1',"Current Budget");
        /*
        //Allow some PE to Non-Finance Dept People
        CASE "Activity Type" OF
         "Activity Type"::"Admin & PE":
          BEGIN
          AdminPlan.RESET;
          //AdminPlan.SETRANGE(AdminPlan.Code,GLSetup."Current Budget");
          //AdminPlan.SETRANGE(AdminPlan."Global Dimension 1 Code",ReqHeader."Global Dimension 1 Code");
          //AdminPlan.SETRANGE(AdminPlan."Global Dimension 2 Code",ReqHeader."Global Dimension 2 Code");//CashMngt."Finance Code");
          IF AdminPlan.FIND('-') THEN
          "PE Allowed":=TRUE;
              TempPEApp.RESET;
              TempPEApp.SETRANGE(TempPEApp."Employee No",ReqHeader."Employee No");
              TempPEApp.SETRANGE(TempPEApp."Doc Request No",ReqHeader."No.");
              TempPEApp.SETRANGE(TempPEApp.Archived,FALSE);
              TempPEApp.SETRANGE(TempPEApp.Approved,TRUE);
              IF TempPEApp.FIND('-')THEN BEGIN
                  AdminPlan.RESET;
                  AdminPlan.SETRANGE(AdminPlan.Code,GLSetup."Current Budget");
                  AdminPlan.SETRANGE(AdminPlan."PE Activity Code",TempPEApp."PE Code");
                  IF AdminPlan.FIND('+') THEN BEGIN
                  "PE Allowed":=TRUE;
                  "Global Dimension 1 Code":=AdminPlan."Global Dimension 1 Code";
                  "Global Dimension 2 Code":=AdminPlan."Global Dimension 2 Code";
                  END;
              END;
          END;
        END;
        */

    end;

    var
        NoSeriesMgt: Codeunit "No. Series";
        PSetup: Record "Purchases & Payables Setup";
        Text000: label 'Please Select the Supplier';
        Text001: label 'Purchase Order No %1 has been created';
        Text002: label 'Process Type %1,  cannot be used when the Amount is above the set limit of %2';
        Text003: label 'Process Type %1,  cannot be used when the Amount is less than the minimum the set limit of %2';
        Text004: label 'Are you sure you want to select Process Type as %1 ?';
        LineNo: Integer;
        Vend: Record Vendor;
        Convertrep: Report Check;
        amountwords: array[2] of Text[250];
        Centstxt: Text;
        Dotpos: Integer;
        Centsdec: Decimal;
        Centstxt2: array[2] of Text;
        Tenderrec: Record "Procurement Request";
        Tenderlines: Record "Procurement Request Lines";
        GLSetup: Record "General Ledger Setup";
        GLEntry: Record "G/L Entry";
        Committment: Decimal;
        BudgetAmount: Decimal;
        Balance: Decimal;
        CustLedger: Record "Cust. Ledger Entry";
        TransactionTypeRec: Record "Transaction Types";
        ReceiptsHeader: Record "Receipts Header1";
        RequestLines: Record "Requisition Lines1";
        TotalActual: Decimal;
        TotalAmount: Decimal;
        GLAccount: Record "G/L Account";
        Expenses: Decimal;
        BudgetAvailable: Decimal;
        Committments: Record "Commitment Entries";
        CommittedAmount: Decimal;
        CommitmentEntries: Record "Commitment Entries";
        ImprestHeader: Record Payments;
        TotalCommittedAmount: Decimal;
        CashMngt: Record "Cash Management Setup";
        ReqHeader: Record "Requisition Header1";
        ProcurementPlan: Record "Procurement Plan 1";
        Empl: Record Employee;
        userrec: Record "User Setup";
        Qty: Decimal;
        emprec: Record Employee;
        AdminPlan: Record "Procurement Plan 1";


    procedure CreateAttachment()
    begin
        /*IF NOT SegInteractLanguage.GET(Code,"Language Code (Default)") THEN BEGIN
          SegInteractLanguage.INIT;
          SegInteractLanguage."Segment No." := Code;
          SegInteractLanguage."Segment Line No." := 0;
          SegInteractLanguage."Language Code" :="Language Code (Default)";
          SegInteractLanguage.Description := FORMAT("Interaction Template Code") + ' ' + FORMAT("Language Code (Default)");
          SegInteractLanguage.Subject := "Subject (Default)";
        END;
        SegInteractLanguage.CreateAttachment;
        */

    end;


    procedure OpenAttachment()
    begin
        /*IF SegInteractLanguage.GET(Code,"Language Code (Default)") THEN
          IF SegInteractLanguage."Attachment No." <> 0 THEN
            SegInteractLanguage.OpenAttachment;
        */

    end;


    procedure ImportAttachment()
    begin
        /*IF NOT SegInteractLanguage.GET(Code,"Language Code (Default)") THEN BEGIN
          SegInteractLanguage.INIT;
          SegInteractLanguage."Segment No." := Code;
          SegInteractLanguage."Segment Line No." := 0;
          SegInteractLanguage."Language Code" := Code;
          SegInteractLanguage.Description :=
           FORMAT("Interaction Template Code") + ' ' + FORMAT("Language Code (Default)");
          SegInteractLanguage.INSERT(TRUE);
        END;
        SegInteractLanguage.ImportAttachment;
        */

    end;


    procedure ExportAttachment()
    begin
        /*IF SegInteractLanguage.GET(Code,"Language Code (Default)") THEN
          IF SegInteractLanguage."Attachment No." <> 0 THEN
            SegInteractLanguage.ExportAttachment;*/

    end;


    procedure RemoveAttachment(Prompt: Boolean)
    begin
        /*IF SegInteractLanguage.GET(Code,"Language Code (Default)") THEN
          IF SegInteractLanguage."Attachment No." <> 0 THEN
            SegInteractLanguage.RemoveAttachment(Prompt);*/

    end;


    procedure CreatePurchaseOrderFromContract(var PurchaseRec: Record "Contract Management Header"; var Amnt: Decimal; var Desc: Text)
    var
        Empl: Record Employee;
        PurchSetup: Record "Purchases & Payables Setup";
        NoSeriesMgt: Codeunit "No. Series";
        UsersRec: Record "User Setup";
        PurchLine: Record "Contract Management Lines";
        Vend: Record Vendor;
        PurchaseHeader: Record "Purchase Header";
        PurchaseLine: Record "Purchase Line";
        PurchaseRecLine: Record "Contract Management Lines";
        ProcReq: Record "Procurement Request";
        ProcReq1: Record "Procurement Request";
        ProcReqLines: Record "Procurement Request Lines";
        glsetup: Record "General Ledger Setup";
    begin
        /*WITH PurchaseRec DO BEGIN
        
        
        
        {IF Ordered THEN
        ERROR('An LPO has already been generated for requisition No %1',PurchaseRec.Code"); }
        
        {IF PurchaseRec."Supplier Code" = '' THEN
        ERROR(Text000);}
        
        {PurchaseRecLine.RESET;
        PurchaseRecLine.SETRANGE(PurchaseRecLine."Contract Header",PurchaseRec.Code);
        IF PurchaseRecLine.FIND('-') THEN BEGIN}
        
        //Purchase Header
        PurchaseHeader.INIT;
        PurchaseHeader."Document Type":=PurchaseHeader."Document Type"::Order;
        PurchaseHeader."No.":='';
        PurchaseHeader."Buy-from Vendor No.":=Supplier;
        PurchaseHeader.VALIDATE(PurchaseHeader."Buy-from Vendor No.");
        IF Vend.GET(PurchaseRecLine.Supplier) THEN
        //PurchaseHeader.:=Vend."Sup Type";
        PurchaseHeader."Posting Date":=TODAY;
        PurchaseHeader.VALIDATE("Posting Date");
        //PurchaseHeader."Requisition No":=PurchaseRec.Code;
        PurchaseHeader."Contract No":=Code;
        PurchaseHeader."Activity Type":=PurchaseRec."Activity Type";
        PurchaseHeader.Activity:=PurchaseRec.Activity_;
        
        //IF NOT PurchaseHeader.GET(PurchaseHeader."No.") THEN
        PurchaseHeader.INSERT(TRUE);
        
        REPEAT
        //Purchase Lines
        LineNo:=LineNo+1000;
        PurchaseLine.RESET;
        PurchaseLine.SETRANGE(PurchaseLine."Document Type",PurchaseLine."Document Type"::Order);
        PurchaseLine.SETRANGE(PurchaseLine."Document No.",PurchaseHeader."No.");
        //PurchaseLine.SETRANGE(PurchaseLine."Line No.",PurchaseRecLine."Line No");
        PurchaseLine.SETRANGE(PurchaseLine."Buy-from Vendor No.",Supplier);
        IF NOT PurchaseLine.FINDFIRST THEN BEGIN
        PurchaseLine.INIT;
        PurchaseLine."Document Type":=PurchaseLine."Document Type"::Order;
        PurchaseLine."Document No.":=PurchaseHeader."No.";
        PurchaseLine."Line No.":=LineNo;PurchaseLine.VALIDATE(PurchaseLine."No.");
        PurchaseLine."Buy-from Vendor No.":=Supplier;
        PurchaseLine.Type:=PurchaseLine.Type::"G/L Account";
        PurchaseLine."No.":=PurchaseRec."GL Account";
        PurchaseLine.VALIDATE("No.");
        PurchaseLine.Description:=Desc;
        PurchaseLine.VALIDATE(PurchaseLine.Quantity,1); //*
        //PurchaseLine.VALIDATE(PurchaseLine.Quantity);
        PurchaseLine."Unit of Measure Code":='NO';
        PurchaseLine.VALIDATE("Unit of Measure Code");
        //PurchaseLine.Quantity:=1;
        //PurchaseLine.VALIDATE(PurchaseLine.Quantity);
        PurchaseLine."Qty. to Receive":=1; PurchaseLine.VALIDATE(PurchaseLine."Qty. to Receive");
        PurchaseLine."Qty. to Invoice":=1; PurchaseLine.VALIDATE(PurchaseLine."Qty. to Invoice");
        PurchaseLine.VALIDATE(PurchaseLine."Direct Unit Cost",Amnt); //*
        PurchaseLine.VALIDATE(PurchaseLine.Amount,Amnt); //*
        PurchaseLine.VALIDATE(PurchaseLine."Line Amount",Amnt); //*
        PurchaseLine.VALIDATE(PurchaseLine."Direct Unit Cost");
        //PurchaseLine."Location Code":='';
        PurchaseLine."Contract No":=Code;
        PurchaseLine."Shortcut Dimension 1 Code":="Global Dimension 1 Code";
        PurchaseLine."Shortcut Dimension 2 Code":="Global Dimension 2 Code";
        glsetup.RESET;
        glsetup.GET;
        PurchaseLine."Current Budget":=glsetup."Current Budget";
        PurchaseLine."Activity Type":=PurchaseRec."Activity Type";
        PurchaseLine.Activity:=PurchaseRec.Activity_;
        IF NOT PurchaseLine.GET(PurchaseLine."Document Type"::Order,PurchaseHeader."No.",PurchaseLine."Line No.") THEN
        PurchaseLine.INSERT(TRUE);
        END;
        UNTIL PurchaseRecLine.NEXT = 0;
        //CODEUNIT.RUN(CODEUNIT::"Purch.-Quote to Order",PurchaseHeader);
        //END;
        
        MESSAGE(Text001,PurchaseHeader."No.");
        
        //PurchaseRec.Ordered:=TRUE;
        PurchaseRec.MODIFY;
        
        END;
        */

    end;


    procedure CreatePurchaseOrderFromContract2(var PurchaseRec: Record "Contract Management Header"; var Contractlines: Record "Contract Lines")
    var
        Empl: Record Employee;
        PurchSetup: Record "Purchases & Payables Setup";
        NoSeriesMgt: Codeunit "No. Series";
        UsersRec: Record "User Setup";
        PurchLine: Record "Contract Management Lines";
        Vend: Record Vendor;
        PurchaseHeader: Record "Purchase Header";
        PurchaseLine: Record "Purchase Line";
        PurchaseRecLine: Record "Contract Management Lines";
        ProcReq: Record "Procurement Request";
        ProcReq1: Record "Procurement Request";
        ProcReqLines: Record "Procurement Request Lines";
        Contractlines2: Record "Contract Lines";
    begin
        /*
        IF PurchaseRec.Supplier = '' THEN BEGIN
           ERROR(Text000);
        END;
        
        //Error('%1..%2',PurchaseRec."Activity Type",PurchaseRec.Activity_);
        //Purchase Header
        PurchaseHeader.INIT;
        PurchaseHeader."Document Type":=PurchaseHeader."Document Type"::Order;
        PurchaseHeader."No.":='';
        PurchaseHeader."Buy-from Vendor No.":=Supplier;
        PurchaseHeader.VALIDATE(PurchaseHeader."Buy-from Vendor No.");
        IF Vend.GET(PurchaseRecLine.Supplier) THEN
        PurchaseHeader."Supplier Type":=Vend."Sup Type";
        PurchaseHeader."Posting Date":=TODAY;
        PurchaseHeader.VALIDATE("Posting Date");
        PurchaseHeader."Requisition No":=PurchaseRec.Code;
        PurchaseHeader."Contract No":=Code;
        //IF NOT PurchaseHeader.GET(PurchaseHeader."No.") THEN
        PurchaseHeader."Activity Type":=PurchaseRec."Activity Type";
        PurchaseHeader.Activity:=PurchaseRec.Activity_;
        PurchaseHeader.INSERT(TRUE);
        
        
        
        Contractlines2.RESET;
        Contractlines2.SETFILTER(Contractlines2."Contract No",Contractlines."Contract No");
        IF Contractlines2.FINDSET THEN REPEAT
                 // message('...%1',Contractlines2.Descriptison);
                //Purchase Lines
                LineNo:=LineNo+1000;
                //PurchaseLine.RESET;
                //PurchaseLine.SETRANGE(PurchaseLine."Document Type",PurchaseLine."Document Type"::Order);
                //PurchaseLine.SETRANGE(PurchaseLine."Document No.",PurchaseHeader."No.");
                //PurchaseLine.SETRANGE(PurchaseLine."Line No.",PurchaseRecLine."Line No");
                //PurchaseLine.SETRANGE(PurchaseLine."Buy-from Vendor No.",Supplier);
                //IF NOT PurchaseLine.FINDFIRST THEN BEGIN
                PurchaseLine.INIT;
                PurchaseLine."Document Type":=PurchaseLine."Document Type"::Order;
                PurchaseLine."Document No.":=PurchaseHeader."No.";
                PurchaseLine."Line No.":=LineNo;//PurchaseLine.VALIDATE(PurchaseLine."No.");
                PurchaseLine."Buy-from Vendor No.":=Supplier;
                PurchaseLine.Type:=PurchaseLine.Type::"G/L Account";
                PurchaseLine."No.":=PurchaseRec."GL Account";
                PurchaseLine.VALIDATE("No.");
                PurchaseLine.Description:=Contractlines2.Descriptison;
                PurchaseLine.Quantity:=Contractlines2.Quantity;
                PurchaseLine.VALIDATE(PurchaseLine.Quantity);
                PurchaseLine."Unit of Measure Code":='NO';
                PurchaseLine.VALIDATE("Unit of Measure Code");
                PurchaseLine.Quantity:=Contractlines2.Quantity;
                PurchaseLine."Direct Unit Cost":=Contractlines2.Cost;
                PurchaseLine.VALIDATE(PurchaseLine."Direct Unit Cost");
                //PurchaseLine."Location Code":='';
                PurchaseLine."Contract No":=Code;
                PurchaseLine."Shortcut Dimension 1 Code":="Global Dimension 1 Code";
                PurchaseLine."Shortcut Dimension 2 Code":="Global Dimension 2 Code";
                GLSetup.RESET;
                GLSetup.GET;
                PurchaseLine."Current Budget":=GLSetup."Current Budget";
                PurchaseLine."Activity Type":=PurchaseRec."Activity Type";
                PurchaseLine.Activity:=PurchaseRec.Activity_;
        
                IF NOT PurchaseLine.GET(PurchaseLine."Document Type"::Order,PurchaseHeader."No.",PurchaseLine."Line No.") THEN
                PurchaseLine.INSERT(TRUE);
                //END;
        UNTIL Contractlines2.NEXT = 0;
        //CODEUNIT.RUN(CODEUNIT::"Purch.-Quote to Order",PurchaseHeader);
        //END;
        
        MESSAGE(Text001,PurchaseHeader."No.");
        
        PurchaseRec.Ordered:=TRUE;
        PurchaseRec.MODIFY;
        
        //END;
        //Message('Purchase Order Created Successfully!!');
        */

    end;
}
