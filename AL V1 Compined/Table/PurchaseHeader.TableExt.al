#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
TableExtension 50007 tableextension50007 extends "Purchase Header"
{
    fields
    {
        modify("Document Type")
        {
            OptionCaption = 'Quote,Order,Invoice,Credit Memo,Blanket Order,Return Order,Store Requisition,Purchase Requisition,,,,,,IEC Materials';

            //Unsupported feature: Property Modification (OptionString) on ""Document Type"(Field 1)".

        }

        //Unsupported feature: Property Modification (Data type) on ""Posting Description"(Field 22)".

        modify(Status)
        {
            OptionCaption = 'Open,Released,Pending Approval,Pending Prepayment,In Progress';

            //Unsupported feature: Property Modification (OptionString) on "Status(Field 120)".


            //Unsupported feature: Property Modification (Editable) on "Status(Field 120)".

        }
        modify("Assigned User ID")
        {
            TableRelation = "User Setup" where("Procurement officer" = const(true));
        }

        //Unsupported feature: Code Insertion on "Status(Field 120)".

        //trigger OnValidate()
        //Parameters and return type have not been exported.
        //begin
        /*
        {IF Status=Status::Released THEN BEGIN
        IF ("Document Type"="Document Type"::"Purchase Requisition") OR ("Document Type"="Document Type"::Order) THEN BEGIN
          Commitment.LPOCommittment(Rec);
        END;
        END;}
        */
        //end;
        field(50000; Copied; Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(50001; "Debit Note"; Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(50002; "Fully Issued"; Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(50003; "Partially Issued"; Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(50004; "Cancelled?"; Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(50005; "Project?"; Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(50006; "Send To PM"; Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(50007; "Sent By"; Code[50])
        {
            DataClassification = ToBeClassified;
            TableRelation = User;
        }
        field(50008; "Sending Date"; Date)
        {
            DataClassification = ToBeClassified;
        }
        field(50009; "Store No"; Code[20])
        {
            DataClassification = ToBeClassified;
            //  TableRelation = Table0.Field12143624;

            trigger OnValidate()
            begin
                /*
                StoreReqLines.RESET;
                StoreReqLines.SETRANGE(StoreReqLines."Requistion No","Store No");
                IF StoreReqLines.FIND('-') THEN
                BEGIN
                //Find Purchase Lines
                PurchaseLine.RESET;
                PurchaseLine.SETRANGE(PurchaseLine."Document No.","No.");
                //PurchaseLine.SETRANGE(PurchaseLine."Document Type",PurchaseLine."Document Type"::Quote);
                IF PurchaseLine.FIND('-') THEN
                BEGIN
                PurchaseLine.DELETEALL;
                  REPEAT
                    LineNo:=LineNo+1000;
                    PurchaseLine.INIT;
                    PurchaseLine."Line No.":=LineNo;
                    PurchaseLine."Document No.":="No.";
                    PurchaseLine."No.":=StoreReqLines."No.";
                    PurchaseLine."Document Type":=PurchaseLine."Document Type"::Quote;
                    PurchaseLine.Description:=StoreReqLines.Description;
                    PurchaseLine.Quantity:=StoreReqLines.Quantity;
                    PurchaseLine."Unit of Measure":=StoreReqLines."Unit of Measure";
                    PurchaseLine.INSERT;
                  UNTIL StoreReqLines.NEXT=0;
                END ELSE
                BEGIN
                    MESSAGE('NOT FOUND');
                
                  REPEAT
                    LineNo:=LineNo+10000;
                    PurchaseLine.INIT;
                    PurchaseLine."Line No.":=LineNo;
                    PurchaseLine."Document No.":="No.";
                    PurchaseLine."No.":=StoreReqLines."No.";
                    PurchaseLine."Document Type":=PurchaseLine."Document Type"::Quote;
                    PurchaseLine.Description:=StoreReqLines.Description;
                    PurchaseLine.Quantity:=StoreReqLines.Quantity;
                    PurchaseLine."Unit of Measure":=StoreReqLines."Unit of Measure";
                
                    PurchaseLine.INSERT;
                  UNTIL StoreReqLines.NEXT=0;
                
                  END;
                
                END;
                
                */

            end;
        }
        field(50010; Replenishment; Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(50011; Description; Text[250])
        {
            DataClassification = ToBeClassified;

            trigger OnValidate()
            begin
                //Ushindi///
                TestField(Status, Status::Open);
            end;
        }
        field(50012; "Requisition Type"; Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = ' ,Internal Use,Project,Stock Replenishment,Technical Installation,Technical Maintenance,Stock Return';
            OptionMembers = " ","Internal Use",Project,"Stock Replenishment","Technical Installation","Technical Maintenance","Stock Return";

            trigger OnValidate()
            begin

                TestField(Status, Status::Open);
                PurchLine.Reset;
                PurchLine.SetRange(PurchLine."Document Type", PurchLine."document type"::"Store Requisition");
                PurchLine.SetRange(PurchLine."Document No.", "No.");

                if PurchLine.FindFirst then begin
                    Error('You must first delete the Requsisition lines below.Please check!!');
                end;

                /*
                //Ensure CTW IRs are either Internal use or Return only..
                //Ushindi...
                IF "ChargeToWork?"=TRUE THEN BEGIN
                 IF ("Requisition Type"<>"Requisition Type"::"Internal Use") AND   ("Requisition Type"<>"Requisition Type"::"Stock Return")
                 THEN ERROR('CTW Requisitions can only be of either Type Internal Use or Return, Please check!');
                
                END;
                //End ..Ushindi
                
                */

            end;
        }
        field(50013; "Taken By"; Code[60])
        {
            DataClassification = ToBeClassified;
        }
        field(50014; "Department Name"; Code[100])
        {
            CalcFormula = lookup("Dimension Value".Name where(Code = field("Shortcut Dimension 1 Code")));
            Editable = false;
            FieldClass = FlowField;
        }
        field(50015; "Project Name"; Code[60])
        {
            CalcFormula = lookup("Dimension Value".Name where(Code = field("Shortcut Dimension 2 Code")));
            Editable = false;
            FieldClass = FlowField;
        }
        field(50016; "Valid to Date"; Date)
        {
            DataClassification = ToBeClassified;

            trigger OnValidate()
            var
                UserSetup: Record "User Setup";
            begin
                /*
               //CMM 271008 CHECK RIGHTS TO CHANGE VALIDITY DATE
                  IF ("Valid to Date" <> xRec."Valid to Date") AND (xRec."Valid to Date"<>0D) THEN BEGIN
                     IF UserSetup.GET(USERID)  THEN
                         IF UserSetup."Extend Purch. Quote/LPO Period" <> TRUE THEN
                           ERROR('You do not have suuficient rights to change the validity date');
                  END;
               //END CMM
                 */

            end;
        }
        field(50017; "Request-By No."; Code[10])
        {
            DataClassification = ToBeClassified;
            Editable = false;
            TableRelation = Employee."No.";

            trigger OnValidate()
            var
                Text003: Label 'You cannot rename a %1.';
                ConfirmChangeQst: Label 'Do you want to change %1?', Comment = '%1 = a Field Caption like Currency Code';
                Text005: Label 'You cannot reset %1 because the document still has one or more lines.';
                YouCannotChangeFieldErr: Label 'You cannot change %1 because the order is associated with one or more sales orders.', Comment = '%1 - fieldcaption';
                Text007: Label '%1 is greater than %2 in the %3 table.\';
                Text008: Label 'Confirm change?';
                Text009: Label 'Deleting this document will cause a gap in the number series for receipts. An empty receipt %1 will be created to fill this gap in the number series.\\Do you want to continue?', Comment = '%1 = Document No.';
                Text012: Label 'Deleting this document will cause a gap in the number series for posted invoices. An empty posted invoice %1 will be created to fill this gap in the number series.\\Do you want to continue?', Comment = '%1 = Document No.';
                Text014: Label 'Deleting this document will cause a gap in the number series for posted credit memos. An empty posted credit memo %1 will be created to fill this gap in the number series.\\Do you want to continue?', Comment = '%1 = Document No.';
                RecreatePurchLinesMsg: Label 'If you change %1, the existing purchase lines will be deleted and new purchase lines based on the new information in the header will be created.\\Do you want to continue?', Comment = '%1: FieldCaption';
                ResetItemChargeAssignMsg: Label 'If you change %1, the existing purchase lines will be deleted and new purchase lines based on the new information in the header will be created.\The amount of the item charge assignment will be reset to 0.\\Do you want to continue?', Comment = '%1: FieldCaption';
                LinesNotUpdatedMsg: Label 'You have changed %1 on the purchase header, but it has not been changed on the existing purchase lines.', Comment = 'You have changed Posting Date on the purchase header, but it has not been changed on the existing purchase lines.';
                LinesNotUpdatedDateMsg: Label 'You have changed the %1 on the purchase order, which might affect the prices and discounts on the purchase order lines.', Comment = '%1: OrderDate';
                Text020: Label 'You must update the existing purchase lines manually.';
                AffectExchangeRateMsg: Label 'The change may affect the exchange rate that is used for price calculation on the purchase lines.';
                Text022: Label 'Do you want to update the exchange rate?';
                Text023: Label 'You cannot delete this document. Your identification is set up to process from %1 %2 only.';
                Text025: Label 'You have modified the %1 field. Note that the recalculation of VAT may cause penny differences, so you must check the amounts afterwards. ';
                Text027: Label 'Do you want to update the %2 field on the lines to reflect the new value of %1?';
                Text028: Label 'Your identification is set up to process from %1 %2 only.';
                MaxAllowedValueIs100Err: Label 'The values must be less than or equal 100.';
                Text029: Label 'Deleting this document will cause a gap in the number series for return shipments. An empty return shipment %1 will be created to fill this gap in the number series.\\Do you want to continue?', Comment = '%1 = Document No.';
                DoYouWantToKeepExistingDimensionsQst: Label 'This will change the dimension specified on the document. Do you want to keep the existing dimensions?';
                Text032: Label 'You have modified %1.\\Do you want to update the lines?', Comment = 'You have modified Currency Factor.\\Do you want to update the lines?';
                ReviewLinesManuallyMsg: Label 'You should review the lines and manually update prices and discounts if needed.';
                UpdateLinesOrderDateAutomaticallyQst: Label 'Do you want to update the order date for existing lines?';
                GLSetup: Record "General Ledger Setup";
                GLAcc: Record "G/L Account";
                xPurchLine: Record "Purchase Line";
                VendLedgEntry: Record "Vendor Ledger Entry";
                Vend: Record Vendor;
                PaymentTerms: Record "Payment Terms";
                PaymentMethod: Record "Payment Method";
                CurrExchRate: Record "Currency Exchange Rate";
                Cust: Record Customer;
                CompanyInfo: Record "Company Information";
                PostCode: Record "Post Code";
                BankAcc: Record "Bank Account";
                PurchRcptHeader: Record "Purch. Rcpt. Header";
                PurchInvHeader: Record "Purch. Inv. Header";
                PurchCrMemoHeader: Record "Purch. Cr. Memo Hdr.";
                ReturnShptHeader: Record "Return Shipment Header";
                PurchInvHeaderPrepmt: Record "Purch. Inv. Header";
                PurchCrMemoHeaderPrepmt: Record "Purch. Cr. Memo Hdr.";
                GenBusPostingGrp: Record "Gen. Business Posting Group";
                RespCenter: Record "Responsibility Center";
                Location: Record Location;
                WhseRequest: Record "Warehouse Request";
                InvtSetup: Record "Inventory Setup";
                GenJournalTemplate: Record "Gen. Journal Template";
                NoSeries: Record "No. Series";
                SalespersonPurchaser: Record "Salesperson/Purchaser";
                NoSeriesMgt: Codeunit "No. Series";
                DimMgt: Codeunit DimensionManagement;
                ApprovalsMgmt: Codeunit "Approvals Mgmt.";
                UserSetupMgt: Codeunit "User Setup Management";
                LeadTimeMgt: Codeunit "Lead-Time Management";
                PostingSetupMgt: Codeunit PostingSetupManagement;
                StandardCodesMgtGlobal: Codeunit "Standard Codes Mgt.";
                ApplicationAreaMgmt: Codeunit "Application Area Mgmt.";
                CurrencyDate: Date;
                Confirmed: Boolean;
                Text034: Label 'You cannot change the %1 when the %2 has been filled in.';
                Text037: Label 'Contact %1 %2 is not related to vendor %3.';
                Text038: Label 'Contact %1 %2 is related to a different company than vendor %3.';
                Text039: Label 'Contact %1 %2 is not related to a vendor.';
                Text040: Label 'You can not change the %1 field because %2 %3 has %4 = %5 and the %6 has already been assigned %7 %8.';
                Text042: Label 'You must cancel the approval process if you wish to change the %1.';
                Text045: Label 'Deleting this document will cause a gap in the number series for prepayment invoices. An empty prepayment invoice %1 will be created to fill this gap in the number series.\\Do you want to continue?';
                Text046: Label 'Deleting this document will cause a gap in the number series for prepayment credit memos. An empty prepayment credit memo %1 will be created to fill this gap in the number series.\\Do you want to continue?';
                Text049: Label '%1 is set up to process from %2 %3 only.';
                Text050: Label 'Reservations exist for this order. These reservations will be canceled if a date conflict is caused by this change.\\Do you want to continue?';
                Text051: Label 'You may have changed a dimension.\\Do you want to update the lines?';
                Text052: Label 'The %1 field on the purchase order %2 must be the same as on sales order %3.';
                ReplaceDocumentDate: Boolean;
                UpdateDocumentDate: Boolean;
                PrepaymentInvoicesNotPaidErr: Label 'You cannot post the document of type %1 with the number %2 before all related prepayment invoices are posted.', Comment = 'You cannot post the document of type Order with the number 1001 before all related prepayment invoices are posted.';
                StatisticsInsuffucientPermissionsErr: Label 'You don''t have permission to view statistics.';
                Text054: Label 'There are unpaid prepayment invoices that are related to the document of type %1 with the number %2.';
                DeferralLineQst: Label 'You have changed the %1 on the purchase header, do you want to update the deferral schedules for the lines with this date?', Comment = '%1=The posting date on the document.';
                PostedDocsToPrintCreatedMsg: Label 'One or more related posted documents have been generated during deletion to fill gaps in the posting number series. You can view or print the documents from the respective document archive.';
                BuyFromVendorTxt: Label 'Buy-from Vendor';
                PayToVendorTxt: Label 'Pay-to Vendor';
                DocumentNotPostedClosePageQst: Label 'The document has been saved but is not yet posted.\\Are you sure you want to exit?';
                SelectNoSeriesAllowed: Boolean;
                MixedDropshipmentErr: Label 'You cannot print the purchase order because it contains one or more lines for drop shipment in addition to regular purchase lines.';
                ModifyVendorAddressNotificationLbl: Label 'Update the address';
                DontShowAgainActionLbl: Label 'Don''t show again';
                ModifyVendorAddressNotificationMsg: Label 'The address you entered for %1 is different from the Vendor''s existing address.', Comment = '%1=Vendor name';
                ModifyBuyFromVendorAddressNotificationNameTxt: Label 'Update Buy-from Vendor Address';
                ModifyBuyFromVendorAddressNotificationDescriptionTxt: Label 'Warn if the Buy-from address on purchase documents is different from the Vendor''s existing address.';
                ModifyPayToVendorAddressNotificationNameTxt: Label 'Update Pay-to Vendor Address';
                ModifyPayToVendorAddressNotificationDescriptionTxt: Label 'Warn if the Pay-to address on purchase documents is different from the Vendor''s existing address.';
                PurchaseAlreadyExistsTxt: Label 'Purchase %1 %2 already exists for this vendor.', Comment = '%1 = Document Type; %2 = Document No.';
                ShowVendLedgEntryTxt: Label 'Show the vendor ledger entry.';
                ShowDocAlreadyExistNotificationNameTxt: Label 'Purchase document with same external document number already exists.';
                ShowDocAlreadyExistNotificationDescriptionTxt: Label 'Warn if purchase document with same external document number already exists.';
                DuplicatedCaptionsNotAllowedErr: Label 'Field captions must not be duplicated when using this method. Use UpdatePurchLinesByFieldNo instead.';
                SplitMessageTxt: Label '%1\%2', Comment = 'Some message text 1.\Some message text 2.';
                FullPurchaseTypesTxt: Label 'Purchase Quote,Purchase Order,Purchase Invoice,Purchase Credit Memo,Purchase Blanket Order,Purchase Return Order';
                RecreatePurchaseLinesCancelErr: Label 'Change in the existing purchase lines for the field %1 is cancelled by user.', Comment = '%1 - Field Name, Sample:You must delete the existing purchase lines before you can change Currency Code.';
                WarnZeroQuantityPostingTxt: Label 'Warn before posting Purchase lines with 0 quantity';
                WarnZeroQuantityPostingDescriptionTxt: Label 'Warn before posting lines on Purchase documents where quantity is 0.';
                CalledFromWhseDoc: Boolean;

            begin


                //CAW 240908 EALAYER
                Empl.Get("Request-By No.");
                "Request-By Name" := Empl.FullName;
                "Shortcut Dimension 1 Code" := Empl."Global Dimension 1 Code";
                "Shortcut Dimension 2 Code" := Empl."Global Dimension 2 Code";


                TestField(Status, Status::Open);
                if ("Request-By No." <> xRec."Request-By No.") and
                 (xRec."Request-By No." <> '')
                 then begin
                    if HideValidationDialog then
                        Confirmed := true
                    else
                        Confirmed := Confirm(ConfirmChangeQst, false, FieldCaption("Request-By No."));

                    if Confirmed then begin
                        PurchLine.SetRange("Document Type", "Document Type");
                        PurchLine.SetRange("Document No.", "No.");
                        if "Request-By No." = '' then begin
                            if not PurchLine.IsEmpty then begin
                                Error(
                                Text005,
                                FieldCaption("Request-By No."));
                                Init;
                                PurchSetup.Get;
                                "No. Series" := xRec."No. Series";
                                InitRecord;
                            end;

                            if xRec."Posting No." <> '' then begin
                                "Posting No. Series" := xRec."Posting No. Series";
                                "Posting No." := xRec."Posting No.";
                            end;

                            if ("Document Type" = "document type"::"Store Requisition") or ("Document Type" = "document type"::"IEC Materials") then
                                PurchLine.SetFilter("Qty. Requested", '<>0');
                        end;

                        PurchLine.Reset;

                    end else begin
                        Rec := xRec;
                        exit;

                    end;
                end;
            end;
        }
        field(50018; "Request-By Name"; Text[50])
        {
            Editable = false;
        }
        field(50019; "Requester ID"; Code[50])
        {
            DataClassification = ToBeClassified;
            Editable = true;
            TableRelation = User."User Name";
            //This property is currently not supported
            //TestTableRelation = false;
            ValidateTableRelation = false;
        }
        field(50020; "Purchase Requisition No."; Code[20])
        {
            DataClassification = ToBeClassified;
            Enabled = false;
        }
        field(50021; "Created Quotes"; Integer)
        {
            DataClassification = ToBeClassified;
        }
        field(50022; "Store Requisition No."; Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(50023; "Budgeted  Name"; Code[10])
        {
            DataClassification = ToBeClassified;
            TableRelation = "G/L Budget Name";
        }
        field(50024; "Requisition Expense Group"; Code[10])
        {
            Caption = 'Requisition Expense Group';
            DataClassification = ToBeClassified;
            Description = '//Track IR Expense A/C---Used to map to Inv Adj A/c...Ushindi';
            TableRelation = "Gen. Business Posting Group" where("Auto Link Internal Requisition" = const(TRUE));

            trigger OnValidate()
            begin
                /*
                IF ("Document Type" = "Document Type"::"Store Requisition") OR ("Document Type"="Document Type"::"IEC Materials")  THEN BEGIN
                  IF GenBusPostingGrp.ValidateVatBusPostingGroup(GenBusPostingGrp,"Gen. Bus. Posting Group") THEN BEGIN
                    "VAT Bus. Posting Group" := GenBusPostingGrp."Def. VAT Bus. Posting Group";
                    RecreatePurchLines(FIELDCAPTION("Gen. Bus. Posting Group"));
                     END;
                     END;
                
                   //Ushindi...Ensure any existing IR lines have to be deleted before changing expense group
                 TESTFIELD(Status,Status::Open);
                PurchLine.RESET;
                PurchLine.SETRANGE(PurchLine."Document Type",PurchLine."Document Type"::"Store Requisition");
                PurchLine.SETRANGE(PurchLine."Document No.","No.");
                
                IF PurchLine.FINDFIRST THEN BEGIN
                ERROR('You must first delete the Requsisition lines before updating the Expense Group.Please check!!');
                END;
                
                //Ushindi..>Ensure Gen Business PG is initialized as the Expense Category
                "Gen. Bus. Posting Group":="Requisition Expense Group";
                VALIDATE("Gen. Bus. Posting Group");
                //Ushindi
                
                //All other purchase documents need vendor gen business posting grp validation
                IF "Document Type" <> "Document Type"::"Store Requisition"  THEN BEGIN
                IF (xRec."Buy-from Vendor No." = "Buy-from Vendor No.") AND
                   (xRec."Gen. Bus. Posting Group" <> "Gen. Bus. Posting Group")
                THEN
                  IF GenBusPostingGrp.ValidateVatBusPostingGroup(GenBusPostingGrp,"Gen. Bus. Posting Group") THEN BEGIN
                    "VAT Bus. Posting Group" := GenBusPostingGrp."Def. VAT Bus. Posting Group";
                    RecreatePurchLines(FIELDCAPTION("Gen. Bus. Posting Group"));
                  END;
                  END;
                
                //
                */

            end;
        }
        field(50025; "ChargeToWork?"; Boolean)
        {
            DataClassification = ToBeClassified;
            Description = '//Track CTW IRs....Ushindi';

            trigger OnValidate()
            begin

                /*
                //Ushindi changes.....21st Jan 2015

               //Ensure all CTW IRs have the relevant CTW Expense Group
               TESTFIELD("Requisition Expense Group");
               //CTW IR should not be linked to Stock Replenishment IR Type
               IF "Requisition Type"="Requisition Type"::"Stock Replenishment"
               THEN ERROR('Charge To Work IRs can not be tied to Stock Replenishment Type, Please check!');
                */

            end;
        }
        field(50027; "Beneficiary Name"; Text[30])
        {
            DataClassification = ToBeClassified;
        }
        field(50028; "Beneficiary Address"; Text[30])
        {
            DataClassification = ToBeClassified;
        }
        field(50029; "Beneficiary Address 2"; Text[20])
        {
            DataClassification = ToBeClassified;
        }
        field(50030; "Beneficiary City"; Text[30])
        {
            DataClassification = ToBeClassified;
        }
        field(50031; "IR External Document No"; Code[35])
        {
            DataClassification = ToBeClassified;
            Description = 'Track External Doc No';
        }
        field(50061; "PO Type"; Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = ' ,LSO,LPO';
            OptionMembers = " ",LSO,LPO;
        }
        field(50069; "Vote Item"; Code[20])
        {
            DataClassification = ToBeClassified;
            Editable = false;
            TableRelation = "G/L Account";
        }
        field(50070; "Vote Amount"; Decimal)
        {
            CalcFormula = lookup("G/L Budget Entry".Amount where("G/L Account No." = field("Vote Item")));
            Editable = false;
            FieldClass = FlowField;
        }
        field(50072; "Budget Commitments"; Decimal)
        {
            CalcFormula = average("Purchase Line"."Budget Commitments" where("Document No." = field("No.")));
            Editable = false;
            FieldClass = FlowField;
        }
        field(51001; "Inspection Team Setup?"; Boolean)
        {
            CalcFormula = exist("Goods & Services Inspection" where("No." = field("No."),
                                                                     "Vendor Shipment No." = field("Vendor Shipment No.")));
            Editable = false;
            FieldClass = FlowField;
        }
        field(51002; "Inspection Completed?"; Boolean)
        {
            CalcFormula = - exist("Goods & Services Inspection" where("No." = field("No."),
                                                                      Decision = filter(" " | Rejected),
                                                                      "Vendor Shipment No." = field("Vendor Shipment No.")));
            Editable = false;
            FieldClass = FlowField;
        }
        field(59000; "Contract No."; Code[25])
        {
            DataClassification = ToBeClassified;
        }
        field(59001; "Contract Name"; Text[30])
        {
            DataClassification = ToBeClassified;
        }
        field(59009; "Sending Time"; Time)
        {
            DataClassification = ToBeClassified;
        }
        field(59021; "Job Task No."; Code[20])
        {
            Caption = 'Job Task No.';
            DataClassification = ToBeClassified;
            TableRelation = "Job Task"."Job Task No." where("Job No." = field(Job),
                                                             "Job Task Type" = const(Posting),
                                                             "Directorate Code" = const('DIRECTORATE CODE'),
                                                             "Department Code" = const('DEPARTMENT CODE'));

            trigger OnValidate()
            begin
                /*
                TESTFIELD("Receipt No.",'');
                
                IF "Job Task No." <> xRec."Job Task No." THEN BEGIN
                  VALIDATE("Job Planning Line No.",0);
                  IF "Document Type" = "Document Type"::Order THEN
                    TESTFIELD("Quantity Received",0);
                END;
                
                IF "Job Task No." = '' THEN BEGIN
                  CLEAR(JobJnlLine);
                  "Job Line Type" := "Job Line Type"::" ";
                  UpdateJobPrices;
                  EXIT;
                END;
                
                JobSetCurrencyFactor;
                IF JobTaskIsSet THEN BEGIN
                  CreateTempJobJnlLine(TRUE);
                  UpdateJobPrices;
                END;
                UpdateDimensionsFromJobTask;
                
                */

                TaskRec.Reset;
                TaskRec.SetRange("Job No.", Job);
                TaskRec.SetRange("Job Task No.", "Job Task No.");
                if TaskRec.Find('-') then begin
                    TaskRec.CalcFields("Schedule (Total Cost)", "Remaining (Total Cost)", "Usage (Total Cost)", TaskRec.Commitments);
                    // "Job Task Name":=TaskRec.Description;
                    "Job Task Budget" := TaskRec."Schedule (Total Cost)";
                    "Job Task Remaining Amount" := TaskRec."Schedule (Total Cost)" - (TaskRec."Usage (Total Cost)" + TaskRec.Commitments);
                end;

            end;
        }
        field(59024; "Budget Item"; Code[20])
        {
            CalcFormula = lookup("Purchase Line"."Vote Item" where("Document No." = field("No.")));
            Caption = 'Job No.';
            Editable = false;
            FieldClass = FlowField;
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


                /*
                IF Jobs.GET("Budget Item") THEN BEGIN
                Jobs.CALCFIELDS(Jobs."Recog. Costs G/L Amount",Jobs."Actual Project Costs");
                
                IF Harvest=TRUE THEN
                "Total Project Cost":=Jobs."Actual Project Costs";
                END;
                */

            end;
        }
        field(59025; "Buget Desc"; Text[50])
        {
            CalcFormula = lookup("G/L Account".Name where("No." = field("Budget Item")));
            FieldClass = FlowField;
        }
        field(59030; "Budgeted Amount"; Decimal)
        {
            CalcFormula = average("Purchase Line"."Vote Amount" where("Document No." = field("No.")));
            Description = '//daudi changed for schedule to Budget as per the new structure';
            Editable = false;
            FieldClass = FlowField;
        }
        field(59031; "Actual Budget Costs"; Decimal)
        {
            CalcFormula = average("Purchase Line"."Actual To Date" where("Document No." = field("No.")));
            Editable = false;
            FieldClass = FlowField;
        }
        field(59033; "Available Funds"; Decimal)
        {
            CalcFormula = average("Purchase Line"."Available Funds" where("Document No." = field("No.")));
            FieldClass = FlowField;
        }
        field(59034; "Requisition Amount"; Decimal)
        {
            CalcFormula = sum("Purchase Line"."Line Amount" where("Document Type" = field("Document Type"),
                                                                   "Document No." = field("No.")));
            Editable = false;
            FieldClass = FlowField;
        }
        field(59035; "Remaining Budget"; Decimal)
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(59036; "Required Date"; Date)
        {
            DataClassification = ToBeClassified;
        }
        field(59037; "Function Name"; Text[50])
        {
            DataClassification = ToBeClassified;
            Description = 'Stores the name of the function in the database';
        }
        field(59038; "Budget Center Name"; Text[45])
        {
            DataClassification = ToBeClassified;
            Description = 'Stores the name of the budget center in the database';
        }
        field(59039; "Store Requisition Type"; Option)
        {
            DataClassification = ToBeClassified;
            OptionMembers = " ",Item,"Minor Asset";
        }
        field(59040; "Shortcut Dimension 3 Code"; Code[20])
        {
            CaptionClass = '1,2,3';
            DataClassification = ToBeClassified;
            TableRelation = "Dimension Value".Code where("Global Dimension No." = const(3));

            trigger OnValidate()
            begin
                //ValidateShortcutDimCode(3,"Shortcut Dimension 3 Code");
            end;
        }
        field(59041; "Unit  Name"; Code[100])
        {
            CalcFormula = lookup("Dimension Value".Name where(Code = field("Shortcut Dimension 3 Code")));
            Editable = false;
            FieldClass = FlowField;
        }
        field(59042; "Total Project Cost"; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(59043; Harvest; Boolean)
        {
            DataClassification = ToBeClassified;

            trigger OnValidate()
            begin
                //VALIDATE("Budget Item");
            end;
        }
        field(59044; "Procurement Type"; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = table;
        }
        field(59045; "Contract Number"; Code[25])
        {
            DataClassification = ToBeClassified;
        }
        field(59046; "Date received"; Date)
        {
            DataClassification = ToBeClassified;
        }
        field(59047; "Approved Requisition Amount"; Decimal)
        {
            CalcFormula = sum("Purchase Line"."Line Amount" where("Document No." = field("No.")));
            Editable = false;
            FieldClass = FlowField;
        }
        field(69013; "Order types"; Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = 'LPO,LSO';
            OptionMembers = LPO,LSO;
        }
        field(69020; "Reason to reopen"; Text[20])
        {
            DataClassification = ToBeClassified;
        }
        field(69021; "Reason to Cancel"; Text[20])
        {
            DataClassification = ToBeClassified;
        }
        field(69022; "Order Number"; Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(70000; Committed; Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(70001; CommittedBy; Code[30])
        {
            DataClassification = ToBeClassified;
        }
        field(70002; "Procurement Plan"; Code[10])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Procurement Header".No;
        }
        field(70003; "Procurement Plan Item"; Code[10])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Procurement Plan 1"."Plan Item No" where("Plan Year" = field("Procurement Plan"));

            trigger OnValidate()
            begin
                PlanItem.Reset;
                PlanItem.SetRange("Plan Item No", "Procurement Plan Item");
                if PlanItem.Find('-') then
                    "Procurement Plan Item Descript" := PlanItem."Item Description";
            end;
        }
        field(70004; "Request Ref No"; Code[10])
        {
            DataClassification = ToBeClassified;
        }
        field(70005; "Supplier Type"; Code[30])
        {
            DataClassification = ToBeClassified;
        }
        field(70006; "Process Type"; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Procurement Method".Code;

            trigger OnValidate()
            begin

                PurchSetup.Get; //"Max Low Value Proc Amount"

                if "Process Type" <> '' then
                    if Confirm(Text0061, true, "Process Type") then begin
                        if ProcCeiling.Get("Purchase Type") then begin
                            CalcFields(Amount);
                            if Amount > ProcCeiling."Maximum Ceiling" then
                                Error(Text0059, "Process Type", ProcCeiling."Maximum Ceiling");

                            if Amount < ProcCeiling."Minimum Ceiling" then
                                Error(Text0060, "Process Type", ProcCeiling."Minimum Ceiling");
                        end;


                    end
                    else
                        "Process Type" := '';
            end;
        }
        field(70007; "Purchase Type"; Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Purchases Types";
        }
        field(70008; "Requisition No"; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Purchase Header" where("Document Type" = const("Purchase Requisition"));

            trigger OnValidate()
            begin
                if "Requisition No" <> '' then begin
                    RequisitionLines.Reset;
                    RequisitionLines.SetRange(RequisitionLines."Requisition No", "Requisition No");
                    if RequisitionLines.Find('-') then
                        //"Activity Type":=RequisitionLines."Activity Type";
                        // Activity:=RequisitionLines.Activity;
                        repeat
                            PurchLine."Document Type" := PurchLine."document type"::Order;
                            PurchLine."Document No." := "No.";


                            PurchLine.Reset;
                            PurchLine.SetRange(PurchLine."Document No.", "No.");
                            if PurchLine.Find('+') then
                                PurchLine."Line No." := PurchLine."Line No." + 10000;

                            if RequisitionLines.Type = RequisitionLines.Type::"G/L Account" then
                                PurchLine.Type := PurchLine.Type::"G/L Account"
                            else
                                PurchLine.Type := RequisitionLines.Type;

                            PurchLine."No." := RequisitionLines."No.";
                            PurchLine.Validate(PurchLine."No.");
                            PurchLine."Buy-from Vendor No." := "Buy-from Vendor No.";
                            PurchLine."Gen. Bus. Posting Group" := "Gen. Bus. Posting Group";
                            PurchLine."VAT Bus. Posting Group" := "VAT Bus. Posting Group";
                            // PurchLine."VAT Prod. Posting Group" := ;
                            PurchLine."Pay-to Vendor No." := "Pay-to Vendor No.";
                            PurchLine.Description := RequisitionLines.Description;
                            PurchLine.Quantity := RequisitionLines.Quantity;
                            PurchLine."Unit of Measure" := RequisitionLines."Unit of Measure";
                            PurchLine."Shortcut Dimension 1 Code" := RequisitionLines."Shortcut Dimension 1 Code";
                            PurchLine."Shortcut Dimension 2 Code" := RequisitionLines."Shortcut Dimension 2 Code";

                            // PurchLine."Unit Price (LCY)":=RequisitionLines."Unit Price";
                            // PurchLine.Amount:=RequisitionLines.Amount;
                            PurchLine.Insert;
                        until RequisitionLines.Next = 0;
                end;
            end;
        }
        field(70009; Ordered; Boolean)
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(70010; HOD; Boolean)
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(70014; "Department Code"; Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Responsibility Center" where("Operating Unit Type" = const(Department),
                                                           "Direct Reports To" = field("Directorate Code"));
        }
        field(70018; "Directorate Code"; Code[50])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Responsibility Center" where("Operating Unit Type" = const(Directorate));
        }
        field(70019; Division; Code[50])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Responsibility Center" where("Operating Unit Type" = const("Division/Section"),
                                                           "Direct Reports To" = field("Department Code"));
        }
        field(70020; Job; Code[50])
        {
            DataClassification = ToBeClassified;
            TableRelation = Job;

            trigger OnValidate()
            var
                JobRec: Record Job;
            begin
                if JobRec.Get(Job) then begin
                    "Job Name" := JobRec.Description;
                    Approver := JobRec."Project Manager";

                end;
            end;
        }
        field(70021; "Job Name"; Text[250])
        {
            DataClassification = ToBeClassified;
        }
        field(70022; Approver; Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = "User Setup";
        }
        field(70023; "Supplier Code"; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = Vendor;

            trigger OnValidate()
            begin
                if Vend.Get("Supplier Code") then
                    Supplier := Vend.Name;
            end;
        }
        field(70024; Supplier; Text[100])
        {
            DataClassification = ToBeClassified;
        }
        field(70025; Specifications; Text[250])
        {
            DataClassification = ToBeClassified;
        }
        field(70026; "Item Category"; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Item Category".Code where(Indentation = const(0));

            trigger OnValidate()
            begin
                /*ItemCategory.RESET;
                ItemCategory.SETRANGE("Item No","Item Category Description");
                IF ItemCategory.FIND('-') THEN
                  "Item Category Description":=ItemCategory.Description;*/

            end;
        }
        field(70027; "General Item Category"; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "General Item Categories".Code;
        }
        field(70028; "Archive Requisitions"; Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(70029; "Commitments."; Decimal)
        {
            CalcFormula = sum("Commitment Entries1".Amount where(Job = field(Job),
                                                                  "Job Task No" = field("Job Task No."),
                                                                  Type = const(Committed)));
            Editable = false;
            FieldClass = FlowField;
        }
        field(70030; "Job Task Budget"; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(70031; "Job Task Remaining Amount"; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(70032; "Planned Commencement Date"; Date)
        {
            DataClassification = ToBeClassified;
        }
        field(70033; "Priority Level"; Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = ',Low,Normal,High,Critical';
            OptionMembers = ,Low,Normal,High,Critical;
        }
        field(70034; "Works Length (Km)"; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(70035; Region; Code[50])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Responsibility Center" where("Operating Unit Type" = const(Region));
        }
        field(70036; "Funding Agency"; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Funding Agency";
        }
        field(70037; "Funding Source"; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Funding Source";
        }
        field(70038; "Solicitation Type"; Code[30])
        {
            DataClassification = ToBeClassified;
        }
        field(70040; "Requisition Product Group"; Option)
        {
            DataClassification = ToBeClassified;
            Description = 'New field used to categorize the Items further into Goods, Works, Services and Assets. NB: In most organizations, the Works, Services and Assets shall be setup under TYPE:SERVICE';
            OptionCaption = 'Goods,Services,Works,Assets';
            OptionMembers = Goods,Services,Works,Assets;
        }
        field(70041; "IFS Linked"; Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(70042; "Requisition Template ID"; Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Purchase Requisition Template".Code;
        }
        field(70043; "PRN Type"; Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = 'Standard,Project Works';
            OptionMembers = Standard,"Project Works";
        }
        field(70044; "Project Staffing Template ID"; Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Project Key Staff Template".Code;
        }
        field(70045; "Works Equipment Template ID"; Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Works Equipment Template".Code;
        }
        field(70046; "Procurement Plan ID"; Code[10])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Procurement Plan".Code;
        }
        field(70047; "Procurement Plan Entry No"; Integer)
        {
            DataClassification = ToBeClassified;
            TableRelation = if ("PRN Type" = const(Standard)) "Procurement Plan Entry"."Entry No." where("Procurement Plan ID" = field("Procurement Plan ID"),
                                                                                                        "Requisition Product Group" = field("Requisition Product Group"),
                                                                                                        Region = field(Region),
                                                                                                        Directorate = field("Directorate Code"),
                                                                                                        Department = field("Department Code"),
                                                                                                        "Procurement Use" = const("Standard (Internal Use)"))
            else if ("PRN Type" = const("Project Works")) "Procurement Plan Entry"."Entry No." where("Procurement Plan ID" = field("Procurement Plan ID"),
                                                                                                                                                                                                "Requisition Product Group" = field("Requisition Product Group"),
                                                                                                                                                                                                Region = field(Region),
                                                                                                                                                                                                Directorate = field("Directorate Code"),
                                                                                                                                                                                                Department = field("Department Code"),
                                                                                                                                                                                                "Procurement Use" = const("Project-Specific Use"));

            trigger OnValidate()
            begin
                PPlanEntry.Reset;
                PPlanEntry.SetRange(PPlanEntry."Entry No.", "Procurement Plan Entry No");
                if PPlanEntry.Find('-') then begin
                    PPlanEntry.CalcFields("Total Purchase Commitments");
                    "PP Planning Category" := PPlanEntry."Planning Category";
                    "Procurement Plan Item Descript" := PPlanEntry.Description;
                    "PP Funding Source ID" := PPlanEntry."Funding Source ID";
                    "PP Total Budget" := PPlanEntry."Line Budget Cost";
                    "PP Total Actual Costs" := PPlanEntry."Total Actual Costs";
                    "PP Total Commitments" := PPlanEntry."Total Purchase Commitments";
                    "PP Solicitation Type" := PPlanEntry."Solicitation Type";
                    "PP Procurement Method" := PPlanEntry."Procurement Method";
                    "PP Preference/Reservation Code" := PPlanEntry."Preference/Reservation Code";
                    Job := PPlanEntry."Budget Control Job No";
                    "Budget Item" := PPlanEntry."Budget Control Job No";
                    Message(Job);
                    "Job Task No." := PPlanEntry."Budget Control Job Task No.";
                    Message('job No %1 job task no', Job, "Job Task No.");
                    "PP  Invitation Notice Type" := PPlanEntry."Invitation Notice Type";

                    SoliType.Reset;
                    SoliType.SetRange(Code, PPlanEntry."Solicitation Type");
                    if SoliType.FindSet then begin
                        "PP Bid Selection Method" := SoliType."Default Bid Selection Method";
                    end;
                end;
                Validate("Job Task No.");
            end;
        }
        field(70048; "PP Planning Category"; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Procurement Plan Entry"."Planning Category";
        }
        field(70049; "PP Funding Source ID"; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Procurement Plan Entry"."Funding Source ID";
        }
        field(70050; "PP Total Budget"; Decimal)
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(70051; "PP Total Actual Costs"; Decimal)
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(70052; "PP Total Commitments"; Decimal)
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(70053; "PP Total Available Budget"; Decimal)
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(70054; "PP Solicitation Type"; Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Solicitation Type".Code;
        }
        field(70055; "PP Procurement Method"; Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = ',Open Tender,RFQ,RFP,Two-Stage Tender,Design Competition Tender,Restricted Tender,Direct Procurement,Low Value Procurement,Force Account,Framework Agreement,Reverse Auction';
            OptionMembers = ,"Open Tender",RFQ,RFP,"Two-Stage Tender","Design Competition Tender","Restricted Tender","Direct Procurement","Low Value Procurement","Force Account","Framework Agreement","Reverse Auction";
        }
        field(70056; "PP Preference/Reservation Code"; Code[10])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Special Vendor Category".Code;
        }
        field(70057; "PRN Conversion Procedure"; Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = 'Invitation For Supply,Direct PO';
            OptionMembers = "Invitation For Supply","Direct PO";
        }
        field(70058; "Ordered PRN"; Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(70059; "Linked IFS No."; Code[30])
        {
            DataClassification = ToBeClassified;
        }
        field(70060; "Linked LPO No."; Code[30])
        {
            DataClassification = ToBeClassified;
        }
        field(70061; "Works Category"; Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Works Category".Code;

            trigger OnValidate()
            begin
                WorksCategory.Reset;
                WorksCategory.SetRange(Code, "Works Category");
                if WorksCategory.FindSet then
                    "Works Description" := WorksCategory.Description;
            end;
        }
        field(70062; "Works Description"; Text[100])
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(70063; "Total PRN Amount"; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(70064; "Total PRN Amount (LCY)"; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(70065; "PP  Invitation Notice Type"; Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = ',Single  Stage Tender,Two Stage Tender,RFQ,Low Value Procurement';
            OptionMembers = ,"Single  Stage Tender","Two Stage Tender",RFQ,"Low Value Procurement";
        }
        field(70066; "PP Bid Selection Method"; Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(70067; "PRN Order Date/Time"; DateTime)
        {
            DataClassification = ToBeClassified;
        }
        field(70068; "Document Status"; Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = 'Draft,Submitted,Withdrawn,Opened,Evaluation,Awarded,Lost,Cancelled';
            OptionMembers = Draft,Submitted,Withdrawn,Opened,Evaluation,Awarded,Lost,Cancelled;
        }
        field(70069; "Bidder Type"; Option)
        {
            DataClassification = ToBeClassified;
            Description = 'Bid Response';
            OptionCaption = 'Single Entity,Joint Venture';
            OptionMembers = "Single Entity","Joint Venture";
        }
        field(70070; "Joint Venture Partner"; Text[50])
        {
            DataClassification = ToBeClassified;
        }
        field(70071; "Invitation For Supply No"; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Standard Purchase Code".Code;

            trigger OnValidate()
            var
                CompanyInfo: record "Company Information";
                vend: record vendor;
            begin
                //Procurement.UpdateBidResponseFromITT(Rec);
                IFS.Reset;
                IFS.SetRange(Code, "Invitation For Supply No");
                if IFS.FindSet then begin
                    //Purch.INIT;
                    "Document Type" := "document type"::Quote;
                    "Invitation Notice Type" := IFS."Invitation Notice Type";
                    "Bid Envelope Type" := IFS."Bid Envelop Type";
                    "Tender Description" := IFS."Tender Summary";
                    "Responsibility Center" := IFS."Responsibility Center";
                    Validate("Location Code", IFS."Location Code");
                    "Language Code" := IFS."Language Code";
                    Validate("Purchaser Code", IFS."Purchaser Code");
                    "Currency Code" := IFS."Currency Code";
                    "IFS Code" := "Invitation For Supply No";
                    "Bid Charge Code" := IFS."Bid Charge Code";
                    "Bid Charge (LCY)" := IFS."Bid Charge (LCY)";
                    "Works Category" := IFS."Works Category";
                    "Engineer Estimate (LCY)" := IFS."Engineer Estimate (LCY)";
                    "Max Works Completion Duration" := IFS."Max Works Completion Duration";
                    "Max Works Kickoff Duration" := IFS."Max Works Kickoff Duration";
                    "Max Works Charter Duration" := IFS."Max Works Charter Duration";
                    Validate("Payment Terms Code", IFS."Payment Terms Code");
                    "Defects Liability Period" := IFS."Defects Liability Period";
                    "Daily Liquidated Dam Unit Cost" := IFS."Daily Liquidated Dam Unit Cost";
                    "Liquidated Damages Limit %" := IFS."Liquidated Damages Limit %";
                    "Payment Retention %" := IFS."Payment Retention %";
                    "Retention Amount Limit %" := IFS."Retention Amount Limit %";
                    "Min Interim Certificate Amount" := IFS."Min Interim Certificate Amount";
                    CompanyInfo.Get;
                    "Procuring Entity (PE) Name" := CompanyInfo.Name;

                    PurchLines.Reset;
                    PurchLines.SetRange("Document No.", "No.");
                    if PurchLines.FindSet then begin
                        PurchLines.DeleteAll;
                    end;

                    IFSLines.Reset;
                    IFSLines.SetRange("Standard Purchase Code", "Invitation For Supply No");
                    if IFSLines.FindSet then begin
                        repeat

                            PurchLines.Init;
                            PurchLines."Document Type" := PurchLines."document type"::Quote;
                            PurchLines."Document No." := "No.";
                            PurchLines."Line No." := IFSLines."Line No.";
                            PurchLines."Buy-from Vendor No." := "Vendor No.";
                            PurchLines.Type := IFSLines.Type;
                            PurchLines."No." := IFSLines."No.";
                            //PurchLines."Location Code":=IFSLines.
                            //PurchLines."Posting Group":=IFSLines
                            PurchLines.Description := IFSLines.Description;
                            PurchLines."Description 2" := IFSLines.Description;
                            //PurchLines."Unit of Measure":=IFSLines."Unit of Measure Code";
                            //PurchLines.VALIDATE(PurchLines.Quantity,IFSLines.Quantity);
                            PurchLines.Quantity := IFSLines.Quantity;
                            PurchLines.Amount := IFSLines."Amount Excl. VAT";
                            PurchLines."Unit of Measure Code" := IFSLines."Unit of Measure Code";
                            PurchLines."Shortcut Dimension 1 Code" := IFSLines."Shortcut Dimension 2 Code";
                            PurchLines."Shortcut Dimension 2 Code" := IFSLines."Shortcut Dimension 2 Code";
                            PurchLines."Variant Code" := IFSLines."Variant Code";
                            PurchLines."Dimension Set ID" := IFSLines."Dimension Set ID";
                            PurchLines."Item Category" := IFSLines."Item Category";
                            PurchLines.Insert(true);

                        until IFSLines.Next = 0;
                    end;

                end;
            end;
        }
        field(70072; "Invitation Notice Type"; Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = ',Single  Stage Tender,Two Stage Tender,RFQ,Low Value Procurement';
            OptionMembers = ,"Single  Stage Tender","Two Stage Tender",RFQ,"Low Value Procurement";
        }
        field(70073; "Bid Envelope Type"; Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = '1-Envelope,2-Envelope';
            OptionMembers = "1-Envelope","2-Envelope";
        }
        field(70074; "Bid Seal Type"; Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = 'Sealed,Unsealed';
            OptionMembers = Sealed,Unsealed;
        }
        field(70075; "Tender Description"; Text[80])
        {
            DataClassification = ToBeClassified;
        }
        field(70076; "Bidder Representative Name"; Text[80])
        {
            DataClassification = ToBeClassified;
        }
        field(70077; "Bidder Representative Desgn"; Code[50])
        {
            Caption = 'Bidder Representative Designation';
            DataClassification = ToBeClassified;
            Description = 'Bidder Representative Designation';
        }
        field(70078; "Bidder Representative Address"; Text[100])
        {
            DataClassification = ToBeClassified;
        }
        field(70079; "Bidder Witness Name"; Text[80])
        {
            DataClassification = ToBeClassified;
        }
        field(70080; "Bidder Witness Designation"; Code[50])
        {
            DataClassification = ToBeClassified;
        }
        field(70081; "Bidder Witness Address"; Text[100])
        {
            DataClassification = ToBeClassified;
        }
        field(70082; "Tender Document Source"; Code[50])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Tender Document Source".Code;
        }
        field(70083; "Bid Charge Code"; Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Bid Charges Schedule".Code;

            trigger OnValidate()
            begin
                IFSfee.Reset;
                IFSfee.SetRange(Code, "Bid Charge Code");
                if IFSfee.FindSet then begin
                    "Bid Charge (LCY)" := IFSfee.Amount
                end;
            end;
        }
        field(70084; "Bid Charge (LCY)"; Decimal)
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(70085; "Payment Reference No."; Code[30])
        {
            DataClassification = ToBeClassified;
        }
        field(70086; "Posted Direct Income Voucher"; Code[30])
        {
            DataClassification = ToBeClassified;
        }
        field(70087; "Primary Region"; Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Responsibility Center" where("Operating Unit Type" = const(Region));
        }
        field(70088; "Primary Directorate"; Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Responsibility Center" where("Operating Unit Type" = const(Directorate));
        }
        field(70089; "Primary Department"; Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Responsibility Center".Code where("Operating Unit Type" = const(Department),
                                                                "Direct Reports To" = field("Primary Directorate"));
        }
        field(70090; "Primary Branch/Centre"; Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Responsibility Center" where("Operating Unit Type" = const(Branch));
        }
        field(70091; "Building/House No"; Text[50])
        {
            DataClassification = ToBeClassified;
        }
        field(70092; "Plot No"; Code[50])
        {
            DataClassification = ToBeClassified;
        }
        field(70093; Street; Text[50])
        {
            DataClassification = ToBeClassified;
        }
        field(70094; "Nature of Business"; Text[250])
        {
            DataClassification = ToBeClassified;
        }
        field(70095; "Current Trade Licence No"; Code[50])
        {
            DataClassification = ToBeClassified;
        }
        field(70096; "Trade Licence Expiry Date"; Date)
        {
            DataClassification = ToBeClassified;
        }
        field(70097; "Max Value of Business"; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(70098; "Preferred Bank Account Code"; Code[20])
        {
            Caption = 'Preferred Bank Account Code';
            DataClassification = ToBeClassified;
            TableRelation = "Vendor Bank Account".Code where("Vendor No." = field("Vendor No."));
        }
        field(70099; "Bankers Name"; Text[100])
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(70100; "Bankers Branch"; Text[100])
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(70101; "KNTC Agent"; Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(70102; "Business Type"; Code[30])
        {
            DataClassification = ToBeClassified;
            Description = 'Used to record the different Business Types based on Ownership categories such as Companies, Partnerships, Sole Ownership etc. Linked to Business Type Table';
            TableRelation = "Business Types".Code;
        }
        field(70103; "Nominal Capital LCY"; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(70104; "Issued Capital LCY"; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(70105; "Response is restricted"; Boolean)
        {
            Caption = 'Response is restricted to invited suppliers';
            DataClassification = ToBeClassified;
            Description = 'Response is restricted to invited suppliers';
        }
        field(70106; "Supplier to respond"; Boolean)
        {
            Caption = 'Supplier to respond with full quantity on each line';
            DataClassification = ToBeClassified;
            Description = 'Supplier to respond with full quantity on each line';
        }
        field(70107; "Procuring Entity can extend"; Boolean)
        {
            Caption = 'Procuring Entity can extend submission deadline through Addendum';
            DataClassification = ToBeClassified;
            Description = 'Procuring Entity can extend submission deadline through Addendum';
        }
        field(70108; "Procuring Entity can Cancel"; Boolean)
        {
            Caption = 'Procuring Entity can Cancel Invitation Notice at any stage';
            DataClassification = ToBeClassified;
            Description = 'Procuring Entity can Cancel Invitation Notice at any stage';
        }
        field(70109; "No. of Addendum Notices issued"; Integer)
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(70110; "Last Addendum Notice No."; Code[20])
        {
            CalcFormula = lookup("Tender Addendum Notice"."Addendum Notice No." where("Invitation Notice No." = field("Invitation For Supply No")));
            Editable = false;
            FieldClass = FlowField;
        }
        field(70111; "Read-out Bid Price (A)"; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(70112; "Arithmetic Corrections (B)"; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(70113; "Corrected Bid Price (C=A+B)"; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(70114; "Unconditional Discount % (D)"; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(70115; "Unconditional Disc Amount (E)"; Decimal)
        {
            Caption = 'Unconditional Discount Amount (E)';
            DataClassification = ToBeClassified;
            Description = 'Unconditional Discount Amount (E)';
        }
        field(70116; "Corrected & Disc Bid Price"; Decimal)
        {
            Caption = 'Corrected & Discounted Bid Price (F=C-E)';
            DataClassification = ToBeClassified;
            Description = 'Corrected & Discounted Bid Price (F=C-E)';
        }
        field(70117; "Any Additional Adjustments (G)"; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(70118; "Any Priced Deviations (H))"; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(70119; "Final Evaluated Bid Price"; Decimal)
        {
            Caption = 'Final Evaluated Bid Price (I=F+G+H)';
            DataClassification = ToBeClassified;
            Description = 'Final Evaluated Bid Price (I=F+G+H)';
        }
        field(70120; "Financial Evaluation Date"; Date)
        {
            DataClassification = ToBeClassified;
        }
        field(70121; "Weighted Financial Score %"; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(70122; "Financial Evaluation Ranking"; Code[30])
        {
            DataClassification = ToBeClassified;
        }
        field(70123; "Pre-bid Register No."; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "IFS Prebid Register".Code;
        }
        field(70124; "Attended Pre-bid Conference"; Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(70125; "Prebid Conference Date"; Date)
        {
            DataClassification = ToBeClassified;
        }
        field(70126; "Bid Opening Register No."; Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(70127; "Bid Opening Date"; Date)
        {
            DataClassification = ToBeClassified;
        }
        field(70128; "Late Bid (Opening Stage)"; Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(70129; "Withdrawn Bid (Opening Stage)"; Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(70130; "Withdrawal Notice No"; Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(70131; "Modified Bid (Opening Stage)"; Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(70132; "Succesful Bid (Opening Stage)"; Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(70133; "Preliminary Evaluation Date"; Date)
        {
            DataClassification = ToBeClassified;
        }
        field(70134; "Responsive Bid (Evaluation)"; Boolean)
        {
            Caption = 'Responsive Bid (Preliminary Evaluation)';
            DataClassification = ToBeClassified;
            Description = 'Responsive Bid (Preliminary Evaluation)';
        }
        field(70135; "Technical Evaluation Date"; Date)
        {
            DataClassification = ToBeClassified;
        }
        field(70136; "Weighted Tech Score %"; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(70137; "Passed Tech Evaluation"; Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(70138; "Tech Evaluation Ranking"; Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(70139; "Aggregate Weighted Score %"; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(70140; "Aggregate Ranking"; Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(70141; "Final Tender Outcome"; Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = ',Awarded,Unsuccesful,Canceled';
            OptionMembers = ,Awarded,Unsuccesful,Canceled;
        }
        field(70142; "Engineer Estimate (LCY)"; Decimal)
        {
            DataClassification = ToBeClassified;
            Description = 'This field is based on estimates for Works that usuallly guide bidders/contarctors in specialized industries such as Road construction';
        }
        field(70143; "Max Works Kickoff Duration"; Code[10])
        {
            Caption = 'Max Works Kickoff Duration (After Contract/Order)';
            DataClassification = ToBeClassified;
            Description = 'Max Works Kickoff Duration (After Contract/Order)';
        }
        field(70144; "Max Works Charter Duration"; Code[10])
        {
            Caption = 'Max Works Charter/Program Duration (After Contract/Order)';
            DataClassification = ToBeClassified;
            Description = 'Max Works Charter/Program Duration (After Contract/Order)';
        }
        field(70145; "Max Works Completion Duration"; Code[10])
        {
            Caption = 'Max Works Completion Duration (After Contract/Order';
            DataClassification = ToBeClassified;
            Description = 'Max Works Completion Duration (After Contract/Order';
        }
        field(70147; "Defects Liability Period"; Code[20])
        {
            DataClassification = ToBeClassified;
            Description = 'Defects Liability (Warranty) Period';
        }
        field(70148; "Daily Liquidated Dam Unit Cost"; Decimal)
        {
            Caption = 'Daily Liquidated Damages Unit Cost (LCY)';
            DataClassification = ToBeClassified;
            Description = 'Daily Liquidated Damages Unit Cost (LCY)';
        }
        field(70149; "Liquidated Damages Limit %"; Decimal)
        {
            Caption = 'Liquidated Damages Limit % (Contract Value)';
            DataClassification = ToBeClassified;
            Description = 'Liquidated Damages Limit % (Contract Value)';
            MaxValue = 100;
            MinValue = 0;
        }
        field(70150; "Payment Retention %"; Decimal)
        {
            DataClassification = ToBeClassified;
            MaxValue = 100;
            MinValue = 0;
        }
        field(70151; "Retention Amount Limit %"; Decimal)
        {
            Caption = 'Retention Amount Limit % (Contract Value)';
            DataClassification = ToBeClassified;
            Description = 'Retention Amount Limit % (Contract Value)';
            MaxValue = 100;
            MinValue = 0;
        }
        field(70152; "Min Interim Certificate Amount"; Decimal)
        {
            Caption = 'Minimum Interim Certificate Amount (LCY)';
            DataClassification = ToBeClassified;
        }
        field(70153; "Vendor No."; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = Vendor."No." where(Blocked = const(" "));

            trigger OnValidate()
            begin
                Validate("Buy-from Vendor No.", "Vendor No.");
                Vendor.Reset;
                Vendor.SetRange("No.", "Vendor No.");
                if Vendor.FindSet then begin
                    //Purch.INIT;
                    "Building/House No" := Vendor."Building/House No";
                    "Plot No" := Vendor."Plot No";
                    Street := Vendor.Street;
                    "Nature of Business" := Vendor."Nature of Business";
                    "Current Trade Licence No" := Vendor."Current Trade Licence No";
                    "Trade Licence Expiry Date" := Vendor."Trade Licence Expiry Date";
                    "Max Value of Business" := Vendor."Max Value of Business";
                    "Preferred Bank Account Code" := Vendor."Preferred Bank Account Code";
                    "Business Type" := Vendor."Business Type";
                    "Nominal Capital LCY" := Vendor."Nominal Capital LCY";
                    "Issued Capital LCY" := Vendor."Issued Capital LCY";

                end;

                Procurement.UpdateBidResponse(Rec);
            end;
        }
        field(70154; "Sealed Bids (Technical)"; Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(70155; "Sealed Bids (Financial)"; Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(70156; "Contract Description"; Text[250])
        {
            DataClassification = ToBeClassified;
        }
        field(70157; "Contract Start Date"; Date)
        {
            DataClassification = ToBeClassified;
        }
        field(70158; "Contract End Date"; Date)
        {
            DataClassification = ToBeClassified;
        }
        field(70159; "Notice of Award No."; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Bid Tabulation Header" where("Document Type" = filter("Notice of Award"));
        }
        field(70160; "Awarded Bid No"; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Purchase Header"."No." where("Document Type" = const(Quote));
        }
        field(70161; "Award Tender Sum Inc Taxes"; Decimal)
        {
            Caption = 'Award Tender Sum Inc Taxes (LCY)';
            DataClassification = ToBeClassified;
            Description = 'Award Tender Sum Inc Taxes (LCY)';
        }
        field(70162; "IFS Code"; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Standard Purchase Code".Code;
        }
        field(70163; "Tender Name"; Text[100])
        {
            DataClassification = ToBeClassified;
        }
        field(70164; "Contract Type"; Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = 'Original Contract,Contract Variation';
            OptionMembers = "Original Contract","Contract Variation";
        }
        field(70165; "Parent Contract ID"; Code[30])
        {
            DataClassification = ToBeClassified;
        }
        field(70166; "Governing Laws"; Text[80])
        {
            DataClassification = ToBeClassified;
        }
        field(70167; "Contract Status"; Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = 'Signed,Cancelled';
            OptionMembers = Signed,Cancelled;
        }
        field(70168; "Procuring Entity (PE) Name"; Text[80])
        {
            DataClassification = ToBeClassified;
        }
        field(70169; "PE Representative"; Text[80])
        {
            DataClassification = ToBeClassified;
        }
        field(70170; "Final Evaluation Report"; Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(70171; "Final Evaluation Report Date"; Date)
        {
            DataClassification = ToBeClassified;
        }
        field(70172; "Proffesion Opinion No"; Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(70173; "Proffesion Opinion Date"; Date)
        {
            DataClassification = ToBeClassified;
        }
        field(70174; "Due Dilgence Date"; Date)
        {
            DataClassification = ToBeClassified;
        }
        field(70175; "Due Diligence Rating"; Code[20])
        {
            DataClassification = ToBeClassified;
            Description = 'Due Diligence Assessment Rating';
        }
        field(70176; "Due Diligence Report ID"; Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = ',Pass,Fail';
            OptionMembers = ,Pass,Fail;
        }
        field(70177; "Due Diligence Voucher"; Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(8603700; Test; Code[5])
        {
            DataClassification = ToBeClassified;
        }
        field(8603701; "Procurement Plan Item Descript"; Text[250])
        {
            DataClassification = ToBeClassified;
        }
        field(8603702; "Item Category Description"; Text[250])
        {
            DataClassification = ToBeClassified;
        }
        field(8603703; "Archive Document"; Boolean)
        {
            DataClassification = ToBeClassified;

            trigger OnValidate()
            begin
                if Confirm('Are you sure you want to archive this Purchase Invoice No. ' + "No." + ' ?') = true then begin
                    Message('Document archived successfully');
                end;

            end;
        }
    }


    //Unsupported feature: Code Modification on "OnInsert".

    //trigger OnInsert()
    //>>>> ORIGINAL CODE:
    //begin
    /*
    InitInsert;

    IF GETFILTER("Buy-from Vendor No.") <> '' THEN
    #4..8

    IF "Buy-from Vendor No." <> '' THEN
      StandardCodesMgt.CheckShowPurchRecurringLinesNotification(Rec);
    */
    //end;
    //>>>> MODIFIED CODE:
    //begin
    /*
    #1..11
    IF UsersRec.GET(USERID) THEN BEGIN
      IF NOT UsersRec."Portal User" THEN BEGIN //exempt the portal user name
      "Requester ID":=USERID;
       "Request-By Name":=UsersRec."Employee Name";
       "Request-By No.":=UsersRec."Employee No.";
       END;
       END;
    //added on 28/06/2019 to add HOD
    Empl.RESET;
    Empl.SETRANGE("No.","Request-By No.");
    IF Empl.FIND('-') THEN BEGIN
      HOD := Empl.HOD;
      "Directorate Code":=Empl."Directorate Code";
      "Department Code":=Empl."Department Code";
     // "Shortcut Dimension 1 Code":=Empl."Global Dimension 1 Code";
      Division:=Empl.Division;
      "Shortcut Dimension 1 Code":=Empl."Global Dimension 1 Code";
      "Shortcut Dimension 2 Code":=Empl."Global Dimension 2 Code";
    END;
    //

    "Order Date":=TODAY;
    //Add Default procurement plan
    AnnualReportingCodes.RESET;
    AnnualReportingCodes.SETRANGE("Current Year",TRUE);
    IF AnnualReportingCodes.FINDSET THEN
     "Procurement Plan":=AnnualReportingCodes."Annual Procurement Plan";
    "Taken By":=PurchLine."Employee Name";
    */
    //end;


    //Unsupported feature: Code Modification on "OnRename".

    //trigger OnRename()
    //>>>> ORIGINAL CODE:
    //begin
    /*
    ERROR(Text003,TABLECAPTION);
    */
    //end;
    //>>>> MODIFIED CODE:
    //begin
    /*
     ERROR(Text003,TABLECAPTION);
    */
    //end;


    //Unsupported feature: Code Modification on "GetNoSeriesCode(PROCEDURE 9)".

    //procedure GetNoSeriesCode();
    //Parameters and return type have not been exported.
    //>>>> ORIGINAL CODE:
    //begin
    /*
    CASE "Document Type" OF
      "Document Type"::Quote:
        NoSeriesCode := PurchSetup."Quote Nos.";
    #4..10
        NoSeriesCode := PurchSetup."Credit Memo Nos.";
      "Document Type"::"Blanket Order":
        NoSeriesCode := PurchSetup."Blanket Order Nos.";
    END;
    OnAfterGetNoSeriesCode(Rec,PurchSetup,NoSeriesCode);
    EXIT(NoSeriesMgt.GetNoSeriesWithCheck(NoSeriesCode,SelectNoSeriesAllowed,"No. Series"));
    */
    //end;
    //>>>> MODIFIED CODE:
    //begin
    /*
    #1..13
      "Document Type"::"Purchase Requisition":
        NoSeriesCode := PurchSetup."Purchase Requisition Nos.";
       "Document Type"::"Store Requisition":
        NoSeriesCode := PurchSetup."Store Requisition Nos.";

    #14..16
    */
    //end;

    local procedure "........procurement Functions............"()
    begin
    end;

    procedure CreatePurchaseOrderProcMethodLines(var ProcReqLines: Record "Purchase Line")
    var
        PurchaseRec: Record "Purchase Header";
        PurchaseHeader: Record "Purchase Header";
        PurchaseLine: Record "Purchase Line";
        vend: record vendor;
        PurchaseRecLine: Record "Purchase Line";
        ProcReq: Record "Procurement Request";
        ProcReq1: Record "Procurement Request";
        ProcReqLines1: Record "Procurement Request Lines";
        ProcReqLines2: Record "Procurement Request Lines";
        Recordsupdated: Integer;
        GLSETUP: Record "General Ledger Setup";
    begin


        ProcReqLines2.Reset;
        ProcReqLines2.SetRange("Requisition No", ProcReqLines."Requisition No");
        ProcReqLines2.SetRange(Select, true);
        ProcReqLines2.SetRange(Ordered, false);
        ProcReqLines2.SetRange("Vendor No", ProcReqLines."Buy-from Vendor No.");
        if ProcReqLines2.Find('-') then begin

            //Purchase Header
            PurchaseHeader.Init;
            PurchaseHeader."Document Type" := PurchaseHeader."document type"::Order;
            PurchaseHeader."No." := '';
            PurchaseHeader."Buy-from Vendor No." := ProcReqLines2."Vendor No";
            PurchaseHeader.Validate(PurchaseHeader."Buy-from Vendor No.");
            if Vend.Get(ProcReqLines2."Vendor No") then
                PurchaseHeader."Supplier Type" := Vend."Supplier Type 1";

            ProcReq.Reset;
            ProcReq.SetRange(ProcReq.No, ProcReqLines2."Requisition No");
            if ProcReq.Find('-') then
                PurchaseHeader."Requisition No" := ProcReq."Requisition No";
            //IF NOT PurchaseHeader.GET(PurchaseHeader."No.") THEN
            PurchaseHeader.Insert(true);


            repeat
                //Purchase Lines
                PurchaseLine.Reset;
                PurchaseLine.SetRange(PurchaseLine."Document Type", PurchaseLine."document type"::Order);
                PurchaseLine.SetRange(PurchaseLine."Document No.", PurchaseHeader."No.");
                PurchaseLine.SetRange(PurchaseLine."Line No.", ProcReqLines2."Line No");
                PurchaseLine.SetRange(PurchaseLine."Buy-from Vendor No.", ProcReqLines2."Vendor No");
                if not PurchaseLine.FindFirst then begin
                    PurchaseLine.Init;
                    PurchaseLine."Document Type" := PurchaseLine."document type"::Order;
                    PurchaseLine."Document No." := PurchaseHeader."No.";
                    PurchaseLine."Line No." := ProcReqLines2."Line No";//PurchaseLine.VALIDATE(PurchaseLine."No.");
                    PurchaseLine."Buy-from Vendor No." := ProcReqLines2."Vendor No";

                    if ProcReqLines.Type = ProcReqLines2.Type::"Non Stock Item" then
                        PurchaseLine.Type := PurchaseLine.Type::"G/L Account";
                    if ProcReqLines.Type = ProcReqLines2.Type::"Fixed Asset" then
                        PurchaseLine.Type := PurchaseLine.Type::"Fixed Asset";
                    if ProcReqLines.Type = ProcReqLines2.Type::Item then
                        PurchaseLine.Type := PurchaseLine.Type::Item;

                    PurchaseLine."No." := ProcReqLines2.No;
                    PurchaseLine.Description := ProcReqLines2.Description;
                    PurchaseLine."Unit of Measure" := ProcReqLines2."Unit of Measure";
                    PurchaseLine.Quantity := ProcReqLines2.Quantity;
                    PurchaseLine."Direct Unit Cost" := ProcReqLines2."Unit Price";
                    PurchaseLine.Validate(PurchaseLine."Direct Unit Cost");
                    //PurchaseLine."Location Code":=PurchaseRecLine."Location Code";
                    if not PurchaseLine.Get(PurchaseLine."document type"::Order, PurchaseHeader."No.", ProcReqLines2."Line No") then
                        PurchaseLine.Insert(true);
                end;
                //UNTIL ProcReqLines.NEXT = 0;
                //CODEUNIT.RUN(CODEUNIT::"Purch.-Quote to Order",PurchaseHeader);


                //Update the Proc Request
                /*ProcReqLines.RESET;
                ProcReqLines.SETRANGE("Requisition No",ProcReqLines."Requisition No");
                ProcReqLines.SETRANGE(Ordered,FALSE);
                ProcReqLines.SETRANGE(Select,TRUE);
                IF ProcReqLines.FIND('-') THEN BEGIN
                REPEAT*/
                ProcReqLines2.Ordered := true;
                ProcReqLines2."Order Date" := Today;
                ProcReqLines2.Modify;
            /*UNTIL ProcReqLines.NEXT =0;
            END;*/

            //END;
            until ProcReqLines2.Next = 0;

            Message(Text001, PurchaseHeader."No.");
        end;//****ProcReqLines2

        //Update Header Fully ordered*****
        Recordsupdated := 0;
        //Update Header Fully ordered
        ProcReqLines1.Reset;
        ProcReqLines1.SetRange("Requisition No", ProcReqLines."Requisition No");
        ProcReqLines1.SetRange(Ordered, false);
        ProcReqLines1.SetRange(Select, true);
        if ProcReqLines1.Find('-') then begin
            repeat
                Recordsupdated := Recordsupdated + 1;
            until ProcReqLines1.Next = 0;
        end;


        if Recordsupdated = 0 then begin
            ProcReq.Closed := true;
            ProcReq.Status := ProcReq.Status::"Pending Approval";
            ProcReq.Modify;

            //Update Purch Req
            ProcReq.Reset;
            ProcReq.SetRange(ProcReq.No, ProcReqLines."Requisition No");
            if ProcReq.Find('-') then
                if PurchaseRec.Get(ProcReq."Requisition No") then begin
                    PurchaseRec.Ordered := true;
                    PurchaseRec.Modify;
                end;


        end;
        //Update Header Fully ordered*****

    end;

    procedure CreatePurchaseOrderProcMethod(var ProcReq: Record "Procurement Request")
    var
        PurchaseRec: Record "Purchase Header";
        PurchaseHeader: Record "Purchase Header";
        ProcReqLines: Record "Procurement Request Lines";
        PurchaseLine: Record "Purchase Line";

        vend: record vendor;
    begin

        //Purchase Header
        PurchaseHeader.Init;
        PurchaseHeader."Document Type" := PurchaseHeader."document type"::Order;
        PurchaseHeader."No." := '';
        PurchaseHeader."Buy-from Vendor No." := ProcReq."Vendor No";
        PurchaseHeader.Validate(PurchaseHeader."Buy-from Vendor No.");
        Vend.Reset;
        Vend.SetRange("No.", ProcReq."Vendor No");
        if Vend.FindSet then
            PurchaseHeader."Supplier Type" := Vend."Supplier Type 1";
        PurchaseHeader."Requisition No" := ProcReq."Requisition No";
        PurchaseHeader."Posting Date" := Today;
        PurchaseHeader."Due Date" := Today;
        PurchaseHeader.Validate(PurchaseHeader."Posting Date");
        PurchaseHeader."Document Date" := Today;
        PurchaseHeader.Validate(PurchaseHeader."Document Date");
        //IF NOT PurchaseHeader.GET(PurchaseHeader."No.") THEN
        PurchaseHeader.Insert(true);


        ProcReqLines.Reset;
        ProcReqLines.SetRange("Requisition No", ProcReq.No);
        if ProcReqLines.Find('-') then begin
            repeat
                //Purchase Lines
                PurchaseLine.Reset;
                PurchaseLine.SetRange(PurchaseLine."Document Type", PurchaseLine."document type"::Order);
                PurchaseLine.SetRange(PurchaseLine."Document No.", PurchaseHeader."No.");
                PurchaseLine.SetRange(PurchaseLine."Line No.", ProcReqLines."Line No");
                PurchaseLine.SetRange(PurchaseLine."Buy-from Vendor No.", ProcReq."Vendor No");
                if not PurchaseLine.FindFirst then begin
                    PurchaseLine.Init;
                    PurchaseLine."Document Type" := PurchaseLine."document type"::Order;
                    PurchaseLine."Document No." := PurchaseHeader."No.";
                    PurchaseLine."Line No." := ProcReqLines."Line No";//PurchaseLine.VALIDATE(PurchaseLine."No.");
                    PurchaseLine."Buy-from Vendor No." := ProcReq."Vendor No";
                    //PurchaseLine.Type:=ProcReqLines.Type;

                    if ProcReqLines.Type = ProcReqLines.Type::"Non Stock Item" then
                        PurchaseLine.Type := PurchaseLine.Type::"G/L Account";
                    if ProcReqLines.Type = ProcReqLines.Type::"Fixed Asset" then
                        PurchaseLine.Type := PurchaseLine.Type::"Fixed Asset";
                    if ProcReqLines.Type = ProcReqLines.Type::Item then begin
                        PurchaseLine.Type := PurchaseLine.Type::Item;
                    end;
                    PurchaseLine."No." := ProcReqLines.No;
                    PurchaseLine.Validate(PurchaseLine."No.");
                    PurchaseLine."Activity Type" := ProcReqLines."Activity Type";
                    PurchaseLine.Activity := ProcReqLines.Activity;
                    PurchaseLine."Current Budget" := ProcReqLines."Current Budget";
                    PurchaseLine.Description := ProcReqLines.Description;
                    PurchaseLine."Unit of Measure" := ProcReqLines."Unit of Measure";
                    PurchaseLine.Quantity := ProcReqLines.Quantity;
                    PurchaseLine."Direct Unit Cost" := ProcReqLines.Amount;
                    PurchaseLine.Validate(PurchaseLine."Direct Unit Cost");
                    //PurchaseLine."Location Code":=PurchaseRecLine."Location Code";
                    PurchLine.Amount := PurchaseLine.Quantity * PurchaseLine."Direct Unit Cost";
                    PurchaseLine.Validate(Quantity);
                    PurchaseLine."Direct Unit Cost" := ProcReqLines.Amount;
                    //IF NOT PurchaseLine.GET(PurchaseLine."Document Type"::Order,PurchaseHeader."No.",ProcReqLines."Line No.") THEN
                    PurchaseLine.Insert(true);
                end;
            until ProcReqLines.Next = 0;
            //CODEUNIT.RUN(CODEUNIT::"Purch.-Quote to Order",PurchaseHeader);
        end;

        Message(Text001, PurchaseHeader."No.");
        PurchaseRec.Reset;
        PurchaseRec.SetRange("No.", ProcReq."Requisition No");
        if PurchaseRec.FindSet then begin
            //IF PurchaseRec.GET(ProcReq."Requisition No") THEN BEGIN
            PurchaseRec.Ordered := true;
            PurchaseRec.Modify;
        end;

        //Update the Proc Request
        ProcReq.Closed := true;
        ProcReq.Status := ProcReq.Status::"Pending Approval";
        ProcReq.Modify;
    end;

    var
        Commitment: Codeunit "Procurement Processing";

    var
        Text0057: label 'Please Select the Supplier';
        Text0058: label 'Purchase Order No %1 has been created';
        Text0059: label 'Process Type %1,  cannot be used when the Amount is above the set limit of %2';
        Text0060: label 'Process Type %1,  cannot be used when the Amount is less than the minimum the set limit of %2';
        Text0061: label 'Are you sure you want to select Process Type as %1 ?';
        ProcCeiling: Record "Procurement Financial ceilings";
        RequisitionHeader: Record "Purchase Header";
        RequisitionLines: Record "Purchase Line";
        RFQLines: Record "Procurement Request Lines";
        VATPostingSetup: Record "VAT Posting Setup";
        UsersRec: Record "User Setup";
        Empl: Record Employee;

        Text001: label 'Purchase Order No %1 has been created';
        AnnualReportingCodes: Record "Annual Reporting Codes";
        PlanItem: Record "Procurement Plan 1";
        ItemCategory: Record "Item Category";
        TaskRec: Record "Job Task";
        PPlanEntry: Record "Procurement Plan Entry";
        ProcSetup: Record "Procurement Setup";
        WorksCategory: Record "Works Category";
        EmailNotification: Codeunit "Email Notifications";
        IFSfee: Record "Bid Charges Schedule";
        Procurement: Codeunit "Procurement Processing";
        JobPlanningLine: Record "Job Planning Line";
        JobTask: Record "Job Task";
        JobS: Record Job;
        IFS: Record "Standard Purchase Code";
        IFSLines: Record "Standard Purchase Line";
        PurchLines: Record "Purchase Line";
        Vend: Record Vendor;
        Vendor: Record Vendor;
        FixedAsset: Record "Fixed Asset";
        SoliType: Record "Solicitation Type";
}

