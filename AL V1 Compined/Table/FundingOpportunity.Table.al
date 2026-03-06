#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Table 65021 "Funding Opportunity"
{
    DrillDownPageID = "Funding Opportunity List";
    LookupPageID = "Funding Opportunity List";

    fields
    {
        field(1; "Call No."; Code[30])
        {
            DataClassification = ToBeClassified;

            trigger OnValidate()
            begin
                if "Call No." <> xRec."Call No." then begin
                    GrantsSetup.Get;
                    NoSeriesMgt.TestManual(GrantsSetup."Grantor Nos");
                    "No. Series" := '';
                end;
            end;
        }
        field(2; "Organization ID"; Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = Contact;

            trigger OnValidate()
            begin
                Contacts.Reset;
                Contacts.SetRange("No.", "Organization ID");
                if Contacts.Find('-') then begin
                    "Issuing Organization" := Contacts.Name;
                end;
            end;
        }
        field(3; "Issuing Organization"; Code[200])
        {
            DataClassification = ToBeClassified;
        }
        field(4; "Call Type"; Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = 'Call For Proposals,Call For Application,Call for Concept Notes,Call For Nominations,Expression of Interest';
            OptionMembers = "Call For Proposals","Call For Application","Call for Concept Notes","Call For Nominations","Expression of Interest";
        }
        field(5; "External Announcement No"; Code[150])
        {
            DataClassification = ToBeClassified;
            Description = 'e.g. website';
        }
        field(6; "Release Date"; Date)
        {
            DataClassification = ToBeClassified;
            Description = 'when the call was published';
        }
        field(7; "Opening Date"; Date)
        {
            DataClassification = ToBeClassified;
            Description = 'Earliest submission date';
            Enabled = false;
        }
        field(8; "Application Due Date"; Date)
        {
            DataClassification = ToBeClassified;
        }
        field(9; "Application date"; Date)
        {
            DataClassification = ToBeClassified;
            Description = 'changed from Earliest Start Date to  Application date';
        }
        field(10; "Expiration Date"; Date)
        {
            DataClassification = ToBeClassified;
        }
        field(11; "Home Page"; Code[100])
        {
            DataClassification = ToBeClassified;
        }
        field(12; Status; Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = 'Open,Closed';
            OptionMembers = Open,Closed;
        }
        field(13; "No. Series"; Code[20])
        {
            Caption = 'No. Series';
            DataClassification = ToBeClassified;
            Editable = false;
            TableRelation = "No. Series";
        }
        field(14; "Document Date"; Date)
        {
            DataClassification = ToBeClassified;
        }
        field(15; "Created By"; Code[100])
        {
            DataClassification = ToBeClassified;
        }
        field(16; "Opportunity Amount"; Decimal)
        {
            DataClassification = ToBeClassified;

            trigger OnValidate()
            begin
                GetCurrency;
                if "Currency Code" = '' then
                    "Opportunity Amount(LCY)" := "Opportunity Amount"
                else
                    "Opportunity Amount(LCY)" := ROUND(
                       CurrExchRate.ExchangeAmtFCYToLCY(
                         "Posting Date", "Currency Code",
                         "Opportunity Amount", "Currency Factor"));
            end;
        }
        field(17; "Opportunity Amount(LCY)"; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(18; "Currency Code"; Code[100])
        {
            DataClassification = ToBeClassified;
            TableRelation = Currency;

            trigger OnValidate()
            begin
                if not (CurrFieldNo in [0, FieldNo("Posting Date")]) or ("Currency Code" <> xRec."Currency Code") then
                    TestField(Status, Status::Open);
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
        field(19; "Title Details"; Blob)
        {
            DataClassification = ToBeClassified;
        }
        field(20; Title; Text[50])
        {
            DataClassification = ToBeClassified;
        }
        field(21; "Grantor No"; Code[50])
        {
            DataClassification = ToBeClassified;
            TableRelation = Customer where("Funding Class" = const(Grant));
        }
        field(22; "Posting Date"; Date)
        {
            DataClassification = ToBeClassified;

            trigger OnValidate()
            begin
                Validate("Currency Code");
            end;
        }
        field(23; "Currency Factor"; Decimal)
        {
            DataClassification = ToBeClassified;

            trigger OnValidate()
            begin
                if "Currency Factor" <> xRec."Currency Factor" then
                    UpdateSalesLinesByFieldNo(FieldNo("Currency Factor"), false);
            end;
        }
        field(24; "Opportunity Status"; Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = 'Open,Submitted,Received';
            OptionMembers = Open,Submitted,Received;
        }
        field(25; "Donor Type"; Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = 'External,Internal';
            OptionMembers = External,Internal;
        }
        field(26; "Grant Type"; Code[10])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Grant Types".Code;

            trigger OnValidate()
            begin
                if GrantTypes.Get("Grant Type") then begin
                    if (GrantTypes.Type = GrantTypes.Type::External) then begin
                        "Grant Class" := "grant class"::External;
                    end;

                    if (GrantTypes.Type = GrantTypes.Type::Internal) then begin
                        "Grant Class" := "grant class"::Internal;
                    end;
                end;
            end;
        }
        field(27; "Grant Class"; Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = 'External,Internal';
            OptionMembers = External,Internal;
        }
        field(28; "Project Duration"; DateFormula)
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
        key(Key1; "Call No.")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }

    trigger OnInsert()
    begin
        if "Call No." = '' then begin
            GrantsSetup.Get;
            GrantsSetup.TestField("Grantor Nos");
          //  NoSeriesMgt.InitSeries(GrantsSetup."Grantor Nos", xRec."No. Series", 0D, "Call No.", "No. Series");
            "Call No." := NoSeriesMgt.GetNextNo(GrantsSetup."Grantor Nos", Today, true);
        end;

        "Document Date" := Today;
        "Created By" := UserId;
    end;

    var
        GrantsSetup: Record "Grants Setup";
        NoSeriesMgt: Codeunit "No. Series";
        Contacts: Record Contact;
        CurrencyDate: Date;
        CurrExchRate: Record "Currency Exchange Rate";
        Confirmed: Boolean;
        HideValidationDialog: Boolean;
        MissingExchangeRatesQst: label 'There are no exchange rates for currency %1 and date %2. Do you want to add them now? Otherwise, the last change you made will be reverted.', Comment = '%1 - currency code, %2 - posting date';
        Text021: label 'Do you want to update the exchange rate?';
        GrantTypes: Record "Grant Types";
        GLSetup: Record "General Ledger Setup";
        CurrencyCode: Code[10];
        Currency: Record Currency;
        GLSetupRead: Boolean;


    procedure SetWorkDescription(NewWorkDescription: Text)
    var
      //  TempBlob: Record "Upgrade Blob Storage";
    begin
        Clear("Title Details");
        if NewWorkDescription = '' then
            exit;
     //cc//   TempBlob.Blob := "Title Details";
        //CC//   TempBlob. (NewWorkDescription, Textencoding::Windows);
    //cc//    "Title Details" := TempBlob.Blob;
        Modify;
    end;


    procedure GetWorkDescription(): Text
    var
        //CC//  TempBlob: Record TempBlob temporary;
        CR: Text[1];
    begin
        CalcFields("Title Details");
        if not "Title Details".Hasvalue then
            exit('');
        CR[1] := 10;
        //CC//  TempBlob.Blob := "Title Details";
        //CC//  exit(TempBlob.ReadAsText(CR, Textencoding::Windows));
    end;

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
    local procedure OnBeforeUpdateCurrencyFactor(var SalesHeader: Record "Funding Opportunity"; var Updated: Boolean)
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
