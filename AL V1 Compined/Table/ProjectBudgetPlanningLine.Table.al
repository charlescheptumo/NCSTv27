#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Table 65037 "Project Budget Planning Line"
{
    Caption = 'Project Budget Planning Line';
    DrillDownPageID = "Job Planning Lines";
    LookupPageID = "Job Planning Lines";

    fields
    {
        field(1; "Line No."; Integer)
        {
            AutoIncrement = true;
            Caption = 'Line No.';
            Editable = false;
        }
        field(2; "Job No."; Code[20])
        {
            Caption = 'Job No.';
            NotBlank = true;
            TableRelation = Job;
        }
        field(3; "Planning Date"; Date)
        {
            Caption = 'Planning Date';

            trigger OnValidate()
            begin
                /*ValidateModification(xRec."Planning Date" <> "Planning Date");
                
                VALIDATE("Document Date","Planning Date");
                IF ("Currency Date" = 0D) OR ("Currency Date" = xRec."Planning Date") THEN
                  VALIDATE("Currency Date","Planning Date");
                IF (Type <> Type::Text) AND ("No." <> '') THEN
                  UpdateAllAmounts;
                IF "Planning Date" <> 0D THEN
                  CheckItemAvailable(FIELDNO("Planning Date"));
                IF CurrFieldNo = FIELDNO("Planned Delivery Date") THEN
                  UpdateReservation(CurrFieldNo)
                ELSE
                  UpdateReservation(FIELDNO("Planning Date"));
                "Planned Delivery Date" := "Planning Date";
                */

            end;
        }
        field(4; "Document No."; Code[20])
        {
            Caption = 'Document No.';

            trigger OnValidate()
            begin
                //ValidateModification(xRec."Document No." <> "Document No.");
            end;
        }
        field(5; Type; Option)
        {
            Caption = 'Type';
            OptionCaption = 'Resource,Item,G/L Account,Text';
            OptionMembers = Resource,Item,"G/L Account",Text;

            trigger OnValidate()
            begin
                /*ValidateModification(xRec.Type <> Type);
                
                UpdateReservation(FIELDNO(Type));
                
                VALIDATE("No.",'');
                IF Type = Type::Item THEN BEGIN
                  GetLocation("Location Code");
                  Location.TESTFIELD("Directed Put-away and Pick",FALSE);
                END;
                */

            end;
        }
        field(7; "No."; Code[20])
        {
            Caption = 'No.';
            TableRelation = if (Type = const(Resource)) Resource
            else if (Type = const(Item)) Item where(Blocked = const(false))
            else if (Type = const("G/L Account")) "G/L Account"
            else if (Type = const(Text)) "Standard Text";

            trigger OnValidate()
            begin
                /*ValidateModification(xRec."No." <> "No.");
                
                CheckUsageLinkRelations;
                
                UpdateReservation(FIELDNO("No."));
                
                UpdateDescription;
                
                IF ("No." = '') OR ("No." <> xRec."No.") THEN BEGIN
                  "Unit of Measure Code" := '';
                  "Qty. per Unit of Measure" := 1;
                  "Variant Code" := '';
                  "Work Type Code" := '';
                  "Gen. Bus. Posting Group" := '';
                  "Gen. Prod. Posting Group" := '';
                  DeleteAmounts;
                  "Cost Factor" := 0;
                  IF "No." = '' THEN
                    EXIT;
                END;
                
                GetJob;
                "Customer Price Group" := Job."Customer Price Group";
                
                CASE Type OF
                  Type::Resource:
                    BEGIN
                      Res.GET("No.");
                      Res.CheckResourcePrivacyBlocked(FALSE);
                      Res.TESTFIELD(Blocked,FALSE);
                      Res.TESTFIELD("Gen. Prod. Posting Group");
                      IF Description = '' THEN
                        Description := Res.Name;
                      IF "Description 2" = '' THEN
                        "Description 2" := Res."Name 2";
                      "Gen. Prod. Posting Group" := Res."Gen. Prod. Posting Group";
                      "Resource Group No." := Res."Resource Group No.";
                      VALIDATE("Unit of Measure Code",Res."Base Unit of Measure");
                    END;
                  Type::Item:
                    BEGIN
                      GetItem;
                      Item.TESTFIELD(Blocked,FALSE);
                      Item.TESTFIELD("Gen. Prod. Posting Group");
                      Description := Item.Description;
                      "Description 2" := Item."Description 2";
                      IF Job."Language Code" <> '' THEN
                        GetItemTranslation;
                      "Gen. Prod. Posting Group" := Item."Gen. Prod. Posting Group";
                      VALIDATE("Unit of Measure Code",Item."Base Unit of Measure");
                      IF "Usage Link" THEN
                        IF Item.Reserve = Item.Reserve::Optional THEN
                          Reserve := Job.Reserve
                        ELSE
                          Reserve := Item.Reserve;
                    END;
                  Type::"G/L Account":
                    BEGIN
                      GLAcc.GET("No.");
                      GLAcc.CheckGLAcc;
                      GLAcc.TESTFIELD("Direct Posting",TRUE);
                      GLAcc.TESTFIELD("Gen. Prod. Posting Group");
                      Description := GLAcc.Name;
                      "Gen. Bus. Posting Group" := GLAcc."Gen. Bus. Posting Group";
                      "Gen. Prod. Posting Group" := GLAcc."Gen. Prod. Posting Group";
                      "Unit of Measure Code" := '';
                      "Direct Unit Cost (LCY)" := 0;
                      "Unit Cost (LCY)" := 0;
                      "Unit Price" := 0;
                    END;
                  Type::Text:
                    BEGIN
                      StandardText.GET("No.");
                      Description := StandardText.Description;
                    END;
                END;
                
                IF Type <> Type::Text THEN
                  VALIDATE(Quantity);
                  */

            end;
        }
        field(8; Description; Text[100])
        {
            Caption = 'Description';

            trigger OnValidate()
            begin
                //ValidateModification(xRec.Description <> Description);
            end;
        }
        field(9; Quantity; Decimal)
        {
            Caption = 'Quantity';
            DecimalPlaces = 0 : 5;

            trigger OnValidate()
            var
                Delta: Decimal;
            begin
                /*IF "Usage Link" THEN
                  IF NOT BypassQtyValidation THEN BEGIN
                    IF ("Qty. Posted" > 0) AND (Quantity < "Qty. Posted") THEN
                      ERROR(QtyLessErr,FIELDCAPTION(Quantity),FIELDCAPTION("Qty. Posted"));
                    IF ("Qty. Posted" < 0) AND (Quantity > "Qty. Posted") THEN
                      ERROR(QtyGreaterErr,FIELDCAPTION(Quantity),FIELDCAPTION("Qty. Posted"));
                  END;
                
                CALCFIELDS("Qty. Transferred to Invoice");
                IF ("Qty. Transferred to Invoice" > 0) AND (Quantity < "Qty. Transferred to Invoice") THEN
                  ERROR(QtyLessErr,FIELDCAPTION(Quantity),FIELDCAPTION("Qty. Transferred to Invoice"));
                IF ("Qty. Transferred to Invoice" < 0) AND (Quantity > "Qty. Transferred to Invoice") THEN
                  ERROR(QtyGreaterErr,FIELDCAPTION(Quantity),FIELDCAPTION("Qty. Transferred to Invoice"));
                
                CASE Type OF
                  Type::Item:
                    IF NOT Item.GET("No.") THEN
                      ERROR(MissingItemResourceGLErr,Type,Item.FIELDCAPTION("No."));
                  Type::Resource:
                    IF NOT Res.GET("No.") THEN
                      ERROR(MissingItemResourceGLErr,Type,Res.FIELDCAPTION("No."));
                  Type::"G/L Account":
                    IF NOT GLAcc.GET("No.") THEN
                      ERROR(MissingItemResourceGLErr,Type,GLAcc.FIELDCAPTION("No."));
                END;
                
                "Quantity (Base)" := CalcBaseQty(Quantity);
                
                IF "Usage Link" AND (xRec."No." = "No.") THEN BEGIN
                  Delta := Quantity - xRec.Quantity;
                  VALIDATE("Remaining Qty.","Remaining Qty." + Delta);
                  VALIDATE("Qty. to Transfer to Journal","Qty. to Transfer to Journal" + Delta);
                END;
                
                UpdateQtyToTransfer;
                UpdateQtyToInvoice;
                
                CheckItemAvailable(FIELDNO(Quantity));
                UpdateReservation(FIELDNO(Quantity));
                
                UpdateAllAmounts;
                BypassQtyValidation := FALSE;
                */
                JobPlanningLines.Reset;
                JobPlanningLines.SetRange("Job No.", "Job No.");
                JobPlanningLines.SetRange("Job Task No.", "Job Task No.");
                if JobPlanningLines.Find('-') then begin
                    Quantity := JobPlanningLines.Quantity;
                end;

            end;
        }
        field(11; "Direct Unit Cost (LCY)"; Decimal)
        {
            AutoFormatType = 2;
            Caption = 'Direct Unit Cost (LCY)';
        }
        field(12; "Unit Cost (LCY)"; Decimal)
        {
            AutoFormatType = 2;
            Caption = 'Unit Cost (LCY)';
            Editable = false;

            trigger OnValidate()
            begin
                /*ValidateModification(xRec."Unit Cost (LCY)" <> "Unit Cost (LCY)");
                
                IF (Type = Type::Item) AND
                   Item.GET("No.") AND
                   (Item."Costing Method" = Item."Costing Method"::Standard)
                THEN
                  UpdateAllAmounts
                ELSE BEGIN
                  InitRoundingPrecisions;
                  "Unit Cost" := ROUND(
                      CurrExchRate.ExchangeAmtLCYToFCY(
                        "Currency Date","Currency Code",
                        "Unit Cost (LCY)","Currency Factor"),
                      UnitAmountRoundingPrecisionFCY);
                  UpdateAllAmounts;
                END;
                */
                "Unit Cost" := "Unit Cost (LCY)";
                "Total Cost" := Quantity * "Unit Cost (LCY)";
                "Total Cost (LCY)" := Quantity * "Unit Cost (LCY)";

            end;
        }
        field(13; "Total Cost (LCY)"; Decimal)
        {
            AutoFormatType = 1;
            Caption = 'Total Cost (LCY)';
            Editable = false;
        }
        field(14; "Unit Price (LCY)"; Decimal)
        {
            AutoFormatType = 2;
            Caption = 'Unit Price (LCY)';
            Editable = false;

            trigger OnValidate()
            begin
                /*ValidateModification(xRec."Unit Price (LCY)" <> "Unit Price (LCY)");
                
                InitRoundingPrecisions;
                "Unit Price" := ROUND(
                    CurrExchRate.ExchangeAmtLCYToFCY(
                      "Currency Date","Currency Code",
                      "Unit Price (LCY)","Currency Factor"),
                    UnitAmountRoundingPrecisionFCY);
                UpdateAllAmounts;
                */

            end;
        }
        field(15; "Total Price (LCY)"; Decimal)
        {
            AutoFormatType = 1;
            Caption = 'Total Price (LCY)';
            Editable = false;
        }
        field(16; "Resource Group No."; Code[20])
        {
            Caption = 'Resource Group No.';
            Editable = false;
            TableRelation = "Resource Group";
        }
        field(17; "Unit of Measure Code"; Code[10])
        {
            Caption = 'Unit of Measure Code';
            TableRelation = if (Type = const(Item)) "Item Unit of Measure".Code where("Item No." = field("No."))
            else if (Type = const(Resource)) "Resource Unit of Measure".Code where("Resource No." = field("No."))
            else
            "Unit of Measure";

            trigger OnValidate()
            var
                Resource: Record Resource;
            begin
                /*ValidateModification(xRec."Unit of Measure Code" <> "Unit of Measure Code");
                
                GetGLSetup;
                CASE Type OF
                  Type::Item:
                    BEGIN
                      Item.GET("No.");
                      "Qty. per Unit of Measure" :=
                        UOMMgt.GetQtyPerUnitOfMeasure(Item,"Unit of Measure Code");
                    END;
                  Type::Resource:
                    BEGIN
                      IF CurrFieldNo <> FIELDNO("Work Type Code") THEN
                        IF "Work Type Code" <> '' THEN BEGIN
                          WorkType.GET("Work Type Code");
                          IF WorkType."Unit of Measure Code" <> '' THEN
                            TESTFIELD("Unit of Measure Code",WorkType."Unit of Measure Code");
                        END ELSE
                          TESTFIELD("Work Type Code",'');
                      IF "Unit of Measure Code" = '' THEN BEGIN
                        Resource.GET("No.");
                        "Unit of Measure Code" := Resource."Base Unit of Measure";
                      END;
                      ResourceUnitOfMeasure.GET("No.","Unit of Measure Code");
                      "Qty. per Unit of Measure" := ResourceUnitOfMeasure."Qty. per Unit of Measure";
                      "Quantity (Base)" := Quantity * "Qty. per Unit of Measure";
                    END;
                  Type::"G/L Account":
                    "Qty. per Unit of Measure" := 1;
                END;
                CheckItemAvailable(FIELDNO("Unit of Measure Code"));
                UpdateReservation(FIELDNO("Unit of Measure Code"));
                VALIDATE(Quantity);
                */

            end;
        }
        field(20; "Location Code"; Code[10])
        {
            Caption = 'Location Code';
            TableRelation = Location where("Use As In-Transit" = const(false));

            trigger OnValidate()
            begin
                /*ValidateModification(xRec."Location Code" <> "Location Code");
                
                "Bin Code" := '';
                IF Type = Type::Item THEN BEGIN
                  GetLocation("Location Code");
                  Location.TESTFIELD("Directed Put-away and Pick",FALSE);
                  CheckItemAvailable(FIELDNO("Location Code"));
                  UpdateReservation(FIELDNO("Location Code"));
                  VALIDATE(Quantity);
                END;
                */

            end;
        }
        field(29; "Last Date Modified"; Date)
        {
            Caption = 'Last Date Modified';
            Editable = false;
        }
        field(30; "User ID"; Code[50])
        {
            Caption = 'User ID';
            DataClassification = EndUserIdentifiableInformation;
            Editable = false;
            TableRelation = User."User Name";
            //This property is currently not supported
            //TestTableRelation = false;

            trigger OnLookup()
            var
                UserMgt: Codeunit "User Management";
            begin
                UserMgt.DisplayUserInformation("User ID");
            end;
        }
        field(32; "Work Type Code"; Code[10])
        {
            Caption = 'Work Type Code';
            TableRelation = "Work Type";

            trigger OnValidate()
            begin
                /*ValidateModification(xRec."Work Type Code" <> "Work Type Code");
                TESTFIELD(Type,Type::Resource);
                
                VALIDATE("Line Discount %",0);
                IF ("Work Type Code" = '') AND (xRec."Work Type Code" <> '') THEN BEGIN
                  Res.GET("No.");
                  "Unit of Measure Code" := Res."Base Unit of Measure";
                  VALIDATE("Unit of Measure Code");
                END;
                IF WorkType.GET("Work Type Code") THEN
                  IF WorkType."Unit of Measure Code" <> '' THEN BEGIN
                    "Unit of Measure Code" := WorkType."Unit of Measure Code";
                    IF ResourceUnitOfMeasure.GET("No.","Unit of Measure Code") THEN
                      "Qty. per Unit of Measure" := ResourceUnitOfMeasure."Qty. per Unit of Measure";
                  END ELSE BEGIN
                    Res.GET("No.");
                    "Unit of Measure Code" := Res."Base Unit of Measure";
                    VALIDATE("Unit of Measure Code");
                  END;
                VALIDATE(Quantity);
                */

            end;
        }
        field(33; "Customer Price Group"; Code[10])
        {
            Caption = 'Customer Price Group';
            TableRelation = "Customer Price Group";

            trigger OnValidate()
            begin
                /*IF (Type = Type::Item) AND ("No." <> '') THEN
                  UpdateAllAmounts;*/

            end;
        }
        field(79; "Country/Region Code"; Code[10])
        {
            Caption = 'Country/Region Code';
            Editable = false;
            TableRelation = "Country/Region";
        }
        field(80; "Gen. Bus. Posting Group"; Code[20])
        {
            Caption = 'Gen. Bus. Posting Group';
            Editable = false;
            TableRelation = "Gen. Business Posting Group";
        }
        field(81; "Gen. Prod. Posting Group"; Code[20])
        {
            Caption = 'Gen. Prod. Posting Group';
            Editable = false;
            TableRelation = "Gen. Product Posting Group";
        }
        field(83; "Document Date"; Date)
        {
            Caption = 'Document Date';
        }
        field(1000; "Job Task No."; Code[20])
        {
            Caption = 'Job Task No.';
            NotBlank = true;
            TableRelation = "Job Task"."Job Task No." where("Job No." = field("Job No."),
                                                             "Job Task Type" = const(Posting));

            trigger OnValidate()
            begin

                JobPlanningLines.Reset;
                JobPlanningLines.SetRange("Job No.", "Job No.");
                JobPlanningLines.SetRange("Job Task No.", "Job Task No.");
                if JobPlanningLines.Find('-') then begin
                    //JobTask.CALCFIELDS("Schedule (Total Cost)");
                    "Total Cost" := JobPlanningLines."Total Cost";
                    "Total Cost (LCY)" := JobPlanningLines."Total Cost (LCY)";
                    Type := JobPlanningLines.Type;
                    "No." := JobPlanningLines."No.";
                    "Document No." := JobPlanningLines."Document No.";
                    "Planning Date" := JobPlanningLines."Planning Date";
                    Description := JobPlanningLines.Description;
                end;
            end;
        }
        field(1001; "Line Amount (LCY)"; Decimal)
        {
            AutoFormatType = 1;
            Caption = 'Line Amount (LCY)';
            Editable = false;
        }
        field(1002; "Unit Cost"; Decimal)
        {
            AutoFormatExpression = "Currency Code";
            AutoFormatType = 2;
            Caption = 'Unit Cost';

            trigger OnValidate()
            begin
                //ValidateModification(xRec."Unit Cost" <> "Unit Cost");

                //UpdateAllAmounts;
            end;
        }
        field(1003; "Total Cost"; Decimal)
        {
            AutoFormatExpression = "Currency Code";
            AutoFormatType = 1;
            Caption = 'Total Cost';
            Editable = false;
        }
        field(1004; "Unit Price"; Decimal)
        {
            AutoFormatExpression = "Currency Code";
            AutoFormatType = 2;
            Caption = 'Unit Price';

            trigger OnValidate()
            begin
                ValidateModification(xRec."Unit Price" <> "Unit Price");

                UpdateAllAmounts;
            end;
        }
        field(1005; "Total Price"; Decimal)
        {
            AutoFormatExpression = "Currency Code";
            AutoFormatType = 1;
            Caption = 'Total Price';
            Editable = false;
        }
        field(1006; "Line Amount"; Decimal)
        {
            AutoFormatExpression = "Currency Code";
            AutoFormatType = 1;
            Caption = 'Line Amount';

            trigger OnValidate()
            begin
                ValidateModification(xRec."Line Amount" <> "Line Amount");

                UpdateAllAmounts;
            end;
        }
        field(1007; "Line Discount Amount"; Decimal)
        {
            AutoFormatExpression = "Currency Code";
            AutoFormatType = 1;
            Caption = 'Line Discount Amount';

            trigger OnValidate()
            begin
                ValidateModification(xRec."Line Discount Amount" <> "Line Discount Amount");

                UpdateAllAmounts;
            end;
        }
        field(1008; "Line Discount Amount (LCY)"; Decimal)
        {
            AutoFormatType = 1;
            Caption = 'Line Discount Amount (LCY)';
            Editable = false;

            trigger OnValidate()
            begin
                ValidateModification(xRec."Line Discount Amount (LCY)" <> "Line Discount Amount (LCY)");

                InitRoundingPrecisions;
                "Line Discount Amount" := ROUND(
                    CurrExchRate.ExchangeAmtLCYToFCY(
                      "Currency Date", "Currency Code",
                      "Line Discount Amount (LCY)", "Currency Factor"),
                    AmountRoundingPrecisionFCY);
                UpdateAllAmounts;
            end;
        }
        field(1015; "Cost Factor"; Decimal)
        {
            Caption = 'Cost Factor';
            Editable = false;

            trigger OnValidate()
            begin
                ValidateModification(xRec."Cost Factor" <> "Cost Factor");

                UpdateAllAmounts;
            end;
        }
        field(1019; "Serial No."; Code[50])
        {
            Caption = 'Serial No.';
            Editable = false;
        }
        field(1020; "Lot No."; Code[50])
        {
            Caption = 'Lot No.';
            Editable = false;
        }
        field(1021; "Line Discount %"; Decimal)
        {
            BlankZero = true;
            Caption = 'Line Discount %';
            DecimalPlaces = 0 : 5;

            trigger OnValidate()
            begin
                ValidateModification(xRec."Line Discount %" <> "Line Discount %");

                UpdateAllAmounts;
            end;
        }
        field(1022; "Line Type"; Option)
        {
            Caption = 'Line Type';
            OptionCaption = 'Budget,Billable,Both Budget and Billable';
            OptionMembers = Budget,Billable,"Both Budget and Billable";

            trigger OnValidate()
            begin
                "Schedule Line" := true;
                "Contract Line" := true;
                if "Line Type" = "line type"::Budget then
                    "Contract Line" := false;
                if "Line Type" = "line type"::Billable then
                    "Schedule Line" := false;

                if not "Contract Line" and (("Qty. Transferred to Invoice" <> 0) or ("Qty. Invoiced" <> 0)) then
                    Error(LineTypeErr, TableCaption, FieldCaption("Line Type"), "Line Type");

                ControlUsageLink;
            end;
        }
        field(1023; "Currency Code"; Code[10])
        {
            Caption = 'Currency Code';
            Editable = false;
            TableRelation = Currency;

            trigger OnValidate()
            begin
                ValidateModification(xRec."Currency Code" <> "Currency Code");

                UpdateCurrencyFactor;
                UpdateAllAmounts;
            end;
        }
        field(1024; "Currency Date"; Date)
        {
            AccessByPermission = TableData Currency = R;
            Caption = 'Currency Date';

            trigger OnValidate()
            begin
                ValidateModification(xRec."Currency Date" <> "Currency Date");

                UpdateCurrencyFactor;
                if (CurrFieldNo <> FieldNo("Planning Date")) and ("No." <> '') then
                    UpdateFromCurrency;
            end;
        }
        field(1025; "Currency Factor"; Decimal)
        {
            Caption = 'Currency Factor';
            DecimalPlaces = 0 : 15;
            Editable = false;
            MinValue = 0;

            trigger OnValidate()
            begin
                ValidateModification(xRec."Currency Factor" <> "Currency Factor");

                if ("Currency Code" = '') and ("Currency Factor" <> 0) then
                    FieldError("Currency Factor", StrSubstNo(CurrencyFactorErr, FieldCaption("Currency Code")));
                UpdateAllAmounts;
            end;
        }
        field(1026; "Schedule Line"; Boolean)
        {
            Caption = 'Budget Line';
            Editable = false;
            InitValue = true;
        }
        field(1027; "Contract Line"; Boolean)
        {
            Caption = 'Billable Line';
            Editable = false;
        }
        field(1030; "Job Contract Entry No."; Integer)
        {
            Caption = 'Job Contract Entry No.';
            Editable = false;
        }
        field(1035; "Invoiced Amount (LCY)"; Decimal)
        {
            CalcFormula = sum("Job Planning Line Invoice"."Invoiced Amount (LCY)" where("Job No." = field("Job No."),
                                                                                         "Job Task No." = field("Job Task No."),
                                                                                         "Job Planning Line No." = field("Line No.")));
            Caption = 'Invoiced Amount (LCY)';
            Editable = false;
            FieldClass = FlowField;
        }
        field(1036; "Invoiced Cost Amount (LCY)"; Decimal)
        {
            CalcFormula = sum("Job Planning Line Invoice"."Invoiced Cost Amount (LCY)" where("Job No." = field("Job No."),
                                                                                              "Job Task No." = field("Job Task No."),
                                                                                              "Job Planning Line No." = field("Line No.")));
            Caption = 'Invoiced Cost Amount (LCY)';
            Editable = false;
            FieldClass = FlowField;
        }
        field(1037; "VAT Unit Price"; Decimal)
        {
            Caption = 'VAT Unit Price';
        }
        field(1038; "VAT Line Discount Amount"; Decimal)
        {
            Caption = 'VAT Line Discount Amount';
        }
        field(1039; "VAT Line Amount"; Decimal)
        {
            Caption = 'VAT Line Amount';
        }
        field(1041; "VAT %"; Decimal)
        {
            Caption = 'VAT %';
        }
        field(1042; "Description 2"; Text[50])
        {
            Caption = 'Description 2';
        }
        field(1043; "Job Ledger Entry No."; Integer)
        {
            BlankZero = true;
            Caption = 'Job Ledger Entry No.';
            Editable = false;
            TableRelation = "Job Ledger Entry";
        }
        field(1048; Status; Option)
        {
            Caption = 'Status';
            Editable = false;
            InitValue = "Order";
            OptionCaption = 'Planning,Quote,Order,Completed';
            OptionMembers = Planning,Quote,"Order",Completed;
        }
        field(1050; "Ledger Entry Type"; Option)
        {
            Caption = 'Ledger Entry Type';
            OptionCaption = ' ,Resource,Item,G/L Account';
            OptionMembers = " ",Resource,Item,"G/L Account";
        }
        field(1051; "Ledger Entry No."; Integer)
        {
            BlankZero = true;
            Caption = 'Ledger Entry No.';
            TableRelation = if ("Ledger Entry Type" = const(Resource)) "Res. Ledger Entry"
            else if ("Ledger Entry Type" = const(Item)) "Item Ledger Entry"
            else if ("Ledger Entry Type" = const("G/L Account")) "G/L Entry";
        }
        field(1052; "System-Created Entry"; Boolean)
        {
            Caption = 'System-Created Entry';
        }
        field(1053; "Usage Link"; Boolean)
        {
            Caption = 'Usage Link';

            trigger OnValidate()
            begin
                if "Usage Link" and ("Line Type" = "line type"::Billable) then
                    Error(UsageLinkErr, FieldCaption("Usage Link"), TableCaption, FieldCaption("Line Type"), "Line Type");

                ControlUsageLink;

                CheckItemAvailable(FieldNo("Usage Link"));
                UpdateReservation(FieldNo("Usage Link"));
            end;
        }
        field(1060; "Remaining Qty."; Decimal)
        {
            Caption = 'Remaining Qty.';
            DecimalPlaces = 0 : 5;
            Editable = false;

            trigger OnValidate()
            begin
                Validate("Remaining Qty. (Base)", CalcBaseQty("Remaining Qty."));
            end;
        }
        field(1061; "Remaining Qty. (Base)"; Decimal)
        {
            Caption = 'Remaining Qty. (Base)';
            DecimalPlaces = 0 : 5;
            Editable = false;
        }
        field(1062; "Remaining Total Cost"; Decimal)
        {
            AutoFormatExpression = "Currency Code";
            AutoFormatType = 1;
            Caption = 'Remaining Total Cost';
            Editable = false;
        }
        field(1063; "Remaining Total Cost (LCY)"; Decimal)
        {
            AutoFormatType = 1;
            Caption = 'Remaining Total Cost (LCY)';
            Editable = false;
        }
        field(1064; "Remaining Line Amount"; Decimal)
        {
            AutoFormatExpression = "Currency Code";
            AutoFormatType = 1;
            Caption = 'Remaining Line Amount';
            Editable = false;
        }
        field(1065; "Remaining Line Amount (LCY)"; Decimal)
        {
            AutoFormatType = 1;
            Caption = 'Remaining Line Amount (LCY)';
            Editable = false;
        }
        field(1070; "Qty. Posted"; Decimal)
        {
            Caption = 'Qty. Posted';
            DecimalPlaces = 0 : 5;
            Editable = false;
        }
        field(1071; "Qty. to Transfer to Journal"; Decimal)
        {
            Caption = 'Qty. to Transfer to Journal';
            DecimalPlaces = 0 : 5;
        }
        field(1072; "Posted Total Cost"; Decimal)
        {
            AutoFormatExpression = "Currency Code";
            AutoFormatType = 1;
            Caption = 'Posted Total Cost';
            Editable = false;
        }
        field(1073; "Posted Total Cost (LCY)"; Decimal)
        {
            AutoFormatType = 1;
            Caption = 'Posted Total Cost (LCY)';
            Editable = false;
        }
        field(1074; "Posted Line Amount"; Decimal)
        {
            AutoFormatExpression = "Currency Code";
            AutoFormatType = 1;
            Caption = 'Posted Line Amount';
            Editable = false;
        }
        field(1075; "Posted Line Amount (LCY)"; Decimal)
        {
            AutoFormatType = 1;
            Caption = 'Posted Line Amount (LCY)';
            Editable = false;
        }
        field(1080; "Qty. Transferred to Invoice"; Decimal)
        {
            CalcFormula = sum("Job Planning Line Invoice"."Quantity Transferred" where("Job No." = field("Job No."),
                                                                                        "Job Task No." = field("Job Task No."),
                                                                                        "Job Planning Line No." = field("Line No.")));
            Caption = 'Qty. Transferred to Invoice';
            DecimalPlaces = 0 : 5;
            Editable = false;
            FieldClass = FlowField;
        }
        field(1081; "Qty. to Transfer to Invoice"; Decimal)
        {
            Caption = 'Qty. to Transfer to Invoice';
            DecimalPlaces = 0 : 5;

            trigger OnValidate()
            begin
                if "Qty. to Transfer to Invoice" = 0 then
                    exit;

                if "Contract Line" then begin
                    if Quantity = "Qty. Transferred to Invoice" then
                        Error(QtyAlreadyTransferredErr, TableCaption);

                    if Quantity > 0 then begin
                        if ("Qty. to Transfer to Invoice" > 0) and ("Qty. to Transfer to Invoice" > (Quantity - "Qty. Transferred to Invoice")) or
                           ("Qty. to Transfer to Invoice" < 0)
                        then
                            Error(QtyToTransferToInvoiceErr, FieldCaption("Qty. to Transfer to Invoice"), 0, Quantity - "Qty. Transferred to Invoice");
                    end else begin
                        if ("Qty. to Transfer to Invoice" > 0) or
                           ("Qty. to Transfer to Invoice" < 0) and ("Qty. to Transfer to Invoice" < (Quantity - "Qty. Transferred to Invoice"))
                        then
                            Error(QtyToTransferToInvoiceErr, FieldCaption("Qty. to Transfer to Invoice"), Quantity - "Qty. Transferred to Invoice", 0);
                    end;
                end else
                    Error(NoContractLineErr, FieldCaption("Qty. to Transfer to Invoice"), TableCaption, "Line Type");
            end;
        }
        field(1090; "Qty. Invoiced"; Decimal)
        {
            CalcFormula = sum("Job Planning Line Invoice"."Quantity Transferred" where("Job No." = field("Job No."),
                                                                                        "Job Task No." = field("Job Task No."),
                                                                                        "Job Planning Line No." = field("Line No."),
                                                                                        "Document Type" = filter("Posted Invoice" | "Posted Credit Memo")));
            Caption = 'Qty. Invoiced';
            DecimalPlaces = 0 : 5;
            Editable = false;
            FieldClass = FlowField;
        }
        field(1091; "Qty. to Invoice"; Decimal)
        {
            Caption = 'Qty. to Invoice';
            DecimalPlaces = 0 : 5;
            Editable = false;
        }
        field(1100; "Reserved Quantity"; Decimal)
        {
            AccessByPermission = TableData Item = R;
            CalcFormula = - sum("Reservation Entry".Quantity where("Source Type" = const(1003),
                                                                   "Source Subtype" = field(Status),
                                                                   "Source ID" = field("Job No."),
                                                                   "Source Ref. No." = field("Job Contract Entry No."),
                                                                   "Reservation Status" = const(Reservation)));
            Caption = 'Reserved Quantity';
            DecimalPlaces = 0 : 5;
            Editable = false;
            FieldClass = FlowField;
        }
        field(1101; "Reserved Qty. (Base)"; Decimal)
        {
            AccessByPermission = TableData Item = R;
            CalcFormula = - sum("Reservation Entry"."Quantity (Base)" where("Source Type" = const(1003),
                                                                            "Source Subtype" = field(Status),
                                                                            "Source ID" = field("Job No."),
                                                                            "Source Ref. No." = field("Job Contract Entry No."),
                                                                            "Reservation Status" = const(Reservation)));
            Caption = 'Reserved Qty. (Base)';
            DecimalPlaces = 0 : 5;
            Editable = false;
            FieldClass = FlowField;

            trigger OnValidate()
            begin
                TestField("Qty. per Unit of Measure");
                UpdatePlanned;
            end;
        }
        field(1102; Reserve; Option)
        {
            AccessByPermission = TableData Item = R;
            Caption = 'Reserve';
            OptionCaption = 'Never,Optional,Always';
            OptionMembers = Never,Optional,Always;

            trigger OnValidate()
            begin
                if Reserve <> Reserve::Never then begin
                    TestField(Type, Type::Item);
                    TestField("No.");
                    TestField("Usage Link");
                end;
                CalcFields("Reserved Qty. (Base)");
                if (Reserve = Reserve::Never) and ("Reserved Qty. (Base)" > 0) then
                    TestField("Reserved Qty. (Base)", 0);

                if xRec.Reserve = Reserve::Always then begin
                    GetItem;
                    if Item.Reserve = Item.Reserve::Always then
                        TestField(Reserve, Reserve::Always);
                end;
            end;
        }
        field(1103; Planned; Boolean)
        {
            Caption = 'Planned';
            Editable = false;
        }
        field(5402; "Variant Code"; Code[10])
        {
            Caption = 'Variant Code';
            TableRelation = if (Type = const(Item)) "Item Variant".Code where("Item No." = field("No."));

            trigger OnValidate()
            begin
                ValidateModification(xRec."Variant Code" <> "Variant Code");

                if "Variant Code" = '' then begin
                    if Type = Type::Item then begin
                        Item.Get("No.");
                        Description := Item.Description;
                        "Description 2" := Item."Description 2";
                        GetItemTranslation;
                    end
                end else begin
                    TestField(Type, Type::Item);

                    ItemVariant.Get("No.", "Variant Code");
                    Description := ItemVariant.Description;
                    "Description 2" := ItemVariant."Description 2";
                end;
                Validate(Quantity);
                CheckItemAvailable(FieldNo("Variant Code"));
                UpdateReservation(FieldNo("Variant Code"));
            end;
        }
        field(5403; "Bin Code"; Code[20])
        {
            Caption = 'Bin Code';
            TableRelation = Bin.Code where("Location Code" = field("Location Code"));

            trigger OnValidate()
            begin
                ValidateModification(xRec."Bin Code" <> "Bin Code");

                TestField("Location Code");
                CheckItemAvailable(FieldNo("Bin Code"));
                UpdateReservation(FieldNo("Bin Code"));
            end;
        }
        field(5404; "Qty. per Unit of Measure"; Decimal)
        {
            Caption = 'Qty. per Unit of Measure';
            DecimalPlaces = 0 : 5;
            Editable = false;
            InitValue = 1;
        }
        field(5410; "Quantity (Base)"; Decimal)
        {
            Caption = 'Quantity (Base)';
            DecimalPlaces = 0 : 5;

            trigger OnValidate()
            begin
                TestField("Qty. per Unit of Measure", 1);
                Validate(Quantity, "Quantity (Base)");
            end;
        }
        field(5790; "Requested Delivery Date"; Date)
        {
            Caption = 'Requested Delivery Date';

            trigger OnValidate()
            begin
                if ("Requested Delivery Date" <> xRec."Requested Delivery Date") and
                   ("Promised Delivery Date" <> 0D)
                then
                    Error(
                      RequestedDeliveryDateErr,
                      FieldCaption("Requested Delivery Date"),
                      FieldCaption("Promised Delivery Date"));

                if "Requested Delivery Date" <> 0D then
                    Validate("Planned Delivery Date", "Requested Delivery Date")
            end;
        }
        field(5791; "Promised Delivery Date"; Date)
        {
            Caption = 'Promised Delivery Date';

            trigger OnValidate()
            begin
                if "Promised Delivery Date" <> 0D then
                    Validate("Planned Delivery Date", "Promised Delivery Date")
                else
                    Validate("Requested Delivery Date");
            end;
        }
        field(5794; "Planned Delivery Date"; Date)
        {
            Caption = 'Planned Delivery Date';

            trigger OnValidate()
            begin
                Validate("Planning Date", "Planned Delivery Date");
            end;
        }
        field(5900; "Service Order No."; Code[20])
        {
            Caption = 'Service Order No.';
        }
        field(65001; "Budget Type"; Option)
        {
            DataClassification = ToBeClassified;
            Description = 'Added for Project Procurement Plan';
            OptionCaption = 'Original,Revised,Suplementary';
            OptionMembers = Original,Revised,Suplementary;
        }
        field(65002; "Job Budget Templates"; Code[100])
        {
            DataClassification = ToBeClassified;
            Description = 'Added for Project Procurement Plan';
            TableRelation = "Job Budget Templates";
        }
        field(65003; "Project Budget ID"; Code[50])
        {
            DataClassification = ToBeClassified;
            Description = 'Added for Project Procurement Plan';
        }
        field(65004; Transferred; Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(65005; "Destination job Task No."; Code[20])
        {
            Caption = 'Job Task No.';
            NotBlank = true;
            TableRelation = "Job Task"."Job Task No." where("Job No." = field("Job No."),
                                                             "Job Task Type" = const(Posting));

            trigger OnValidate()
            begin

                JobPlanningLines.Reset;
                JobPlanningLines.SetRange("Job No.", "Job No.");
                JobPlanningLines.SetRange("Job Task No.", "Job Task No.");
                if JobPlanningLines.Find('-') then begin
                    //JobTask.CALCFIELDS("Schedule (Total Cost)");
                    "Total Cost" := JobPlanningLines."Total Cost";
                    "Total Cost (LCY)" := JobPlanningLines."Total Cost (LCY)";
                    Type := JobPlanningLines.Type;
                    "No." := JobPlanningLines."No.";
                    "Document No." := JobPlanningLines."Document No.";
                    "Planning Date" := JobPlanningLines."Planning Date";
                    Description := JobPlanningLines.Description;
                end;
            end;
        }
        field(65006; "Destination Quantity"; Decimal)
        {
            Caption = 'Quantity';
            DataClassification = ToBeClassified;
            DecimalPlaces = 0 : 5;

            trigger OnValidate()
            var
                Delta: Decimal;
            begin
                /*IF "Usage Link" THEN
                  IF NOT BypassQtyValidation THEN BEGIN
                    IF ("Qty. Posted" > 0) AND (Quantity < "Qty. Posted") THEN
                      ERROR(QtyLessErr,FIELDCAPTION(Quantity),FIELDCAPTION("Qty. Posted"));
                    IF ("Qty. Posted" < 0) AND (Quantity > "Qty. Posted") THEN
                      ERROR(QtyGreaterErr,FIELDCAPTION(Quantity),FIELDCAPTION("Qty. Posted"));
                  END;
                
                CALCFIELDS("Qty. Transferred to Invoice");
                IF ("Qty. Transferred to Invoice" > 0) AND (Quantity < "Qty. Transferred to Invoice") THEN
                  ERROR(QtyLessErr,FIELDCAPTION(Quantity),FIELDCAPTION("Qty. Transferred to Invoice"));
                IF ("Qty. Transferred to Invoice" < 0) AND (Quantity > "Qty. Transferred to Invoice") THEN
                  ERROR(QtyGreaterErr,FIELDCAPTION(Quantity),FIELDCAPTION("Qty. Transferred to Invoice"));
                
                CASE Type OF
                  Type::Item:
                    IF NOT Item.GET("No.") THEN
                      ERROR(MissingItemResourceGLErr,Type,Item.FIELDCAPTION("No."));
                  Type::Resource:
                    IF NOT Res.GET("No.") THEN
                      ERROR(MissingItemResourceGLErr,Type,Res.FIELDCAPTION("No."));
                  Type::"G/L Account":
                    IF NOT GLAcc.GET("No.") THEN
                      ERROR(MissingItemResourceGLErr,Type,GLAcc.FIELDCAPTION("No."));
                END;
                
                "Quantity (Base)" := CalcBaseQty(Quantity);
                
                IF "Usage Link" AND (xRec."No." = "No.") THEN BEGIN
                  Delta := Quantity - xRec.Quantity;
                  VALIDATE("Remaining Qty.","Remaining Qty." + Delta);
                  VALIDATE("Qty. to Transfer to Journal","Qty. to Transfer to Journal" + Delta);
                END;
                
                UpdateQtyToTransfer;
                UpdateQtyToInvoice;
                
                CheckItemAvailable(FIELDNO(Quantity));
                UpdateReservation(FIELDNO(Quantity));
                
                UpdateAllAmounts;
                BypassQtyValidation := FALSE;
                */

            end;
        }
    }

    keys
    {
        key(Key1; "Job No.", "Line No.", "Project Budget ID", "Job Task No.")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }

    trigger OnDelete()
    var
        JobUsageLink: Record "Job Usage Link";
    begin
        ValidateModification(true);
        CheckRelatedJobPlanningLineInvoice;

        if "Usage Link" then begin
            JobUsageLink.SetRange("Job No.", "Job No.");
            JobUsageLink.SetRange("Job Task No.", "Job Task No.");
            JobUsageLink.SetRange("Line No.", "Line No.");
            if not JobUsageLink.IsEmpty then
                Error(JobUsageLinkErr, TableCaption);
        end;

        if (Quantity <> 0) and ItemExists("No.") then begin
            // JobPlanningLineReserve.DeleteLine(Rec);
            CalcFields("Reserved Qty. (Base)");
            TestField("Reserved Qty. (Base)", 0);
        end;

        if "Schedule Line" then
            Job.UpdateOverBudgetValue("Job No.", false, "Total Cost (LCY)");
    end;

    trigger OnInsert()
    begin
        LockTable;
        GetJob;
        if Job.Blocked = Job.Blocked::All then
            Job.TestBlocked;
        JobTask.Get("Job No.", "Job Task No.");
        JobTask.TestField("Job Task Type", JobTask."job task type"::Posting);
        InitJobPlanningLine;
        if Quantity <> 0 then
            UpdateReservation(0);

        if "Schedule Line" then
            Job.UpdateOverBudgetValue("Job No.", false, "Total Cost (LCY)");
    end;

    trigger OnModify()
    begin
        "Last Date Modified" := Today;
        "User ID" := UserId;

        if ((Quantity <> 0) or (xRec.Quantity <> 0)) and ItemExists(xRec."No.") then
            UpdateReservation(0);

        if "Schedule Line" then
            Job.UpdateOverBudgetValue("Job No.", false, "Total Cost (LCY)");
    end;

    trigger OnRename()
    begin
        //ERROR(RecordRenameErr,FIELDCAPTION("Job No."),FIELDCAPTION("Job Task No."),TABLECAPTION);
    end;

    var
        GLAcc: Record "G/L Account";
        Location: Record Location;
        Item: Record Item;
        JobTask: Record "Job Task";
        ItemVariant: Record "Item Variant";
        Res: Record Resource;
        ResCost: Record "Resource Cost";
        WorkType: Record "Work Type";
        Job: Record Job;
        ResourceUnitOfMeasure: Record "Resource Unit of Measure";
        CurrExchRate: Record "Currency Exchange Rate";
        SKU: Record "Stockkeeping Unit";
        StandardText: Record "Standard Text";
        ItemTranslation: Record "Item Translation";
        GLSetup: Record "General Ledger Setup";
        JobPlanningLineReserve: Codeunit "Job Planning Line-Reserve";
        UOMMgt: Codeunit "Unit of Measure Management";
        ItemCheckAvail: Codeunit "Item-Check Avail.";
        CurrencyFactorErr: label 'cannot be specified without %1', Comment = '%1 = Currency Code field name';
        RecordRenameErr: label 'You cannot change the %1 or %2 of this %3.', Comment = '%1 = Job Number field name; %2 = Job Task Number field name; %3 = Job Planning Line table name';
        CurrencyDate: Date;
        MissingItemResourceGLErr: label 'You must specify %1 %2 in planning line.', Comment = '%1 = Document Type (Item, Resoure, or G/L); %2 = Field name';
        HasGotGLSetup: Boolean;
        UnitAmountRoundingPrecision: Decimal;
        AmountRoundingPrecision: Decimal;
        QtyLessErr: label '%1 cannot be less than %2.', Comment = '%1 = Name of first field to compare; %2 = Name of second field to compare';
        ControlUsageLinkErr: label 'The %1 must be a %2 and %3 must be enabled, because linked Job Ledger Entries exist.', Comment = '%1 = Job Planning Line table name; %2 = Caption for field Schedule Line; %3 = Captiion for field Usage Link';
        JobUsageLinkErr: label 'This %1 cannot be deleted because linked job ledger entries exist.', Comment = '%1 = Job Planning Line table name';
        BypassQtyValidation: Boolean;
        LinkedJobLedgerErr: label 'You cannot change this value because linked job ledger entries exist.';
        LineTypeErr: label 'The %1 cannot be of %2 %3 because it is transferred to an invoice.', Comment = 'The Job Planning Line cannot be of Line Type Schedule, because it is transferred to an invoice.';
        QtyToTransferToInvoiceErr: label '%1 may not be lower than %2 and may not exceed %3.', Comment = '%1 = Qty. to Transfer to Invoice field name; %2 = First value in comparison; %3 = Second value in comparison';
        AutoReserveQst: label 'Automatic reservation is not possible.\Do you want to reserve items manually?';
        NoContractLineErr: label '%1 cannot be set on a %2 of type %3.', Comment = '%1 = Qty. to Transfer to Invoice field name; %2 = Job Planning Line table name; %3 = The job''s line type';
        QtyAlreadyTransferredErr: label 'The %1 has already been completely transferred.', Comment = '%1 = Job Planning Line table name';
        UsageLinkErr: label '%1 cannot be enabled on a %2 with %3 %4.', Comment = 'Usage Link cannot be enabled on a Job Planning Line with Line Type Schedule';
        QtyGreaterErr: label '%1 cannot be higher than %2.', Comment = '%1 = Caption for field Quantity; %2 = Captiion for field Qty. Transferred to Invoice';
        RequestedDeliveryDateErr: label 'You cannot change the %1 when the %2 has been filled in.', Comment = '%1 = Caption for field Requested Delivery Date; %2 = Captiion for field Promised Delivery Date';
        UnitAmountRoundingPrecisionFCY: Decimal;
        AmountRoundingPrecisionFCY: Decimal;
        NotPossibleJobPlanningLineErr: label 'It is not possible to deleted job planning line transferred to an invoice.';
        JobPlanningLines: Record "Job Planning Line";

    local procedure CalcBaseQty(Qty: Decimal): Decimal
    begin
        TestField("Qty. per Unit of Measure");
        exit(ROUND(Qty * "Qty. per Unit of Measure", 0.00001));
    end;

    local procedure CheckItemAvailable(CalledByFieldNo: Integer)
    begin
        /*IF CurrFieldNo <> CalledByFieldNo THEN
          EXIT;
        IF Reserve = Reserve::Always THEN
          EXIT;
        IF (Type <> Type::Item) OR ("No." = '') THEN
          EXIT;
        IF Quantity <= 0 THEN
          EXIT;
        IF NOT (Status IN [Status::Order]) THEN
          EXIT;
        
        IF ItemCheckAvail.JobPlanningLineCheck(Rec) THEN
          ItemCheckAvail.RaiseUpdateInterruptedError;*/

    end;

    local procedure GetLocation(LocationCode: Code[10])
    begin
        if LocationCode = '' then
            Clear(Location)
        else
            if Location.Code <> LocationCode then
                Location.Get(LocationCode);
    end;

    local procedure GetJob()
    begin
        if ("Job No." <> Job."No.") and ("Job No." <> '') then
            Job.Get("Job No.");
    end;

    procedure UpdateCurrencyFactor()
    begin
        if "Currency Code" <> '' then begin
            if "Currency Date" = 0D then
                CurrencyDate := WorkDate
            else
                CurrencyDate := "Currency Date";
            "Currency Factor" := CurrExchRate.ExchangeRate(CurrencyDate, "Currency Code");
        end else
            "Currency Factor" := 0;
    end;

    local procedure ItemExists(ItemNo: Code[20]): Boolean
    var
        Item2: Record Item;
    begin
        if Type = Type::Item then
            if not Item2.Get(ItemNo) then
                exit(false);
        exit(true);
    end;

    local procedure GetItem()
    begin
        if "No." <> Item."No." then
            if not Item.Get("No.") then
                Clear(Item);
    end;

    local procedure GetSKU(): Boolean
    begin
        if (SKU."Location Code" = "Location Code") and
           (SKU."Item No." = "No.") and
           (SKU."Variant Code" = "Variant Code")
        then
            exit(true);

        if SKU.Get("Location Code", "No.", "Variant Code") then
            exit(true);

        exit(false);
    end;

    local procedure InitRoundingPrecisions()
    var
        Currency: Record Currency;
    begin
        if (AmountRoundingPrecision = 0) or
           (UnitAmountRoundingPrecision = 0) or
           (AmountRoundingPrecisionFCY = 0) or
           (UnitAmountRoundingPrecisionFCY = 0)
        then begin
            Clear(Currency);
            Currency.InitRoundingPrecision;
            AmountRoundingPrecision := Currency."Amount Rounding Precision";
            UnitAmountRoundingPrecision := Currency."Unit-Amount Rounding Precision";

            if "Currency Code" <> '' then begin
                Currency.Get("Currency Code");
                Currency.TestField("Amount Rounding Precision");
                Currency.TestField("Unit-Amount Rounding Precision");
            end;

            AmountRoundingPrecisionFCY := Currency."Amount Rounding Precision";
            UnitAmountRoundingPrecisionFCY := Currency."Unit-Amount Rounding Precision";
        end;
    end;

    procedure Caption(): Text[250]
    var
        Job: Record Job;
        JobTask: Record "Job Task";
    begin
        /*IF NOT Job.GET("Job No.") THEN
          EXIT('');
        IF NOT JobTask.GET("Job No.","Job Task No.") THEN
          EXIT('');
        EXIT(STRSUBSTNO('%1 %2 %3 %4',
            Job."No.",
            Job.Description,
            JobTask."Job Task No.",
            JobTask.Description));*/

    end;

    procedure SetUpNewLine(LastJobPlanningLine: Record "Job Planning Line")
    begin
        /*"Document Date" := LastJobPlanningLine."Planning Date";
        "Document No." := LastJobPlanningLine."Document No.";
        Type := LastJobPlanningLine.Type;
        VALIDATE("Line Type",LastJobPlanningLine."Line Type");
        GetJob;
        "Currency Code" := Job."Currency Code";
        UpdateCurrencyFactor;
        IF LastJobPlanningLine."Planning Date" <> 0D THEN
          VALIDATE("Planning Date",LastJobPlanningLine."Planning Date");
        
        OnAfterSetupNewLine(Rec,LastJobPlanningLine);
        */

    end;

    procedure InitJobPlanningLine()
    var
        JobJnlManagement: Codeunit JobJnlManagement;
    begin
        GetJob;
        if "Planning Date" = 0D then
            Validate("Planning Date", WorkDate);
        "Currency Code" := Job."Currency Code";
        UpdateCurrencyFactor;
        "VAT Unit Price" := 0;
        "VAT Line Discount Amount" := 0;
        "VAT Line Amount" := 0;
        "VAT %" := 0;
        "Job Contract Entry No." := JobJnlManagement.GetNextEntryNo;
        "User ID" := UserId;
        "Last Date Modified" := 0D;
        Status := Job.Status;
        ControlUsageLink;

        //OnAfterInitJobPlanningLine(Rec);
    end;

    local procedure DeleteAmounts()
    begin
        /*Quantity := 0;
        "Quantity (Base)" := 0;
        
        "Direct Unit Cost (LCY)" := 0;
        "Unit Cost (LCY)" := 0;
        "Unit Cost" := 0;
        
        "Total Cost (LCY)" := 0;
        "Total Cost" := 0;
        
        "Unit Price (LCY)" := 0;
        "Unit Price" := 0;
        
        "Total Price (LCY)" := 0;
        "Total Price" := 0;
        
        "Line Amount (LCY)" := 0;
        "Line Amount" := 0;
        
        "Line Discount %" := 0;
        
        "Line Discount Amount (LCY)" := 0;
        "Line Discount Amount" := 0;
        
        "Remaining Qty." := 0;
        "Remaining Qty. (Base)" := 0;
        "Remaining Total Cost" := 0;
        "Remaining Total Cost (LCY)" := 0;
        "Remaining Line Amount" := 0;
        "Remaining Line Amount (LCY)" := 0;
        
        "Qty. Posted" := 0;
        "Qty. to Transfer to Journal" := 0;
        "Posted Total Cost" := 0;
        "Posted Total Cost (LCY)" := 0;
        "Posted Line Amount" := 0;
        "Posted Line Amount (LCY)" := 0;
        
        "Qty. to Transfer to Invoice" := 0;
        "Qty. to Invoice" := 0;
        */

    end;

    local procedure UpdateFromCurrency()
    begin
        //UpdateAllAmounts;
    end;

    local procedure GetItemTranslation()
    begin
        /*GetJob;
        IF ItemTranslation.GET("No.","Variant Code",Job."Language Code") THEN BEGIN
          Description := ItemTranslation.Description;
          "Description 2" := ItemTranslation."Description 2";
        END;
        */

    end;

    local procedure GetGLSetup()
    begin
        /*IF HasGotGLSetup THEN
          EXIT;
        GLSetup.GET;
        HasGotGLSetup := TRUE;
        */

    end;

    local procedure UpdateAllAmounts()
    begin
        /*OnBeforeUpdateAllAmounts(Rec);
        
        InitRoundingPrecisions;
        
        UpdateUnitCost;
        UpdateTotalCost;
        FindPriceAndDiscount(Rec,CurrFieldNo);
        HandleCostFactor;
        UpdateUnitPrice;
        UpdateTotalPrice;
        UpdateAmountsAndDiscounts;
        UpdateRemainingCostsAndAmounts;
        IF Type = Type::Text THEN
          FIELDERROR(Type);
        */

    end;

    local procedure UpdateUnitCost()
    var
        RetrievedCost: Decimal;
    begin
        /*GetJob;
        IF (Type = Type::Item) AND Item.GET("No.") THEN
          IF Item."Costing Method" = Item."Costing Method"::Standard THEN BEGIN
            IF RetrieveCostPrice THEN BEGIN
              IF GetSKU THEN
                "Unit Cost (LCY)" := ROUND(SKU."Unit Cost" * "Qty. per Unit of Measure",UnitAmountRoundingPrecision)
              ELSE
                "Unit Cost (LCY)" := ROUND(Item."Unit Cost" * "Qty. per Unit of Measure",UnitAmountRoundingPrecision);
              "Unit Cost" := ROUND(
                  CurrExchRate.ExchangeAmtLCYToFCY(
                    "Currency Date","Currency Code",
                    "Unit Cost (LCY)","Currency Factor"),
                  UnitAmountRoundingPrecisionFCY);
            END ELSE
              RecalculateAmounts(Job."Exch. Calculation (Cost)",xRec."Unit Cost","Unit Cost","Unit Cost (LCY)");
          END ELSE BEGIN
            IF RetrieveCostPrice THEN BEGIN
              IF GetSKU THEN
                RetrievedCost := SKU."Unit Cost" * "Qty. per Unit of Measure"
              ELSE
                RetrievedCost := Item."Unit Cost" * "Qty. per Unit of Measure";
              "Unit Cost" := ROUND(
                  CurrExchRate.ExchangeAmtLCYToFCY(
                    "Currency Date","Currency Code",
                    RetrievedCost,"Currency Factor"),
                  UnitAmountRoundingPrecisionFCY);
              "Unit Cost (LCY)" := ROUND(RetrievedCost,UnitAmountRoundingPrecision);
            END ELSE
              RecalculateAmounts(Job."Exch. Calculation (Cost)",xRec."Unit Cost","Unit Cost","Unit Cost (LCY)");
          END
        ELSE
          IF (Type = Type::Resource) AND Res.GET("No.") THEN BEGIN
            IF RetrieveCostPrice THEN BEGIN
              ResCost.INIT;
              ResCost.Code := "No.";
              ResCost."Work Type Code" := "Work Type Code";
              CODEUNIT.RUN(CODEUNIT::"Resource-Find Cost",ResCost);
              OnAfterResourceFindCost(Rec,ResCost);
              "Direct Unit Cost (LCY)" := ROUND(ResCost."Direct Unit Cost" * "Qty. per Unit of Measure",UnitAmountRoundingPrecision);
              RetrievedCost := ResCost."Unit Cost" * "Qty. per Unit of Measure";
              "Unit Cost" := ROUND(
                  CurrExchRate.ExchangeAmtLCYToFCY(
                    "Currency Date","Currency Code",
                    RetrievedCost,"Currency Factor"),
                  UnitAmountRoundingPrecisionFCY);
              "Unit Cost (LCY)" := ROUND(RetrievedCost,UnitAmountRoundingPrecision);
            END ELSE
              RecalculateAmounts(Job."Exch. Calculation (Cost)",xRec."Unit Cost","Unit Cost","Unit Cost (LCY)");
          END ELSE
            RecalculateAmounts(Job."Exch. Calculation (Cost)",xRec."Unit Cost","Unit Cost","Unit Cost (LCY)");
        */

    end;

    local procedure RetrieveCostPrice(): Boolean
    var
        ShouldRetrieveCostPrice: Boolean;
        IsHandled: Boolean;
    begin
        /*IsHandled := FALSE;
        ShouldRetrieveCostPrice := FALSE;
        OnBeforeRetrieveCostPrice(Rec,xRec,ShouldRetrieveCostPrice,IsHandled);
        IF IsHandled THEN
          EXIT(ShouldRetrieveCostPrice);
        
        CASE Type OF
          Type::Item:
            ShouldRetrieveCostPrice :=
              ("No." <> xRec."No.") OR
              ("Location Code" <> xRec."Location Code") OR
              ("Variant Code" <> xRec."Variant Code") OR
              (NOT BypassQtyValidation AND (Quantity <> xRec.Quantity)) OR
              ("Unit of Measure Code" <> xRec."Unit of Measure Code");
          Type::Resource:
            ShouldRetrieveCostPrice :=
              ("No." <> xRec."No.") OR
              ("Work Type Code" <> xRec."Work Type Code") OR
              ("Unit of Measure Code" <> xRec."Unit of Measure Code");
          Type::"G/L Account":
            ShouldRetrieveCostPrice := "No." <> xRec."No.";
          ELSE
            EXIT(FALSE);
        END;
        EXIT(ShouldRetrieveCostPrice);
        */

    end;

    local procedure UpdateTotalCost()
    begin
        /*"Total Cost" := ROUND("Unit Cost" * Quantity,AmountRoundingPrecisionFCY);
        "Total Cost (LCY)" := ROUND(
            CurrExchRate.ExchangeAmtFCYToLCY(
              "Currency Date","Currency Code",
              "Total Cost","Currency Factor"),
            AmountRoundingPrecision);*/

    end;

    local procedure FindPriceAndDiscount(var JobPlanningLine: Record "Job Planning Line"; CalledByFieldNo: Integer)
    var
        SalesPriceCalcMgt: Codeunit "Sales Price Calc. Mgt.";
        PurchPriceCalcMgt: Codeunit "Purch. Price Calc. Mgt.";
    begin
        /*IF RetrieveCostPrice AND ("No." <> '') THEN BEGIN
          SalesPriceCalcMgt.FindJobPlanningLinePrice(JobPlanningLine,CalledByFieldNo);
        
          IF Type <> Type::"G/L Account" THEN
            PurchPriceCalcMgt.FindJobPlanningLinePrice(JobPlanningLine,CalledByFieldNo)
          ELSE BEGIN
            // Because the SalesPriceCalcMgt.FindJobJnlLinePrice function also retrieves costs for G/L Account,
            // cost and total cost need to get updated again.
            UpdateUnitCost;
            UpdateTotalCost;
          END;
        END;*/

    end;

    local procedure HandleCostFactor()
    begin
        /*IF ("Cost Factor" <> 0) AND (("Unit Cost" <> xRec."Unit Cost") OR ("Cost Factor" <> xRec."Cost Factor")) THEN
          "Unit Price" := ROUND("Unit Cost" * "Cost Factor",UnitAmountRoundingPrecisionFCY)
        ELSE
          IF (Item."Price/Profit Calculation" = Item."Price/Profit Calculation"::"Price=Cost+Profit") AND
             (Item."Profit %" < 100) AND
             ("Unit Cost" <> xRec."Unit Cost")
          THEN
            "Unit Price" := ROUND("Unit Cost" / (1 - Item."Profit %" / 100),UnitAmountRoundingPrecisionFCY);
        */

    end;

    local procedure UpdateUnitPrice()
    begin
        /*GetJob;
        RecalculateAmounts(Job."Exch. Calculation (Price)",xRec."Unit Price","Unit Price","Unit Price (LCY)");*/

    end;

    local procedure RecalculateAmounts(JobExchCalculation: Option "Fixed FCY","Fixed LCY"; xAmount: Decimal; var Amount: Decimal; var AmountLCY: Decimal)
    begin
        /*IF (xRec."Currency Factor" <> "Currency Factor") AND
           (Amount = xAmount) AND (JobExchCalculation = JobExchCalculation::"Fixed LCY")
        THEN
          Amount := ROUND(
              CurrExchRate.ExchangeAmtLCYToFCY(
                "Currency Date","Currency Code",
                AmountLCY,"Currency Factor"),
              UnitAmountRoundingPrecisionFCY)
        ELSE
          AmountLCY := ROUND(
              CurrExchRate.ExchangeAmtFCYToLCY(
                "Currency Date","Currency Code",
                Amount,"Currency Factor"),
              UnitAmountRoundingPrecision);
        */

    end;

    local procedure UpdateTotalPrice()
    begin
        /*"Total Price" := ROUND(Quantity * "Unit Price",AmountRoundingPrecisionFCY);
        "Total Price (LCY)" := ROUND(
            CurrExchRate.ExchangeAmtFCYToLCY(
              "Currency Date","Currency Code",
              "Total Price","Currency Factor"),
            AmountRoundingPrecision);
        */

    end;

    local procedure UpdateAmountsAndDiscounts()
    begin
        /*IF "Total Price" = 0 THEN BEGIN
          "Line Amount" := 0;
          "Line Discount Amount" := 0;
        END ELSE
          IF ("Line Amount" <> xRec."Line Amount") AND ("Line Discount Amount" = xRec."Line Discount Amount") THEN BEGIN
            "Line Amount" := ROUND("Line Amount",AmountRoundingPrecisionFCY);
            "Line Discount Amount" := "Total Price" - "Line Amount";
            "Line Discount %" :=
              ROUND("Line Discount Amount" / "Total Price" * 100,0.00001);
          END ELSE
            IF ("Line Discount Amount" <> xRec."Line Discount Amount") AND ("Line Amount" = xRec."Line Amount") THEN BEGIN
              "Line Discount Amount" := ROUND("Line Discount Amount",AmountRoundingPrecisionFCY);
              "Line Amount" := "Total Price" - "Line Discount Amount";
              "Line Discount %" :=
                ROUND("Line Discount Amount" / "Total Price" * 100,0.00001);
            END ELSE
              IF ("Line Discount Amount" = xRec."Line Discount Amount") AND
                 (("Line Amount" <> xRec."Line Amount") OR ("Line Discount %" <> xRec."Line Discount %") OR
                  ("Total Price" <> xRec."Total Price"))
              THEN BEGIN
                "Line Discount Amount" :=
                  ROUND("Total Price" * "Line Discount %" / 100,AmountRoundingPrecisionFCY);
                "Line Amount" := "Total Price" - "Line Discount Amount";
              END;
        
        "Line Amount (LCY)" := ROUND(
            CurrExchRate.ExchangeAmtFCYToLCY(
              "Currency Date","Currency Code",
              "Line Amount","Currency Factor"),
            AmountRoundingPrecision);
        
        "Line Discount Amount (LCY)" := ROUND(
            CurrExchRate.ExchangeAmtFCYToLCY(
              "Currency Date","Currency Code",
              "Line Discount Amount","Currency Factor"),
            AmountRoundingPrecision);
        */

    end;

    procedure Use(PostedQty: Decimal; PostedTotalCost: Decimal; PostedLineAmount: Decimal)
    begin
        /*IF "Usage Link" THEN BEGIN
          InitRoundingPrecisions;
          // Update Quantity Posted
          VALIDATE("Qty. Posted","Qty. Posted" + PostedQty);
        
          // Update Posted Costs and Amounts.
          "Posted Total Cost" += ROUND(PostedTotalCost,AmountRoundingPrecisionFCY);
          "Posted Total Cost (LCY)" := ROUND(
              CurrExchRate.ExchangeAmtFCYToLCY(
                "Currency Date","Currency Code",
                "Posted Total Cost","Currency Factor"),
              AmountRoundingPrecision);
        
          "Posted Line Amount" += ROUND(PostedLineAmount,AmountRoundingPrecisionFCY);
          "Posted Line Amount (LCY)" := ROUND(
              CurrExchRate.ExchangeAmtFCYToLCY(
                "Currency Date","Currency Code",
                "Posted Line Amount","Currency Factor"),
              AmountRoundingPrecision);
        
          // Update Remaining Quantity
          IF (PostedQty >= 0) = ("Remaining Qty." >= 0) THEN
            IF ABS(PostedQty) <= ABS("Remaining Qty.") THEN
              VALIDATE("Remaining Qty.","Remaining Qty." - PostedQty)
            ELSE BEGIN
              VALIDATE(Quantity,Quantity + PostedQty - "Remaining Qty.");
              VALIDATE("Remaining Qty.",0);
            END
          ELSE
            VALIDATE("Remaining Qty.","Remaining Qty." - PostedQty);
        
          // Update Remaining Costs and Amounts
          UpdateRemainingCostsAndAmounts;
        
          // Update Quantity to Post
          VALIDATE("Qty. to Transfer to Journal","Remaining Qty.");
        END ELSE
          ClearValues;
        
        MODIFY(TRUE);
        */

    end;

    local procedure UpdateRemainingCostsAndAmounts()
    begin
        /*IF "Usage Link" THEN BEGIN
          InitRoundingPrecisions;
          "Remaining Total Cost" := ROUND("Unit Cost" * "Remaining Qty.",AmountRoundingPrecisionFCY);
          "Remaining Total Cost (LCY)" := ROUND(
              CurrExchRate.ExchangeAmtFCYToLCY(
                "Currency Date","Currency Code",
                "Remaining Total Cost","Currency Factor"),
              AmountRoundingPrecision);
          "Remaining Line Amount" := CalcLineAmount("Remaining Qty.");
          "Remaining Line Amount (LCY)" := ROUND(
              CurrExchRate.ExchangeAmtFCYToLCY(
                "Currency Date","Currency Code",
                "Remaining Line Amount","Currency Factor"),
              AmountRoundingPrecision);
        END ELSE
          ClearValues;
        */

    end;

    procedure UpdateQtyToTransfer()
    begin
        /*IF "Contract Line" THEN BEGIN
          CALCFIELDS("Qty. Transferred to Invoice");
          VALIDATE("Qty. to Transfer to Invoice",Quantity - "Qty. Transferred to Invoice");
        END ELSE
          VALIDATE("Qty. to Transfer to Invoice",0);
        */

    end;

    procedure UpdateQtyToInvoice()
    begin
        /*IF "Contract Line" THEN BEGIN
          CALCFIELDS("Qty. Invoiced");
          VALIDATE("Qty. to Invoice",Quantity - "Qty. Invoiced")
        END ELSE
          VALIDATE("Qty. to Invoice",0);
        */

    end;

    procedure UpdatePostedTotalCost(AdjustJobCost: Decimal; AdjustJobCostLCY: Decimal)
    begin
        /*IF "Usage Link" THEN BEGIN
          InitRoundingPrecisions;
          "Posted Total Cost" += ROUND(AdjustJobCost,AmountRoundingPrecisionFCY);
          "Posted Total Cost (LCY)" += ROUND(AdjustJobCostLCY,AmountRoundingPrecision);
        END;
        */

    end;

    local procedure ValidateModification(FieldChanged: Boolean)
    begin
        /*IF FieldChanged THEN BEGIN
          CALCFIELDS("Qty. Transferred to Invoice");
          TESTFIELD("Qty. Transferred to Invoice",0);
        END;
        
        OnAfterValidateModification(Rec,FieldChanged);
        */

    end;

    local procedure CheckUsageLinkRelations()
    var
        JobUsageLink: Record "Job Usage Link";
    begin
        /*JobUsageLink.SETRANGE("Job No.","Job No.");
        JobUsageLink.SETRANGE("Job Task No.","Job Task No.");
        JobUsageLink.SETRANGE("Line No.","Line No.");
        IF NOT JobUsageLink.ISEMPTY THEN
          ERROR(LinkedJobLedgerErr);
          */

    end;

    local procedure ControlUsageLink()
    var
        JobUsageLink: Record "Job Usage Link";
    begin
        /*GetJob;
        
        IF Job."Apply Usage Link" THEN BEGIN
          IF "Schedule Line" THEN
            "Usage Link" := TRUE
          ELSE
            "Usage Link" := FALSE;
        END ELSE BEGIN
          IF NOT "Schedule Line" THEN
            "Usage Link" := FALSE;
        END;
        
        JobUsageLink.SETRANGE("Job No.","Job No.");
        JobUsageLink.SETRANGE("Job Task No.","Job Task No.");
        JobUsageLink.SETRANGE("Line No.","Line No.");
        IF NOT JobUsageLink.ISEMPTY AND NOT "Usage Link" THEN
          ERROR(ControlUsageLinkErr,TABLECAPTION,FIELDCAPTION("Schedule Line"),FIELDCAPTION("Usage Link"));
        
        VALIDATE("Remaining Qty.",Quantity - "Qty. Posted");
        VALIDATE("Qty. to Transfer to Journal",Quantity - "Qty. Posted");
        UpdateRemainingCostsAndAmounts;
        
        UpdateQtyToTransfer;
        UpdateQtyToInvoice;
        */

    end;

    local procedure CalcLineAmount(Qty: Decimal): Decimal
    var
        TotalPrice: Decimal;
    begin
        /*InitRoundingPrecisions;
        TotalPrice := ROUND(Qty * "Unit Price",AmountRoundingPrecisionFCY);
        EXIT(TotalPrice - ROUND(TotalPrice * "Line Discount %" / 100,AmountRoundingPrecisionFCY));
        */

    end;

    procedure Overdue(): Boolean
    begin
        /*IF ("Planning Date" < WORKDATE) AND ("Remaining Qty." > 0) THEN
          EXIT(TRUE);
        EXIT(FALSE);
        */

    end;

    procedure SetBypassQtyValidation(Bypass: Boolean)
    begin
        //BypassQtyValidation := Bypass;
    end;

    local procedure UpdateReservation(CalledByFieldNo: Integer)
    var
        ReservationCheckDateConfl: Codeunit "Reservation-Check Date Confl.";
    begin
        /*IF (CurrFieldNo <> CalledByFieldNo) AND (CurrFieldNo <> 0) THEN
          EXIT;
        CASE CalledByFieldNo OF
          FIELDNO("Planning Date"),FIELDNO("Planned Delivery Date"):
            IF (xRec."Planning Date" <> "Planning Date") AND
               (Quantity <> 0) AND
               (Reserve <> Reserve::Never)
            THEN
              ReservationCheckDateConfl.JobPlanningLineCheck(Rec,TRUE);
          FIELDNO(Quantity):
            JobPlanningLineReserve.VerifyQuantity(Rec,xRec);
          FIELDNO("Usage Link"):
            IF (Type = Type::Item) AND "Usage Link" THEN BEGIN
              GetItem;
              IF Item.Reserve = Item.Reserve::Optional THEN BEGIN
                GetJob;
                Reserve := Job.Reserve
              END ELSE
                Reserve := Item.Reserve;
            END ELSE
              Reserve := Reserve::Never;
        END;
        JobPlanningLineReserve.VerifyChange(Rec,xRec);
        UpdatePlanned;
        */

    end;

    local procedure UpdateDescription()
    begin
        /*IF (xRec.Type = xRec.Type::Resource) AND (xRec."No." <> '') THEN BEGIN
          Res.GET(xRec."No.");
          IF Description = Res.Name THEN
            Description := '';
          IF "Description 2" = Res."Name 2" THEN
            "Description 2" := '';
        END;
        */

    end;

    procedure ShowReservation()
    var
        Reservation: Page Reservation;
    begin
        /*TESTFIELD(Type,Type::Item);
        TESTFIELD("No.");
        TESTFIELD(Reserve);
        TESTFIELD("Usage Link");
        Reservation.SetJobPlanningLine(Rec);
        Reservation.RUNMODAL;
        */

    end;

    procedure ShowReservationEntries(Modal: Boolean)
    var
        ReservEntry: Record "Reservation Entry";
        ReservEngineMgt: Codeunit "Reservation Engine Mgt.";
    begin
        /*TESTFIELD(Type,Type::Item);
        TESTFIELD("No.");
        ReservEngineMgt.InitFilterAndSortingLookupFor(ReservEntry,TRUE);
        JobPlanningLineReserve.FilterReservFor(ReservEntry,Rec);
        IF Modal THEN
          PAGE.RUNMODAL(PAGE::"Reservation Entries",ReservEntry)
        ELSE
          PAGE.RUN(PAGE::"Reservation Entries",ReservEntry);
        */

    end;

    procedure AutoReserve()
    var
        ReservMgt: Codeunit "Reservation Management";
        FullAutoReservation: Boolean;
        QtyToReserve: Decimal;
        QtyToReserveBase: Decimal;
    begin
        /*TESTFIELD(Type,Type::Item);
        TESTFIELD("No.");
        IF Reserve = Reserve::Never THEN
          FIELDERROR(Reserve);
        JobPlanningLineReserve.ReservQuantity(Rec,QtyToReserve,QtyToReserveBase);
        IF QtyToReserveBase <> 0 THEN BEGIN
          ReservMgt.SetJobPlanningLine(Rec);
          TESTFIELD("Planning Date");
          ReservMgt.AutoReserve(FullAutoReservation,'',"Planning Date",QtyToReserve,QtyToReserveBase);
          FIND;
          IF NOT FullAutoReservation THEN BEGIN
            COMMIT;
            IF CONFIRM(AutoReserveQst,TRUE) THEN BEGIN
              ShowReservation;
              FIND;
            END;
          END;
          UpdatePlanned;
        END;
        */

    end;

    procedure ShowTracking()
    var
        OrderTrackingForm: Page "Order Tracking";
    begin
        /*OrderTrackingForm.SetJobPlanningLine(Rec);
        OrderTrackingForm.RUNMODAL;
        */

    end;

    procedure ShowOrderPromisingLine()
    var
        OrderPromisingLine: Record "Order Promising Line";
        OrderPromisingLines: Page "Order Promising Lines";
    begin
        /*OrderPromisingLine.SETRANGE("Source Type",OrderPromisingLine."Source Type"::Job);
        OrderPromisingLine.SETRANGE("Source Type",OrderPromisingLine."Source Type"::Job);
        OrderPromisingLine.SETRANGE("Source ID","Job No.");
        OrderPromisingLine.SETRANGE("Source Line No.","Job Contract Entry No.");
        
        OrderPromisingLines.SetSourceType(OrderPromisingLine."Source Type"::Job);
        OrderPromisingLines.SETTABLEVIEW(OrderPromisingLine);
        OrderPromisingLines.RUNMODAL;*/

    end;

    procedure FilterLinesWithItemToPlan(var Item: Record Item)
    begin
        /*RESET;
        SETCURRENTKEY(Status,Type,"No.","Variant Code","Location Code","Planning Date");
        SETRANGE(Status,Status::Order);
        SETRANGE(Type,Type::Item);
        SETRANGE("No.",Item."No.");
        SETFILTER("Variant Code",Item.GETFILTER("Variant Filter"));
        SETFILTER("Location Code",Item.GETFILTER("Location Filter"));
        SETFILTER("Planning Date",Item.GETFILTER("Date Filter"));
        SETFILTER("Remaining Qty. (Base)",'<>0');
        */

    end;

    procedure FindLinesWithItemToPlan(var Item: Record Item): Boolean
    begin
        /*FilterLinesWithItemToPlan(Item);
        EXIT(FIND('-'));*/

    end;

    procedure LinesWithItemToPlanExist(var Item: Record Item): Boolean
    begin
        /*FilterLinesWithItemToPlan(Item);
        EXIT(NOT ISEMPTY);*/

    end;

    procedure DrillDownJobInvoices()
    var
        JobInvoices: Page "Job Invoices";
    begin
        /*JobInvoices.SetShowDetails(FALSE);
        JobInvoices.SetPrJobPlanningLine(Rec);
        JobInvoices.RUN;*/

    end;

    local procedure CheckRelatedJobPlanningLineInvoice()
    var
        JobPlanningLineInvoice: Record "Job Planning Line Invoice";
    begin
        /*JobPlanningLineInvoice.SETRANGE("Job No.","Job No.");
        JobPlanningLineInvoice.SETRANGE("Job Task No.","Job Task No.");
        JobPlanningLineInvoice.SETRANGE("Job Planning Line No.","Line No.");
        IF NOT JobPlanningLineInvoice.ISEMPTY THEN
          ERROR(NotPossibleJobPlanningLineErr);*/

    end;

    procedure RowID1(): Text[250]
    var
        ItemTrackingMgt: Codeunit "Item Tracking Management";
    begin
        /*EXIT(
          ItemTrackingMgt.ComposeRowID(DATABASE::"Job Planning Line",Status,
            "Job No.",'',0,"Job Contract Entry No."));*/

    end;

    procedure UpdatePlanned(): Boolean
    begin
        /*CALCFIELDS("Reserved Quantity");
        IF Planned = ("Reserved Quantity" = "Remaining Qty.") THEN
          EXIT(FALSE);
        Planned := NOT Planned;
        EXIT(TRUE);*/

    end;

    procedure ClearValues()
    begin
        /*VALIDATE("Remaining Qty.",0);
        "Remaining Total Cost" := 0;
        "Remaining Total Cost (LCY)" := 0;
        "Remaining Line Amount" := 0;
        "Remaining Line Amount (LCY)" := 0;
        VALIDATE("Qty. Posted",0);
        VALIDATE("Qty. to Transfer to Journal",0);
        "Posted Total Cost" := 0;
        "Posted Total Cost (LCY)" := 0;
        "Posted Line Amount" := 0;
        "Posted Line Amount (LCY)" := 0;
        */

    end;

    procedure InitFromJobPlanningLine(FromJobPlanningLine: Record "Job Planning Line"; NewQuantity: Decimal)
    var
        ToJobPlanningLine: Record "Job Planning Line";
        JobJnlManagement: Codeunit JobJnlManagement;
    begin
        /*ToJobPlanningLine := Rec;
        
        ToJobPlanningLine.INIT;
        ToJobPlanningLine.TRANSFERFIELDS(FromJobPlanningLine);
        ToJobPlanningLine."Line No." := GetNextJobLineNo(FromJobPlanningLine);
        ToJobPlanningLine.VALIDATE("Line Type","Line Type"::Billable);
        ToJobPlanningLine.ClearValues;
        ToJobPlanningLine."Job Contract Entry No." := JobJnlManagement.GetNextEntryNo;
        IF ToJobPlanningLine.Type <> ToJobPlanningLine.Type::Text THEN BEGIN
          ToJobPlanningLine.VALIDATE(Quantity,NewQuantity);
          ToJobPlanningLine.VALIDATE("Currency Code",FromJobPlanningLine."Currency Code");
          ToJobPlanningLine.VALIDATE("Currency Date",FromJobPlanningLine."Currency Date");
          ToJobPlanningLine.VALIDATE("Currency Factor",FromJobPlanningLine."Currency Factor");
          ToJobPlanningLine.VALIDATE("Unit Cost",FromJobPlanningLine."Unit Cost");
          ToJobPlanningLine.VALIDATE("Unit Price",FromJobPlanningLine."Unit Price");
        END;
        
        Rec := ToJobPlanningLine;
        */

    end;

    local procedure GetNextJobLineNo(FromJobPlanningLine: Record "Job Planning Line"): Integer
    var
        JobPlanningLine: Record "Job Planning Line";
    begin
        /*JobPlanningLine.SETRANGE("Job No.",FromJobPlanningLine."Job No.");
        JobPlanningLine.SETRANGE("Job Task No.",FromJobPlanningLine."Job Task No.");
        IF JobPlanningLine.FINDLAST THEN;
        EXIT(JobPlanningLine."Line No." + 10000);*/

    end;

    procedure IsNonInventoriableItem(): Boolean
    begin
        /*IF Type <> Type::Item THEN
          EXIT(FALSE);
        IF "No." = '' THEN
          EXIT(FALSE);
        GetItem;
        EXIT(Item.IsNonInventoriableType);/*/

    end;

    [IntegrationEvent(false, false)]
    local procedure OnAfterInitJobPlanningLine(var JobPlanningLine: Record "Job Planning Line")
    begin
    end;

    [IntegrationEvent(false, false)]
    local procedure OnAfterResourceFindCost(var JobPlanningLine: Record "Job Planning Line"; var ResourceCost: Record "Resource Cost")
    begin
    end;

    [IntegrationEvent(false, false)]
    local procedure OnAfterSetupNewLine(var JobPlanningLine: Record "Job Planning Line"; LastJobPlanningLine: Record "Job Planning Line")
    begin
    end;

    [IntegrationEvent(false, false)]
    local procedure OnAfterValidateModification(var JobPlanningLine: Record "Job Planning Line"; FieldChanged: Boolean)
    begin
    end;

    [IntegrationEvent(false, false)]
    local procedure OnBeforeRetrieveCostPrice(var JobPlanningLine: Record "Job Planning Line"; xJobPlanningLine: Record "Job Planning Line"; var ShouldRetrieveCostPrice: Boolean; var IsHandled: Boolean)
    begin
    end;

    [IntegrationEvent(false, false)]
    local procedure OnBeforeUpdateAllAmounts(var JobPlanningLine: Record "Job Planning Line")
    begin
    end;
}
