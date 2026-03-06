#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Table 56022 "Copyright Registration Table"
{
    DrillDownPageID = "Copyright Reg Application List";
    LookupPageID = "Copyright Reg Application List";

    fields
    {
        field(1; "No."; Code[20])
        {
            Caption = 'No.';

            trigger OnValidate()
            begin
                if "No." <> xRec."No." then begin
                    SalesSetup.Get;
                    NoSeriesMgt.TestManual(SalesSetup."Copyright Registration Nos.");

                    "No. Series" := '';
                end;

                "Customer Type" := "customer type"::"Copyright Applicant"
            end;
        }
        field(2; Name; Text[50])
        {
            Caption = 'Name';

            trigger OnValidate()
            begin
                if ("Search Name" = UpperCase(xRec.Name)) or ("Search Name" = '') then
                    "Search Name" := Name;
            end;
        }
        field(3; "Search Name"; Code[50])
        {
            Caption = 'Search Name';
        }
        field(4; "Name 2"; Text[50])
        {
            Caption = 'Name 2';
        }
        field(5; Address; Text[50])
        {
            Caption = 'Address';
        }
        field(6; "Address 2"; Text[50])
        {
            Caption = 'Address 2';
        }
        field(7; City; Text[30])
        {
            Caption = 'City';
            //This property is currently not supported
            //TestTableRelation = false;
            //The property 'ValidateTableRelation' can only be set if the property 'TableRelation' is set
            //ValidateTableRelation = false;

            trigger OnValidate()
            begin
                //PostCode.ValidateCity(City,"Post Code",County,"Country/Region Code",(CurrFieldNo <> 0) AND GUIALLOWED);
            end;
        }
        field(8; Contact; Text[50])
        {
            Caption = 'Contact';

            trigger OnValidate()
            begin
                /*IF RMSetup.GET THEN
                  IF RMSetup."Bus. Rel. Code for Customers" <> '' THEN
                    IF (xRec.Contact = '') AND (xRec."Primary Contact No." = '') THEN BEGIN
                      MODIFY;
                      UpdateContFromCust.OnModify(Rec);
                      UpdateContFromCust.InsertNewContactPerson(Rec,FALSE);
                      MODIFY(TRUE);
                    END
                */

            end;
        }
        field(9; "Phone No."; Text[30])
        {
            Caption = 'Phone No.';
            ExtendedDatatype = PhoneNo;
        }
        field(10; "Telex No."; Text[20])
        {
            Caption = 'Telex No.';
        }
        field(21; "Customer Posting Group"; Code[10])
        {
            Caption = 'Customer Posting Group';
            TableRelation = "Customer Posting Group";
        }
        field(35; "Country/Region Code"; Code[10])
        {
            Caption = 'Country/Region Code';
            TableRelation = "Country/Region";
        }
        field(88; "Gen. Bus. Posting Group"; Code[10])
        {
            Caption = 'Gen. Bus. Posting Group';
            TableRelation = "Gen. Business Posting Group";

            trigger OnValidate()
            begin
                /*IF xRec."Gen. Bus. Posting Group" <> "Gen. Bus. Posting Group" THEN
                  IF GenBusPostingGrp.ValidateVatBusPostingGroup(GenBusPostingGrp,"Gen. Bus. Posting Group") THEN
                    VALIDATE("VAT Bus. Posting Group",GenBusPostingGrp."Def. VAT Bus. Posting Group");
                    */

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

            trigger OnValidate()
            begin
                PostCode.ValidatePostCode(City, "Post Code", County, "Country/Region Code", (CurrFieldNo <> 0) and GuiAllowed);
            end;
        }
        field(92; County; Text[30])
        {
            Caption = 'County';
        }
        field(102; "E-Mail"; Text[80])
        {
            Caption = 'E-Mail';
            ExtendedDatatype = EMail;
        }
        field(107; "No. Series"; Code[10])
        {
            Caption = 'No. Series';
            Editable = false;
            TableRelation = "No. Series";
        }
        field(110; "VAT Bus. Posting Group"; Code[10])
        {
            Caption = 'VAT Bus. Posting Group';
            TableRelation = "VAT Business Posting Group";
        }
        field(58000; Type; Option)
        {
            Description = 'Person/Company';
            OptionCaption = 'Person,Company';
            OptionMembers = Person,Company;
        }
        field(58001; "Customer Category"; Code[10])
        {
            Caption = 'Applicant Category';
            Description = 'Customer/Author/Publisher/Licensee';
            TableRelation = "Applicant category setup";
        }
        field(58002; "Customer Type"; Option)
        {
            Caption = 'Applicant Type';
            Description = 'Customer/Applicant';
            OptionCaption = 'Customer,Copyright Applicant';
            OptionMembers = Customer,"Copyright Applicant";
        }
        field(58003; "Company Reg No"; Code[20])
        {
        }
        field(58004; "ID. No."; Code[20])
        {
        }
        field(58005; "P.I.N"; Code[11])
        {

            trigger OnValidate()
            begin
                /*
                IF "P.I.N"<>'' THEN BEGIN
                StrPIN:=COPYSTR("P.I.N",1,11);
                
                IF STRLEN("P.I.N")<>11 THEN BEGIN
                ERROR('Invalid PIN number. Please enter the correct PIN number.');
                END;
                END;
                
                mystr:="P.I.N";
                  i := 1;
                  WHILE (mystr[i] IN ['0'..'9']) AND (i<= STRLEN(mystr)) DO
                    i := i+1;
                
                   j := 1;
                  WHILE (mystr[j] IN ['0'..'9']) AND (j<= STRLEN(mystr)) DO
                    j := j+1;
                
                
                      IF (i<>1) AND (i<>11) THEN
                  ERROR('P.I.N Must Start & End with character');
                      {IF j<>11 THEN
                  ERROR('P.I.N Must Start & End with character');}
                  */

            end;
        }
        field(58006; Title; Code[20])
        {
            TableRelation = Salutation.Code;
        }
        field(58007; Status; Option)
        {
            OptionCaption = 'Open,Pending,Approved,Rejected';
            OptionMembers = Open,Pending,Approved,Rejected;
        }
        field(58008; "Captured by"; Code[30])
        {
        }
        field(58009; Invoiced; Boolean)
        {
        }
        field(58010; "Registration Date"; Date)
        {
        }
        field(58011; "Created By"; Code[30])
        {
        }
        field(58012; "Copyright Title"; Text[100])
        {
        }
        field(58013; "Copyright Work Category"; Code[20])
        {
            TableRelation = "Copyright Works Categories";

            trigger OnValidate()
            begin
                if CopyrightCategory.Get("Copyright Work Category") then
                    "Copyright Category Description" := Format(CopyrightCategory.Description);
            end;
        }
        field(58014; "Copyright Work SubCategory"; Code[20])
        {
            TableRelation = "Copyright Works Sub-Categories".Code where("Category Code" = field("Copyright Work Category"));

            trigger OnValidate()
            begin

                if CopyrightSubCategory.Get("Copyright Work SubCategory", "Copyright Work Category") then
                    "Copyright SubCategory Desc" := CopyrightSubCategory.Description;
            end;
        }
        field(58015; "Copyright Category Description"; Text[50])
        {
            Editable = false;
        }
        field(58016; "Copyright SubCategory Desc"; Text[50])
        {
            Editable = false;
        }
        field(58017; "Date of Fixation/Reduction"; Date)
        {
        }
        field(58018; Language; Code[10])
        {
            TableRelation = Language;
        }
        field(58019; "Copyright Work Abstract"; Blob)
        {
        }
        field(58020; "Agent First Name"; Text[50])
        {
            Caption = 'Agent First Name';

            trigger OnValidate()
            begin
                //IF (Surname = UPPERCASE(xRec."First Name")) OR (Surname = '') THEN
                //  Surname := "First Name";
                //"First Name":=UPPERCASE("First Name");
            end;
        }
        field(58021; "Agent Surname"; Code[50])
        {
            Caption = 'Agent Surname';

            trigger OnValidate()
            begin
                //Surname:=UPPERCASE(Surname);
            end;
        }
        field(58022; "Agent Middle Name"; Text[50])
        {
            Caption = 'Agent Middle Name';

            trigger OnValidate()
            begin
                //"Middle Name":=UPPERCASE("Middle Name");
            end;
        }
        field(58023; "Agent Address"; Text[50])
        {
            Caption = 'Agent Address';
        }
        field(58024; "Agent Address 2"; Text[50])
        {
            Caption = 'Agent Address 2';
        }
        field(58025; "Agent City"; Text[30])
        {
            Caption = 'Agent City';
            TableRelation = if ("Country/Region Code" = const('')) "Post Code".City
            else if ("Country/Region Code" = filter(<> '')) "Post Code".City where("Country/Region Code" = field("Country/Region Code"));
            //This property is currently not supported
            //TestTableRelation = false;
            ValidateTableRelation = false;

            trigger OnValidate()
            begin
                PostCode.ValidateCity(City, "Post Code", County, "Country/Region Code", (CurrFieldNo <> 0) and GuiAllowed);
            end;
        }
        field(58026; "Agent Contact"; Text[50])
        {
            Caption = 'Agent Contact';
        }
        field(58027; "Agent Phone No."; Text[30])
        {
            Caption = 'Agent Phone No.';
            ExtendedDatatype = PhoneNo;
        }
        field(58028; "Agent ID. No."; Code[20])
        {
        }
        field(58029; "Agent P.I.N"; Code[11])
        {

            trigger OnValidate()
            begin
                /*
                IF "P.I.N"<>'' THEN BEGIN
                StrPIN:=COPYSTR("P.I.N",1,11);
                
                IF STRLEN("P.I.N")<>11 THEN BEGIN
                ERROR('Invalid PIN number. Please enter the correct PIN number.');
                END;
                END;
                
                mystr:="P.I.N";
                  i := 1;
                  WHILE (mystr[i] IN ['0'..'9']) AND (i<= STRLEN(mystr)) DO
                    i := i+1;
                
                   j := 1;
                  WHILE (mystr[j] IN ['0'..'9']) AND (j<= STRLEN(mystr)) DO
                    j := j+1;
                
                
                      IF (i<>1) AND (i<>11) THEN
                  ERROR('P.I.N Must Start & End with character');
                      {IF j<>11 THEN
                  ERROR('P.I.N Must Start & End with character');}
                  */

            end;
        }
        field(58030; "Author First Name"; Text[50])
        {
            Caption = 'Author First Name';

            trigger OnValidate()
            begin
                //IF (Surname = UPPERCASE(xRec."First Name")) OR (Surname = '') THEN
                //  Surname := "First Name";
                //"First Name":=UPPERCASE("First Name");
            end;
        }
        field(58031; "Author Surname"; Code[50])
        {
            Caption = 'Author  Surname';

            trigger OnValidate()
            begin
                //Surname:=UPPERCASE(Surname);
            end;
        }
        field(58032; "Author Middle Name"; Text[50])
        {
            Caption = 'Author Middle Name';

            trigger OnValidate()
            begin
                //"Middle Name":=UPPERCASE("Middle Name");
            end;
        }
        field(58033; "Author Postal Address"; Text[50])
        {
            Caption = 'Author Address';
        }
        field(58034; "Author Physical Address"; Text[50])
        {
            Caption = 'Author Address';
        }
        field(58035; "Author City"; Text[30])
        {
            Caption = 'Author City';
            TableRelation = if ("Country/Region Code" = const('')) "Post Code".City
            else if ("Country/Region Code" = filter(<> '')) "Post Code".City where("Country/Region Code" = field("Country/Region Code"));
            //This property is currently not supported
            //TestTableRelation = false;
            ValidateTableRelation = false;

            trigger OnValidate()
            begin
                PostCode.ValidateCity(City, "Post Code", County, "Country/Region Code", (CurrFieldNo <> 0) and GuiAllowed);
            end;
        }
        field(58036; "Author Contact"; Text[50])
        {
            Caption = 'Author Contact';
        }
        field(58037; "Author Phone No."; Text[30])
        {
            Caption = 'Author Phone No.';
            ExtendedDatatype = PhoneNo;
        }
        field(58038; "Author ID. No."; Code[20])
        {
        }
        field(58039; "Author P.I.N"; Code[11])
        {
        }
        field(58040; "Prod/Pub Name"; Text[50])
        {
            Caption = 'Prod/Pub Name';
        }
        field(58041; "Prod/Pub ID No/Company Reg No"; Code[30])
        {
            Caption = 'Prod/Pub ID No/Company Reg No';
        }
        field(58042; "Prod/Pub P.I.N"; Code[11])
        {
        }
        field(58043; "Assignment/License Date"; Date)
        {
            Caption = 'Assignment/License Date';
        }
        field(58044; "1st Country of Production"; Code[10])
        {
            Caption = '1st Country of Production';
            TableRelation = "Country/Region";
        }
        field(58045; ISBN; Code[20])
        {
            Caption = 'ISBN';
        }
        field(58046; "Production Category"; Option)
        {
            Caption = 'Production Category';
            OptionCaption = 'Self-Produced,Label/Record Company';
            OptionMembers = "Self-Produced","Label/Record Company";
            //This property is currently not supported
            //TestTableRelation = false;
            //The property 'ValidateTableRelation' can only be set if the property 'TableRelation' is set
            //ValidateTableRelation = false;

            trigger OnValidate()
            begin
                PostCode.ValidateCity(City, "Post Code", County, "Country/Region Code", (CurrFieldNo <> 0) and GuiAllowed);
            end;
        }
        field(58047; "Prod/Pub Phone No."; Text[30])
        {
            Caption = 'Prod/Pub Phone No.';
            ExtendedDatatype = PhoneNo;
        }
        field(58048; "Prod/Pub Email"; Text[80])
        {
        }
        field(58049; "Applicant Account"; Code[50])
        {
            TableRelation = Customer where("Customer Type" = filter(Trade));

            trigger OnValidate()
            begin

                if Customer.Get("Applicant Account") then begin

                    Name := Customer.Name;
                    Address := Customer.Address;
                    "Address 2" := Customer."Address 2";
                    City := Customer.City;
                    Contact := Customer.Contact;
                    "Phone No." := Customer."Phone No.";
                    "Telex No." := Customer."Telex No.";
                    "Customer Posting Group" := Customer."Customer Posting Group";
                    "Country/Region Code" := Customer."Country/Region Code";
                    "Gen. Bus. Posting Group" := Customer."Gen. Bus. Posting Group";
                    County := Customer.County;
                    "Post Code" := Customer."Post Code";
                    "E-Mail" := Customer."E-Mail";
                    "VAT Bus. Posting Group" := Customer."VAT Bus. Posting Group";
                    Type := Customer.Type;
                    "Customer Category" := Customer."Customer Category";
                    "Customer Type" := Customer."Customer Type";
                    "Company Reg No" := Customer."Company Reg No";
                    "ID. No." := Customer."ID. No.";
                    "P.I.N" := Customer."P.I.N";
                    Title := Customer.Title;
                    "Registration Date" := Today;
                    "Captured by" := UserId;
                    "Created By" := UserId;
                end;
            end;
        }
        field(58050; "Receipt No"; Code[20])
        {
            TableRelation = "Receipts Header1"."No." where(Posted = const(true));

            trigger OnValidate()
            begin
                if Rcpt.Get("Receipt No") then begin
                    Rcpt.CalcFields(Amount);
                    copyrightSetup.Get();
                    if copyrightSetup."Copyright Amount" <> Rcpt.Amount then begin
                        Error('Receipt amount should be equal to copyright registration amount');
                    end else begin
                        objCopyright.Reset;
                        objCopyright.SetRange(objCopyright."Receipt No", "Receipt No");
                        if objCopyright.FindSet then begin
                            Error('There is another copyright registered with the selected receipt');
                        end else begin
                            "Receipt Amount" := Rcpt.Amount;
                        end;
                    end;
                end;
            end;
        }
        field(58051; "Receipt Amount"; Decimal)
        {
            Editable = false;
        }
        field(58052; "Payemnt Reference No"; Code[30])
        {
        }
        field(58053; Portal; Boolean)
        {
        }
        field(58056; authorPostCode; Code[20])
        {
            TableRelation = "Post Code".Code;

            trigger OnValidate()
            begin
                PostCode.Reset;
                PostCode.SetRange(PostCode.Code, authorPostCode);
                if PostCode.FindSet then
                    "Author City" := PostCode.City;
            end;
        }
        field(69020; "Applicant First Name"; Text[50])
        {
        }
        field(69021; "Applicant Middle Name"; Text[50])
        {
        }
        field(69022; "Applicant Last Name"; Text[50])
        {
        }
        field(69023; "Applicant Physical Location"; Text[250])
        {
        }
        field(69024; "Agent Post Code"; Code[10])
        {
        }
        field(69025; "Agent Email"; Text[50])
        {
        }
        field(69026; "Agent Telephone"; Code[20])
        {
        }
        field(69027; "Author Stage Name"; Text[50])
        {
        }
        field(69028; "Author Full Name"; Text[250])
        {
        }
        field(69029; "Author Telephone"; Text[30])
        {
        }
        field(69030; "Author Email"; Text[100])
        {
        }
        field(69031; "Prod/Pub Telephone"; Text[30])
        {
        }
        field(69032; "Producer Address"; Text[30])
        {
        }
        field(69033; "Producer Post Code"; Code[10])
        {
        }
        field(69034; "Producer City"; Text[30])
        {
        }
        field(69035; CopyrightRegistrationNumber; Text[50])
        {
        }
        field(69036; AgentPhysicalAddress; Text[230])
        {
        }
        field(69037; CopyrightApplicationNo; Text[30])
        {
        }
        field(69038; ApplicationDate; Date)
        {
        }
        field(69039; AuthorId; Code[10])
        {
        }
        field(69040; AuthorFullName; Text[100])
        {
        }
        field(69041; AuthorPhysicalAddress; Text[250])
        {
        }
        field(69042; Submitted; Boolean)
        {
        }
    }

    keys
    {
        key(Key1; "No.")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }

    trigger OnInsert()
    begin
        SalesSetup.Get();
        if "No." = '' then
         //   NoSeriesMgt.InitSeries(SalesSetup."Copyright Registration Nos.", xRec."No. Series", 0D, "No.", "No. Series");
            "No." := NoSeriesMgt.GetNextNo(SalesSetup."Copyright Registration Nos.", Today, true);
        "Created By" := UserId;
    end;

    var
        SalesSetup: Record "Copyright Setup";
        CommentLine: Record "Comment Line";
        SalesOrderLine: Record "Sales Line";
        CustBankAcc: Record "Customer Bank Account";
        ShipToAddr: Record "Ship-to Address";
        PostCode: Record "Post Code";
        GenBusPostingGrp: Record "Gen. Business Posting Group";
        ShippingAgentService: Record "Shipping Agent Services";
        ItemCrossReference: Record "Item Reference";
        RMSetup: Record "Marketing Setup";
        SalesPrice: Record "Sales Price";
        SalesLineDisc: Record "Sales Line Discount";
        SalesPrepmtPct: Record "Sales Prepayment %";
        ServContract: Record "Service Contract Header";
        ServHeader: Record "Service Header";
        ServiceItem: Record "Service Item";
        PaymentToleranceMgt: Codeunit "Payment Tolerance Management";
        NoSeriesMgt: Codeunit "No. Series";
        MoveEntries: Codeunit MoveEntries;
        UpdateContFromCust: Codeunit "CustCont-Update";
        DimMgt: Codeunit DimensionManagement;
        ApprovalsMgmt: Codeunit "Approvals Mgmt.";
        InsertFromContact: Boolean;
        CopyrightCategory: Record "Copyright Works Categories";
        CopyrightSubCategory: Record "Copyright Works Sub-Categories";
        Customer: Record Customer;
        Text000: label 'You cannot delete %1 %2 because there is at least one outstanding Sales %3 for this customer.';
        Text002: label 'Do you wish to create a contact for %1 %2?';
        Text003: label 'Contact %1 %2 is not related to customer %3 %4.';
        Text004: label 'post';
        Text005: label 'create';
        Text006: label 'You cannot %1 this type of document when Customer %2 is blocked with type %3';
        Text007: label 'You cannot delete %1 %2 because there is at least one not cancelled Service Contract for this customer.';
        Text008: label 'Deleting the %1 %2 will cause the %3 to be deleted for the associated Service Items. Do you want to continue?';
        Text009: label 'Cannot delete customer.';
        Text010: label 'The %1 %2 has been assigned to %3 %4.\The same %1 cannot be entered on more than one %3. Enter another code.';
        Text011: label 'Reconciling IC transactions may be difficult if you change IC Partner Code because this %1 has ledger entries in a fiscal year that has not yet been closed.\ Do you still want to change the IC Partner Code?';
        Text012: label 'You cannot change the contents of the %1 field because this %2 has one or more open ledger entries.';
        Text013: label 'You cannot delete %1 %2 because there is at least one outstanding Service %3 for this customer.';
        Text014: label 'Before you can use Online Map, you must fill in the Online Map Setup window.\See Setting Up Online Map in Help.';
        Text015: label 'You cannot delete %1 %2 because there is at least one %3 associated to this customer.';
        AllowPaymentToleranceQst: label 'Do you want to allow payment tolerance for entries that are currently open?';
        RemovePaymentRoleranceQst: label 'Do you want to remove payment tolerance from entries that are currently open?';
        Rcpt: Record "Receipts Header1";
        Literary: Text;
        Books: Text;
        copyrightSetup: Record "Copyright Setup";
        receiptHeader: Record "Receipts Header1";
        receiptLine: Record "Receipt Lines1";
        objCopyright: Record "Copyright Registration Table";


    procedure AssistEdit(OldCust: Record "Copyright Registration Table"): Boolean
    var
        Cust: Record "Copyright Registration Table";
    begin
        begin
            Cust := Rec;
            SalesSetup.Get;
            SalesSetup.TestField("Copyright Registration Nos.");
            // if NoSeriesMgt.SelectSeries(SalesSetup."Copyright Registration Nos.", OldCust."No. Series", Cust."No. Series") then begin
            //     NoSeriesMgt.SetSeries(Cust."No.");
                Rec := Cust;
                exit(true);
            end;
        end;
   // end;

    local procedure ValidateShortcutDimCode(FieldNumber: Integer; var ShortcutDimCode: Code[20])
    begin
        DimMgt.ValidateDimValueCode(FieldNumber, ShortcutDimCode);
        DimMgt.SaveDefaultDim(Database::Customer, "No.", FieldNumber, ShortcutDimCode);
        Modify;
    end;


    procedure ShowContact()
    var
        ContBusRel: Record "Contact Business Relation";
        Cont: Record Contact;
    begin
        /*IF "No." = '' THEN
          EXIT;
        
        ContBusRel.SETCURRENTKEY("Link to Table","No.");
        ContBusRel.SETRANGE("Link to Table",ContBusRel."Link to Table"::Customer);
        ContBusRel.SETRANGE("No.","No.");
        IF NOT ContBusRel.FINDFIRST THEN BEGIN
          IF NOT CONFIRM(Text002,FALSE,TABLECAPTION,"No.") THEN
            EXIT;
          UpdateContFromCust.InsertNewContact(Rec,FALSE);
          ContBusRel.FINDFIRST;
        END;
        COMMIT;
        
        Cont.SETCURRENTKEY("Company Name","Company No.",Type,Name);
        Cont.SETRANGE("Company No.",ContBusRel."Contact No.");
        PAGE.RUN(PAGE::"Contact List",Cont);
        */

    end;


    procedure SetInsertFromContact(FromContact: Boolean)
    begin
        InsertFromContact := FromContact;
    end;


    procedure CheckBlockedCustOnDocs(Cust2: Record Customer; DocType: Option Quote,"Order",Invoice,"Credit Memo","Blanket Order","Return Order"; Shipment: Boolean; Transaction: Boolean)
    begin
        begin
            if ((Cust2.Blocked = Cust2.Blocked::All) or
                ((Cust2.Blocked = Cust2.Blocked::Invoice) and (DocType in [Doctype::Quote, Doctype::Order, Doctype::Invoice, Doctype::"Blanket Order"])) or
                ((Cust2.Blocked = Cust2.Blocked::Ship) and (DocType in [Doctype::Quote, Doctype::Order, Doctype::"Blanket Order"]) and
                 (not Transaction)) or
                ((Cust2.Blocked = Cust2.Blocked::Ship) and (DocType in [Doctype::Quote, Doctype::Order, Doctype::Invoice, Doctype::"Blanket Order"]) and
                 Shipment and Transaction))
            then
                Cust2.CustBlockedErrorMessage(Cust2, Transaction);
        end;
    end;


    procedure CheckBlockedCustOnJnls(Cust2: Record Customer; DocType: Option " ",Payment,Invoice,"Credit Memo","Finance Charge Memo",Reminder,Refund; Transaction: Boolean)
    begin
        begin
            if (Cust2.Blocked = Cust2.Blocked::All) or
               ((Cust2.Blocked = Cust2.Blocked::Invoice) and (DocType in [Doctype::Invoice, Doctype::" "]))
            then
                Cust2.CustBlockedErrorMessage(Cust2, Transaction)
        end;
    end;


    procedure CustBlockedErrorMessage(Cust2: Record Customer; Transaction: Boolean)
    var
        "Action": Text[30];
    begin
        if Transaction then
            Action := Text004
        else
            Action := Text005;
        Error(Text006, Action, Cust2."No.", Cust2.Blocked);
    end;


    procedure DisplayMap()
    var
        MapPoint: Record "Online Map Setup";
        MapMgt: Codeunit "Online Map Management";
    begin
        if MapPoint.FindFirst then
            MapMgt.MakeSelection(Database::Customer, GetPosition)
        else
            Message(Text014);
    end;


    procedure SetStyle(): Text
    begin
        /*IF CalcAvailableCredit < 0 THEN
          EXIT('Unfavorable');
        EXIT('');
        */

    end;


    procedure HasValidDDMandate(Date: Date): Boolean
    var
        SEPADirectDebitMandate: Record "SEPA Direct Debit Mandate";
    begin
        exit(SEPADirectDebitMandate.GetDefaultMandate("No.", Date) <> '');
    end;


    procedure CreateAndShowNewInvoice()
    var
        SalesHeader: Record "Sales Header";
    begin
        SalesHeader."Document Type" := SalesHeader."document type"::Invoice;
        SalesHeader.SetRange("Sell-to Customer No.", "No.");
        SalesHeader.Insert(true);
        Commit;
        //PAGE.RUNMODAL(PAGE::"",SalesHeader)
    end;


    procedure CreateAndShowNewCreditMemo()
    var
        SalesHeader: Record "Sales Header";
    begin
        SalesHeader."Document Type" := SalesHeader."document type"::"Credit Memo";
        SalesHeader.SetRange("Sell-to Customer No.", "No.");
        SalesHeader.Insert(true);
        Commit;
        //PAGE.RUNMODAL(PAGE::"Mini Sales Credit Memo",SalesHeader)
    end;


    procedure CreateAndShowNewQuote()
    var
        SalesHeader: Record "Sales Header";
    begin
        SalesHeader."Document Type" := SalesHeader."document type"::Quote;
        SalesHeader.SetRange("Sell-to Customer No.", "No.");
        SalesHeader.Insert(true);
        Commit;
        //PAGE.RUNMODAL(PAGE:://"Mini Sales Quote",SalesHeader)
    end;

    local procedure UpdatePaymentTolerance(UseDialog: Boolean)
    begin
        /*IF "Block Payment Tolerance" THEN BEGIN
          IF UseDialog THEN
            IF NOT CONFIRM(RemovePaymentRoleranceQst,FALSE) THEN
              EXIT;
          PaymentToleranceMgt.DelTolCustLedgEntry(Rec);
        /  IF UseDialog THEN
            IF NOT CONFIRM(AllowPaymentToleranceQst,FALSE) THEN
              EXIT;
          PaymentToleranceMgt.CalcTolCustLedgEntry(Rec);
        END;
        */

    end;


    procedure GetBillToCustomerNo(): Code[20]
    begin
        /*IF "Bill-to Customer No." <> '' THEN
          EXIT("Bill-to Customer No.");
        EXIT("No.");
        */

    end;
}
