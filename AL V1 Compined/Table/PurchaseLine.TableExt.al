#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
TableExtension 50008 tableextension50008 extends "Purchase Line"
{
    fields
    {
        modify("Document Type")
        {
            OptionCaption = 'Quote,Order,Invoice,Credit Memo,Blanket Order,Return Order,Store Requisition,Purchase Requisition';

            //Unsupported feature: Property Modification (OptionString) on ""Document Type"(Field 1)".

        }

        //Unsupported feature: Property Modification (Editable) on ""Buy-from Vendor No."(Field 2)".

        modify(Type)
        {
            OptionCaption = ' ,G/L Account,Item,,Fixed Asset,Charge (Item),Service';

            //Unsupported feature: Property Modification (OptionString) on "Type(Field 5)".

        }

        //Unsupported feature: Property Modification (Data type) on ""Description 2"(Field 12)".

        modify("Unit of Measure")
        {
            TableRelation = "Unit of Measure";
        }

        //Unsupported feature: Property Insertion (Editable) on ""Qty. to Receive"(Field 18)".


        //Unsupported feature: Property Insertion (Editable) on ""Direct Unit Cost"(Field 22)".


        //Unsupported feature: Property Modification (Editable) on ""Amount Including VAT"(Field 30)".

        modify("Job Task No.")
        {
            TableRelation = "Job Task"."Job Task No." where("Job Task Type" = const(Posting),
                                                             "Job No." = field("Job No."));
        }

        //Unsupported feature: Property Modification (Data type) on ""Unit of Measure (Cross Ref.)"(Field 5706)".


        //Unsupported feature: Code Insertion on ""Document No."(Field 3)".

        //trigger OnValidate()
        //Parameters and return type have not been exported.
        //begin
        /*
        PurchHeader.RESET;
        PurchHeader.SETRANGE("No.","Document No.");
        IF PurchHeader.FINDSET THEN BEGIN
        "Directorate Code":=PurchHeader."Directorate Code";
        Division:=PurchHeader.Division;
        "Department Code":=PurchHeader."Department Code";
        END;
        */
        //end;


        //Unsupported feature: Code Modification on "Quantity(Field 15).OnValidate".

        //trigger OnValidate()
        //Parameters and return type have not been exported.
        //>>>> ORIGINAL CODE:
        //begin
        /*
        TestStatusOpen;
        IsHandled := FALSE;
        OnValidateQuantityOnBeforeDropShptCheck(Rec,xRec,CurrFieldNo,IsHandled);
        IF NOT IsHandled THEN
          IF "Drop Shipment" AND ("Document Type" <> "Document Type"::Invoice) THEN
            ERROR(
              Text001,FIELDCAPTION(Quantity),"Sales Order No.");
        "Quantity (Base)" := CalcBaseQty(Quantity);
        IF "Document Type" IN ["Document Type"::"Return Order","Document Type"::"Credit Memo"] THEN BEGIN
          IF (Quantity * "Return Qty. Shipped" < 0) OR
        #11..85
        END;

        CheckWMS;
        */
        //end;
        //>>>> MODIFIED CODE:
        //begin
        /*

        {=======} //TARGET
        #2..7
        {<<<<<<<}
        #8..88
        IF "Document Type"="Document Type"::Invoice THEN
          BEGIN
            gEntry.RESET;
                  actualAmount:=0;
                  cSetup.GET;
                  Bcommitments.RESET;
                  gEntry.SETRANGE("G/L Account No.","Vote Item");
                  gEntry.SETFILTER(gEntry."Posting Date",'%1..%2',cSetup."Leave Posting Period[FROM]",cSetup."Leave Posting Period[TO]");
                   IF gEntry.FINDSET THEN
                     BEGIN
                       REPEAT
                          actualAmount:=actualAmount+ABS(gEntry.Amount);
                       UNTIL gEntry.NEXT=0;
                     END;

                    "Actual To Date":=actualAmount;

                     Bcommitments.SETRANGE("Account No.","Vote Item");
                     IF Bcommitments.FINDSET THEN
                       BEGIN
                      "Vote Amount":=Bcommitments."Budgeted Amount";
                      Bcommitments.CALCFIELDS("Commited Amount Imprest","Commited Amount Orders","Commited Amount PRN","Committed Invoices");
                      "Budget Commitments":=(Bcommitments."Commited Amount Imprest"+Bcommitments."Commited Amount Orders"+Bcommitments."Commited Amount PRN"+Bcommitments."Committed Invoices");
                      "Available Funds":="Vote Amount"-actualAmount-"Budget Commitments";
                      END;


          END;
        */
        //end;


        //Unsupported feature: Code Modification on ""Direct Unit Cost"(Field 22).OnValidate".

        //trigger OnValidate()
        //Parameters and return type have not been exported.
        //>>>> ORIGINAL CODE:
        //begin
        /*
        VALIDATE("Line Discount %");
        */
        //end;
        //>>>> MODIFIED CODE:
        //begin
        /*
        VALIDATE("Line Discount %");

         {// *************************************************************************************************
          // Following Code Added By Eric Daudi 18/03/2020 To Pass Actual Line Description Through To GL Entry
        PurchHeader.RESET;
        PurchHeader.SETRANGE("No.","Document No.");
        PurchHeader.SETRANGE(Status,PurchHeader.Status::Open);
        IF PurchHeader.FINDSET THEN BEGIN
             "Line Amount":="Qty. Requested"*"Direct Unit Cost";
           END;
          // *************************************************************************************************
          }
        */
        //end;


        //Unsupported feature: Code Modification on "Amount(Field 29).OnValidate".

        //trigger OnValidate()
        //Parameters and return type have not been exported.
        //>>>> ORIGINAL CODE:
        //begin
        /*
        GetPurchHeader;
        Amount := ROUND(Amount,Currency."Amount Rounding Precision");
        CASE "VAT Calculation Type" OF
        #4..29
                      "VAT Base Amount","Quantity (Base)",PurchHeader."Currency Factor"),
                    Currency."Amount Rounding Precision");
                IF "VAT Base Amount" <> 0 THEN
                  "VAT %" :=
                    ROUND(100 * ("Amount Including VAT" - "VAT Base Amount") / "VAT Base Amount",0.00001)
                ELSE
                  "VAT %" := 0;
              END;
            END;
        END;

        InitOutstandingAmount;
        UpdateUnitCost;
        */
        //end;
        //>>>> MODIFIED CODE:
        //begin
        /*

        #1..32
                  "VAT %" :=ROUND(100 * ("Amount Including VAT" - "VAT Base Amount") / "VAT Base Amount",0.00001)
        #35..42
        */
        //end;

        //Unsupported feature: Property Deletion (Editable) on "Amount(Field 29)".

        field(50000; "Purchase Requisition No."; Code[20])
        {
            Editable = false;
            Enabled = false;
        }
        field(50001; "Purchase Requisition Line No."; Integer)
        {
            Editable = false;
        }
        field(50002; Status; Option)
        {
            CalcFormula = lookup("Purchase Header".Status where("Document Type" = field("Document Type"),
                                                                 "No." = field("Document No.")));
            Editable = true;
            FieldClass = FlowField;
            OptionCaption = 'Open,Released,Pending Approval,Pending Prepayment,Cancelled';
            OptionMembers = Open,Released,"Pending Approval","Pending Prepayment",Cancelled;
        }
        field(50003; Select; Boolean)
        {

            trigger OnValidate()
            begin
                Rec.Modify(false);
            end;
        }
        field(50004; "Quantity To  Issue"; Decimal)
        {

            trigger OnValidate()
            VAR
                PurchHeader: RECORD "Purchase Header";
            begin


                Rec.Modify(false);
                if Rec."Quantity To  Issue" = 0 then
                    Error('YOU CANNOT ISSUE ZERO QUANTITIES.PLEASE CHECK!!');
                if Rec."Quantity To  Issue" > (Rec."Qty. Requested" - Rec."Quantity  issued") then
                    Error('YOU CANNOT ISSUE MORE THAN WHAT WAS REQUESTED.PLEASE CHECK!!');

                PurchHeader.Get(Rec."Document Type", Rec."Document No.");

                /*IF PurchHeader."Requisition Type"<>PurchHeader."Requisition Type"::"Stock Return" THEN BEGIN
                
                IF Type=Type::Item THEN BEGIN
                CALCFIELDS("Quantity In Store");
                  //new code to convert unit of measure
                  IF UoM.GET("No.","Unit of Measure Code")  THEN BEGIN
                    qty:="Quantity To  Issue"*UoM."Qty. per Unit of Measure";
                END
                 //   MESSAGE('%1',qty);
                IF qty>"Quantity In Store" THEN
                
                ERROR('INSUFFICIENT STOCK TO ISSUE FROM %1 STORE.PLEASE CHECK!!',"Location Code");
                 END;;
                
                END;*///*************Commented by Morris During upgrade

            end;
        }
        field(50005; Category; Option)
        {
            OptionCaption = ' ,Item,Service,Capex';
            OptionMembers = " ",Item,Service,Capex;

            trigger OnValidate()
            begin

                //Ushindi

                Rec.TestStatusOpen;
                if Rec.Category = Rec.Category::Item then begin
                    Rec.Type := Rec.Type::Item
                end;
            end;
        }
        field(50006; "Service/Item Code"; Code[20])
        {
            TableRelation = Item."No." where(Blocked = const(false));

            trigger OnValidate()
            VAR
                PurchLine2: RECORD "PURCHASE LINE";
            begin
                Rec.TestStatusOpen;
                /*IF (Category=Category::Service) THEN
                BEGIN
                       Service.RESET;
                       Service.SETRANGE(Service."Service Code","Service/Item Code");
                    IF Service.FINDSET THEN
                    BEGIN
                      Type:=Type::"G/L Account";
                      VALIDATE(Type);
                      "No.":=Service."G/L Account";
                      VALIDATE("No.");
                      Category:=Category::Service;
                      "Service/Item Code":=Service."Service Code";
                      Description:=Service."Service Name";
                   END;
                END;*/
                // IF  (Category=Category::Capex) THEN
                //  BEGIN
                //   Service.SETRANGE(Service."Service Code","Service/Item Code");
                //    IF Service.FINDSET THEN
                //    BEGIN
                //      Type:=Type::"Fixed Asset";
                //      VALIDATE(Type);
                //     "No.":=Service."G/L Account";
                //      VALIDATE("No.");
                //      Category:=Category::Capex;
                //      "Service/Item Code":=Service."Service Code";
                //      Description:=Service."Service Name";
                // END;
                // END;

                Item.Reset;
                Item.SetRange("No.", Rec."Service/Item Code");
                if Item.Find('-') then begin
                    Rec.Description := Item.Description;
                    //"Unit of Measure Code":= base unit;
                    Rec."Unit of Measure" := Item."Base Unit of Measure";
                end;

                //IF (Category=Category::Item) OR (Category=Category::Service)THEN BEGIN
                Rec.Type := Rec.Type::Item;
                Rec."No." := Rec."Service/Item Code";

                Item.Reset;
                Item.SetRange("No.", Rec."Service/Item Code");
                if Item.Find('-') then begin
                    Rec.Description := Item.Description;
                    Rec."Unit of Measure" := Item."Base Unit of Measure";
                    //"Unit of Measure Code":=Item."Unit of Measure Id";

                end;

                // VALIDATE("No.");
                Rec."Service/Item Code" := Rec."No.";
                //"Item Category":="Posting Group";
                Rec.Category := Rec.Category::Item;

                if PurchLine2.Get(Rec."Document Type", Rec."Document No.", Rec."Line No.") then begin

                    Rec.Modify;

                end;

                //END;
                Rec.Validate(Rec."Qty. Requested");

            end;
        }
        field(50007; "Partially Issued"; Boolean)
        {
        }
        field(50008; "Fully Issued"; Boolean)
        {
        }
        field(50009; "Quantity  issued"; Decimal)
        {
            Editable = true;
        }
        field(50010; "Quantity In Store"; Decimal)
        {
            CalcFormula = sum("Item Ledger Entry".Quantity where("Item No." = field("No."),
                                                                  "Location Code" = field("Location Code")));
            Caption = 'Inventory';
            DecimalPlaces = 0 : 5;
            Editable = false;
            FieldClass = FlowField;
        }
        field(50011; "Qty. on Purch. Order"; Decimal)
        {
            CalcFormula = sum("Purchase Line"."Outstanding Qty. (Base)" where("Document Type" = const(Order),
                                                                               Type = const(Item),
                                                                               "No." = field("No.")));
            Caption = 'Qty. on Purch. Order';
            DecimalPlaces = 0 : 5;
            Editable = false;
            FieldClass = FlowField;
        }
        field(50012; "Qty on Requisition"; Decimal)
        {
        }
        field(50013; "PO Number"; Code[20])
        {
            TableRelation = "Purchase Header"."No." where("Document Type" = filter(Order),
                                                           Status = const(Open));

            trigger OnValidate()
            begin
                Rec.Modify(false);
            end;
        }
        field(50014; Select2; Boolean)
        {
            Caption = 'Select';

            trigger OnValidate()
            begin
                //Ushindi
                Rec.Modify(false);
                Rec.TestField(Rec."PO Type");
                Rec.TestField(Rec."Buy-from Vendor No.");
                Rec."Selected By" := UserId;
            end;
        }
        field(50015; Ordered; Boolean)
        {

            trigger OnValidate()
            begin
                Rec.Modify(false);
            end;
        }
        field(50016; "Preferred Supplier"; Code[10])
        {
            TableRelation = Vendor;
        }
        field(50017; "Ordered by"; Code[50])
        {
            TableRelation = User."User Name";
        }
        field(50018; "Order Creation date"; Date)
        {
        }
        field(50019; "Order Creation Time"; Time)
        {
        }
        field(50020; "Last Issued By"; Code[50])
        {
        }
        field(50021; "Last Issue date"; Date)
        {
        }
        field(50022; "Last Issue Time"; Time)
        {
        }
        field(50023; "Budget Amount"; Decimal)
        {
            Editable = false;
        }
        field(50024; "Actual To Date"; Decimal)
        {
            Editable = false;
        }
        field(50025; "Requisition Type"; Option)
        {
            OptionCaption = ' ,Internal Use,Project,Stock Replenishment,Technical Installation,Technical Maintenance,Stock Return';
            OptionMembers = " ","Internal Use",Project,"Stock Replenishment","Technical Installation","Technical Maintenance","Stock Return";
        }
        field(50026; "Customer No."; Code[10])
        {
            TableRelation = Customer;

            trigger OnValidate()
            begin
                //Ushindi


                if Rec."Requisition Type" = Rec."requisition type"::"Internal Use" then begin
                    Error('Your requisition is for Internal use.You cannot fill in this field!!');
                    Rec.Modify := false;
                end;


                if Rec."Requisition Type" = Rec."requisition type"::"Stock Replenishment" then begin
                    Error('Your requisition is for Stock Replenishment.You cannot fill in this field!!');
                    Rec.Modify := false;
                end;
            end;
        }
        field(50027; "Requisition No."; Code[10])
        {
            CalcFormula = lookup("Purchase Line"."Document No." where("Document Type" = const("Store Requisition"),
                                                                       Type = field(Type),
                                                                       "PO Number" = field("Document No."),
                                                                       "No." = field("No.")));
            FieldClass = FlowField;
        }
        field(50028; "Employee No"; Code[10])
        {
            TableRelation = Employee."No.";
        }
        field(50029; "Employee Name"; Text[100])
        {
            CalcFormula = lookup(Customer.Name where("No." = field("Employee No")));
            Editable = false;
            FieldClass = FlowField;
        }
        field(50030; "Item Category"; Code[20])
        {
            TableRelation = "Item Category".Code where(Indentation = const(0));

            trigger OnValidate()
            begin

                if (Rec."Document Type" = Rec."document type"::"Store Requisition") then begin
                    //Category:=Category::Item;
                    Rec.Validate(Rec.Category);
                end;
                //INSERT(TRUE);
            end;
        }
        field(50031; VendorName; Text[100])
        {
            CalcFormula = lookup("Purchase Header"."Buy-from Vendor Name" where("Document Type" = field("Document Type"),
                                                                                 "No." = field("Document No.")));
            FieldClass = FlowField;
        }
        field(50032; Branch; Code[20])
        {
            CalcFormula = lookup("Dimension Set Entry"."Dimension Value Code" where("Dimension Set ID" = field("Dimension Set ID"),
                                                                                     "Dimension Code" = const('BRANCH')));
            FieldClass = FlowField;
        }
        field(50033; Department; Code[20])
        {
            CalcFormula = lookup("Dimension Set Entry"."Dimension Value Code" where("Dimension Set ID" = field("Dimension Set ID"),
                                                                                     "Dimension Code" = const('DEPARTMENT')));
            FieldClass = FlowField;
        }
        field(50034; "G/L Name"; Text[60])
        {
            CalcFormula = lookup("G/L Account".Name where("No." = field("No.")));
            FieldClass = FlowField;
        }
        field(50035; "IR Approval History"; Code[50])
        {
        }
        field(50036; "Selected By"; Code[50])
        {
        }
        field(50037; "Qty. Requested"; Decimal)
        {

            trigger OnValidate()
            begin

                Rec.TestStatusOpen;

                Rec.Validate(Rec."Direct Unit Cost");
                Rec.Quantity := Rec."Qty. Requested";
                Rec."Line Amount" := Rec."Qty. Requested" * Rec."Direct Unit Cost";

                if Rec."Document Type" = Rec."document type"::"Purchase Requisition" then begin

                    /* gEntry.RESET;
                     actualAmount:=0;
                     cSetup.GET;
                     Bcommitments.RESET;
                     gEntry.SETRANGE("G/L Account No.","Vote Item");
                     gEntry.SETFILTER(gEntry."Posting Date",'%1..%2',cSetup."Leave Posting Period[FROM]",cSetup."Leave Posting Period[TO]");
                      IF gEntry.FINDSET THEN
                        BEGIN
                          REPEAT
                             actualAmount:=actualAmount+ABS(gEntry.Amount);
                          UNTIL gEntry.NEXT=0;
                        END;

                       "Actual To Date":=actualAmount;

                        Bcommitments.SETRANGE("Account No.","Vote Item");
                        IF Bcommitments.FINDSET THEN
                          BEGIN
                         "Vote Amount":=Bcommitments."Budgeted Amount";
                         Bcommitments.CALCFIELDS("Commited Amount Imprest","Commited Amount Orders","Commited Amount PRN","Committed Invoices");
                         "Budget Commitments":=(Bcommitments."Commited Amount Imprest"+Bcommitments."Commited Amount Orders"+Bcommitments."Commited Amount PRN"+Bcommitments."Committed Invoices");
                         "Available Funds":="Vote Amount"-actualAmount-"Budget Commitments";
                         END;*/



                    ProcurementPlan.Reset;
                    ProcurementPlan.SetRange(ProcurementPlan."Plan Item No", Rec."Procurement Plan Item");
                    if ProcurementPlan.Find('-') then begin
                        if ProcurementPlan."Procurement Type" = ProcurementPlan."procurement type"::Goods then
                            Rec.Category := Rec.Category::Item
                        else
                            if ProcurementPlan."Procurement Type" = ProcurementPlan."procurement type"::Service then
                                Rec.Category := Rec.Category::Service;

                        ProcurementPlan.CalcFields("Approved Budget", Commitment, Actual);
                        Rec."Vote Amount" := ProcurementPlan."Approved Budget";
                        Rec."Budget Commitments" := ProcurementPlan.Commitment;
                        Rec."Available Funds" := Rec."Vote Amount" - ProcurementPlan.Actual - Rec."Budget Commitments";

                        //Description:=ProcurementPlan."Item Description";
                        Rec."Unit of Measure" := ProcurementPlan."Unit of Measure";
                        Rec."Unit Cost" := ProcurementPlan."Unit Cost";
                        //Budgeted:=BudgetLines.Amount;
                        Rec."Budget Amount" := ProcurementPlan."Approved Budget";
                        //"Direct Unit Cost":=ProcurementPlan."Unit Cost";
                        Rec.Validate(Rec."Direct Unit Cost");
                        /*   IF Category=Category::Service THEN BEGIN
                         "Qty. Requested":=ProcurementPlan.Quantity;
                         Quantity:=ProcurementPlan.Quantity;;
                         END;*/
                        Rec."Line Amount" := Rec."Qty. Requested" * Rec."Direct Unit Cost";

                    end;
                end;

            end;
        }
        field(50038; "Include in Purch. Order"; Boolean)
        {
        }
        field(50039; "Request-By No."; Code[10])
        {
            TableRelation = Employee."No.";
        }
        field(50040; "Request-By Name"; Text[50])
        {
        }
        field(50041; "Quantity Rejected"; Decimal)
        {

            trigger OnValidate()
            begin

                /*
             //RGK CHECK IF CURRENT USER HAS RIGHTS EDIT THIS FIELD
             UserSetup.SETFILTER(UserSetup."User ID",'%1',USERID);
             IF UserSetup.FINDFIRST THEN BEGIN
               IF UserSetup."Perform Purchase Inspection"<>TRUE THEN
                  ERROR(AAA01);
             END ELSE BEGIN
               EXIT;
             END;
              */

            end;
        }
        field(50042; "Quantity Returned"; Decimal)
        {

            trigger OnValidate()
            begin

                /*
             //RGK CHECK IF CURRENT USER HAS RIGHTS EDIT THIS FIELD
             UserSetup.SETFILTER(UserSetup."User ID",'%1',USERID);
             IF UserSetup.FINDFIRST THEN BEGIN
               IF UserSetup."Perform Purchase Inspection"<>TRUE THEN
                  ERROR(AAA01);
             END ELSE BEGIN
               EXIT;
             END;
              */

            end;
        }
        field(50043; "Requestor ID"; Code[50])
        {
            CalcFormula = lookup("Purchase Header".Test where("Document Type" = field("Document Type"),
                                                               "No." = field("Document No.")));
            Editable = false;
            FieldClass = FlowField;
        }
        field(50044; "IR Line Reference"; Code[35])
        {
        }
        field(50045; "Requisition Header Type"; Option)
        {
            Description = '//Ushindi...Lookup IR Type from Header';
            FieldClass = Normal;
            OptionCaption = ' ,Internal Use,Project,Stock Replenishment,Technical Installation,Technical Maintenance,Stock Return';
            OptionMembers = " ","Internal Use",Project,"Stock Replenishment","Technical Installation","Technical Maintenance","Stock Return";
        }
        field(50046; "Project Description"; Code[250])
        {
            CalcFormula = lookup(Job.Description where("No." = field("Job No.")));
            FieldClass = FlowField;
        }
        field(50050; "Remaining Quantity"; Decimal)
        {
            CalcFormula = sum("Item Ledger Entry".Quantity where("Item No." = field("No.")));
            FieldClass = FlowField;
        }
        field(50061; "PO Type"; Option)
        {
            OptionCaption = ' ,LSO,LPO';
            OptionMembers = " ",LSO,LPO;

            trigger OnValidate()
            begin
                Rec.Decision := Rec.Decision::Order;
            end;
        }
        field(50062; Decision; Option)
        {
            OptionCaption = ' ,Order';
            OptionMembers = " ","Order";
        }
        field(50063; "TRF Unit of measue"; Code[20])
        {
        }
        field(50064; "Type of Vehicle"; Code[20])
        {
            TableRelation = "Transport Method".Code;

            trigger OnValidate()
            begin
                Rec.TestField(Rec.Status, Rec.Status::Open);
            end;
        }
        field(50065; "Vehicle Description"; Text[100])
        {
            CalcFormula = lookup("Transport Method".Description where(Code = field("Type of Vehicle")));
            Editable = false;
            FieldClass = FlowField;
        }
        field(50066; "Date From"; Date)
        {
        }
        field(50067; "To Date"; Date)
        {

            trigger OnValidate()
            begin
                // Description:="Vehicle Description";
                // VALIDATE("Date From");
                // IF ("To Date")<("Date From") THEN
                //  ERROR(Text0010);
            end;
        }
        field(50068; "External Doc No"; Code[20])
        {
            CalcFormula = lookup("Purchase Header"."Vendor Order No." where("No." = field("Document No.")));
            FieldClass = FlowField;
        }
        field(50069; "Vote Item"; Code[20])
        {
            TableRelation = "G/L Account";
        }
        field(50070; "Vote Amount"; Decimal)
        {
            Editable = false;
        }
        field(50071; "Available Funds"; Decimal)
        {
            Editable = false;
        }
        field(50072; "Budget Commitments"; Decimal)
        {
            Editable = false;
        }
        field(50073; "Approved Requisition Amount"; Decimal)
        {
        }
        field(50074; "Approved Unit Cost"; Decimal)
        {

            trigger OnValidate()
            begin
                Rec."Approved Requisition Amount" := Rec.Quantity * Rec."Approved Unit Cost";
            end;
        }
        field(70000; "Procurement Plan"; Code[10])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Procurement Header".No;
        }
        field(70001; "Procurement Plan Item"; Code[10])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Procurement Plan 1"."Plan Item No" where("Plan Year" = field("Procurement Plan"),
                                                                       "Directorate Code" = field("Directorate Code"));

            trigger OnValidate()
            begin

                ProcurementPlan.Reset;
                ProcurementPlan.SetRange(ProcurementPlan."Plan Item No", Rec."Procurement Plan Item");
                if ProcurementPlan.Find('-') then begin
                    /*IF ProcurementPlan."Procurement Type"=ProcurementPlan."Procurement Type"::Goods THEN BEGIN
                      Type:=Type::Item;
                      "No.":=ProcurementPlan."No.";
                    END;
                    IF ProcurementPlan."Procurement Type"<>ProcurementPlan."Procurement Type"::Service THEN BEGIN
                     Type:=Type::"G/L Account";
                     "No.":=ProcurementPlan."Source of Funds";
                    END;*/
                    //"Budget Line":=ProcurementPlan."Source of Funds";
                    /*Type:=Type::Item;
                   "No.":=ProcurementPlan."No.";*/
                    /*
                     Description:=ProcurementPlan."Item Description";
                    "Unit of Measure":=ProcurementPlan."Unit of Measure";
                    Amount:=ProcurementPlan."Estimated Cost";
                    //"Unit Cost":=ProcurementPlan."Unit Cost";
                     //Budgeted:=BudgetLines.Amount;
                   "Budget Amount":=ProcurementPlan."Estimated Cost";*/

                end;

                ProcurementPlan.Reset;
                ProcurementPlan.SetRange("Plan Year", Rec."Procurement Plan");
                ProcurementPlan.SetRange("Plan Item No", Rec."Procurement Plan Item");
                if ProcurementPlan.FindSet then begin
                    Rec."General Item Category" := ProcurementPlan."General Item Category";
                    if ProcurementPlan."Procurement Type" = ProcurementPlan."procurement type"::Goods then
                        Rec."General Item Category" := 'GOODS';
                    if ProcurementPlan."Procurement Type" = ProcurementPlan."procurement type"::Service then
                        Rec."General Item Category" := 'Service';
                    if ProcurementPlan."Procurement Type" = ProcurementPlan."procurement type"::Works then
                        Rec."General Item Category" := 'Works';
                    Rec."Item Category" := ProcurementPlan."Item Category";
                    Rec."Job No." := ProcurementPlan."Job ID";
                    Rec."Job Task No." := ProcurementPlan."Job Task No.";
                    if GeneralItem.Get(Rec."Item Category") then begin
                        Rec."Service/Item Code" := GeneralItem."Item No";
                        Item.Reset;
                        Item.SetRange("No.", Rec."Service/Item Code");
                        if Item.Find('-') then begin
                            Rec.Description := Item.Description;
                        end;
                        Rec.Type := Rec.Type::Item;
                        Rec."No." := GeneralItem."Item No";
                    end;
                end;

            end;
        }
        field(70002; "Requisition Status"; Option)
        {
            DataClassification = ToBeClassified;
            OptionMembers = " ",Approved,Rejected;
        }
        field(70003; "Requisition Date"; Date)
        {
            DataClassification = ToBeClassified;
        }
        field(70004; "Requisition Type1"; Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = 'Quote,Order,Invoice,Credit Memo,Blanket Order,Return Order,None,Purchase Requisition,Store Requisition,Imprest,Claim-Accounting,Appointment,Payment Voucher';
            OptionMembers = Quote,"Order",Invoice,"Credit Memo","Blanket Order","Return Order","None","Purchase Requisition","Store Requisition",Imprest,"Claim-Accounting",Appointment,"Payment Voucher";
        }
        field(70005; Committed; Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(70006; "Request Generated"; Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(70007; "Process Type"; Code[10])
        {
            CalcFormula = lookup("Purchase Header"."Process Type" where("No." = field("Document No.")));
            FieldClass = FlowField;
        }
        field(70008; "Contract No"; Code[10])
        {
            DataClassification = ToBeClassified;
        }
        field(70009; "Activity Type"; Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = ',WorkPlan,Admin & PE,Proc Plan';
            OptionMembers = ,WorkPlan,"Admin & PE","Proc Plan";

            trigger OnValidate()
            begin
                /*
                CashMngt.GET;
                GLSetup.GET;
                "Current Budget":=GLSetup."Current Budget";
                //message('%1',"Current Budget");
                */

            end;
        }
        field(70010; Activity; Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(70011; "Current Budget"; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "G/L Budget Name";
        }
        field(70012; "BD Amount"; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(70013; "Purchase Type"; Code[30])
        {
            CalcFormula = lookup("Purchase Header"."Process Type" where("No." = field("Document No.")));
            FieldClass = FlowField;
        }
        field(70014; "Requisition No"; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Requisition Header1";
        }
        field(70015; "Department Code"; Code[30])
        {
            TableRelation = "Responsibility Center" where("Operating Unit Type" = const(Department),
                                                           "Direct Reports To" = field("Directorate Code"));
        }
        field(70016; "Directorate Code"; Code[50])
        {
            TableRelation = "Responsibility Center" where("Operating Unit Type" = const(Directorate));
        }
        field(70017; Division; Code[50])
        {
            Description = 's';
            TableRelation = "Responsibility Center" where("Operating Unit Type" = const("Division/Section"),
                                                           "Direct Reports To" = field("Department Code"));
        }
        field(70027; "General Item Category"; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "General Item Categories".Code;
        }
        field(70028; "Item Description"; Text[60])
        {
            DataClassification = ToBeClassified;
        }
        field(70029; Specifications; Text[250])
        {
            DataClassification = ToBeClassified;
        }
        field(70030; "Direct Unit Cost Inc. VAT"; Decimal)
        {
            DataClassification = ToBeClassified;

            trigger OnValidate()
            begin
                Rec."Direct Unit Cost" := Rec."Direct Unit Cost Inc. VAT";
                Rec.Validate(Rec."Direct Unit Cost");
            end;
        }
        field(70031; "Entry No"; Integer)
        {
            DataClassification = ToBeClassified;
        }
        field(70032; "Workplan Task No."; Code[20])
        {
            Caption = 'Job Task No.';
            DataClassification = ToBeClassified;
            TableRelation = "Job Task"."Job Task No." where("Job Task Type" = const(Posting),
                                                             "Job No." = field("Job No."),
                                                             "Global Dimension 1 Code" = field("Shortcut Dimension 1 Code"));

            trigger OnValidate()
            begin
                Rec.Validate(Rec."Job Task No.", Rec."Workplan Task No.");
            end;
        }
        field(70033; Comment; Text[250])
        {
            DataClassification = ToBeClassified;
        }
        field(70034; "Linked IFS No."; Code[30])
        {
            DataClassification = ToBeClassified;
        }
        field(70035; "Linked LPO No."; Code[30])
        {
            DataClassification = ToBeClassified;
        }
        field(70036; "Procurement Plan ID"; Code[10])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Procurement Plan".Code;
        }
        field(70037; "Procurement Plan Entry No"; Integer)
        {
            DataClassification = ToBeClassified;
            TableRelation = "Procurement Plan Entry"."Entry No.";//CC//S where("Procurement Plan ID" = field("Procurement Plan Entry No"));

            trigger OnValidate()
            begin
                /* PlanItem.RESET;
                 PlanItem.SETRANGE("Plan Item No","Procurement Plan Item");
                 IF PlanItem.FIND('-') THEN
                   "Procurement Plan Item Descript":=PlanItem."Item Description";*/

            end;
        }
        field(70038; "Quantity Partial Issued"; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(70039; "Ordered PRN"; Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(8603700; Test; Code[10])
        {
            DataClassification = ToBeClassified;
        }
    }
    keys
    {
        // Unsupported feature: Key containing base fields
        // 
        // //Unsupported feature: Deletion (KeyCollection) on ""Document Type","Pay-to Vendor No.","Shortcut Dimension 1 Code","Shortcut Dimension 2 Code","Currency Code","Document No."(Key)".
        // 
        // 
        // //Unsupported feature: Deletion (KeyCollection) on ""Document Type","Document No.","Location Code"(Key)".
        // 
        // key(Key1;"Document Type","Pay-to Vendor No.","Shortcut Dimension 1 Code","Shortcut Dimension 2 Code","Currency Code","Document No.","Entry No")
        // {
        // Enabled = false;
        // MaintainSIFTIndex = false;
        // MaintainSQLIndex = false;
        // SumIndexFields = "Outstanding Amount","Amt. Rcd. Not Invoiced","Outstanding Amount (LCY)","Amt. Rcd. Not Invoiced (LCY)";
        // }
        // Unsupported feature: Key containing base fields
        // key(Key2;"Document Type","Document No.","Location Code","Entry No")
        // {
        // MaintainSQLIndex = false;
        // SumIndexFields = Amount,"Amount Including VAT";
        // }
        key(Key3; "Procurement Plan")
        {
        }
    }


    //Unsupported feature: Code Modification on "OnInsert".

    //trigger OnInsert()
    //>>>> ORIGINAL CODE:
    //begin
    /*
    TestStatusOpen;
    IF Quantity <> 0 THEN BEGIN
      OnBeforeVerifyReservedQty(Rec,xRec,0);
      ReservePurchLine.VerifyQuantity(Rec,xRec);
    END;
    LOCKTABLE;
    PurchHeader."No." := '';
    IF ("Deferral Code" <> '') AND (GetDeferralAmount <> 0) THEN
      UpdateDeferralAmounts;
    */
    //end;
    //>>>> MODIFIED CODE:
    //begin
    /*
    TestStatusOpen;

    #2..9

    PurchHeader.RESET;
    PurchHeader.SETRANGE("No.","Document No.");
    PurchHeader.SETRANGE(Status,PurchHeader.Status::Open);
    IF PurchHeader.FINDSET THEN BEGIN
    "Procurement Plan":=PurchHeader."Procurement Plan";
      //"Procurement Plan Item":=PurchHeader."Procurement Plan Item";
      //"Item Category":=PurchHeader."Item Category";

      //"General Item Category":=PurchHeader."General Item Category";
      IF GeneralItem.GET("Item Category") THEN BEGIN
        "Service/Item Code":=GeneralItem."Item No";
        Item.RESET;
      Item.SETRANGE("No.","Service/Item Code");
      IF Item.FIND('-') THEN BEGIN
         Description:=Item.Description;
      END;
      Type:=Type::Item;
      "No.":=GeneralItem."Item No";
      //VALIDATE("No.");

        //VALIDATE("Service/Item Code");
        END;

    {"Directorate Code":=PurchHeader."Di;rectorate Code";
    Division:=PurchHeader.Division;
    "Department Code":=PurchHeader."Department Code";}
    END;
    */
    //end;


    //Unsupported feature: Code Modification on "InitHeaderDefaults(PROCEDURE 97)".

    //procedure InitHeaderDefaults();
    //Parameters and return type have not been exported.
    //>>>> ORIGINAL CODE:
    //begin
    /*
    PurchHeader.TESTFIELD("Buy-from Vendor No.");

    "Buy-from Vendor No." := PurchHeader."Buy-from Vendor No.";
    "Currency Code" := PurchHeader."Currency Code";
    #5..29
    "Order Date" := PurchHeader."Order Date";

    OnAfterInitHeaderDefaults(Rec,PurchHeader);
    */
    //end;
    //>>>> MODIFIED CODE:
    //begin
    /*
    //PurchHeader.TESTFIELD("Buy-from Vendor No.");
    #2..32
    */
    //end;


    //Unsupported feature: Code Modification on "CreateTempJobJnlLine(PROCEDURE 55)".

    //procedure CreateTempJobJnlLine();
    //Parameters and return type have not been exported.
    //>>>> ORIGINAL CODE:
    //begin
    /*
    OnBeforeCreateTempJobJnlLine(TempJobJnlLine,Rec,xRec,GetPrices,CurrFieldNo);

    GetPurchHeader;
    #4..13
    TempJobJnlLine.VALIDATE("No.","No.");
    TempJobJnlLine.VALIDATE(Quantity,Quantity);
    TempJobJnlLine.VALIDATE("Variant Code","Variant Code");
    TempJobJnlLine.VALIDATE("Unit of Measure Code","Unit of Measure Code");

    IF NOT GetPrices THEN BEGIN
      IF xRec."Line No." <> 0 THEN BEGIN
    #21..36
      TempJobJnlLine.VALIDATE("Unit Cost (LCY)","Unit Cost (LCY)");

    OnAfterCreateTempJobJnlLine(TempJobJnlLine,Rec,xRec,GetPrices,CurrFieldNo);
    */
    //end;
    //>>>> MODIFIED CODE:
    //begin
    /*
    #1..16
    //TempJobJnlLine.VALIDATE("Unit of Measure Code","Unit of Measure Code");
    #18..39
    */
    //end;


    //Unsupported feature: Property Modification (Id) on "ItemChargeAssignmentErr(Variable 1097)".

    //var
    //>>>> ORIGINAL VALUE:
    //ItemChargeAssignmentErr : 1097;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //ItemChargeAssignmentErr : 1297;
    //Variable type has not been exported.


    //Unsupported feature: Property Modification (Id) on "CannotFindDescErr(Variable 1035)".

    //var
    //>>>> ORIGINAL VALUE:
    //CannotFindDescErr : 1035;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //CannotFindDescErr : 1635;
    //Variable type has not been exported.


    //Unsupported feature: Property Modification (Id) on "CommentLbl(Variable 1024)".

    //var
    //>>>> ORIGINAL VALUE:
    //CommentLbl : 1024;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //CommentLbl : 1524;
    //Variable type has not been exported.


    //Unsupported feature: Property Modification (Id) on "LineDiscountPctErr(Variable 1036)".

    //var
    //>>>> ORIGINAL VALUE:
    //LineDiscountPctErr : 1036;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //LineDiscountPctErr : 1536;
    //Variable type has not been exported.


    //Unsupported feature: Property Modification (Id) on "PurchasingBlockedErr(Variable 1037)".

    //var
    //>>>> ORIGINAL VALUE:
    //PurchasingBlockedErr : 1037;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //PurchasingBlockedErr : 1537;
    //Variable type has not been exported.

    var
        "........New Variables By Ushindi...................": Integer;
        GLPostCheckLineCDU: Codeunit "Gen. Jnl.-Check Line";
        GLAccCode: Code[20];
        GDimensions: array[8] of Code[20];
        GPostDate: Date;
        GBusUnitCode: Code[20];
        GCurrFactor: Decimal;
        UserSetup: Record "User Setup";
        Service: Record "Service Items";
        Jobs: Record Job;
        qty: Decimal;
        UoM: Record "Item Unit of Measure";
        Text055: label 'You have exceeded availble budget by KES %1, Please seek advice from accounts and finance department';
        "...........................Bcommitments................................": Integer;
        fAsset: Record "Fixed Asset";
        Bcommitments: Record "Budget Commitment";
        cSetup: Record "Human Resources Setup";
        gEntry: Record "G/L Entry";
        actualAmount: Decimal;
        ProcurementPlan: Record "Procurement Plan 1";
        Item: Record Item;
        GeneralItem: Record "Item Category";
        "----------Editable.............................................................": Integer;
        AmountEditable: Boolean;
        LineAmountEditable: Boolean;
        QuantityEditable: Boolean;
}
