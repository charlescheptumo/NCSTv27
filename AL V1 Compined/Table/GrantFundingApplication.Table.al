#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Table 65022 "Grant Funding Application"
{
    DrillDownPageID = "All Research Proposals";
    LookupPageID = "All Research Proposals";

    fields
    {
        field(1; "Application No"; Code[30])
        {
            DataClassification = ToBeClassified;

            trigger OnValidate()
            begin
                if "Application No" <> xRec."Application No" then begin
                    GrantsSetup.Get;
                    NoSeriesMgt.TestManual(GrantsSetup."Grant Proposal Nos");
                    "No. Series" := '';
                end;
            end;
        }
        field(2; "Document Date"; Date)
        {
            DataClassification = ToBeClassified;
        }
        field(3; "FOA ID"; Code[100])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Funding Opportunity";

            trigger OnValidate()
            begin
                if FOA.Get("FOA ID") then begin
                    "External Document No" := FOA."External Announcement No";
                    "Opportunity  Title" := FOA.Title;
                    "Call Type" := FOA."Call Type";
                    "Grant Class" := FOA."Grant Class";
                    "Grant Type" := FOA."Grant Type";
                end;
            end;
        }
        field(4; "External Document No"; Code[100])
        {
            DataClassification = ToBeClassified;
        }
        field(5; Description; Text[200])
        {
            DataClassification = ToBeClassified;
        }
        field(6; "Opportunity  Title"; Text[200])
        {
            DataClassification = ToBeClassified;
        }
        field(7; "Call Type"; Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = 'Call For Proposals,Call For Application,Call for Concept Notes,Call For Nominations,Expression of Interest';
            OptionMembers = "Call For Proposals","Call For Application","Call for Concept Notes","Call For Nominations","Expression of Interest";
        }
        field(8; "Grant Type"; Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Grant Types";
        }
        field(9; "Justification for Application"; Text[200])
        {
            DataClassification = ToBeClassified;
        }
        field(10; "Research Center"; Code[100])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Responsibility Center" where("Operating Unit Type" = const(Department));
        }
        field(11; "Primary Research Program ID"; Code[100])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Research Center Programs"."Program Code" where("Center Code" = field("Research Center"));
        }
        field(12; "Primary Research Area"; Code[100])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Research Project Area".Code where("Research Program ID" = field("Primary Research Program ID"));
        }
        field(13; "No. Series"; Code[30])
        {
            DataClassification = ToBeClassified;
        }
        field(14; "Principal Investigator"; Code[50])
        {
            CalcFormula = lookup("Grant Research Team"."Researcher ID" where("Grant Opportunity ID" = field("Application No"),
                                                                              "Lead Role" = const(true)));
            FieldClass = FlowField;
        }
        field(15; "Currency Code"; Code[10])
        {
            Caption = 'Currency Code';
            DataClassification = ToBeClassified;
            TableRelation = Currency;

            trigger OnValidate()
            begin
                if not (CurrFieldNo in [0, FieldNo("Posting Date")]) or ("Currency Code" <> xRec."Currency Code") then
                    TestField("Approval Status", "approval status"::Open);
                if (CurrFieldNo <> FieldNo("Currency Code")) and ("Currency Code" = xRec."Currency Code") then
                    UpdateCurrencyFactor
                else
                    if "Currency Code" <> xRec."Currency Code" then
                        UpdateCurrencyFactor
                    else
                        if "Currency Code" <> '' then begin
                            UpdateCurrencyFactor;
                            if "Currency Factor" <> xRec."Currency Factor" then
                                ConfirmUpdateCurrencyFactor;
                        end;
            end;
        }
        field(16; "Requested Grant Amount"; Decimal)
        {
            DataClassification = ToBeClassified;

            trigger OnValidate()
            begin
                GetCurrency;
                if "Currency Code" = '' then
                    "Requested Grant Amount(LCY)" := "Requested Grant Amount"
                else
                    "Requested Grant Amount(LCY)" := ROUND(
                        CurrExchRate.ExchangeAmtFCYToLCY(
                          "Posting Date", "Currency Code",
                         "Requested Grant Amount", "Currency Factor"));
            end;
        }
        field(17; "Requested Grant Amount(LCY)"; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(18; "Awarded Grant Amount"; Decimal)
        {
            DataClassification = ToBeClassified;

            trigger OnValidate()
            begin
                GetCurrency;
                if "Currency Code" = '' then
                    "Awarded Grant Amount (LCY)" := "Awarded Grant Amount"
                else
                    "Awarded Grant Amount (LCY)" := ROUND(
                       CurrExchRate.ExchangeAmtFCYToLCY(
                         "Posting Date", "Currency Code",
                         "Awarded Grant Amount", "Currency Factor"));
            end;
        }
        field(19; "Awarded Grant Amount (LCY)"; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(20; "Application Status"; Option)
        {
            DataClassification = ToBeClassified;
            Editable = false;
            OptionCaption = 'Not Started,InProgress,Won,Lost';
            OptionMembers = "Not Started",InProgress,Won,Lost;
        }
        field(21; "Approval Status"; Option)
        {
            DataClassification = ToBeClassified;
            Editable = false;
            OptionCaption = 'Open,Pending Approval,Released,Rejected';
            OptionMembers = Open,"Pending Approval",Released,Rejected;
        }
        field(22; "Grant Admin Team Code"; Code[10])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Grant Admin Team".Code;
        }
        field(23; "Created By"; Code[100])
        {
            DataClassification = ToBeClassified;
        }
        field(24; "Created On"; Date)
        {
            DataClassification = ToBeClassified;
        }
        field(25; "Closed Date"; Date)
        {
            DataClassification = ToBeClassified;
        }
        field(26; "Grantor No."; Code[50])
        {
            DataClassification = ToBeClassified;
            TableRelation = Customer where("Funding Class" = const(Grant));

            trigger OnValidate()
            begin
                if Customer.Get("Grantor No.") then begin
                    "Grantor Name" := Customer.Name;
                end;
            end;
        }
        field(27; "Grantor Name"; Text[100])
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(28; Address; Code[50])
        {
            DataClassification = ToBeClassified;
        }
        field(29; Address2; Code[50])
        {
            DataClassification = ToBeClassified;
        }
        field(30; "Post Code"; Code[50])
        {
            DataClassification = ToBeClassified;
        }
        field(31; City; Code[50])
        {
            DataClassification = ToBeClassified;
        }
        field(33; "Phone No"; Code[100])
        {
            DataClassification = ToBeClassified;
        }
        field(34; "Mobile Phone No"; Code[100])
        {
            DataClassification = ToBeClassified;
        }
        field(35; "Grantor Research Contact ID"; Code[50])
        {
            DataClassification = ToBeClassified;
            TableRelation = Contact;

            trigger OnValidate()
            begin
                if Contact.Get("Grantor Research Contact ID") then begin
                    "Grantor Research Reviewer" := Contact.Name;
                end;
            end;
        }
        field(36; "Grantor Research Reviewer"; Code[100])
        {
            DataClassification = ToBeClassified;
        }
        field(37; "Grantor Admin Contact ID"; Code[50])
        {
            DataClassification = ToBeClassified;
            TableRelation = Contact;

            trigger OnValidate()
            begin
                if Contact.Get("Grantor Admin Contact ID") then begin
                    "Grantor Admin Name" := Contact.Name;
                end;
            end;
        }
        field(38; "Grantor Admin Name"; Code[100])
        {
            DataClassification = ToBeClassified;
        }
        field(39; "Grantor Finance Contact ID"; Code[50])
        {
            DataClassification = ToBeClassified;
            TableRelation = Contact;

            trigger OnValidate()
            begin
                if Contact.Get("Grantor Finance Contact ID") then begin
                    "Grantor Finance Contact" := Contact.Name;
                end;
            end;
        }
        field(40; "Grantor Finance Contact"; Code[100])
        {
            DataClassification = ToBeClassified;
        }
        field(41; "Application Due Date"; Date)
        {
            DataClassification = ToBeClassified;
        }
        field(42; "Application Submitted Date"; Date)
        {
            DataClassification = ToBeClassified;
        }
        field(43; "Estimated Award Date"; Date)
        {
            DataClassification = ToBeClassified;
        }
        field(44; "Currency Factor"; Decimal)
        {
            Caption = 'Currency Factor';
            DataClassification = ToBeClassified;
            DecimalPlaces = 0 : 15;
            Editable = false;
            MinValue = 0;

            trigger OnValidate()
            begin
                if "Currency Factor" <> xRec."Currency Factor" then
                    UpdateSalesLinesByFieldNo(FieldNo("Currency Factor"), false);
            end;
        }
        field(45; "Posting Date"; Date)
        {
            DataClassification = ToBeClassified;
        }
        field(46; "Grant Class"; Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = 'External,Internal';
            OptionMembers = External,Internal;
        }
        field(47; Closed; Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(48; "Date Closed"; Date)
        {
            DataClassification = ToBeClassified;
        }
        field(95; "Additional-Currency Posting"; Option)
        {
            Caption = 'Additional-Currency Posting';
            DataClassification = ToBeClassified;
            Editable = false;
            OptionCaption = 'None,Amount Only,Additional-Currency Amount Only';
            OptionMembers = "None","Amount Only","Additional-Currency Amount Only";
        }
        field(98; "FA Add.-Currency Factor"; Decimal)
        {
            Caption = 'FA Add.-Currency Factor';
            DataClassification = ToBeClassified;
            DecimalPlaces = 0 : 15;
            MinValue = 0;
        }
    }

    keys
    {
        key(Key1; "Application No")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }

    trigger OnInsert()
    begin
        if "Application No" = '' then begin
            GrantsSetup.Get;
            GrantsSetup.TestField("Grant Proposal Nos");
           // NoSeriesMgt.InitSeries(GrantsSetup."Grant Proposal Nos", xRec."No. Series", 0D, "Application No", "No. Series");
            "Application No" := NoSeriesMgt.GetNextNo(GrantsSetup."Grant Proposal Nos", Today, true);
        end;

        "Created By" := UserId;
        "Created On" := Today;
        "Document Date" := Today;
    end;

    var
        GrantsSetup: Record "Grants Setup";
        NoSeriesMgt: Codeunit "No. Series";
        FOA: Record "Funding Opportunity";
        CurrencyDate: Date;
        CurrExchRate: Record "Currency Exchange Rate";
        MissingExchangeRatesQst: label 'There are no exchange rates for currency %1 and date %2. Do you want to add them now? Otherwise, the last change you made will be reverted.', Comment = '%1 - currency code, %2 - posting date';
        Confirmed: Boolean;
        Text021: label 'Do you want to update the exchange rate?';
        HideValidationDialog: Boolean;
        Customer: Record Customer;
        Contact: Record Contact;
        Currency: Record Currency;
        GLSetup: Record "General Ledger Setup";
        CurrencyCode: Code[10];
        GLSetupRead: Boolean;

    local procedure UpdateCurrencyFactor()
    var
        UpdateCurrencyExchangeRates: Codeunit "Update Currency Exchange Rates";
        Updated: Boolean;
    begin
        OnBeforeUpdateCurrencyFactor(Rec, Updated);
        if Updated then
            exit;

        if "Currency Code" <> '' then begin
            if "Posting Date" <> 0D then
                CurrencyDate := "Posting Date"
            else
                CurrencyDate := WorkDate;

            if UpdateCurrencyExchangeRates.ExchangeRatesForCurrencyExist(CurrencyDate, "Currency Code") then begin
                "Currency Factor" := CurrExchRate.ExchangeRate(CurrencyDate, "Currency Code");
                if "Currency Code" <> xRec."Currency Code" then
                    RecreateSalesLines(FieldCaption("Currency Code"));
            end else begin
                if Confirm(StrSubstNo(MissingExchangeRatesQst, "Currency Code", CurrencyDate)) then begin
                    Commit;
                    UpdateCurrencyExchangeRates.OpenExchangeRatesPage("Currency Code");
                    UpdateCurrencyFactor;
                end else
                    RevertCurrencyCodeAndPostingDate;
            end;
        end else
            "Currency Factor" := 0;
    end;

    local procedure ConfirmUpdateCurrencyFactor()
    begin
        if GetHideValidationDialog then
            Confirmed := true
        else
            Confirmed := Confirm(Text021, false);
        if Confirmed then
            Validate("Currency Factor")
        else
            "Currency Factor" := xRec."Currency Factor";
    end;

    [IntegrationEvent(false, false)]
    local procedure OnBeforeUpdateCurrencyFactor(var SalesHeader: Record "Grant Funding Application"; var Updated: Boolean)
    begin
    end;

    local procedure RecreateSalesLines(ChangedFieldName: Text[100])
    var
        TempSalesLine: Record "Sales Line" temporary;
        ItemChargeAssgntSales: Record "Item Charge Assignment (Sales)";
        TempItemChargeAssgntSales: Record "Item Charge Assignment (Sales)" temporary;
        TempInteger: Record "Integer" temporary;
        TempATOLink: Record "Assemble-to-Order Link" temporary;
        ATOLink: Record "Assemble-to-Order Link";
        TransferExtendedText: Codeunit "Transfer Extended Text";
        ExtendedTextAdded: Boolean;
        ConfirmText: Text;
    begin
        /*IF SalesLinesExist THEN BEGIN
          IF GetHideValidationDialog OR NOT GUIALLOWED THEN
            Confirmed := TRUE
          ELSE BEGIN
            IF HasItemChargeAssignment THEN
              ConfirmText := ResetItemChargeAssignMsg
            ELSE
              ConfirmText := RecreateSalesLinesMsg;
            Confirmed := CONFIRM(ConfirmText,FALSE,ChangedFieldName);
          END;
        
          IF Confirmed THEN BEGIN
            SalesLine.LOCKTABLE;
            ItemChargeAssgntSales.LOCKTABLE;
            ReservEntry.LOCKTABLE;
            MODIFY;
            OnBeforeRecreateSalesLines(Rec);
            SalesLine.RESET;
            SalesLine.SETRANGE("Document Type","Document Type");
            SalesLine.SETRANGE("Document No.","No.");
            IF SalesLine.FINDSET THEN BEGIN
              TempReservEntry.DELETEALL;
              RecreateReservEntryReqLine(TempSalesLine,TempATOLink,ATOLink);
              TransferItemChargeAssgntSalesToTemp(ItemChargeAssgntSales,TempItemChargeAssgntSales);
              SalesLine.DELETEALL(TRUE);
              SalesLine.INIT;
              SalesLine."Line No." := 0;
              TempSalesLine.FINDSET;
              ExtendedTextAdded := FALSE;
              SalesLine.BlockDynamicTracking(TRUE);
              REPEAT
                IF TempSalesLine."Attached to Line No." = 0 THEN BEGIN
                  CreateSalesLine(TempSalesLine);
                  ExtendedTextAdded := FALSE;
                  OnAfterRecreateSalesLine(SalesLine,TempSalesLine);
        
                  IF SalesLine.Type = SalesLine.Type::Item THEN BEGIN
                    ClearItemAssgntSalesFilter(TempItemChargeAssgntSales);
                    TempItemChargeAssgntSales.SETRANGE("Applies-to Doc. Type",TempSalesLine."Document Type");
                    TempItemChargeAssgntSales.SETRANGE("Applies-to Doc. No.",TempSalesLine."Document No.");
                    TempItemChargeAssgntSales.SETRANGE("Applies-to Doc. Line No.",TempSalesLine."Line No.");
                    IF TempItemChargeAssgntSales.FINDSET THEN
                      REPEAT
                        IF NOT TempItemChargeAssgntSales.MARK THEN BEGIN
                          TempItemChargeAssgntSales."Applies-to Doc. Line No." := SalesLine."Line No.";
                          TempItemChargeAssgntSales.Description := SalesLine.Description;
                          TempItemChargeAssgntSales.MODIFY;
                          TempItemChargeAssgntSales.MARK(TRUE);
                        END;
                      UNTIL TempItemChargeAssgntSales.NEXT = 0;
                  END;
                  IF SalesLine.Type = SalesLine.Type::"Charge (Item)" THEN BEGIN
                    TempInteger.INIT;
                    TempInteger.Number := SalesLine."Line No.";
                    TempInteger.INSERT;
                  END;
                END ELSE
                  IF NOT ExtendedTextAdded THEN BEGIN
                    TransferExtendedText.SalesCheckIfAnyExtText(SalesLine,TRUE);
                    TransferExtendedText.InsertSalesExtText(SalesLine);
                    OnAfterTransferExtendedTextForSalesLineRecreation(SalesLine);
        
                    SalesLine.FINDLAST;
                    ExtendedTextAdded := TRUE;
                  END;
                CopyReservEntryFromTemp(TempSalesLine,SalesLine."Line No.");
                RecreateReqLine(TempSalesLine,SalesLine."Line No.",FALSE);
                SynchronizeForReservations(SalesLine,TempSalesLine);
        
                IF TempATOLink.AsmExistsForSalesLine(TempSalesLine) THEN BEGIN
                  ATOLink := TempATOLink;
                  ATOLink."Document Line No." := SalesLine."Line No.";
                  ATOLink.INSERT;
                  ATOLink.UpdateAsmFromSalesLineATOExist(SalesLine);
                  TempATOLink.DELETE;
                END;
              UNTIL TempSalesLine.NEXT = 0;
        
              ClearItemAssgntSalesFilter(TempItemChargeAssgntSales);
              TempSalesLine.SETRANGE(Type,SalesLine.Type::"Charge (Item)");
              CreateItemChargeAssgntSales(ItemChargeAssgntSales,TempItemChargeAssgntSales,TempSalesLine,TempInteger);
              TempSalesLine.SETRANGE(Type);
              TempSalesLine.DELETEALL;
              OnAfterDeleteAllTempSalesLines;
              ClearItemAssgntSalesFilter(TempItemChargeAssgntSales);
              TempItemChargeAssgntSales.DELETEALL;
            END;
          END ELSE
            ERROR(
              Text017,ChangedFieldName);
        END;
        
        SalesLine.BlockDynamicTracking(FALSE);
        */

    end;

    local procedure RevertCurrencyCodeAndPostingDate()
    begin
        "Currency Code" := xRec."Currency Code";
        "Posting Date" := xRec."Posting Date";
    end;

    procedure GetHideValidationDialog(): Boolean
    var
        IdentityManagement: Codeunit "Identity Management";
    begin
        //CC//   exit(HideValidationDialog or IdentityManagement.IsInvAppId);
    end;

    procedure UpdateSalesLinesByFieldNo(ChangedFieldNo: Integer; AskQuestion: Boolean)
    var
        "Field": Record "Field";
        JobTransferLine: Codeunit "Job Transfer Line";
        PermissionManager: Codeunit "Permission Manager";
        Question: Text[250];
        NotRunningOnSaaS: Boolean;
        IsHandled: Boolean;
    begin
        /*IF NOT SalesLinesExist THEN
          EXIT;
        
        IF NOT Field.GET(DATABASE::"Sales Header",ChangedFieldNo) THEN
          Field.GET(DATABASE::"Sales Line",ChangedFieldNo);
        
        NotRunningOnSaaS := TRUE;
        CASE ChangedFieldNo OF
          FIELDNO("Shipping Agent Code"),
          FIELDNO("Shipping Agent Service Code"):
            NotRunningOnSaaS := NOT PermissionManager.SoftwareAsAService;
        END;
        IF AskQuestion THEN BEGIN
          Question := STRSUBSTNO(Text031,Field."Field Caption");
          IF GUIALLOWED THEN
            IF NotRunningOnSaaS THEN
              IF DIALOG.CONFIRM(Question,TRUE) THEN
                CASE ChangedFieldNo OF
                  FIELDNO("Shipment Date"),
                  FIELDNO("Shipping Agent Code"),
                  FIELDNO("Shipping Agent Service Code"),
                  FIELDNO("Shipping Time"),
                  FIELDNO("Requested Delivery Date"),
                  FIELDNO("Promised Delivery Date"),
                  FIELDNO("Outbound Whse. Handling Time"):
                    ConfirmResvDateConflict;
                END
              ELSE
                EXIT
            ELSE
              ConfirmResvDateConflict;
        END;
        
        SalesLine.LOCKTABLE;
        MODIFY;
        
        SalesLine.RESET;
        SalesLine.SETRANGE("Document Type","Document Type");
        SalesLine.SETRANGE("Document No.","No.");
        IF SalesLine.FINDSET THEN
          REPEAT
            OnBeforeSalesLineByChangedFieldNo(SalesHeader,SalesLine,ChangedFieldNo,IsHandled);
            IF NOT IsHandled THEN
              CASE ChangedFieldNo OF
                FIELDNO("Shipment Date"):
                  IF SalesLine."No." <> '' THEN
                    SalesLine.VALIDATE("Shipment Date","Shipment Date");
                FIELDNO("Currency Factor"):
                  IF SalesLine.Type <> SalesLine.Type::" " THEN BEGIN
                    SalesLine.VALIDATE("Unit Price");
                    SalesLine.VALIDATE("Unit Cost (LCY)");
                    IF SalesLine."Job No." <> '' THEN
                      JobTransferLine.FromSalesHeaderToPlanningLine(SalesLine,"Currency Factor");
                  END;
                FIELDNO("Transaction Type"):
                  SalesLine.VALIDATE("Transaction Type","Transaction Type");
                FIELDNO("Transport Method"):
                  SalesLine.VALIDATE("Transport Method","Transport Method");
                FIELDNO("Exit Point"):
                  SalesLine.VALIDATE("Exit Point","Exit Point");
                FIELDNO(Area):
                  SalesLine.VALIDATE(Area,Area);
                FIELDNO("Transaction Specification"):
                  SalesLine.VALIDATE("Transaction Specification","Transaction Specification");
                FIELDNO("Shipping Agent Code"):
                  SalesLine.VALIDATE("Shipping Agent Code","Shipping Agent Code");
                FIELDNO("Shipping Agent Service Code"):
                  IF SalesLine."No." <> '' THEN
                    SalesLine.VALIDATE("Shipping Agent Service Code","Shipping Agent Service Code");
                FIELDNO("Shipping Time"):
                  IF SalesLine."No." <> '' THEN
                    SalesLine.VALIDATE("Shipping Time","Shipping Time");
                FIELDNO("Prepayment %"):
                  IF SalesLine."No." <> '' THEN
                    SalesLine.VALIDATE("Prepayment %","Prepayment %");
                FIELDNO("Requested Delivery Date"):
                  IF SalesLine."No." <> '' THEN
                    SalesLine.VALIDATE("Requested Delivery Date","Requested Delivery Date");
                FIELDNO("Promised Delivery Date"):
                  IF SalesLine."No." <> '' THEN
                    SalesLine.VALIDATE("Promised Delivery Date","Promised Delivery Date");
                FIELDNO("Outbound Whse. Handling Time"):
                  IF SalesLine."No." <> '' THEN
                    SalesLine.VALIDATE("Outbound Whse. Handling Time","Outbound Whse. Handling Time");
                SalesLine.FIELDNO("Deferral Code"):
                  IF SalesLine."No." <> '' THEN
                    SalesLine.VALIDATE("Deferral Code");
                ELSE
                  OnUpdateSalesLineByChangedFieldName(Rec,SalesLine,Field."Field Caption");
              END;
            SalesLineReserve.AssignForPlanning(SalesLine);
            SalesLine.MODIFY(TRUE);
          UNTIL SalesLine.NEXT = 0;
          */

    end;

    local procedure FnReCalculateAmountLCY(ChangedFieldName: Text[100])
    begin
        if (ChangedFieldName = '') then begin
            "Requested Grant Amount(LCY)" := "Requested Grant Amount";
        end;
        if (ChangedFieldName <> '') then begin
            "Requested Grant Amount(LCY)" := "Requested Grant Amount" * "Currency Factor";
        end;
    end;

    procedure CloseOpportunity()
    var
        TempOppEntry: Record "GFA Opportunity Entry" temporary;
    begin
        if "Application No" <> '' then
            TempOppEntry.CloseOppFromOpp(Rec);
    end;

    local procedure GetCurrency()
    begin
        if "Additional-Currency Posting" =
           "additional-currency posting"::"Additional-Currency Amount Only"
        then begin
            if GLSetup."Additional Reporting Currency" = '' then
                ReadGLSetup;
            CurrencyCode := GLSetup."Additional Reporting Currency";
        end else
            CurrencyCode := "Currency Code";

        if CurrencyCode = '' then begin
            Clear(Currency);
            Currency.InitRoundingPrecision
        end else
            if CurrencyCode <> Currency.Code then begin
                Currency.Get(CurrencyCode);
                Currency.TestField("Amount Rounding Precision");
            end;
    end;

    local procedure ReadGLSetup()
    begin
        if not GLSetupRead then begin
            GLSetup.Get;
            GLSetupRead := true;
        end;
    end;
}
