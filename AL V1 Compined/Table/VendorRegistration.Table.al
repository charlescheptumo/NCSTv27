#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Table 70106 "Vendor Registration"
{
    Caption = 'Vendor';
    DataCaptionFields = "No.", Name;
    DrillDownPageID = "Vendor List";
    LookupPageID = "Vendor Lookup";
    Permissions = TableData "Vendor Ledger Entry" = r,
                  TableData "Service Item" = r;

    fields
    {
        field(1; "No."; Code[20])
        {
            Caption = 'No.';

            trigger OnValidate()
            begin
                if "No." <> xRec."No." then begin
                    PurchSetup.Get;
                    NoSeriesMgt.TestManual(PurchSetup."Vendor Nos.");
                    "No. Series" := '';
                end;
                if "Invoice Disc. Code" = '' then
                    "Invoice Disc. Code" := "No.";
            end;
        }
        field(2; Name; Text[300])
        {
            Caption = 'Name';

            trigger OnValidate()
            begin
                if ("Search Name" = UpperCase(xRec.Name)) or ("Search Name" = '') then
                    "Search Name" := Name;
            end;
        }
        field(3; "Search Name"; Code[300])
        {
            Caption = 'Search Name';
        }
        field(4; "Name 2"; Text[300])
        {
            Caption = 'Name 2';
        }
        field(5; Address; Text[300])
        {
            Caption = 'Address';
        }
        field(6; "Address 2"; Text[300])
        {
            Caption = 'Address 2';
        }
        field(7; City; Text[300])
        {
            Caption = 'City';
            TableRelation = if ("Country/Region Code" = const('')) "Post Code".City
            else if ("Country/Region Code" = filter(<> '')) "Post Code".City where("Country/Region Code" = field("Country/Region Code"));
            //This property is currently not supported
            //TestTableRelation = false;
            ValidateTableRelation = false;

            trigger OnLookup()
            begin
                PostCode.LookupPostCode(City, "Post Code", County, "Country/Region Code");
            end;

            trigger OnValidate()
            begin
                PostCode.ValidateCity(City, "Post Code", County, "Country/Region Code", (CurrFieldNo <> 0) and GuiAllowed);
            end;
        }
        field(8; Contact; Text[300])
        {
            Caption = 'Contact';

            trigger OnLookup()
            var
                ContactBusinessRelation: Record "Contact Business Relation";
                Cont: Record Contact;
                TempVend: Record Vendor temporary;
            begin
                if ContactBusinessRelation.FindByRelation(ContactBusinessRelation."link to table"::Vendor, "No.") then
                    Cont.SetRange("Company No.", ContactBusinessRelation."Contact No.")
                else
                    Cont.SetRange("Company No.", '');

                if "Primary Contact No." <> '' then
                    if Cont.Get("Primary Contact No.") then;
                if Page.RunModal(0, Cont) = Action::LookupOK then begin
                    TempVend.Copy(Rec);
                    Find;
                    TransferFields(TempVend, false);
                    Validate("Primary Contact No.", Cont."No.");
                end;
            end;

            trigger OnValidate()
            var
                vend: record Vendor;
            begin
                if RMSetup.Get then
                    if RMSetup."Bus. Rel. Code for Vendors" <> '' then begin
                        if (xRec.Contact = '') and (xRec."Primary Contact No." = '') and (Contact <> '') then begin
                            Modify;
                            UpdateContFromVend.OnModify(vend);
                            UpdateContFromVend.InsertNewContactPerson(vend, false);
                            Modify(true);
                        end;
                        exit;
                    end;
            end;
        }
        field(9; "Phone No."; Text[300])
        {
            Caption = 'Phone No.';
            ExtendedDatatype = PhoneNo;

            trigger OnValidate()
            var
            // Char: dotnet Char;
            // i: Integer;
            begin
                //cc  // for i := 1 to StrLen("Phone No.") do
                //cc    //     if Char.IsLetter("Phone No."[i]) then
                //cc  //         Error(PhoneNoCannotContainLettersErr);
            end;
        }
        field(10; "Telex No."; Text[20])
        {
            Caption = 'Telex No.';
        }
        field(14; "Our Account No."; Text[20])
        {
            Caption = 'Our Account No.';
        }
        field(15; "Territory Code"; Code[10])
        {
            Caption = 'Territory Code';
            TableRelation = Territory;
        }
        field(16; "Global Dimension 1 Code"; Code[20])
        {
            CaptionClass = '1,1,1';
            Caption = 'Global Dimension 1 Code';
            TableRelation = "Dimension Value".Code where("Global Dimension No." = const(1));

            trigger OnValidate()
            begin
                ValidateShortcutDimCode(1, "Global Dimension 1 Code");
            end;
        }
        field(17; "Global Dimension 2 Code"; Code[20])
        {
            CaptionClass = '1,1,2';
            Caption = 'Global Dimension 2 Code';
            TableRelation = "Dimension Value".Code where("Global Dimension No." = const(2));

            trigger OnValidate()
            begin
                ValidateShortcutDimCode(2, "Global Dimension 2 Code");
            end;
        }
        field(19; "Budgeted Amount"; Decimal)
        {
            AutoFormatExpression = "Currency Code";
            AutoFormatType = 1;
            Caption = 'Budgeted Amount';
        }
        field(21; "Vendor Posting Group"; Code[20])
        {
            Caption = 'Vendor Posting Group';
            TableRelation = "Vendor Posting Group";
        }
        field(22; "Currency Code"; Code[10])
        {
            Caption = 'Currency Code';
            TableRelation = Currency;

            trigger OnValidate()
            begin
                UpdateCurrencyId;
            end;
        }
        field(24; "Language Code"; Code[10])
        {
            Caption = 'Language Code';
            TableRelation = Language;
        }
        field(26; "Statistics Group"; Integer)
        {
            Caption = 'Statistics Group';
        }
        field(27; "Payment Terms Code"; Code[10])
        {
            Caption = 'Payment Terms Code';
            TableRelation = "Payment Terms";

            trigger OnValidate()
            begin
                UpdatePaymentTermsId;
            end;
        }
        field(28; "Fin. Charge Terms Code"; Code[10])
        {
            Caption = 'Fin. Charge Terms Code';
            TableRelation = "Finance Charge Terms";
        }
        field(29; "Purchaser Code"; Code[20])
        {
            Caption = 'Purchaser Code';
            TableRelation = "Salesperson/Purchaser";

            trigger OnValidate()
            begin
                ValidatePurchaserCode;
            end;
        }
        field(30; "Shipment Method Code"; Code[10])
        {
            Caption = 'Shipment Method Code';
            TableRelation = "Shipment Method";
        }
        field(31; "Shipping Agent Code"; Code[10])
        {
            Caption = 'Shipping Agent Code';
            TableRelation = "Shipping Agent";
        }
        field(33; "Invoice Disc. Code"; Code[20])
        {
            Caption = 'Invoice Disc. Code';
            TableRelation = Vendor;
            //This property is currently not supported
            //TestTableRelation = false;
            ValidateTableRelation = false;
        }
        field(35; "Country/Region Code"; Code[10])
        {
            Caption = 'Country/Region Code';
            TableRelation = "Country/Region";

            trigger OnValidate()
            begin
                PostCode.CheckClearPostCodeCityCounty(City, "Post Code", County, "Country/Region Code", xRec."Country/Region Code");

                if "Country/Region Code" <> xRec."Country/Region Code" then
                    VATRegistrationValidation;
            end;
        }
        field(38; Comment; Boolean)
        {
            CalcFormula = exist("Comment Line" where("Table Name" = const(Vendor),
                                                      "No." = field("No.")));
            Caption = 'Comment';
            Editable = false;
            FieldClass = FlowField;
        }
        field(39; Blocked; Option)
        {
            Caption = 'Blocked';
            OptionCaption = ' ,Payment,All';
            OptionMembers = " ",Payment,All;

            trigger OnValidate()
            begin
                if (Blocked <> Blocked::All) and "Privacy Blocked" then
                    if GuiAllowed then
                        if Confirm(ConfirmBlockedPrivacyBlockedQst) then
                            "Privacy Blocked" := false
                        else
                            Error('')
                    else
                        Error(CanNotChangeBlockedDueToPrivacyBlockedErr);
            end;
        }
        field(45; "Pay-to Vendor No."; Code[50])
        {
            Caption = 'Pay-to Vendor No.';
            TableRelation = Vendor;
        }
        field(46; Priority; Integer)
        {
            Caption = 'Priority';
        }
        field(47; "Payment Method Code"; Code[50])
        {
            Caption = 'Payment Method Code';
            TableRelation = "Payment Method";

            trigger OnValidate()
            begin
                UpdatePaymentMethodId;
            end;
        }
        field(53; "Last Modified Date Time"; DateTime)
        {
            Caption = 'Last Modified Date Time';
            Editable = false;
        }
        field(54; "Last Date Modified"; Date)
        {
            Caption = 'Last Date Modified';
            Editable = false;
        }
        field(55; "Date Filter"; Date)
        {
            Caption = 'Date Filter';
            FieldClass = FlowFilter;
        }
        field(56; "Global Dimension 1 Filter"; Code[20])
        {
            CaptionClass = '1,3,1';
            Caption = 'Global Dimension 1 Filter';
            FieldClass = FlowFilter;
            TableRelation = "Dimension Value".Code where("Global Dimension No." = const(1));
        }
        field(57; "Global Dimension 2 Filter"; Code[20])
        {
            CaptionClass = '1,3,2';
            Caption = 'Global Dimension 2 Filter';
            FieldClass = FlowFilter;
            TableRelation = "Dimension Value".Code where("Global Dimension No." = const(2));
        }
        field(58; Balance; Decimal)
        {
            AutoFormatExpression = "Currency Code";
            AutoFormatType = 1;
            CalcFormula = - sum("Detailed Vendor Ledg. Entry".Amount where("Vendor No." = field("No."),
                                                                           "Initial Entry Global Dim. 1" = field("Global Dimension 1 Filter"),
                                                                           "Initial Entry Global Dim. 2" = field("Global Dimension 2 Filter"),
                                                                           "Currency Code" = field("Currency Filter")));
            Caption = 'Balance';
            Editable = false;
            FieldClass = FlowField;
        }
        field(59; "Balance (LCY)"; Decimal)
        {
            AutoFormatType = 1;
            CalcFormula = - sum("Detailed Vendor Ledg. Entry"."Amount (LCY)" where("Vendor No." = field("No."),
                                                                                   "Initial Entry Global Dim. 1" = field("Global Dimension 1 Filter"),
                                                                                   "Initial Entry Global Dim. 2" = field("Global Dimension 2 Filter"),
                                                                                   "Currency Code" = field("Currency Filter")));
            Caption = 'Balance (LCY)';
            Editable = false;
            FieldClass = FlowField;
        }
        field(60; "Net Change"; Decimal)
        {
            AutoFormatExpression = "Currency Code";
            AutoFormatType = 1;
            CalcFormula = - sum("Detailed Vendor Ledg. Entry".Amount where("Vendor No." = field("No."),
                                                                           "Initial Entry Global Dim. 1" = field("Global Dimension 1 Filter"),
                                                                           "Initial Entry Global Dim. 2" = field("Global Dimension 2 Filter"),
                                                                           "Posting Date" = field("Date Filter"),
                                                                           "Currency Code" = field("Currency Filter")));
            Caption = 'Net Change';
            Editable = false;
            FieldClass = FlowField;
        }
        field(61; "Net Change (LCY)"; Decimal)
        {
            AutoFormatType = 1;
            CalcFormula = - sum("Detailed Vendor Ledg. Entry"."Amount (LCY)" where("Vendor No." = field("No."),
                                                                                   "Initial Entry Global Dim. 1" = field("Global Dimension 1 Filter"),
                                                                                   "Initial Entry Global Dim. 2" = field("Global Dimension 2 Filter"),
                                                                                   "Posting Date" = field("Date Filter"),
                                                                                   "Currency Code" = field("Currency Filter")));
            Caption = 'Net Change (LCY)';
            Editable = false;
            FieldClass = FlowField;
        }
        field(62; "Purchases (LCY)"; Decimal)
        {
            AutoFormatType = 1;
            CalcFormula = - sum("Vendor Ledger Entry"."Purchase (LCY)" where("Vendor No." = field("No."),
                                                                             "Global Dimension 1 Code" = field("Global Dimension 1 Filter"),
                                                                             "Global Dimension 2 Code" = field("Global Dimension 2 Filter"),
                                                                             "Posting Date" = field("Date Filter"),
                                                                             "Currency Code" = field("Currency Filter")));
            Caption = 'Purchases (LCY)';
            Editable = false;
            FieldClass = FlowField;
        }
        field(64; "Inv. Discounts (LCY)"; Decimal)
        {
            AutoFormatType = 1;
            CalcFormula = - sum("Vendor Ledger Entry"."Inv. Discount (LCY)" where("Vendor No." = field("No."),
                                                                                  "Global Dimension 1 Code" = field("Global Dimension 1 Filter"),
                                                                                  "Global Dimension 2 Code" = field("Global Dimension 2 Filter"),
                                                                                  "Posting Date" = field("Date Filter"),
                                                                                  "Currency Code" = field("Currency Filter")));
            Caption = 'Inv. Discounts (LCY)';
            Editable = false;
            FieldClass = FlowField;
        }
        field(65; "Pmt. Discounts (LCY)"; Decimal)
        {
            AutoFormatType = 1;
            CalcFormula = sum("Detailed Vendor Ledg. Entry"."Amount (LCY)" where("Vendor No." = field("No."),
                                                                                  "Entry Type" = filter("Payment Discount" .. "Payment Discount (VAT Adjustment)"),
                                                                                  "Initial Entry Global Dim. 1" = field("Global Dimension 1 Filter"),
                                                                                  "Initial Entry Global Dim. 2" = field("Global Dimension 2 Filter"),
                                                                                  "Posting Date" = field("Date Filter"),
                                                                                  "Currency Code" = field("Currency Filter")));
            Caption = 'Pmt. Discounts (LCY)';
            Editable = false;
            FieldClass = FlowField;
        }
        field(66; "Balance Due"; Decimal)
        {
            AutoFormatExpression = "Currency Code";
            AutoFormatType = 1;
            CalcFormula = - sum("Detailed Vendor Ledg. Entry".Amount where("Vendor No." = field("No."),
                                                                           "Initial Entry Due Date" = field(upperlimit("Date Filter")),
                                                                           "Initial Entry Global Dim. 1" = field("Global Dimension 1 Filter"),
                                                                           "Initial Entry Global Dim. 2" = field("Global Dimension 2 Filter"),
                                                                           "Currency Code" = field("Currency Filter")));
            Caption = 'Balance Due';
            Editable = false;
            FieldClass = FlowField;
        }
        field(67; "Balance Due (LCY)"; Decimal)
        {
            AutoFormatType = 1;
            CalcFormula = - sum("Detailed Vendor Ledg. Entry"."Amount (LCY)" where("Vendor No." = field("No."),
                                                                                   "Initial Entry Due Date" = field(upperlimit("Date Filter")),
                                                                                   "Initial Entry Global Dim. 1" = field("Global Dimension 1 Filter"),
                                                                                   "Initial Entry Global Dim. 2" = field("Global Dimension 2 Filter"),
                                                                                   "Currency Code" = field("Currency Filter")));
            Caption = 'Balance Due (LCY)';
            Editable = false;
            FieldClass = FlowField;
        }
        field(69; Payments; Decimal)
        {
            AutoFormatExpression = "Currency Code";
            AutoFormatType = 1;
            CalcFormula = sum("Detailed Vendor Ledg. Entry".Amount where("Initial Document Type" = const(Payment),
                                                                          "Entry Type" = const("Initial Entry"),
                                                                          "Vendor No." = field("No."),
                                                                          "Initial Entry Global Dim. 1" = field("Global Dimension 1 Filter"),
                                                                          "Initial Entry Global Dim. 2" = field("Global Dimension 2 Filter"),
                                                                          "Posting Date" = field("Date Filter"),
                                                                          "Currency Code" = field("Currency Filter")));
            Caption = 'Payments';
            Editable = false;
            FieldClass = FlowField;
        }
        field(70; "Invoice Amounts"; Decimal)
        {
            AutoFormatExpression = "Currency Code";
            AutoFormatType = 1;
            CalcFormula = - sum("Detailed Vendor Ledg. Entry".Amount where("Initial Document Type" = const(Invoice),
                                                                           "Entry Type" = const("Initial Entry"),
                                                                           "Vendor No." = field("No."),
                                                                           "Initial Entry Global Dim. 1" = field("Global Dimension 1 Filter"),
                                                                           "Initial Entry Global Dim. 2" = field("Global Dimension 2 Filter"),
                                                                           "Posting Date" = field("Date Filter"),
                                                                           "Currency Code" = field("Currency Filter")));
            Caption = 'Invoice Amounts';
            Editable = false;
            FieldClass = FlowField;
        }
        field(71; "Cr. Memo Amounts"; Decimal)
        {
            AutoFormatExpression = "Currency Code";
            AutoFormatType = 1;
            CalcFormula = sum("Detailed Vendor Ledg. Entry".Amount where("Initial Document Type" = const("Credit Memo"),
                                                                          "Entry Type" = const("Initial Entry"),
                                                                          "Vendor No." = field("No."),
                                                                          "Initial Entry Global Dim. 1" = field("Global Dimension 1 Filter"),
                                                                          "Initial Entry Global Dim. 2" = field("Global Dimension 2 Filter"),
                                                                          "Posting Date" = field("Date Filter"),
                                                                          "Currency Code" = field("Currency Filter")));
            Caption = 'Cr. Memo Amounts';
            Editable = false;
            FieldClass = FlowField;
        }
        field(72; "Finance Charge Memo Amounts"; Decimal)
        {
            AutoFormatExpression = "Currency Code";
            AutoFormatType = 1;
            CalcFormula = - sum("Detailed Vendor Ledg. Entry".Amount where("Initial Document Type" = const("Finance Charge Memo"),
                                                                           "Entry Type" = const("Initial Entry"),
                                                                           "Vendor No." = field("No."),
                                                                           "Initial Entry Global Dim. 1" = field("Global Dimension 1 Filter"),
                                                                           "Initial Entry Global Dim. 2" = field("Global Dimension 2 Filter"),
                                                                           "Posting Date" = field("Date Filter"),
                                                                           "Currency Code" = field("Currency Filter")));
            Caption = 'Finance Charge Memo Amounts';
            Editable = false;
            FieldClass = FlowField;
        }
        field(74; "Payments (LCY)"; Decimal)
        {
            AutoFormatType = 1;
            CalcFormula = sum("Detailed Vendor Ledg. Entry"."Amount (LCY)" where("Initial Document Type" = const(Payment),
                                                                                  "Entry Type" = const("Initial Entry"),
                                                                                  "Vendor No." = field("No."),
                                                                                  "Initial Entry Global Dim. 1" = field("Global Dimension 1 Filter"),
                                                                                  "Initial Entry Global Dim. 2" = field("Global Dimension 2 Filter"),
                                                                                  "Posting Date" = field("Date Filter"),
                                                                                  "Currency Code" = field("Currency Filter")));
            Caption = 'Payments (LCY)';
            Editable = false;
            FieldClass = FlowField;
        }
        field(75; "Inv. Amounts (LCY)"; Decimal)
        {
            AutoFormatType = 1;
            CalcFormula = - sum("Detailed Vendor Ledg. Entry"."Amount (LCY)" where("Initial Document Type" = const(Invoice),
                                                                                   "Entry Type" = const("Initial Entry"),
                                                                                   "Vendor No." = field("No."),
                                                                                   "Initial Entry Global Dim. 1" = field("Global Dimension 1 Filter"),
                                                                                   "Initial Entry Global Dim. 2" = field("Global Dimension 2 Filter"),
                                                                                   "Posting Date" = field("Date Filter"),
                                                                                   "Currency Code" = field("Currency Filter")));
            Caption = 'Inv. Amounts (LCY)';
            Editable = false;
            FieldClass = FlowField;
        }
        field(76; "Cr. Memo Amounts (LCY)"; Decimal)
        {
            AutoFormatType = 1;
            CalcFormula = sum("Detailed Vendor Ledg. Entry"."Amount (LCY)" where("Initial Document Type" = const("Credit Memo"),
                                                                                  "Entry Type" = const("Initial Entry"),
                                                                                  "Vendor No." = field("No."),
                                                                                  "Initial Entry Global Dim. 1" = field("Global Dimension 1 Filter"),
                                                                                  "Initial Entry Global Dim. 2" = field("Global Dimension 2 Filter"),
                                                                                  "Posting Date" = field("Date Filter"),
                                                                                  "Currency Code" = field("Currency Filter")));
            Caption = 'Cr. Memo Amounts (LCY)';
            Editable = false;
            FieldClass = FlowField;
        }
        field(77; "Fin. Charge Memo Amounts (LCY)"; Decimal)
        {
            AutoFormatType = 1;
            CalcFormula = - sum("Detailed Vendor Ledg. Entry"."Amount (LCY)" where("Initial Document Type" = const("Finance Charge Memo"),
                                                                                   "Entry Type" = const("Initial Entry"),
                                                                                   "Vendor No." = field("No."),
                                                                                   "Initial Entry Global Dim. 1" = field("Global Dimension 1 Filter"),
                                                                                   "Initial Entry Global Dim. 2" = field("Global Dimension 2 Filter"),
                                                                                   "Posting Date" = field("Date Filter"),
                                                                                   "Currency Code" = field("Currency Filter")));
            Caption = 'Fin. Charge Memo Amounts (LCY)';
            Editable = false;
            FieldClass = FlowField;
        }
        field(78; "Outstanding Orders"; Decimal)
        {
            AccessByPermission = TableData "Purch. Rcpt. Header" = R;
            AutoFormatExpression = "Currency Code";
            AutoFormatType = 1;
            CalcFormula = sum("Purchase Line"."Outstanding Amount" where("Document Type" = const(Order),
                                                                          "Pay-to Vendor No." = field("No."),
                                                                          "Shortcut Dimension 1 Code" = field("Global Dimension 1 Filter"),
                                                                          "Shortcut Dimension 2 Code" = field("Global Dimension 2 Filter"),
                                                                          "Currency Code" = field("Currency Filter")));
            Caption = 'Outstanding Orders';
            Editable = false;
            FieldClass = FlowField;
        }
        field(79; "Amt. Rcd. Not Invoiced"; Decimal)
        {
            AccessByPermission = TableData "Purch. Rcpt. Header" = R;
            AutoFormatExpression = "Currency Code";
            AutoFormatType = 1;
            CalcFormula = sum("Purchase Line"."Amt. Rcd. Not Invoiced" where("Document Type" = const(Order),
                                                                              "Pay-to Vendor No." = field("No."),
                                                                              "Shortcut Dimension 1 Code" = field("Global Dimension 1 Filter"),
                                                                              "Shortcut Dimension 2 Code" = field("Global Dimension 2 Filter"),
                                                                              "Currency Code" = field("Currency Filter")));
            Caption = 'Amt. Rcd. Not Invoiced';
            Editable = false;
            FieldClass = FlowField;
        }
        field(80; "Application Method"; Option)
        {
            Caption = 'Application Method';
            OptionCaption = 'Manual,Apply to Oldest';
            OptionMembers = Manual,"Apply to Oldest";
        }
        field(82; "Prices Including VAT"; Boolean)
        {
            Caption = 'Prices Including VAT';

            trigger OnValidate()
            var
                PurchPrice: Record "Purchase Price";
                Item: Record Item;
                VATPostingSetup: Record "VAT Posting Setup";
                Currency: Record Currency;
                ConfirmManagement: Codeunit "Confirm Management";
            begin
                PurchPrice.SetCurrentkey("Vendor No.");
                PurchPrice.SetRange("Vendor No.", "No.");
                if PurchPrice.Find('-') then begin
                    if VATPostingSetup.Get('', '') then;
                    if ConfirmManagement.GetResponse(
                         StrSubstNo(
                           Text002,
                           FieldCaption("Prices Including VAT"), "Prices Including VAT", PurchPrice.TableCaption), true)
                    then
                        repeat
                            if PurchPrice."Item No." <> Item."No." then
                                Item.Get(PurchPrice."Item No.");
                            if ("VAT Bus. Posting Group" <> VATPostingSetup."VAT Bus. Posting Group") or
                               (Item."VAT Prod. Posting Group" <> VATPostingSetup."VAT Prod. Posting Group")
                            then
                                VATPostingSetup.Get("VAT Bus. Posting Group", Item."VAT Prod. Posting Group");
                            if PurchPrice."Currency Code" = '' then
                                Currency.InitRoundingPrecision
                            else
                                if PurchPrice."Currency Code" <> Currency.Code then
                                    Currency.Get(PurchPrice."Currency Code");
                            if VATPostingSetup."VAT %" <> 0 then begin
                                if "Prices Including VAT" then
                                    PurchPrice."Direct Unit Cost" :=
                                      ROUND(
                                        PurchPrice."Direct Unit Cost" * (1 + VATPostingSetup."VAT %" / 100),
                                        Currency."Unit-Amount Rounding Precision")
                                else
                                    PurchPrice."Direct Unit Cost" :=
                                      ROUND(
                                        PurchPrice."Direct Unit Cost" / (1 + VATPostingSetup."VAT %" / 100),
                                        Currency."Unit-Amount Rounding Precision");
                                PurchPrice.Modify;
                            end;
                        until PurchPrice.Next = 0;
                end;
            end;
        }
        field(84; "Fax No."; Text[30])
        {
            Caption = 'Fax No.';
        }
        field(85; "Telex Answer Back"; Text[20])
        {
            Caption = 'Telex Answer Back';
        }
        field(86; "VAT Registration No."; Text[20])
        {
            Caption = 'VAT Registration No.';

            trigger OnValidate()
            begin
                "VAT Registration No." := UpperCase("VAT Registration No.");
                if "VAT Registration No." <> xRec."VAT Registration No." then
                    VATRegistrationValidation;
            end;
        }
        field(88; "Gen. Bus. Posting Group"; Code[20])
        {
            Caption = 'Gen. Bus. Posting Group';
            TableRelation = "Gen. Business Posting Group";

            trigger OnValidate()
            begin
                if xRec."Gen. Bus. Posting Group" <> "Gen. Bus. Posting Group" then
                    if GenBusPostingGrp.ValidateVatBusPostingGroup(GenBusPostingGrp, "Gen. Bus. Posting Group") then
                        Validate("VAT Bus. Posting Group", GenBusPostingGrp."Def. VAT Bus. Posting Group");
            end;
        }
        field(89; Picture; Blob)
        {
            Caption = 'Picture';
            ObsoleteReason = 'Replaced by Image field';
            ObsoleteState = Pending;
            SubType = Bitmap;
        }
        field(90; GLN; Code[13])
        {
            Caption = 'GLN';
            Numeric = true;

            trigger OnValidate()
            var
                GLNCalculator: Codeunit "GLN Calculator";
            begin
                if GLN <> '' then
                    GLNCalculator.AssertValidCheckDigit13(GLN);
            end;
        }
        field(91; "Post Code"; Code[20])
        {
            Caption = 'Post Code';
            TableRelation = if ("Country/Region Code" = const('')) "Post Code"
            else if ("Country/Region Code" = filter(<> '')) "Post Code" where("Country/Region Code" = field("Country/Region Code"));
            //This property is currently not supported
            //TestTableRelation = false;
            ValidateTableRelation = false;

            trigger OnLookup()
            begin
                PostCode.LookupPostCode(City, "Post Code", County, "Country/Region Code");
            end;

            trigger OnValidate()
            begin
                PostCode.ValidatePostCode(City, "Post Code", County, "Country/Region Code", (CurrFieldNo <> 0) and GuiAllowed);
            end;
        }
        field(92; County; Text[30])
        {
            CaptionClass = '5,1,' + "Country/Region Code";
            Caption = 'County';
        }
        field(97; "Debit Amount"; Decimal)
        {
            AutoFormatExpression = "Currency Code";
            AutoFormatType = 1;
            BlankZero = true;
            CalcFormula = sum("Detailed Vendor Ledg. Entry"."Debit Amount" where("Vendor No." = field("No."),
                                                                                  "Entry Type" = filter(<> Application),
                                                                                  "Initial Entry Global Dim. 1" = field("Global Dimension 1 Filter"),
                                                                                  "Initial Entry Global Dim. 2" = field("Global Dimension 2 Filter"),
                                                                                  "Posting Date" = field("Date Filter"),
                                                                                  "Currency Code" = field("Currency Filter")));
            Caption = 'Debit Amount';
            Editable = false;
            FieldClass = FlowField;
        }
        field(98; "Credit Amount"; Decimal)
        {
            AutoFormatExpression = "Currency Code";
            AutoFormatType = 1;
            BlankZero = true;
            CalcFormula = sum("Detailed Vendor Ledg. Entry"."Credit Amount" where("Vendor No." = field("No."),
                                                                                   "Entry Type" = filter(<> Application),
                                                                                   "Initial Entry Global Dim. 1" = field("Global Dimension 1 Filter"),
                                                                                   "Initial Entry Global Dim. 2" = field("Global Dimension 2 Filter"),
                                                                                   "Posting Date" = field("Date Filter"),
                                                                                   "Currency Code" = field("Currency Filter")));
            Caption = 'Credit Amount';
            Editable = false;
            FieldClass = FlowField;
        }
        field(99; "Debit Amount (LCY)"; Decimal)
        {
            AutoFormatType = 1;
            BlankZero = true;
            CalcFormula = sum("Detailed Vendor Ledg. Entry"."Debit Amount (LCY)" where("Vendor No." = field("No."),
                                                                                        "Entry Type" = filter(<> Application),
                                                                                        "Initial Entry Global Dim. 1" = field("Global Dimension 1 Filter"),
                                                                                        "Initial Entry Global Dim. 2" = field("Global Dimension 2 Filter"),
                                                                                        "Posting Date" = field("Date Filter"),
                                                                                        "Currency Code" = field("Currency Filter")));
            Caption = 'Debit Amount (LCY)';
            Editable = false;
            FieldClass = FlowField;
        }
        field(100; "Credit Amount (LCY)"; Decimal)
        {
            AutoFormatType = 1;
            BlankZero = true;
            CalcFormula = sum("Detailed Vendor Ledg. Entry"."Credit Amount (LCY)" where("Vendor No." = field("No."),
                                                                                         "Entry Type" = filter(<> Application),
                                                                                         "Initial Entry Global Dim. 1" = field("Global Dimension 1 Filter"),
                                                                                         "Initial Entry Global Dim. 2" = field("Global Dimension 2 Filter"),
                                                                                         "Posting Date" = field("Date Filter"),
                                                                                         "Currency Code" = field("Currency Filter")));
            Caption = 'Credit Amount (LCY)';
            Editable = false;
            FieldClass = FlowField;
        }
        field(102; "E-Mail"; Text[80])
        {
            Caption = 'Email';
            ExtendedDatatype = EMail;

            trigger OnValidate()
            var
                MailManagement: Codeunit "Mail Management";
            begin
                MailManagement.ValidateEmailAddressField("E-Mail");
            end;
        }
        field(103; "Home Page"; Text[80])
        {
            Caption = 'Home Page';
            ExtendedDatatype = URL;
        }
        field(104; "Reminder Amounts"; Decimal)
        {
            AutoFormatExpression = "Currency Code";
            AutoFormatType = 1;
            CalcFormula = - sum("Detailed Vendor Ledg. Entry".Amount where("Initial Document Type" = const(Reminder),
                                                                           "Entry Type" = const("Initial Entry"),
                                                                           "Vendor No." = field("No."),
                                                                           "Initial Entry Global Dim. 1" = field("Global Dimension 1 Filter"),
                                                                           "Initial Entry Global Dim. 2" = field("Global Dimension 2 Filter"),
                                                                           "Posting Date" = field("Date Filter"),
                                                                           "Currency Code" = field("Currency Filter")));
            Caption = 'Reminder Amounts';
            Editable = false;
            FieldClass = FlowField;
        }
        field(105; "Reminder Amounts (LCY)"; Decimal)
        {
            AutoFormatType = 1;
            CalcFormula = - sum("Detailed Vendor Ledg. Entry"."Amount (LCY)" where("Initial Document Type" = const(Reminder),
                                                                                   "Entry Type" = const("Initial Entry"),
                                                                                   "Vendor No." = field("No."),
                                                                                   "Initial Entry Global Dim. 1" = field("Global Dimension 1 Filter"),
                                                                                   "Initial Entry Global Dim. 2" = field("Global Dimension 2 Filter"),
                                                                                   "Posting Date" = field("Date Filter"),
                                                                                   "Currency Code" = field("Currency Filter")));
            Caption = 'Reminder Amounts (LCY)';
            Editable = false;
            FieldClass = FlowField;
        }
        field(107; "No. Series"; Code[20])
        {
            Caption = 'No. Series';
            Editable = false;
            TableRelation = "No. Series";
        }
        field(108; "Tax Area Code"; Code[20])
        {
            Caption = 'Tax Area Code';
            TableRelation = "Tax Area";
        }
        field(109; "Tax Liable"; Boolean)
        {
            Caption = 'Tax Liable';
        }
        field(110; "VAT Bus. Posting Group"; Code[20])
        {
            Caption = 'VAT Bus. Posting Group';
            TableRelation = "VAT Business Posting Group";
        }
        field(111; "Currency Filter"; Code[10])
        {
            Caption = 'Currency Filter';
            FieldClass = FlowFilter;
            TableRelation = Currency;
        }
        field(113; "Outstanding Orders (LCY)"; Decimal)
        {
            AccessByPermission = TableData "Purch. Rcpt. Header" = R;
            AutoFormatType = 1;
            CalcFormula = sum("Purchase Line"."Outstanding Amount (LCY)" where("Document Type" = const(Order),
                                                                                "Pay-to Vendor No." = field("No."),
                                                                                "Shortcut Dimension 1 Code" = field("Global Dimension 1 Filter"),
                                                                                "Shortcut Dimension 2 Code" = field("Global Dimension 2 Filter"),
                                                                                "Currency Code" = field("Currency Filter")));
            Caption = 'Outstanding Orders (LCY)';
            Editable = false;
            FieldClass = FlowField;
        }
        field(114; "Amt. Rcd. Not Invoiced (LCY)"; Decimal)
        {
            AccessByPermission = TableData "Purch. Rcpt. Header" = R;
            AutoFormatType = 1;
            CalcFormula = sum("Purchase Line"."Amt. Rcd. Not Invoiced (LCY)" where("Document Type" = const(Order),
                                                                                    "Pay-to Vendor No." = field("No."),
                                                                                    "Shortcut Dimension 1 Code" = field("Global Dimension 1 Filter"),
                                                                                    "Shortcut Dimension 2 Code" = field("Global Dimension 2 Filter"),
                                                                                    "Currency Code" = field("Currency Filter")));
            Caption = 'Amt. Rcd. Not Invoiced (LCY)';
            Editable = false;
            FieldClass = FlowField;
        }
        field(116; "Block Payment Tolerance"; Boolean)
        {
            Caption = 'Block Payment Tolerance';
        }
        field(117; "Pmt. Disc. Tolerance (LCY)"; Decimal)
        {
            AutoFormatType = 1;
            CalcFormula = sum("Detailed Vendor Ledg. Entry"."Amount (LCY)" where("Vendor No." = field("No."),
                                                                                  "Entry Type" = filter("Payment Discount Tolerance" | "Payment Discount Tolerance (VAT Adjustment)" | "Payment Discount Tolerance (VAT Excl.)"),
                                                                                  "Initial Entry Global Dim. 1" = field("Global Dimension 1 Filter"),
                                                                                  "Initial Entry Global Dim. 2" = field("Global Dimension 2 Filter"),
                                                                                  "Posting Date" = field("Date Filter"),
                                                                                  "Currency Code" = field("Currency Filter")));
            Caption = 'Pmt. Disc. Tolerance (LCY)';
            Editable = false;
            FieldClass = FlowField;
        }
        field(118; "Pmt. Tolerance (LCY)"; Decimal)
        {
            AutoFormatType = 1;
            CalcFormula = sum("Detailed Vendor Ledg. Entry"."Amount (LCY)" where("Vendor No." = field("No."),
                                                                                  "Entry Type" = filter("Payment Tolerance" | "Payment Tolerance (VAT Adjustment)" | "Payment Tolerance (VAT Excl.)"),
                                                                                  "Initial Entry Global Dim. 1" = field("Global Dimension 1 Filter"),
                                                                                  "Initial Entry Global Dim. 2" = field("Global Dimension 2 Filter"),
                                                                                  "Posting Date" = field("Date Filter"),
                                                                                  "Currency Code" = field("Currency Filter")));
            Caption = 'Pmt. Tolerance (LCY)';
            Editable = false;
            FieldClass = FlowField;
        }
        field(119; "IC Partner Code"; Code[20])
        {
            Caption = 'IC Partner Code';
            TableRelation = "IC Partner";

            trigger OnValidate()
            var
                VendLedgEntry: Record "Vendor Ledger Entry";
                AccountingPeriod: Record "Accounting Period";
                ICPartner: Record "IC Partner";
                ConfirmManagement: Codeunit "Confirm Management";
            begin
                if xRec."IC Partner Code" <> "IC Partner Code" then begin
                    if not VendLedgEntry.SetCurrentkey("Vendor No.", Open) then
                        VendLedgEntry.SetCurrentkey("Vendor No.");
                    VendLedgEntry.SetRange("Vendor No.", "No.");
                    VendLedgEntry.SetRange(Open, true);
                    if VendLedgEntry.FindLast then
                        Error(Text010, FieldCaption("IC Partner Code"), TableCaption);

                    VendLedgEntry.Reset;
                    VendLedgEntry.SetCurrentkey("Vendor No.", "Posting Date");
                    VendLedgEntry.SetRange("Vendor No.", "No.");
                    AccountingPeriod.SetRange(Closed, false);
                    if AccountingPeriod.FindFirst then begin
                        VendLedgEntry.SetFilter("Posting Date", '>=%1', AccountingPeriod."Starting Date");
                        if VendLedgEntry.FindFirst then
                            if not ConfirmManagement.GetResponse(StrSubstNo(Text009, TableCaption), true) then
                                "IC Partner Code" := xRec."IC Partner Code";
                    end;
                end;

                if "IC Partner Code" <> '' then begin
                    ICPartner.Get("IC Partner Code");
                    if (ICPartner."Vendor No." <> '') and (ICPartner."Vendor No." <> "No.") then
                        Error(Text008, FieldCaption("IC Partner Code"), "IC Partner Code", TableCaption, ICPartner."Vendor No.");
                    ICPartner."Vendor No." := "No.";
                    ICPartner.Modify;
                end;

                if (xRec."IC Partner Code" <> "IC Partner Code") and ICPartner.Get(xRec."IC Partner Code") then begin
                    ICPartner."Vendor No." := '';
                    ICPartner.Modify;
                end;
            end;
        }
        field(120; Refunds; Decimal)
        {
            CalcFormula = - sum("Detailed Vendor Ledg. Entry".Amount where("Initial Document Type" = const(Refund),
                                                                           "Entry Type" = const("Initial Entry"),
                                                                           "Vendor No." = field("No."),
                                                                           "Initial Entry Global Dim. 1" = field("Global Dimension 1 Filter"),
                                                                           "Initial Entry Global Dim. 2" = field("Global Dimension 2 Filter"),
                                                                           "Posting Date" = field("Date Filter"),
                                                                           "Currency Code" = field("Currency Filter")));
            Caption = 'Refunds';
            FieldClass = FlowField;
        }
        field(121; "Refunds (LCY)"; Decimal)
        {
            CalcFormula = - sum("Detailed Vendor Ledg. Entry"."Amount (LCY)" where("Initial Document Type" = const(Refund),
                                                                                   "Entry Type" = const("Initial Entry"),
                                                                                   "Vendor No." = field("No."),
                                                                                   "Initial Entry Global Dim. 1" = field("Global Dimension 1 Filter"),
                                                                                   "Initial Entry Global Dim. 2" = field("Global Dimension 2 Filter"),
                                                                                   "Posting Date" = field("Date Filter"),
                                                                                   "Currency Code" = field("Currency Filter")));
            Caption = 'Refunds (LCY)';
            FieldClass = FlowField;
        }
        field(122; "Other Amounts"; Decimal)
        {
            CalcFormula = - sum("Detailed Vendor Ledg. Entry".Amount where("Initial Document Type" = const(" "),
                                                                           "Entry Type" = const("Initial Entry"),
                                                                           "Vendor No." = field("No."),
                                                                           "Initial Entry Global Dim. 1" = field("Global Dimension 1 Filter"),
                                                                           "Initial Entry Global Dim. 2" = field("Global Dimension 2 Filter"),
                                                                           "Posting Date" = field("Date Filter"),
                                                                           "Currency Code" = field("Currency Filter")));
            Caption = 'Other Amounts';
            FieldClass = FlowField;
        }
        field(123; "Other Amounts (LCY)"; Decimal)
        {
            CalcFormula = - sum("Detailed Vendor Ledg. Entry"."Amount (LCY)" where("Initial Document Type" = const(" "),
                                                                                   "Entry Type" = const("Initial Entry"),
                                                                                   "Vendor No." = field("No."),
                                                                                   "Initial Entry Global Dim. 1" = field("Global Dimension 1 Filter"),
                                                                                   "Initial Entry Global Dim. 2" = field("Global Dimension 2 Filter"),
                                                                                   "Posting Date" = field("Date Filter"),
                                                                                   "Currency Code" = field("Currency Filter")));
            Caption = 'Other Amounts (LCY)';
            FieldClass = FlowField;
        }
        field(124; "Prepayment %"; Decimal)
        {
            Caption = 'Prepayment %';
            DecimalPlaces = 0 : 5;
            MaxValue = 100;
            MinValue = 0;
        }
        field(125; "Outstanding Invoices"; Decimal)
        {
            AccessByPermission = TableData "Purch. Rcpt. Header" = R;
            AutoFormatExpression = "Currency Code";
            AutoFormatType = 1;
            CalcFormula = sum("Purchase Line"."Outstanding Amount" where("Document Type" = const(Invoice),
                                                                          "Pay-to Vendor No." = field("No."),
                                                                          "Shortcut Dimension 1 Code" = field("Global Dimension 1 Filter"),
                                                                          "Shortcut Dimension 2 Code" = field("Global Dimension 2 Filter"),
                                                                          "Currency Code" = field("Currency Filter")));
            Caption = 'Outstanding Invoices';
            Editable = false;
            FieldClass = FlowField;
        }
        field(126; "Outstanding Invoices (LCY)"; Decimal)
        {
            AccessByPermission = TableData "Purch. Rcpt. Header" = R;
            AutoFormatType = 1;
            CalcFormula = sum("Purchase Line"."Outstanding Amount (LCY)" where("Document Type" = const(Invoice),
                                                                                "Pay-to Vendor No." = field("No."),
                                                                                "Shortcut Dimension 1 Code" = field("Global Dimension 1 Filter"),
                                                                                "Shortcut Dimension 2 Code" = field("Global Dimension 2 Filter"),
                                                                                "Currency Code" = field("Currency Filter")));
            Caption = 'Outstanding Invoices (LCY)';
            Editable = false;
            FieldClass = FlowField;
        }
        field(130; "Pay-to No. Of Archived Doc."; Integer)
        {
            CalcFormula = count("Purchase Header Archive" where("Document Type" = const(Order),
                                                                 "Pay-to Vendor No." = field("No.")));
            Caption = 'Pay-to No. Of Archived Doc.';
            FieldClass = FlowField;
        }
        field(131; "Buy-from No. Of Archived Doc."; Integer)
        {
            CalcFormula = count("Purchase Header Archive" where("Document Type" = const(Order),
                                                                 "Buy-from Vendor No." = field("No.")));
            Caption = 'Buy-from No. Of Archived Doc.';
            FieldClass = FlowField;
        }
        field(132; "Partner Type"; Option)
        {
            Caption = 'Partner Type';
            OptionCaption = ' ,Company,Person';
            OptionMembers = " ",Company,Person;
        }
        field(140; Image; Media)
        {
            Caption = 'Image';
            ExtendedDatatype = Person;
        }
        field(150; "Privacy Blocked"; Boolean)
        {
            Caption = 'Privacy Blocked';

            trigger OnValidate()
            begin
                if "Privacy Blocked" then
                    Blocked := Blocked::All
                else
                    Blocked := Blocked::" ";
            end;
        }
        field(160; "Disable Search by Name"; Boolean)
        {
            Caption = 'Disable Search by Name';
            DataClassification = SystemMetadata;
        }
        field(170; "Creditor No."; Code[20])
        {
            Caption = 'Creditor No.';
        }
        field(288; "Preferred Bank Account Code"; Code[20])
        {
            Caption = 'Preferred Bank Account Code';
            TableRelation = "Vendor Bank Account".Code where("Vendor No." = field("No."));
        }
        field(840; "Cash Flow Payment Terms Code"; Code[10])
        {
            Caption = 'Cash Flow Payment Terms Code';
            TableRelation = "Payment Terms";
        }
        field(5049; "Primary Contact No."; Code[20])
        {
            Caption = 'Primary Contact No.';
            TableRelation = Contact;

            trigger OnLookup()
            var
                Cont: Record Contact;
                ContBusRel: Record "Contact Business Relation";
                TempVend: Record Vendor temporary;
            begin
                ContBusRel.SetCurrentkey("Link to Table", "No.");
                ContBusRel.SetRange("Link to Table", ContBusRel."link to table"::Vendor);
                ContBusRel.SetRange("No.", "No.");
                if ContBusRel.FindFirst then
                    Cont.SetRange("Company No.", ContBusRel."Contact No.")
                else
                    Cont.SetRange("No.", '');

                if "Primary Contact No." <> '' then
                    if Cont.Get("Primary Contact No.") then;
                if Page.RunModal(0, Cont) = Action::LookupOK then begin
                    TempVend.Copy(Rec);
                    Find;
                    TransferFields(TempVend, false);
                    Validate("Primary Contact No.", Cont."No.");
                end;
            end;

            trigger OnValidate()
            var
                Cont: Record Contact;
                ContBusRel: Record "Contact Business Relation";
            begin
                Contact := '';
                if "Primary Contact No." <> '' then begin
                    Cont.Get("Primary Contact No.");

                    ContBusRel.FindOrRestoreContactBusinessRelation(Cont, Rec, ContBusRel."link to table"::Vendor);

                    if Cont."Company No." <> ContBusRel."Contact No." then
                        Error(Text004, Cont."No.", Cont.Name, "No.", Name);

                    if Cont.Type = Cont.Type::Person then
                        Contact := Cont.Name;

                    if Cont."Phone No." <> '' then
                        "Phone No." := Cont."Phone No.";
                    if Cont."E-Mail" <> '' then
                        "E-Mail" := Cont."E-Mail";
                end;
            end;
        }
        field(5700; "Responsibility Center"; Code[10])
        {
            Caption = 'Responsibility Center';
            TableRelation = "Responsibility Center";
        }
        field(5701; "Location Code"; Code[10])
        {
            Caption = 'Location Code';
            TableRelation = Location where("Use As In-Transit" = const(false));
        }
        field(5790; "Lead Time Calculation"; DateFormula)
        {
            AccessByPermission = TableData "Purch. Rcpt. Header" = R;
            Caption = 'Lead Time Calculation';

            trigger OnValidate()
            begin
                LeadTimeMgt.CheckLeadTimeIsNotNegative("Lead Time Calculation");
            end;
        }
        field(7177; "No. of Pstd. Receipts"; Integer)
        {
            CalcFormula = count("Purch. Rcpt. Header" where("Buy-from Vendor No." = field("No.")));
            Caption = 'No. of Pstd. Receipts';
            Editable = false;
            FieldClass = FlowField;
        }
        field(7178; "No. of Pstd. Invoices"; Integer)
        {
            CalcFormula = count("Purch. Inv. Header" where("Buy-from Vendor No." = field("No.")));
            Caption = 'No. of Pstd. Invoices';
            Editable = false;
            FieldClass = FlowField;
        }
        field(7179; "No. of Pstd. Return Shipments"; Integer)
        {
            CalcFormula = count("Return Shipment Header" where("Buy-from Vendor No." = field("No.")));
            Caption = 'No. of Pstd. Return Shipments';
            Editable = false;
            FieldClass = FlowField;
        }
        field(7180; "No. of Pstd. Credit Memos"; Integer)
        {
            CalcFormula = count("Purch. Cr. Memo Hdr." where("Buy-from Vendor No." = field("No.")));
            Caption = 'No. of Pstd. Credit Memos';
            Editable = false;
            FieldClass = FlowField;
        }
        field(7181; "Pay-to No. of Orders"; Integer)
        {
            AccessByPermission = TableData "Purch. Rcpt. Header" = R;
            CalcFormula = count("Purchase Header" where("Document Type" = const(Order),
                                                         "Pay-to Vendor No." = field("No.")));
            Caption = 'Pay-to No. of Orders';
            Editable = false;
            FieldClass = FlowField;
        }
        field(7182; "Pay-to No. of Invoices"; Integer)
        {
            CalcFormula = count("Purchase Header" where("Document Type" = const(Invoice),
                                                         "Pay-to Vendor No." = field("No.")));
            Caption = 'Pay-to No. of Invoices';
            Editable = false;
            FieldClass = FlowField;
        }
        field(7183; "Pay-to No. of Return Orders"; Integer)
        {
            AccessByPermission = TableData "Return Shipment Header" = R;
            CalcFormula = count("Purchase Header" where("Document Type" = const("Return Order"),
                                                         "Pay-to Vendor No." = field("No.")));
            Caption = 'Pay-to No. of Return Orders';
            Editable = false;
            FieldClass = FlowField;
        }
        field(7184; "Pay-to No. of Credit Memos"; Integer)
        {
            CalcFormula = count("Purchase Header" where("Document Type" = const("Credit Memo"),
                                                         "Pay-to Vendor No." = field("No.")));
            Caption = 'Pay-to No. of Credit Memos';
            Editable = false;
            FieldClass = FlowField;
        }
        field(7185; "Pay-to No. of Pstd. Receipts"; Integer)
        {
            CalcFormula = count("Purch. Rcpt. Header" where("Pay-to Vendor No." = field("No.")));
            Caption = 'Pay-to No. of Pstd. Receipts';
            Editable = false;
            FieldClass = FlowField;
        }
        field(7186; "Pay-to No. of Pstd. Invoices"; Integer)
        {
            CalcFormula = count("Purch. Inv. Header" where("Pay-to Vendor No." = field("No.")));
            Caption = 'Pay-to No. of Pstd. Invoices';
            Editable = false;
            FieldClass = FlowField;
        }
        field(7187; "Pay-to No. of Pstd. Return S."; Integer)
        {
            CalcFormula = count("Return Shipment Header" where("Pay-to Vendor No." = field("No.")));
            Caption = 'Pay-to No. of Pstd. Return S.';
            Editable = false;
            FieldClass = FlowField;
        }
        field(7188; "Pay-to No. of Pstd. Cr. Memos"; Integer)
        {
            CalcFormula = count("Purch. Cr. Memo Hdr." where("Pay-to Vendor No." = field("No.")));
            Caption = 'Pay-to No. of Pstd. Cr. Memos';
            Editable = false;
            FieldClass = FlowField;
        }
        field(7189; "No. of Quotes"; Integer)
        {
            CalcFormula = count("Purchase Header" where("Document Type" = const(Quote),
                                                         "Buy-from Vendor No." = field("No.")));
            Caption = 'No. of Quotes';
            Editable = false;
            FieldClass = FlowField;
        }
        field(7190; "No. of Blanket Orders"; Integer)
        {
            AccessByPermission = TableData "Purch. Rcpt. Header" = R;
            CalcFormula = count("Purchase Header" where("Document Type" = const("Blanket Order"),
                                                         "Buy-from Vendor No." = field("No.")));
            Caption = 'No. of Blanket Orders';
            Editable = false;
            FieldClass = FlowField;
        }
        field(7191; "No. of Orders"; Integer)
        {
            AccessByPermission = TableData "Purch. Rcpt. Header" = R;
            CalcFormula = count("Purchase Header" where("Document Type" = const(Order),
                                                         "Buy-from Vendor No." = field("No.")));
            Caption = 'No. of Orders';
            FieldClass = FlowField;
        }
        field(7192; "No. of Invoices"; Integer)
        {
            CalcFormula = count("Purchase Header" where("Document Type" = const(Invoice),
                                                         "Buy-from Vendor No." = field("No.")));
            Caption = 'No. of Invoices';
            Editable = false;
            FieldClass = FlowField;
        }
        field(7193; "No. of Return Orders"; Integer)
        {
            AccessByPermission = TableData "Return Shipment Header" = R;
            CalcFormula = count("Purchase Header" where("Document Type" = const("Return Order"),
                                                         "Buy-from Vendor No." = field("No.")));
            Caption = 'No. of Return Orders';
            Editable = false;
            FieldClass = FlowField;
        }
        field(7194; "No. of Credit Memos"; Integer)
        {
            CalcFormula = count("Purchase Header" where("Document Type" = const("Credit Memo"),
                                                         "Buy-from Vendor No." = field("No.")));
            Caption = 'No. of Credit Memos';
            Editable = false;
            FieldClass = FlowField;
        }
        field(7195; "No. of Order Addresses"; Integer)
        {
            CalcFormula = count("Order Address" where("Vendor No." = field("No.")));
            Caption = 'No. of Order Addresses';
            Editable = false;
            FieldClass = FlowField;
        }
        field(7196; "Pay-to No. of Quotes"; Integer)
        {
            CalcFormula = count("Purchase Header" where("Document Type" = const(Quote),
                                                         "Pay-to Vendor No." = field("No.")));
            Caption = 'Pay-to No. of Quotes';
            Editable = false;
            FieldClass = FlowField;
        }
        field(7197; "Pay-to No. of Blanket Orders"; Integer)
        {
            AccessByPermission = TableData "Purch. Rcpt. Header" = R;
            CalcFormula = count("Purchase Header" where("Document Type" = const("Blanket Order"),
                                                         "Pay-to Vendor No." = field("No.")));
            Caption = 'Pay-to No. of Blanket Orders';
            FieldClass = FlowField;
        }
        field(7198; "No. of Incoming Documents"; Integer)
        {
            CalcFormula = count("Incoming Document" where("Vendor No." = field("No.")));
            Caption = 'No. of Incoming Documents';
            Editable = false;
            FieldClass = FlowField;
        }
        field(7600; "Base Calendar Code"; Code[10])
        {
            Caption = 'Base Calendar Code';
            TableRelation = "Base Calendar";
        }
        field(7601; "Document Sending Profile"; Code[20])
        {
            Caption = 'Document Sending Profile';
            TableRelation = "Document Sending Profile".Code;
        }
        field(7602; "Validate EU Vat Reg. No."; Boolean)
        {
            Caption = 'Validate EU Vat Reg. No.';
        }
        field(8000; Id; Guid)
        {
            Caption = 'Id';
        }
        field(8001; "Currency Id"; Guid)
        {
            Caption = 'Currency Id';
            TableRelation = Currency.code;

            trigger OnValidate()
            begin
                UpdateCurrencyCode;
            end;
        }
        field(8002; "Payment Terms Id"; Guid)
        {
            Caption = 'Payment Terms Id';
            TableRelation = "Payment Terms".code;

            trigger OnValidate()
            begin
                UpdatePaymentTermsCode;
            end;
        }
        field(8003; "Payment Method Id"; Guid)
        {
            Caption = 'Payment Method Id';
            TableRelation = "Payment Method".code;

            trigger OnValidate()
            begin
                UpdatePaymentMethodCode;
            end;
        }
        field(50000; "Vendor Type"; Option)
        {
            OptionCaption = 'Trade,Director';
            OptionMembers = Trade,Director;
        }
        field(50001; "Total Allowances"; Decimal)
        {
            CalcFormula = sum("Director Ledger Entry".Amount where(Type = const(Payment),
                                                                    "Director No" = field("No."),
                                                                    "Payroll Period" = field("Pay Period Filter"),
                                                                    "Non-Cash Benefit" = const(false),
                                                                    "Pay Mode" = field("Pay Mode Filter")));
            Editable = false;
            FieldClass = FlowField;
        }
        field(50002; "Total Deductions"; Decimal)
        {
            CalcFormula = sum("Director Ledger Entry".Amount where(Type = filter(Deduction),
                                                                    "Director No" = field("No."),
                                                                    "Payroll Period" = field("Pay Period Filter")));
            Editable = false;
            FieldClass = FlowField;
        }
        field(50003; "PIN Number"; Code[20])
        {
        }
        field(50004; "Cumm. PAYE"; Decimal)
        {
            CalcFormula = sum("Director Ledger Entry".Amount where("Director No" = field("No."),
                                                                    "Payroll Period" = field("Pay Period Filter"),
                                                                    Paye = const(true)));
            Editable = false;
            FieldClass = FlowField;
        }
        field(50005; "Taxable Income"; Decimal)
        {
            CalcFormula = sum("Director Ledger Entry".Amount where("Director No" = field("No."),
                                                                    "Payroll Period" = field("Pay Period Filter"),
                                                                    Taxable = const(true)));
            Editable = false;
            FieldClass = FlowField;
        }
        field(50006; "Payroll Pay Mode"; Code[20])
        {
            TableRelation = "Payroll Pay Mode";
        }
        field(50007; "Pay Mode Filter"; Code[20])
        {
            FieldClass = FlowFilter;
            TableRelation = "Payroll Pay Mode";
        }
        field(50008; "Pays tax"; Boolean)
        {
        }
        field(50009; "Non Cash Benefit"; Decimal)
        {
            CalcFormula = sum("Director Ledger Entry".Amount where(Type = const(Payment),
                                                                    "Director No" = field("No."),
                                                                    "Payroll Period" = field("Pay Period Filter"),
                                                                    "Non-Cash Benefit" = const(true)));
            FieldClass = FlowField;
        }
        field(50010; "Pay Period Filter"; Date)
        {
            FieldClass = FlowFilter;
            TableRelation = "Payroll PeriodX"."Starting Date";
        }
        field(50020; "Shortcut Dimension 3 Code"; Code[20])
        {
            CaptionClass = '1,1,3';
            Caption = 'Shorstcut Dimension 3 Code';
            TableRelation = "Dimension Value".Code where("Global Dimension No." = const(3));

            trigger OnValidate()
            begin
                //ValidateShortcutDimCode(3,"Shortcut Dimension 3 Code");
            end;
        }
        field(50021; "Shortcut Dimension 4 Code"; Code[20])
        {
            CaptionClass = '1,1,4';
            Caption = 'Shortcut Dimension 4 Code';
            TableRelation = "Dimension Value".Code where("Global Dimension No." = const(4));

            trigger OnValidate()
            begin
                //ValidateShortcutDimCode(4,"Shortcut Dimension 4 Code");
            end;
        }
        field(50022; "Shortcut Dimension 5 Code"; Code[20])
        {
            CaptionClass = '1,1,5';
            Caption = 'Shortcut Dimension 5 Code';
            TableRelation = "Dimension Value".Code where("Global Dimension No." = const(5));

            trigger OnValidate()
            begin
                //ValidateShortcutDimCode(5,"Shortcut Dimension 5 Code");
            end;
        }
        field(50050; Vendorname; Code[50])
        {
        }
        field(50145; "Vendor Credit Limit(LCY)"; Decimal)
        {
        }
        field(50146; "Requisition Default Vendor"; Boolean)
        {
        }
        field(50147; "Vendor Retention Account"; Code[20])
        {
            TableRelation = Vendor."No." where(Retention = const(true));
        }
        field(50148; Retention; Boolean)
        {
        }
        field(50149; Tel; Code[20])
        {
        }
        field(50150; Email; Text[200])
        {
        }
        field(50151; "Bank Account Number"; Code[200])
        {
        }
        field(50152; "Bank Branch"; Code[200])
        {
            TableRelation = "Employee Bank AccountX"."Bank Branch No." where(Code = field("Vendor's Bank"));
        }
        field(50153; "Vendor's Bank"; Code[200])
        {
            TableRelation = "Employee Bank AccountX";
        }
        field(50154; "Bank Name"; Text[200])
        {
            CalcFormula = lookup("Employee Bank AccountX"."Bank Name" where(Code = field("Vendor's Bank"),
                                                                             "Bank Branch No." = field("Bank Branch")));
            Editable = false;
            FieldClass = FlowField;
        }
        field(50155; "Bank Branch Name"; Text[200])
        {
            CalcFormula = lookup("Employee Bank AccountX"."Branch Name" where("Bank Branch No." = field("Bank Branch"),
                                                                               Code = field("Vendor's Bank")));
            Editable = false;
            FieldClass = FlowField;
        }
        field(50156; Status; Option)
        {
            OptionCaption = ' ,Active,Inactive,Exited';
            OptionMembers = " ",Active,Inactive,Exited;
        }
        field(50157; "Appointment Date"; Date)
        {
        }
        field(50158; "Termination Date"; Date)
        {
        }
        field(50159; "Yagpo Cert. No."; Code[50])
        {
        }
        field(50160; Category; Code[200])
        {
        }
        field(50161; "Incorporation Certificate No."; Code[200])
        {
        }
        field(50162; Disability; Boolean)
        {
        }
        field(50163; "Tax Compliance"; Code[250])
        {
        }
        field(50164; "Certificate of Registration"; Code[200])
        {
        }
        field(50165; "Type of Work Done"; Text[250])
        {
        }
        field(50166; "Supplier Category"; Text[200])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Supplier Category";
        }
        field(50167; "Special Category"; Text[200])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Vendor Target Groups";
        }
        field(54004; Broker; Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(54006; "Vendor Type1"; Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = ',Unit Trust,Broker,Agent';
            OptionMembers = ,"Unit Trust",Broker,Agent;
        }
        field(70000; "KBA Code"; Code[10])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Employee Bank AccountX".Code;
        }
        field(70001; "KBA Branch Code"; Code[10])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Employee Bank AccountX"."Bank Branch No.";
        }
        field(70002; "Withholding Tax Code"; Code[10])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Tariff Codes1";
        }
        field(70004; "Working Hours"; Code[10])
        {
            DataClassification = ToBeClassified;
        }
        field(70005; Prequalification; Integer)
        {
            CalcFormula = count("Prequalified Suppliers1" where("Vendor No" = field("No.")));
            FieldClass = FlowField;
        }
        field(70006; "Special Groups Type"; Code[50])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Vendor Target Groups".Code;
        }
        field(70007; "Secondary Contact No."; Code[50])
        {
            Caption = 'Secondary Contact No.';
            DataClassification = ToBeClassified;
            TableRelation = Contact;

            trigger OnLookup()
            var
                Cont: Record Contact;
                ContBusRel: Record "Contact Business Relation";
            begin

                ContBusRel.SetCurrentkey("Link to Table", "No.");
                ContBusRel.SetRange("Link to Table", ContBusRel."link to table"::Vendor);
                ContBusRel.SetRange("No.", "No.");
                if ContBusRel.FindFirst then
                    Cont.SetRange("Company No.", ContBusRel."Contact No.")
                else
                    Cont.SetRange("No.", '');

                if "Secondary Contact No." <> '' then
                    if Cont.Get("Secondary Contact No.") then;
                if Page.RunModal(0, Cont) = Action::LookupOK then
                    Validate("Secondary Contact No.", Cont."No.");
            end;

            trigger OnValidate()
            var
                Cont: Record Contact;
                ContBusRel: Record "Contact Business Relation";
            begin

                "Secondary Contact" := '';
                if "Secondary Contact No." <> '' then begin
                    Cont.Get("Secondary Contact No.");

                    ContBusRel.SetCurrentkey("Link to Table", "No.");
                    ContBusRel.SetRange("Link to Table", ContBusRel."link to table"::Vendor);
                    ContBusRel.SetRange("No.", "No.");
                    ContBusRel.FindFirst;

                    if Cont."Company No." <> ContBusRel."Contact No." then
                        Error(Text004, Cont."No.", Cont.Name, "No.", Name);

                    if Cont.Type = Cont.Type::Person then
                        "Secondary Contact" := Cont.Name
                end;
            end;
        }
        field(70008; "Secondary Contact"; Text[50])
        {
            Caption = 'Secondary Contact';
            DataClassification = ToBeClassified;

            trigger OnValidate()
            var
                vend: record vendor;
            begin
                if RMSetup.Get then
                    if RMSetup."Bus. Rel. Code for Vendors" <> '' then
                        if (xRec."Secondary Contact" = '') and (xRec."Secondary Contact No." = '') then begin
                            Modify;
                            UpdateContFromVend.OnModify(vend);
                            UpdateContFromVend.InsertNewContactPerson(vend, false);
                            Modify(true);
                        end
            end;
        }
        field(70009; "Maximum Order Amount"; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(70010; "Minimum Order Amount"; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(70011; "Supplier Registration No."; Code[50])
        {
            DataClassification = ToBeClassified;
        }
        field(70012; "Registration Date"; Date)
        {
            DataClassification = ToBeClassified;
        }
        field(70013; "Registration Expiry Date"; Date)
        {
            DataClassification = ToBeClassified;
        }
        field(70014; "Maximum Order Quantity"; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(70015; "Minimum Order Quantity"; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(70016; ReviewerID; Code[10])
        {
            DataClassification = ToBeClassified;
        }
        field(70017; "Vendor Bank"; Text[30])
        {
            DataClassification = ToBeClassified;
        }
        field(70018; "Bank Branch Code"; Text[30])
        {
            DataClassification = ToBeClassified;
        }
        field(70019; "SWIFT Code"; Text[30])
        {
            DataClassification = ToBeClassified;
        }
        field(70020; "IBAN Code"; Text[30])
        {
            DataClassification = ToBeClassified;
        }
        field(70021; "Procurement status"; Option)
        {
            DataClassification = ToBeClassified;
            OptionMembers = Open,Awarded;
        }
        field(70022; Paye; Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(70023; "Net Pay"; Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(70060; "Ownership Type"; Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = ',Sole Ownership.Partnership,Registered Company';
            OptionMembers = ,"Sole Ownership.Partnership","Registered Company";
        }
        field(70061; "Registration/Incorporation No."; Code[50])
        {
            DataClassification = ToBeClassified;
        }
        field(70062; "Reg/Incorporation Date"; Date)
        {
            DataClassification = ToBeClassified;
        }
        field(70063; "Operations Start Date"; Date)
        {
            DataClassification = ToBeClassified;
        }
        field(70064; "PIN No."; Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(70065; "NSSF No."; Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(70066; "NHIF No."; Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(70067; "Current Vendor Class"; Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(70068; "Vendor Cluster"; Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = 'General,Special';
            OptionMembers = General,Special;
        }
        field(70069; "Supplier Type"; Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = 'Local,Foreign';
            OptionMembers = "Local",Foreign;
        }
        field(70070; "Nominal Capital LCY"; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(70071; "Issued Capital LCY"; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(70072; "Dealer Type"; Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = 'Manufacturer,Distributor,Partner,Reseller,Other';
            OptionMembers = Manufacturer,Distributor,Partner,Reseller,Other;
        }
        field(70073; "Max Value of Business"; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(70074; "Nature of Business"; Text[50])
        {
            DataClassification = ToBeClassified;
        }
        field(70075; "Fixed Line Tel No"; Code[30])
        {
            DataClassification = ToBeClassified;
        }
        field(70076; "Building/House No"; Text[50])
        {
            DataClassification = ToBeClassified;
        }
        field(70077; Floor; Text[30])
        {
            DataClassification = ToBeClassified;
        }
        field(70078; "Plot No"; Code[50])
        {
            DataClassification = ToBeClassified;
        }
        field(70079; Street; Text[50])
        {
            DataClassification = ToBeClassified;
        }
        field(70080; "Authorized Signatory Name"; Text[50])
        {
            DataClassification = ToBeClassified;
        }
        field(70081; "Signatory Designation"; Text[50])
        {
            DataClassification = ToBeClassified;
        }
        field(70082; "Vision Statement"; Text[250])
        {
            DataClassification = ToBeClassified;
        }
        field(70083; "Mission Statement"; Text[250])
        {
            DataClassification = ToBeClassified;
        }
        field(70084; "Total Number of Employees"; Decimal)
        {
            DataClassification = ToBeClassified;
        }
    }

    keys
    {
        key(Key1; "No.")
        {
            Clustered = true;
        }
        key(Key2; "Search Name")
        {
        }
        key(Key3; "Vendor Posting Group")
        {
        }
        key(Key4; "Currency Code")
        {
        }
        key(Key5; Priority)
        {
        }
        key(Key6; "Country/Region Code")
        {
        }
        key(Key7; "Gen. Bus. Posting Group")
        {
        }
        key(Key8; "VAT Registration No.")
        {
        }
        key(Key9; Name)
        {
        }
        key(Key10; City)
        {
        }
        key(Key11; "Post Code")
        {
        }
        key(Key12; "Phone No.")
        {
        }
        key(Key13; Contact)
        {
        }
        key(Key14; Blocked)
        {
        }
    }

    fieldgroups
    {
        fieldgroup(DropDown; "No.", Name, City, "Post Code", "Phone No.", Contact)
        {
        }
        fieldgroup(Brick; "No.", Name, "Balance (LCY)", Contact, "Balance Due (LCY)", Image)
        {
        }
    }

    trigger OnDelete()
    var
        ItemVendor: Record "Item Vendor";
        PurchPrice: Record "Purchase Price";
        PurchLineDiscount: Record "Purchase Line Discount";
        PurchPrepmtPct: Record "Purchase Prepayment %";
        //cc//SocialListeningSearchTopic: Record "Social Listening Search Topic";
        CustomReportSelection: Record "Custom Report Selection";
        PurchOrderLine: Record "Purchase Line";
    //IntrastatSetup: Record "Intrastat Setup";        VATRegistrationLogMgt: Codeunit "VAT Registration Log Mgt.";
    begin
        //ApprovalsMgmt.OnCancelVendorApprovalRequest(vend);

        MoveEntries.MoveVendorEntries(vend);

        CommentLine.SetRange("Table Name", CommentLine."table name"::Vendor);
        CommentLine.SetRange("No.", "No.");
        CommentLine.DeleteAll;

        VendBankAcc.SetRange("Vendor No.", "No.");
        VendBankAcc.DeleteAll;

        OrderAddr.SetRange("Vendor No.", "No.");
        OrderAddr.DeleteAll;

        ItemCrossReference.SetCurrentkey("Reference Type No.", "Reference Type");
        ItemCrossReference.SetRange("Reference Type", ItemCrossReference."reference type"::Vendor);
        ItemCrossReference.SetRange("Reference Type No.", "No.");
        ItemCrossReference.DeleteAll;

        PurchOrderLine.SetCurrentkey("Document Type", "Pay-to Vendor No.");
        PurchOrderLine.SetRange("Pay-to Vendor No.", "No.");
        if PurchOrderLine.FindFirst then
            Error(
              Text000,
              TableCaption, "No.",
              PurchOrderLine."Document Type");

        PurchOrderLine.SetRange("Pay-to Vendor No.");
        PurchOrderLine.SetRange("Buy-from Vendor No.", "No.");
        if not PurchOrderLine.IsEmpty then
            Error(
              Text000,
              TableCaption, "No.");

        UpdateContFromVend.OnDelete(vend);

        DimMgt.DeleteDefaultDim(Database::Vendor, "No.");

        ServiceItem.SetRange("Vendor No.", "No.");
        ServiceItem.ModifyAll("Vendor No.", '');

        ItemVendor.SetRange("Vendor No.", "No.");
        ItemVendor.DeleteAll(true);

        // if not SocialListeningSearchTopic.IsEmpty then begin
        //     SocialListeningSearchTopic.FindSearchTopic(SocialListeningSearchTopic."source type"::Vendor, "No.");
        //     SocialListeningSearchTopic.DeleteAll;
        // end;

        PurchPrice.SetCurrentkey("Vendor No.");
        PurchPrice.SetRange("Vendor No.", "No.");
        PurchPrice.DeleteAll(true);

        PurchLineDiscount.SetCurrentkey("Vendor No.");
        PurchLineDiscount.SetRange("Vendor No.", "No.");
        PurchLineDiscount.DeleteAll(true);

        CustomReportSelection.SetRange("Source Type", Database::Vendor);
        CustomReportSelection.SetRange("Source No.", "No.");
        CustomReportSelection.DeleteAll;

        PurchPrepmtPct.SetCurrentkey("Vendor No.");
        PurchPrepmtPct.SetRange("Vendor No.", "No.");
        PurchPrepmtPct.DeleteAll(true);

        //cc// VATRegistrationLogMgt.DeleteVendorLog(vend);

        //cc//  IntrastatSetup.CheckDeleteIntrastatContact(IntrastatSetup."intrastat contact type"::Vendor, "No.");

        CalendarManagement.DeleteCustomizedBaseCalendarData(CustomizedCalendarChange."source type"::Vendor, "No.");
    end;

    trigger OnInsert()
    begin
        if "No." = '' then begin
            PurchSetup.Get;
            PurchSetup.TestField("Vendor Nos.");
           // NoSeriesMgt.InitSeries(PurchSetup."Vendor Nos.", xRec."No. Series", 0D, "No.", "No. Series");
            "No." := NoSeriesMgt.GetNextNo(PurchSetup."Vendor Nos.", Today, true);
        end;

        if "Invoice Disc. Code" = '' then
            "Invoice Disc. Code" := "No.";

        if not (InsertFromContact or (InsertFromTemplate and (Contact <> ''))) then
            UpdateContFromVend.OnInsert(vend);

        if "Purchaser Code" = '' then
            SetDefaultPurchaser;

        DimMgt.UpdateDefaultDim(
          Database::Vendor, "No.",
          "Global Dimension 1 Code", "Global Dimension 2 Code");

        UpdateReferencedIds;
        SetLastModifiedDateTime;
    end;

    trigger OnModify()
    begin
        UpdateReferencedIds;
        SetLastModifiedDateTime;

        if IsContactUpdateNeeded then begin
            Modify;
            UpdateContFromVend.OnModify(vend);
            if not Find then begin
                Reset;
                if Find then;
            end;
        end;
    end;

    trigger OnRename()
    begin
        ApprovalsMgmt.OnRenameRecordInApprovalRequest(xRec.RecordId, RecordId);
        DimMgt.RenameDefaultDim(Database::Vendor, xRec."No.", "No.");
        SetLastModifiedDateTime;
        if xRec."Invoice Disc. Code" = xRec."No." then
            "Invoice Disc. Code" := "No.";

        CalendarManagement.RenameCustomizedBaseCalendarData(CustomizedCalendarChange."source type"::Vendor, "No.", xRec."No.");
    end;

    var
        Text000: label 'You cannot delete %1 %2 because there is at least one outstanding Purchase %3 for this vendor.';
        Text002: label 'You have set %1 to %2. Do you want to update the %3 price list accordingly?';
        Text003: label 'Do you wish to create a contact for %1 %2?';
        PurchSetup: Record "Purchases & Payables Setup";
        CommentLine: Record "Comment Line";
        PostCode: Record "Post Code";
        VendBankAcc: Record "Vendor Bank Account";
        OrderAddr: Record "Order Address";
        GenBusPostingGrp: Record "Gen. Business Posting Group";
        ItemCrossReference: Record "Item Reference";
        RMSetup: Record "Marketing Setup";
        ServiceItem: Record "Service Item";
        SalespersonPurchaser: Record "Salesperson/Purchaser";
        CustomizedCalendarChange: Record "Customized Calendar Change";
        NoSeriesMgt: Codeunit "No. Series";
        MoveEntries: Codeunit MoveEntries;
        UpdateContFromVend: Codeunit "VendCont-Update";
        DimMgt: Codeunit DimensionManagement;
        LeadTimeMgt: Codeunit "Lead-Time Management";
        ApprovalsMgmt: Codeunit "Approvals Mgmt.";
        CalendarManagement: Codeunit "Calendar Management";
        InsertFromContact: Boolean;
        vend: record vendor;
        Text004: label 'Contact %1 %2 is not related to vendor %3 %4.';
        Text005: label 'post';
        Text006: label 'create';
        Text007: label 'You cannot %1 this type of document when Vendor %2 is blocked with type %3';
        Text008: label 'The %1 %2 has been assigned to %3 %4.\The same %1 cannot be entered on more than one %3.';
        Text009: label 'Reconciling IC transactions may be difficult if you change IC Partner Code because this %1 has ledger entries in a fiscal year that has not yet been closed.\ Do you still want to change the IC Partner Code?';
        Text010: label 'You cannot change the contents of the %1 field because this %2 has one or more open ledger entries.';
        Text011: label 'Before you can use Online Map, you must fill in the Online Map Setup window.\See Setting Up Online Map in Help.';
        SelectVendorErr: label 'You must select an existing vendor.';
        CreateNewVendTxt: label 'Create a new vendor card for %1.', Comment = '%1 is the name to be used to create the customer. ';
        VendNotRegisteredTxt: label 'This vendor is not registered. To continue, choose one of the following options:';
        SelectVendTxt: label 'Select an existing vendor.';
        InsertFromTemplate: Boolean;
        PrivacyBlockedActionErr: label 'You cannot %1 this type of document when Vendor %2 is blocked for privacy.', Comment = '%1 = action (create or post), %2 = vendor code.';
        PrivacyBlockedGenericTxt: label 'Privacy Blocked must not be true for vendor %1.', Comment = '%1 = vendor code';
        ConfirmBlockedPrivacyBlockedQst: label 'If you change the Blocked field, the Privacy Blocked field is changed to No. Do you want to continue?';
        CanNotChangeBlockedDueToPrivacyBlockedErr: label 'The Blocked field cannot be changed because the user is blocked for privacy reasons.';
        PhoneNoCannotContainLettersErr: label 'You cannot enter letters in this field.';

    procedure AssistEdit(OldVend: Record Vendor): Boolean
    var
        Vend: Record Vendor;
    begin
        begin
            //  Vend := Rec;
            PurchSetup.Get;
            PurchSetup.TestField("Vendor Nos.");
         //cc if NoSeriesMgt.SelectSeries(PurchSetup."Vendor Nos.", OldVend."No. Series", Vend."No. Series") then begin
                PurchSetup.Get;
                PurchSetup.TestField("Vendor Nos.");
             //   NoSeriesMgt. (Vend."No.");
                // Rec := Vend;
                exit(true);
            end;
        end;
   // end;

    procedure ValidateShortcutDimCode(FieldNumber: Integer; var ShortcutDimCode: Code[20])
    begin
        DimMgt.ValidateDimValueCode(FieldNumber, ShortcutDimCode);
        DimMgt.SaveDefaultDim(Database::Vendor, "No.", FieldNumber, ShortcutDimCode);
        Modify;
    end;

    procedure ShowContact()
    var
        ContBusRel: Record "Contact Business Relation";
        Cont: Record Contact;
        OfficeContact: Record Contact;
        OfficeMgt: Codeunit "Office Management";
        ConfirmManagement: Codeunit "Confirm Management";
    begin
        if OfficeMgt.GetContact(OfficeContact, "No.") and (OfficeContact.Count = 1) then
            Page.Run(Page::"Contact Card", OfficeContact)
        else begin
            if "No." = '' then
                exit;

            ContBusRel.SetCurrentkey("Link to Table", "No.");
            ContBusRel.SetRange("Link to Table", ContBusRel."link to table"::Vendor);
            ContBusRel.SetRange("No.", "No.");
            if not ContBusRel.FindFirst then begin
                if not ConfirmManagement.GetResponse(StrSubstNo(Text003, TableCaption, "No."), true) then
                    exit;
                UpdateContFromVend.InsertNewContact(vend, false);
                ContBusRel.FindFirst;
            end;
            Commit;

            Cont.FilterGroup(2);
            Cont.SetRange("Company No.", ContBusRel."Contact No.");
            Page.Run(Page::"Contact List", Cont);
        end;
    end;

    procedure SetInsertFromContact(FromContact: Boolean)
    begin
        InsertFromContact := FromContact;
    end;

    procedure CheckBlockedVendOnDocs(Vend2: Record Vendor; Transaction: Boolean)
    begin
        if Vend2."Privacy Blocked" then
            VendPrivacyBlockedErrorMessage(Vend2, Transaction);

        if Vend2.Blocked = Vend2.Blocked::All then
            VendBlockedErrorMessage(Vend2, Transaction);
    end;

    procedure CheckBlockedVendOnJnls(Vend2: Record Vendor; DocType: Option " ",Payment,Invoice,"Credit Memo","Finance Charge Memo",Reminder,Refund; Transaction: Boolean)
    begin
        begin
            if Vend2."Privacy Blocked" then
                Vend2.VendPrivacyBlockedErrorMessage(Vend2, Transaction);

            if (Vend2.Blocked = Vend2.Blocked::All) or
               (Vend2.Blocked = Vend2.Blocked::Payment) and (DocType = Doctype::Payment)
            then
                Vend2.VendBlockedErrorMessage(Vend2, Transaction);
        end;
    end;

    procedure CreateAndShowNewInvoice()
    var
        PurchaseHeader: Record "Purchase Header";
    begin
        PurchaseHeader."Document Type" := PurchaseHeader."document type"::Invoice;
        PurchaseHeader.SetRange("Buy-from Vendor No.", "No.");
        PurchaseHeader.Insert(true);
        Commit;
        Page.Run(Page::"Purchase Invoice", PurchaseHeader)
    end;

    procedure CreateAndShowNewCreditMemo()
    var
        PurchaseHeader: Record "Purchase Header";
    begin
        PurchaseHeader."Document Type" := PurchaseHeader."document type"::"Credit Memo";
        PurchaseHeader.SetRange("Buy-from Vendor No.", "No.");
        PurchaseHeader.Insert(true);
        Commit;
        Page.Run(Page::"Purchase Credit Memo", PurchaseHeader)
    end;

    procedure CreateAndShowNewPurchaseOrder()
    var
        PurchaseHeader: Record "Purchase Header";
    begin
        PurchaseHeader."Document Type" := PurchaseHeader."document type"::Order;
        PurchaseHeader.SetRange("Buy-from Vendor No.", "No.");
        PurchaseHeader.Insert(true);
        Commit;
        Page.Run(Page::"Purchase Order", PurchaseHeader);
    end;

    procedure VendBlockedErrorMessage(Vend2: Record Vendor; Transaction: Boolean)
    var
        "Action": Text[30];
    begin
        if Transaction then
            Action := Text005
        else
            Action := Text006;
        Error(Text007, Action, Vend2."No.", Vend2.Blocked);
    end;

    procedure VendPrivacyBlockedErrorMessage(Vend2: Record Vendor; Transaction: Boolean)
    var
        "Action": Text[30];
    begin
        if Transaction then
            Action := Text005
        else
            Action := Text006;

        Error(PrivacyBlockedActionErr, Action, Vend2."No.");
    end;

    procedure GetPrivacyBlockedGenericErrorText(Vend2: Record Vendor): Text[250]
    begin
        exit(StrSubstNo(PrivacyBlockedGenericTxt, Vend2."No."));
    end;

    procedure DisplayMap()
    var
        MapPoint: Record "Online Map Setup";
        MapMgt: Codeunit "Online Map Management";
    begin
        if MapPoint.FindFirst then
            MapMgt.MakeSelection(Database::Vendor, GetPosition)
        else
            Message(Text011);
    end;

    procedure CalcOverDueBalance() OverDueBalance: Decimal
    var
        [SecurityFiltering(Securityfilter::Filtered)]
        VendLedgEntryRemainAmtQuery: Query "Vend. Ledg. Entry Remain. Amt.";
    begin
        VendLedgEntryRemainAmtQuery.SetRange(Vendor_No, "No.");
        VendLedgEntryRemainAmtQuery.SetRange(IsOpen, true);
        VendLedgEntryRemainAmtQuery.SetFilter(Due_Date, '<%1', WorkDate);
        VendLedgEntryRemainAmtQuery.Open;

        if VendLedgEntryRemainAmtQuery.Read then
            OverDueBalance := -VendLedgEntryRemainAmtQuery.Sum_Remaining_Amt_LCY;
    end;

    procedure GetInvoicedPrepmtAmountLCY(): Decimal
    var
        PurchLine: Record "Purchase Line";
    begin
        PurchLine.SetCurrentkey("Document Type", "Pay-to Vendor No.");
        PurchLine.SetRange("Document Type", PurchLine."document type"::Order);
        PurchLine.SetRange("Pay-to Vendor No.", "No.");
        PurchLine.CalcSums("Prepmt. Amount Inv. (LCY)", "Prepmt. VAT Amount Inv. (LCY)");
        exit(PurchLine."Prepmt. Amount Inv. (LCY)" + PurchLine."Prepmt. VAT Amount Inv. (LCY)");
    end;

    procedure GetTotalAmountLCY(): Decimal
    begin
        CalcFields(
          "Balance (LCY)", "Outstanding Orders (LCY)", "Amt. Rcd. Not Invoiced (LCY)", "Outstanding Invoices (LCY)");

        exit(
          "Balance (LCY)" + "Outstanding Orders (LCY)" +
          "Amt. Rcd. Not Invoiced (LCY)" + "Outstanding Invoices (LCY)" - GetInvoicedPrepmtAmountLCY);
    end;

    procedure HasAddress(): Boolean
    begin
        case true of
            Address <> '':
                exit(true);
            "Address 2" <> '':
                exit(true);
            City <> '':
                exit(true);
            "Country/Region Code" <> '':
                exit(true);
            County <> '':
                exit(true);
            "Post Code" <> '':
                exit(true);
            Contact <> '':
                exit(true);
        end;

        exit(false);
    end;

    procedure GetVendorNo(VendorText: Text[100]): Code[20]
    begin
        exit(GetVendorNoOpenCard(VendorText, true));
    end;

    procedure GetVendorNoOpenCard(VendorText: Text[100]; ShowVendorCard: Boolean): Code[20]
    var
        Vendor: Record Vendor;
        VendorNo: Code[20];
        NoFiltersApplied: Boolean;
        VendorWithoutQuote: Text;
        VendorFilterFromStart: Text;
        VendorFilterContains: Text;
    begin
        if VendorText = '' then
            exit('');

        if StrLen(VendorText) <= MaxStrLen(Vendor."No.") then
            if Vendor.Get(VendorText) then
                exit(Vendor."No.");

        VendorWithoutQuote := ConvertStr(VendorText, '''', '?');

        Vendor.SetFilter(Name, '''@' + VendorWithoutQuote + '''');
        if Vendor.FindFirst then
            exit(Vendor."No.");
        Vendor.SetRange(Name);

        VendorFilterFromStart := '''@' + VendorWithoutQuote + '*''';

        Vendor.FilterGroup := -1;
        Vendor.SetFilter("No.", VendorFilterFromStart);
        Vendor.SetFilter(Name, VendorFilterFromStart);
        if Vendor.FindFirst then
            exit(Vendor."No.");

        VendorFilterContains := '''@*' + VendorWithoutQuote + '*''';

        Vendor.SetFilter("No.", VendorFilterContains);
        Vendor.SetFilter(Name, VendorFilterContains);
        Vendor.SetFilter(City, VendorFilterContains);
        Vendor.SetFilter(Contact, VendorFilterContains);
        Vendor.SetFilter("Phone No.", VendorFilterContains);
        Vendor.SetFilter("Post Code", VendorFilterContains);

        if Vendor.Count = 0 then
            MarkVendorsWithSimilarName(Vendor, VendorText);

        if Vendor.Count = 1 then begin
            Vendor.FindFirst;
            exit(Vendor."No.");
        end;

        if not GuiAllowed then
            Error(SelectVendorErr);

        if Vendor.Count = 0 then begin
            if Vendor.WritePermission then
                case StrMenu(StrSubstNo('%1,%2', StrSubstNo(CreateNewVendTxt, VendorText), SelectVendTxt), 1, VendNotRegisteredTxt) of
                    0:
                        Error(SelectVendorErr);
                    1:
                        exit(CreateNewVendor(CopyStr(VendorText, 1, MaxStrLen(Vendor.Name)), ShowVendorCard));
                end;
            Vendor.Reset;
            NoFiltersApplied := true;
        end;

        if ShowVendorCard then
            VendorNo := PickVendor(Vendor, NoFiltersApplied)
        else
            exit('');

        if VendorNo <> '' then
            exit(VendorNo);

        Error(SelectVendorErr);
    end;

    local procedure MarkVendorsWithSimilarName(var Vendor: Record Vendor; VendorText: Text)
    var
        TypeHelper: Codeunit "Type Helper";
        VendorCount: Integer;
        VendorTextLenght: Integer;
        Treshold: Integer;
    begin
        if VendorText = '' then
            exit;
        if StrLen(VendorText) > MaxStrLen(Vendor.Name) then
            exit;
        VendorTextLenght := StrLen(VendorText);
        Treshold := VendorTextLenght DIV 5;
        if Treshold = 0 then
            exit;
        Vendor.Reset;
        Vendor.Ascending(false); // most likely to search for newest Vendors
        if Vendor.FindSet then
            repeat
                VendorCount += 1;
                if Abs(VendorTextLenght - StrLen(Vendor.Name)) <= Treshold then
                    if TypeHelper.TextDistance(UpperCase(VendorText), UpperCase(Vendor.Name)) <= Treshold then
                        Vendor.Mark(true);
            until Vendor.Mark or (Vendor.Next = 0) or (VendorCount > 1000);
        Vendor.MarkedOnly(true);
    end;

    local procedure CreateNewVendor(VendorName: Text[100]; ShowVendorCard: Boolean): Code[20]
    var
        Vendor: Record Vendor;
        MiniVendorTemplate: Record "Vendor Templ.";
        VendorCard: Page "Vendor Card";
    begin
        // if not MiniVendorTemplate.NewVendorFromTemplate (Vendor)  then
        //     Error(SelectVendorErr);

        Vendor.Name := VendorName;
        Vendor.Modify(true);
        Commit;
        if not ShowVendorCard then
            exit(Vendor."No.");
        Vendor.SetRange("No.", Vendor."No.");
        VendorCard.SetTableview(Vendor);
        if not (VendorCard.RunModal = Action::OK) then
            Error(SelectVendorErr);

        exit(Vendor."No.");
    end;

    local procedure PickVendor(var Vendor: Record Vendor; NoFiltersApplied: Boolean): Code[20]
    var
        VendorList: Page "Vendor List";
    begin
        if not NoFiltersApplied then
            MarkVendorsByFilters(Vendor);

        VendorList.SetTableview(Vendor);
        VendorList.SetRecord(Vendor);
        VendorList.LookupMode := true;
        if VendorList.RunModal = Action::LookupOK then
            VendorList.GetRecord(Vendor)
        else
            Clear(Vendor);

        exit(Vendor."No.");
    end;

    local procedure MarkVendorsByFilters(var Vendor: Record Vendor)
    begin
        if Vendor.FindSet then
            repeat
                Vendor.Mark(true);
            until Vendor.Next = 0;
        if Vendor.FindFirst then;
        Vendor.MarkedOnly := true;
    end;

    procedure OpenVendorLedgerEntries(FilterOnDueEntries: Boolean)
    var
        DetailedVendorLedgEntry: Record "Detailed Vendor Ledg. Entry";
        VendorLedgerEntry: Record "Vendor Ledger Entry";
    begin
        DetailedVendorLedgEntry.SetRange("Vendor No.", "No.");
        Copyfilter("Global Dimension 1 Filter", DetailedVendorLedgEntry."Initial Entry Global Dim. 1");
        Copyfilter("Global Dimension 2 Filter", DetailedVendorLedgEntry."Initial Entry Global Dim. 2");
        if FilterOnDueEntries and (GetFilter("Date Filter") <> '') then begin
            Copyfilter("Date Filter", DetailedVendorLedgEntry."Initial Entry Due Date");
            DetailedVendorLedgEntry.SetFilter("Posting Date", '<=%1', GetRangemax("Date Filter"));
        end;
        Copyfilter("Currency Filter", DetailedVendorLedgEntry."Currency Code");
        VendorLedgerEntry.DrillDownOnEntries(DetailedVendorLedgEntry);
    end;

    local procedure IsContactUpdateNeeded(): Boolean
    var
        VendContUpdate: Codeunit "VendCont-Update";
        UpdateNeeded: Boolean;
        vend2: record vendor;
    begin
        UpdateNeeded :=
          (Name <> xRec.Name) or
          ("Search Name" <> xRec."Search Name") or
          ("Name 2" <> xRec."Name 2") or
          (Address <> xRec.Address) or
          ("Address 2" <> xRec."Address 2") or
          (City <> xRec.City) or
          ("Phone No." <> xRec."Phone No.") or
          ("Telex No." <> xRec."Telex No.") or
          ("Territory Code" <> xRec."Territory Code") or
          ("Currency Code" <> xRec."Currency Code") or
          ("Language Code" <> xRec."Language Code") or
          ("Purchaser Code" <> xRec."Purchaser Code") or
          ("Country/Region Code" <> xRec."Country/Region Code") or
          ("Fax No." <> xRec."Fax No.") or
          ("Telex Answer Back" <> xRec."Telex Answer Back") or
          ("VAT Registration No." <> xRec."VAT Registration No.") or
          ("Post Code" <> xRec."Post Code") or
          (County <> xRec.County) or
          ("E-Mail" <> xRec."E-Mail") or
          ("Home Page" <> xRec."Home Page");

        if not UpdateNeeded and not IsTemporary then
            UpdateNeeded := VendContUpdate.ContactNameIsBlank("No.");

        OnBeforeIsContactUpdateNeeded(vend, vend2, UpdateNeeded);
        exit(UpdateNeeded);
    end;

    procedure SetInsertFromTemplate(FromTemplate: Boolean)
    begin
        InsertFromTemplate := FromTemplate;
    end;

    procedure SetAddress(VendorAddress: Text[100]; VendorAddress2: Text[50]; VendorPostCode: Code[20]; VendorCity: Text[30]; VendorCounty: Text[30]; VendorCountryCode: Code[10]; VendorContact: Text[100])
    begin
        Address := VendorAddress;
        "Address 2" := VendorAddress2;
        "Post Code" := VendorPostCode;
        City := VendorCity;
        County := VendorCounty;
        "Country/Region Code" := VendorCountryCode;
        UpdateContFromVend.OnModify(vend);
        Contact := VendorContact;
    end;

    local procedure SetDefaultPurchaser()
    var
        UserSetup: Record "User Setup";
    begin
        if not UserSetup.Get(UserId) then
            exit;

        if UserSetup."Salespers./Purch. Code" <> '' then
            Validate("Purchaser Code", UserSetup."Salespers./Purch. Code");
    end;

    local procedure SetLastModifiedDateTime()
    begin
        "Last Modified Date Time" := CurrentDatetime;
        "Last Date Modified" := Today;
    end;

    local procedure VATRegistrationValidation()
    var
        VATRegistrationLog: Record "VAT Registration Log";
        VATRegistrationNoFormat: Record "VAT Registration No. Format";
        VATRegNoSrvConfig: Record "VAT Reg. No. Srv Config";
        VATRegistrationLogMgt: Codeunit "VAT Registration Log Mgt.";
        ResultRecordRef: RecordRef;
        ApplicableCountryCode: Code[10];
    begin
        if not VATRegistrationNoFormat.Test("VAT Registration No.", "Country/Region Code", "No.", Database::Vendor) then
            exit;
        VATRegistrationLogMgt.LogVendor(vend);

        if ("Country/Region Code" = '') and (VATRegistrationNoFormat."Country/Region Code" = '') then
            exit;
        ApplicableCountryCode := "Country/Region Code";
        if ApplicableCountryCode = '' then
            ApplicableCountryCode := VATRegistrationNoFormat."Country/Region Code";
        if VATRegNoSrvConfig.VATRegNoSrvIsEnabled then begin
            VATRegistrationLogMgt.ValidateVATRegNoWithVIES(ResultRecordRef, Rec, "No.",
              VATRegistrationLog."account type"::Vendor, ApplicableCountryCode);
            ResultRecordRef.SetTable(Rec);
        end;
    end;

    procedure UpdateCurrencyId()
    var
        Currency: Record Currency;
    begin
        if "Currency Code" = '' then begin
            Clear("Currency Id");
            exit;
        end;

        if not Currency.Get("Currency Code") then
            exit;

        "Currency Id" := Currency.code;
    end;

    procedure UpdatePaymentTermsId()
    var
        PaymentTerms: Record "Payment Terms";
    begin
        if "Payment Terms Code" = '' then begin
            Clear("Payment Terms Id");
            exit;
        end;

        if not PaymentTerms.Get("Payment Terms Code") then
            exit;

        "Payment Terms Id" := PaymentTerms.code;
    end;

    procedure UpdatePaymentMethodId()
    var
        PaymentMethod: Record "Payment Method";
    begin
        if "Payment Method Code" = '' then begin
            Clear("Payment Method Id");
            exit;
        end;

        if not PaymentMethod.Get("Payment Method Code") then
            exit;

        "Payment Method Id" := PaymentMethod.code;
    end;

    local procedure UpdateCurrencyCode()
    var
        Currency: Record Currency;
    begin
        if not IsNullGuid("Currency Id") then begin
            Currency.SetRange(code, "Currency Id");
            Currency.FindFirst;
        end;

        Validate("Currency Code", Currency.Code);
    end;

    local procedure UpdatePaymentTermsCode()
    var
        PaymentTerms: Record "Payment Terms";
    begin
        if not IsNullGuid("Payment Terms Id") then begin
            PaymentTerms.SetRange(code, "Payment Terms Id");
            PaymentTerms.FindFirst;
        end;

        Validate("Payment Terms Code", PaymentTerms.Code);
    end;

    local procedure UpdatePaymentMethodCode()
    var
        PaymentMethod: Record "Payment Method";
    begin
        if not IsNullGuid("Payment Method Id") then begin
            PaymentMethod.SetRange(code, "Payment Method Id");
            PaymentMethod.FindFirst;
        end;

        Validate("Payment Method Code", PaymentMethod.Code);
    end;

    procedure UpdateReferencedIds()
    var
        GraphMgtGeneralTools: Codeunit "Graph Mgt - General Tools";
    begin
        if IsTemporary then
            exit;

        if not GraphMgtGeneralTools.IsApiEnabled then
            exit;

        UpdateCurrencyId;
        UpdatePaymentTermsId;
        UpdatePaymentMethodId;
    end;

    procedure GetReferencedIds(var TempField: Record "Field" temporary)
    var
        DataTypeManagement: Codeunit "Data Type Management";
    begin
        DataTypeManagement.InsertFieldToBuffer(TempField, Database::Vendor, FieldNo("Currency Id"));
        DataTypeManagement.InsertFieldToBuffer(TempField, Database::Vendor, FieldNo("Payment Terms Id"));
        DataTypeManagement.InsertFieldToBuffer(TempField, Database::Vendor, FieldNo("Payment Method Id"));
    end;

    local procedure ValidatePurchaserCode()
    begin
        if "Purchaser Code" <> '' then
            if SalespersonPurchaser.Get("Purchaser Code") then
                if SalespersonPurchaser.VerifySalesPersonPurchaserPrivacyBlocked(SalespersonPurchaser) then
                    Error(SalespersonPurchaser.GetPrivacyBlockedGenericText(SalespersonPurchaser, false))
    end;

    [IntegrationEvent(false, false)]
    local procedure OnBeforeIsContactUpdateNeeded(Vendor: Record Vendor; xVendor: Record Vendor; var UpdateNeeded: Boolean)
    begin
    end;
}
