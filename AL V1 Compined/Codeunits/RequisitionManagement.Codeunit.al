#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Codeunit 50007 "Requisition Management"
{

    trigger OnRun()
    begin
    end;

    var
        GLSetup: Record "General Ledger Setup";
        SalesSetup: Record "Sales & Receivables Setup";
        PurchSetup: Record "Purchases & Payables Setup";
        InvenSetup: Record "Inventory Setup";
        Err100: label 'The Requisition Fulfilment Item Journal andTtemplate must be defined in Purchases & Payables Setup';
        Err200: label 'The No. series for the Item Journal %1 and %2 must be defined!';
        Err300: label 'The To & From locations must be defined';
        SNText01: label 'There are no purchase review documents to process.  Please select the appropriate Decision and enter Target No. to process documents.';
        SNText02: label 'No line were eligible for posting encumbrances - check line statuses.';
        SNText03: label 'The Purchase Order %1 you are appending to does not exist.';
        SNText04: label 'You cannot cancel a %1 purchase line.';
        SNText05: label 'Advanced Budgeting is not licensed or activated in Source Codes.';
        SNText06: label 'You cannot cancel a submitted for approval purchase line, Document %1 Line %2.';
        SNText07: label 'Reversed Requisition Fulfillment & Canceled line, Document %1 Line %2.';
        SNText08: label 'Use Delete instead of Cancel Line for purchase line, Document %1 Line %2.';
        SNText09: label 'You cannot cancel a new purchase line, Document %1 Line %2 - Delete Line instead.';
        SNText10: label 'Commitment Posting is not activated.';
        SNText11: label 'Encumbrance Posting is not activated.';
        SNText12: label 'There are no lines with status New and an Amount to check.';
        SNText13: label 'Nothing to Submit.';
        SNText14: label 'Requisition %1 has submitted lines - cannot be deleted.';
        SNText15: label 'There is nothing to cancel for Line %1.  Delete line instead.';
        SNText16: label 'You cannot cancel a Requisition %1 Line %2 that is %3.';
        SNText17: label 'You cannot cancel a Deposit %1 Line %2 that is %3.';
        SNText18: label 'There are no lines to check.';
        SNText19: label 'There are no lines to cancel.';
        SNText20: label 'There are outstanding Orders that must be fully Invoiced or Canceled first.';
        SNText21: label 'Should Blanket Order %1, Line No. %2 be re-encumbered?';
        SNText22: label 'Blanket Order Status %1 is not valid ';
        SNText23: label 'The line has been submitted for approval.  Confirm cancellation?';
        SNText24: label 'Cancel Line has been stopped.  Document %1 Line %2.';
        SNText25: label 'Posting is not allowed for proposed Vendors.  Vendor No.=%1.';
        SNText26: label 'Processing is not allowed for proposed Vendors.  Vendor No.=%1.';
        SNText27: label 'No lines were eligible for posting commitments - check line statuses.';
        SNText28: label 'Purchase tolerance check failed.  Document No.=%1, Line No.=%2.';
        SNText29: label 'Reclassification not permitted for document %1, line %2.';
        SNText30: label 'Status must be Approval Pending, Transfer Budget Pending or Disapproved.';
        SNText31: label 'There are no lines to reset.';
        SNText32: label 'You cannot cancel a new sales line, Document %1 Line %2 - Delete Line instead.';
        SNText33: label 'You cannot cancel a %1 sales line.';
        SNText34: label 'There are %1 failed validations.  Preview Distributions to resolve.';
        SNText36: label 'The document has been submitted for approval.  Confirm cancellation?';
        SNText37: label 'Cancel Document has been stopped.  %1 %2.';
        SNText38: label 'You cannot reset document a %1 %2 that is %3 %4.';
        SNText39: label 'You cannot cancel a %1 %2 that is %3 %4.';
        CommitmentDescription: label 'Reserve for Commitments';
        EncumbranceDescription: label 'Reserve for Encumbrances';
        ConversionDescription: label 'Conversion of  %1 to %2.';
        Window: Dialog;
        LineNo: Integer;
        Options: Record "Purchases & Payables Setup";
        DimMgt: Codeunit DimensionManagement;
        PurchReleaseDocs: Codeunit "Release Purchase Document";
        Committment: Codeunit "Procurement Processing";


    procedure RequisitionReview(var TempRequisitionLine: Record "Purchase Line")
    var
        RequisitionLine: Record "Purchase Line";
        UserSetup: Record "User Setup";
        PurchaseHeader: Record "Purchase Header";
        LineNo: Integer;
        LastVendorProcessed: Code[20];
        DocNo: Code[20];
        LastReqDocNoProcessed: Code[20];
    begin
        PurchSetup.Get;
        begin
            RequisitionLine.SetCurrentkey(RequisitionLine."Document Type", RequisitionLine."Document No.", RequisitionLine."Line No.");
            RequisitionLine.CopyFilters(TempRequisitionLine);
            //CALCFIELDS("Requisition Status");
            RequisitionLine.SetRange(RequisitionLine.Select2, true);
            RequisitionLine.SetFilter(RequisitionLine."Buy-from Vendor No.", '<>%1', '');
            RequisitionLine.SetFilter(RequisitionLine.Decision, '<>%1', RequisitionLine.Decision::Order);
            RequisitionLine.SetFilter(RequisitionLine.Quantity, '<>0');

            UserSetup.Get(UserId);
            /*
            IF NOT FINDFIRST() THEN BEGIN
              MESSAGE(SNText01);
              EXIT;
            END;
            */
            Window.Open('#1#################################\\' +
                        'Processing Purchase Doc #2######################\' +
                        'New Vendor No.          #3######################\' +
                        'Detail Line No.         #4######################');

            //Create New Purchase Quote
            LineNo := 0;
            LastVendorProcessed := '';
            LastReqDocNoProcessed := '';
            DocNo := '';
            RequisitionLine.SetRange(RequisitionLine.Decision, RequisitionLine.Decision::Order);
            if RequisitionLine.FindSet(true, false) then begin
                Window.Update(1, RequisitionLine.Decision);
                repeat
                    CreateNewPurchaseDocument(RequisitionLine, PurchaseHeader."document type"::Order, DocNo, LineNo,
                                              LastVendorProcessed, LastReqDocNoProcessed);
                    RequisitionLine.Decision := RequisitionLine.Decision::Order;
                    RequisitionLine."Buy-from Vendor No." := '';
                    //"Previous Status" := Status;
                    //Status := Status::"5";
                    RequisitionLine.Modify;

                until RequisitionLine.Next = 0;
            end;

            Window.Close;
        end;

    end;


    procedure CreateNewPurchaseDocument(var RequisitionLine: Record "Purchase Line"; DocumentType: Option Quote,"Order",,,"Blanket Order"; var DocumentNo: Code[20]; var LineNo: Integer; var LastVendorProcessed: Code[20]; var LastReqDocNoProcessed: Code[20])
    var
        PurchaseHeader: Record "Purchase Header";
        PurchaseLine: Record "Purchase Line";
        RequisitionHeader: Record "Purchase Header";
        Vendor: Record Vendor;
        PRN: Record "Purchase Header";
    begin
        begin
            if LastVendorProcessed = RequisitionLine."Buy-from Vendor No." then begin
                LineNo := LineNo + 10000;
                PurchaseHeader.Get(DocumentType, DocumentNo);

            end else begin
                if Vendor.Get(RequisitionLine."Buy-from Vendor No.") then
                    PurchSetup.Get;
                PurchaseHeader.Init;
                PurchaseHeader."Document Type" := PurchaseHeader."document type"::Order;
                PurchaseHeader."PO Type" := RequisitionLine."PO Type";
                PurchaseHeader."Vendor Order No." := RequisitionLine."Document No.";
                PurchaseHeader."Purchase Requisition No." := RequisitionLine."Document No.";
                PurchaseHeader.Insert(true);
                PurchaseHeader.Validate(PurchaseHeader."No.");
                PurchaseHeader.Validate(PurchaseHeader."Buy-from Vendor No.", RequisitionLine."Buy-from Vendor No.");
                //VALIDATE("Purchaser Code",RequisitionLine."Purchaser Code");
                PurchaseHeader.Validate(PurchaseHeader."Posting Date", Today);
                PurchaseHeader.Validate(PurchaseHeader."Document Date", Today);
                //RequisitionHeader.GET(RequisitionLine."Document No.");
                PurchaseHeader.Validate(PurchaseHeader."Shortcut Dimension 1 Code", RequisitionLine."Shortcut Dimension 1 Code");
                PurchaseHeader.Validate(PurchaseHeader."Shortcut Dimension 2 Code", RequisitionLine."Shortcut Dimension 2 Code");
                //VALIDATE("Shortcut Dimension 3 Code", RequisitionLine."Shortcut Dimension Code");
                //Do the Other Dimensions
                //Other Dimensions
                PurchaseHeader.Validate(PurchaseHeader."Dimension Set ID", RequisitionLine."Dimension Set ID");
                if RequisitionHeader."Sell-to Customer No." <> '' then begin
                    PurchaseHeader.Validate(PurchaseHeader."Sell-to Customer No.", RequisitionHeader."Sell-to Customer No.");
                    PurchaseHeader.Validate(PurchaseHeader."Ship-to Code", RequisitionHeader."Ship-to Code");
                end;
                if RequisitionLine."Location Code" <> '' then
                    PurchaseHeader.Validate(PurchaseHeader."Location Code", RequisitionLine."Location Code");
                PurchaseHeader."Prices Including VAT" := RequisitionHeader."Prices Including VAT";
                PurchaseHeader.Validate(PurchaseHeader."Currency Code", RequisitionLine."Currency Code");
                PurchaseHeader.Modify;
                // added by daudi decommit prn
                PRN.Reset;
                PRN.SetRange("No.", RequisitionLine."Document No.");
                if PRN.FindSet then
                    Committment.ReverseLPOCommittment(PRN);
                Committment.LPOCommittment(PurchaseHeader);

                Window.Update(2, StrSubstNo('%1 %2', PurchaseHeader."Document Type", PurchaseHeader."No."));
                Window.Update(3, Format(RequisitionLine."Buy-from Vendor No."));
                LastVendorProcessed := RequisitionLine."Buy-from Vendor No.";
                LineNo := 10000;
            end;

            PurchaseLine.Init;
            PurchaseLine.Validate(PurchaseLine."Document Type", PurchaseHeader."Document Type");
            PurchaseLine.Validate(PurchaseLine."Document No.", PurchaseHeader."No.");
            PurchaseLine.Validate(PurchaseLine.Type, RequisitionLine.Type);

            DocumentNo := PurchaseHeader."No.";



            RequisitionLineTOPurchaseLine(PurchaseLine, RequisitionLine, LineNo, false);
            PurchaseLine.Validate("Direct Unit Cost", RequisitionLine."Direct Unit Cost");
            if LastReqDocNoProcessed <> RequisitionLine."Document No." then begin
                //RequisitionCommentCopy(RequisitionLine."Document No.",DocumentType,DocumentNo);
                if ISSERVICETIER then begin
                    PurchaseHeader.CopyLinks(RequisitionHeader);
                end;
                LastReqDocNoProcessed := RequisitionLine."Document No.";
            end;
        end;

        Window.Update(4, PurchaseLine."Line No.");
        PurchaseLine.Insert(true);

        //RequisitionLine."Document No." := PurchaseLine."Document No.";
        //RequisitionLine."Line No." := PurchaseLine."Line No.";
        //RequisitionLine.Processed:=TRUE;
        //RequisitionLine."Action Date" := WORKDATE;
        //RequisitionLine.MODIFY;
    end;


    procedure RequisitionLineTOPurchaseLine(var PurchaseLine: Record "Purchase Line"; RequisitionLine: Record "Purchase Line"; LineNo: Integer; AppendToOrder: Boolean)
    var
        PurchaseHeader: Record "Purchase Header";
        CurrExchRate: Record "Currency Exchange Rate";
        Committments: Codeunit "Procurement Processing";
    begin
        PurchaseHeader.Get(PurchaseLine."Document Type", PurchaseLine."Document No.");

        begin
            PurchaseLine.Init;
            PurchaseLine."Document Type" := PurchaseHeader."Document Type";
            PurchaseLine."Document No." := PurchaseHeader."No.";
            PurchaseLine."Line No." := LineNo;
            if not AppendToOrder then
                PurchaseLine.Validate(PurchaseLine."Buy-from Vendor No.", RequisitionLine."Buy-from Vendor No.");
            //**
            PurchaseLine.Validate(PurchaseLine.Type, RequisitionLine.Type);
            PurchaseLine.Validate(PurchaseLine."No.", RequisitionLine."No.");
            if PurchaseLine.Type = PurchaseLine.Type::Item then
                PurchaseLine.Validate(PurchaseLine."Location Code", RequisitionLine."Location Code");
            PurchaseLine."Expected Receipt Date" := RequisitionLine."Expected Receipt Date";
            PurchaseLine.Description := RequisitionLine.Description;
            PurchaseLine."Description 2" := RequisitionLine."Description 2";
            //budget committments
            PurchaseLine."Procurement Plan" := RequisitionLine."Procurement Plan";
            PurchaseLine."Procurement Plan Item" := RequisitionLine."Procurement Plan Item";






            PurchaseLine."Vote Item" := RequisitionLine."Vote Item";
            PurchaseLine."Vote Amount" := RequisitionLine."Vote Amount";
            PurchaseLine."Budget Commitments" := RequisitionLine."Budget Commitments";
            PurchaseLine."Actual To Date" := RequisitionLine."Actual To Date";
            PurchaseLine."Available Funds" := RequisitionLine."Available Funds";
            PurchaseLine."Available Funds" := RequisitionLine."Available Funds";
            //"Last Issued By":=RequisitionLine.Narration;
            PurchaseLine.Validate(PurchaseLine."Unit of Measure Code", RequisitionLine."Unit of Measure Code");
            if RequisitionLine."Approved Unit Cost" <> 0 then
                PurchaseLine.Validate(PurchaseLine."Direct Unit Cost", RequisitionLine."Approved Unit Cost")
            else
                PurchaseLine.Validate(PurchaseLine."Direct Unit Cost", RequisitionLine."Direct Unit Cost");
            PurchaseLine.Validate(PurchaseLine.Quantity, RequisitionLine.Quantity);
            //IF PurchaseHeader."Currency Code" = RequisitionLine."Currency Code" THEN
            begin
                PurchaseLine.Validate(PurchaseLine."Direct Unit Cost", RequisitionLine."Direct Unit Cost");
                PurchaseLine.Validate(PurchaseLine."Line Discount %", RequisitionLine."Line Discount %");
                PurchaseLine.Validate(PurchaseLine."Currency Code", RequisitionLine."Currency Code");
            end;
            //ELSE BEGIN
            //VALIDATE("Currency Code",PurchaseHeader."Currency Code");
            //PurchaseLine.VALIDATE("Direct Unit Cost",
            // CurrExchRate.ExchangeAmtFCYToFCY(PurchaseHeader."Posting Date",RequisitionLine."Currency Code",
            //PurchaseHeader."Currency Code",RequisitionLine."Direct Unit Cost"));
            //VALIDATE("Line Discount %",RequisitionLine."Line Discount %");
            //END;
            PurchaseLine.Validate(PurchaseLine."Shortcut Dimension 2 Code", RequisitionLine."Shortcut Dimension 2 Code");
            PurchaseLine.Validate(PurchaseLine."Job No.", RequisitionLine."Job No.");
            PurchaseLine.Validate(PurchaseLine."Transaction Type", RequisitionLine."Transaction Type");
            PurchaseLine.Validate(PurchaseLine."Tax Group Code", RequisitionLine."Tax Group Code");
            if PurchaseLine.Type = PurchaseLine.Type::Item then PurchaseLine.Validate(PurchaseLine."Variant Code", RequisitionLine."Variant Code");
            PurchaseLine."Unit of Measure Code" := RequisitionLine."Unit of Measure";
            PurchaseLine."Gen. Bus. Posting Group" := RequisitionLine."Gen. Bus. Posting Group";
            PurchaseLine."Gen. Prod. Posting Group" := RequisitionLine."Gen. Prod. Posting Group";

        end;
    end;


    procedure CreateDim(DocLine: Record "Purchase Line"; Type1: Integer; No1: Code[20]; Type2: Integer; No2: Code[20]; Type3: Integer; No3: Code[20]; Type4: Integer; No4: Code[20]; Type5: Integer; No5: Code[20])
    var
        TableID: array[10] of Integer;
        No: array[10] of Code[20];
    begin
        /*
        Options.GET;
        Options.TESTFIELD(Options."Journal Source Code");
        TableID[1] := Type1;
        No[1] := No1;
        TableID[2] := Type2;
        No[2] := No2;
        TableID[3] := Type3;
        No[3] := No3;
        TableID[4] := Type4;
        No[4] := No4;
        TableID[5] := Type5;
        No[5] := No5;
        DocLine."Dimension Set ID" :=
          DimMgt.GetDefaultDimID(
            TableID,No,Options."Journal Source Code",DocLine."Shortcut Dimension 1 Code",DocLine."Shortcut Dimension 2 Code",0,0);
        */

    end;


    procedure ChangeDocHeaderStatus(DocHeaderNo: Code[20])
    var
        DocHeader: Record "Purchase Header";
        DocLines: Record "Purchase Line";
        DocFullyProcessed: Boolean;
    begin
        //DocFullyProcessed := TRUE;

        DocLines.Reset;
        DocLines.SetRange(DocLines.Select2, true);
        DocLines.SetRange(DocLines."Document No.", DocHeaderNo);
        if DocLines.Find('-') then begin
            repeat
                Message('%1', DocHeaderNo);
                DocLines."Ordered by" := UserId;
                DocLines."Order Creation date" := Today;
                DocLines."Order Creation Time" := Time;
                DocLines.Ordered := true;
                DocLines.Select2 := false;
            until DocLines.Next = 0;
        end;
    end;


    procedure MaintanceReview(var TempRequisitionLine: Record "Fuel & Maintenance Requisition")
    var
        RequisitionLine: Record "Fuel & Maintenance Requisition";
        UserSetup: Record "User Setup";
        PurchaseHeader: Record "Purchase Header";
        LineNo: Integer;
        LastVendorProcessed: Code[20];
        DocNo: Code[20];
        LastReqDocNoProcessed: Code[20];
    begin
        PurchSetup.Get;
        begin
            RequisitionLine.SetCurrentkey(RequisitionLine."Requisition No");
            RequisitionLine.CopyFilters(TempRequisitionLine);
            UserSetup.Get(UserId);

            Window.Open('#1#################################\\' +
                        'Processing Purchase Doc #2######################\' +
                        'New Vendor No.          #3######################\' +
                        'Detail Line No.         #4######################');

            //Create New Purchase Quote
            LineNo := 0;
            LastVendorProcessed := '';
            LastReqDocNoProcessed := '';
            DocNo := '';
            //SETRANGE(Decision,Decision::Order);
            if RequisitionLine.FindSet(true, false) then begin
                //Window.UPDATE(1, Decision);
                repeat
                    CreateNewPurchaseDocumentM(RequisitionLine, PurchaseHeader."document type"::Order, DocNo, LineNo,
                                              LastVendorProcessed, LastReqDocNoProcessed);


                    RequisitionLine.Modify;

                until RequisitionLine.Next = 0;
            end;

            Window.Close;
        end;
    end;


    procedure CreateNewPurchaseDocumentM(var RequisitionLine: Record "Fuel & Maintenance Requisition"; DocumentType: Option Quote,"Order",,,"Blanket Order"; var DocumentNo: Code[20]; var LineNo: Integer; var LastVendorProcessed: Code[20]; var LastReqDocNoProcessed: Code[20])
    var
        PurchaseHeader: Record "Purchase Header";
        PurchaseLine: Record "Purchase Line";
        RequisitionHeader: Record "Purchase Header";
        Vendor: Record Vendor;
    begin
        begin
            if LastVendorProcessed = RequisitionLine."Vendor(Dealer)" then begin
                LineNo := LineNo + 10000;
                PurchaseHeader.Get(DocumentType, DocumentNo);

            end else begin
                if Vendor.Get(RequisitionLine."Vendor(Dealer)") then
                    PurchSetup.Get;
                PurchaseHeader.Init;
                PurchaseHeader."Document Type" := PurchaseHeader."document type"::Order;
                PurchaseHeader."PO Type" := PurchaseHeader."po type"::LSO;
                PurchaseHeader."Vendor Order No." := RequisitionLine."Requisition No";
                PurchaseHeader."Purchase Requisition No." := RequisitionLine."Requisition No";
                PurchaseHeader.Insert(true);
                PurchaseHeader.Validate(PurchaseHeader."No.");
                PurchaseHeader.Validate(PurchaseHeader."Buy-from Vendor No.", RequisitionLine."Vendor(Dealer)");
                //VALIDATE("Purchaser Code",RequisitionLine."Purchaser Code");
                PurchaseHeader.Validate(PurchaseHeader."Posting Date", Today);
                PurchaseHeader.Validate(PurchaseHeader."Document Date", Today);
                //RequisitionHeader.GET(RequisitionLine."Document No.");
                //VALIDATE("Shortcut Dimension 1 Code", RequisitionLine."Shortcut Dimension 1 Code"); Ask
                //VALIDATE("Shortcut Dimension 2 Code", RequisitionLine."Shortcut Dimension 2 Code");Ask
                //VALIDATE("Shortcut Dimension 3 Code", RequisitionLine."Shortcut Dimension Code");
                //Do the Other Dimensions
                //Other Dimensions
                //VALIDATE(PurchaseHeader."Dimension Set ID",RequisitionLine."Dimension Set ID");Ask
                if RequisitionHeader."Sell-to Customer No." <> '' then begin
                    PurchaseHeader.Validate(PurchaseHeader."Sell-to Customer No.", RequisitionHeader."Sell-to Customer No.");
                    PurchaseHeader.Validate(PurchaseHeader."Ship-to Code", RequisitionHeader."Ship-to Code");
                end;

                PurchaseHeader.Modify;

                Window.Update(2, StrSubstNo('%1 %2', PurchaseHeader."Document Type", PurchaseHeader."No."));
                Window.Update(3, Format(RequisitionLine."Vendor(Dealer)"));
                LastVendorProcessed := RequisitionLine."Vendor(Dealer)";
                LineNo := 10000;
            end;

            PurchaseLine.Init;
            PurchaseLine.Validate(PurchaseLine."Document Type", PurchaseHeader."Document Type");
            PurchaseLine.Validate(PurchaseLine."Document No.", PurchaseHeader."No.");
            //PurchaseLine.VALIDATE(PurchaseLine.Type,RequisitionLine.Type);

            DocumentNo := PurchaseHeader."No.";
            MaintananceTOPurchaseLine(PurchaseLine, RequisitionLine, LineNo, false);
            //PurchaseLine.VALIDATE("Direct Unit Cost",RequisitionLine."Direct Unit Cost");
            if LastReqDocNoProcessed <> RequisitionLine."Requisition No" then begin
                //RequisitionCommentCopy(RequisitionLine."Document No.",DocumentType,DocumentNo);
                if ISSERVICETIER then begin
                    PurchaseHeader.CopyLinks(RequisitionHeader);
                end;
                LastReqDocNoProcessed := RequisitionLine."Requisition No";
            end;
        end;

        Window.Update(4, PurchaseLine."Line No.");
        PurchaseLine.Insert(true);
        //RequisitionLine."Document No." := PurchaseLine."Document No.";
        //RequisitionLine."Line No." := PurchaseLine."Line No.";
        //RequisitionLine.Processed:=TRUE;
        //RequisitionLine."Action Date" := WORKDATE;
        //RequisitionLine.MODIFY;
    end;


    procedure MaintananceTOPurchaseLine(var PurchaseLine: Record "Purchase Line"; RequisitionLine: Record "Fuel & Maintenance Requisition"; LineNo: Integer; AppendToOrder: Boolean)
    var
        PurchaseHeader: Record "Purchase Header";
        CurrExchRate: Record "Currency Exchange Rate";
    begin
        PurchaseHeader.Get(PurchaseLine."Document Type", PurchaseLine."Document No.");

        begin

            PurchaseLine.Init;
            PurchaseLine."Document Type" := PurchaseHeader."Document Type";
            PurchaseLine."Document No." := PurchaseHeader."No.";
            PurchaseLine."Line No." := LineNo;
            if not AppendToOrder then
                PurchaseLine.Type := PurchaseLine.Type::"G/L Account";
            PurchaseLine."No." := RequisitionLine."G/L Account";
            PurchaseLine.Validate(PurchaseLine."No.");
            PurchaseLine."Expected Receipt Date" := Today;

            PurchaseLine.Description := RequisitionLine."G/L Account Name";
            PurchaseLine."Description 2" := RequisitionLine.Description;

            PurchaseLine.Quantity := 1;
            //ELSE BEGIN
            //VALIDATE("Currency Code",PurchaseHeader."Currency Code");
            //PurchaseLine.VALIDATE("Direct Unit Cost",
            // CurrExchRate.ExchangeAmtFCYToFCY(PurchaseHeader."Posting Date",RequisitionLine."Currency Code",
            //PurchaseHeader."Currency Code",RequisitionLine."Direct Unit Cost"));
            //VALIDATE("Line Discount %",RequisitionLine."Line Discount %");
            //END;
            //VALIDATE("Shortcut Dimension 2 Code", RequisitionLine."Shortcut Dimension 2 Code");Ask
            /*
             venRec.RESET;
            venRec.GET("Buy-from Vendor No.");
            "Gen. Bus. Posting Group" := venRec."Gen. Bus. Posting Group";
            */
        end;

    end;
}
