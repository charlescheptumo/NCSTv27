#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
TableExtension 50004 tableextension50004 extends Vendor
{
    fields
    {

        //Unsupported feature: Property Modification (Data type) on "Name(Field 2)".


        //Unsupported feature: Property Modification (Data type) on ""Search Name"(Field 3)".


        //Unsupported feature: Property Modification (Data type) on ""Name 2"(Field 4)".


        //Unsupported feature: Property Modification (Data type) on "Address(Field 5)".


        //Unsupported feature: Property Modification (Data type) on ""Address 2"(Field 6)".


        //Unsupported feature: Property Modification (Data type) on "City(Field 7)".


        //Unsupported feature: Property Modification (Data type) on "Contact(Field 8)".


        //Unsupported feature: Property Modification (Data type) on ""Phone No."(Field 9)".


        //Unsupported feature: Property Modification (Data type) on ""Pay-to Vendor No."(Field 45)".


        //Unsupported feature: Property Modification (Data type) on ""Payment Method Code"(Field 47)".

        field(50000; "Vendor Type"; Option)
        {
            OptionCaption = 'Trade,Director,Payroll';
            OptionMembers = Trade,Director,Payroll;
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
                                                                    Paye = const(true),
                                                                    "Payroll Period" = field("Pay Period Filter")));
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
        field(50156; "Status 1"; Option)
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
        field(50180; "Director Taxable Income"; Decimal)
        {
            CalcFormula = sum("Director Ledger Entry".Amount where("Director No" = field("No."),
                                                                    "Payroll Period" = field("Pay Period Filter"),
                                                                    Taxable = const(true)));
            FieldClass = FlowField;
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
        field(70006; "Supplier Type 1"; Code[50])
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
                ContBusRel.SetRange("No.", Rec."No.");
                if ContBusRel.FindFirst then
                    Cont.SetRange("Company No.", ContBusRel."Contact No.")
                else
                    Cont.SetRange("No.", '');

                if Rec."Secondary Contact No." <> '' then
                    if Cont.Get(Rec."Secondary Contact No.") then;
                if Page.RunModal(0, Cont) = Action::LookupOK then
                    Rec.Validate(Rec."Secondary Contact No.", Cont."No.");
            end;

            trigger OnValidate()
            var
                Cont: Record Contact;
                ContBusRel: Record "Contact Business Relation";
            begin

                Rec."Secondary Contact" := '';
                if Rec."Secondary Contact No." <> '' then begin
                    Cont.Get(Rec."Secondary Contact No.");

                    ContBusRel.SetCurrentkey("Link to Table", "No.");
                    ContBusRel.SetRange("Link to Table", ContBusRel."link to table"::Vendor);
                    ContBusRel.SetRange("No.", Rec."No.");
                    ContBusRel.FindFirst;

                    if Cont."Company No." <> ContBusRel."Contact No." then
                        Error('No Contact found for Vendor %1', Rec."No.");

                    if Cont.Type = Cont.Type::Person then
                        Rec."Secondary Contact" := Cont.Name
                end;
            end;
        }
        field(70008; "Secondary Contact"; Text[50])
        {
            Caption = 'Secondary Contact';
            DataClassification = ToBeClassified;

            trigger OnValidate()
            begin
                // if RMSetup.Get then
                //     if RMSetup."Bus. Rel. Code for Vendors" <> '' then
                //         if (xRec."Secondary Contact" = '') and (xRec."Secondary Contact No." = '') then begin
                //             Rec.Modify;
                //             UpdateContFromVend.OnModify(Rec);
                //             UpdateContFromVend.InsertNewContactPerson(Rec, false);
                //             Rec.Modify(true);
                //         end
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
        field(70022; Password; Text[30])
        {
            DataClassification = ToBeClassified;
        }
        field(70023; "Net Pay"; Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(70050; "Business Type"; Code[30])
        {
            DataClassification = ToBeClassified;
            Description = 'Used to record the different Business Types based on Ownership categories such as Companies, Partnerships, Sole Ownership etc. Linked to Business Type Table';
            TableRelation = "Business Types".Code;
        }
        field(70051; "Country of Incorporation"; Code[10])
        {
            Caption = 'Country/Region Code';
            Description = 'Country of Incorporation/Registration';
            TableRelation = "Country/Region";

            trigger OnValidate()
            var
                PostCode: record "Post Code";
            begin
                PostCode.CheckClearPostCodeCityCounty(Rec.City, Rec."Post Code", Rec.County, Rec."Country/Region Code", xRec."Country/Region Code");

                if Rec."Country/Region Code" <> xRec."Country/Region Code" then
                    Rec.VATRegistrationValidation;
            end;
        }
        field(70052; "Country of Tax Registration"; Code[10])
        {
            Caption = 'Country/Region Code';
            Description = 'Country of Tax Registration';
            TableRelation = "Country/Region";

            trigger OnValidate()
            var
                PostCode: record "Post Code";
            begin
                PostCode.CheckClearPostCodeCityCounty(Rec.City, Rec."Post Code", Rec.County, Rec."Country/Region Code", xRec."Country/Region Code");

                if Rec."Country/Region Code" <> xRec."Country/Region Code" then
                    Rec.VATRegistrationValidation;
            end;
        }
        field(70053; Debarred; Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(70054; "Debarment Voucher No"; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Vendor Debarment Voucher"."Document No";
        }
        field(70055; "Debarment Expiry Date"; Date)
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
        field(70064; "Tax PIN No."; Code[20])
        {
            DataClassification = ToBeClassified;
            Enabled = false;
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
            CalcFormula = lookup("Vendor Classification"."Vendor Category" where(Blocked = filter(false)));
            Description = 'Lookup field mapped to the Vendor Classification Table (For most recent entries that are Open i.e. Blocked=False';
            FieldClass = FlowField;
        }
        field(70068; "Vendor Group"; Option)
        {
            Description = 'Look-up field that is auto-populated when the Vendor Class field is defined';
            OptionCaption = 'General,Special';
            OptionMembers = General,Special;
        }
        field(70069; "Supplier Type"; Option)
        {
            DataClassification = ToBeClassified;
            Description = 'Look-up field that is auto-populated when the Vendor Class field is defined';
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
        field(70074; "Nature of Business"; Text[250])
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
        field(70085; "Registrn Submitted onPortal"; Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(70086; "Industry Group"; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Industry Group".Code;
        }
        field(70087; "Website Url"; Text[100])
        {
            DataClassification = ToBeClassified;
        }
        field(70088; "Company Size"; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Company Size Code".Code;
        }
        field(70089; Trainer; Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(70090; "KNTC Agent"; Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(70091; "Current Trade Licence No"; Code[50])
        {
            DataClassification = ToBeClassified;
        }
        field(70092; "Trade Licence Expiry Date"; Date)
        {
            DataClassification = ToBeClassified;
        }
        field(70093; Registered; Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = 'Yes,No';
            OptionMembers = Yes,No;
        }
        field(70094; Status; Option)
        {
            Caption = 'Status';
            DataClassification = ToBeClassified;
            Editable = false;
            OptionCaption = 'Open,Released,Pending Approval,Pending Prepayment,In Progress';
            OptionMembers = Open,Released,"Pending Approval","Pending Prepayment","In Progress";
        }
        field(70095; "onboarded Year"; Code[10])
        {
            DataClassification = ToBeClassified;
            TableRelation = "G/L Budget Name".Name;
        }
    }
}
