#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Table 70055 "Emailed Prequalified Suppliers"
{
    DrillDownPageID = "Pre Qualified Suppliers";
    LookupPageID = "Pre Qualified Suppliers";

    fields
    {
        field(1; "Ref No."; Code[50])
        {
            TableRelation = "Procurement Request";
        }
        field(2; Name; Text[250])
        {
            NotBlank = true;
        }
        field(3; "Physical Address"; Text[250])
        {
        }
        field(4; "Postal Address"; Text[250])
        {
        }
        field(5; City; Code[20])
        {
        }
        field(6; "E-mail"; Text[50])
        {
        }
        field(7; "Telephone No"; Code[50])
        {
        }
        field(8; "Mobile No"; Code[20])
        {
        }
        field(9; "Contact Person"; Text[30])
        {
        }
        field(10; "KBA Bank Code"; Code[5])
        {
            TableRelation = "Employee Bank AccountX".Code;
        }
        field(11; "KBA Branch Code"; Code[3])
        {
            TableRelation = "Employee Bank AccountX"."Bank Branch No." where(Code = field("KBA Bank Code"));
        }
        field(12; "Bank account No"; Code[20])
        {
        }
        field(13; Category; Code[10])
        {
            TableRelation = "Supplier Category";

            trigger OnValidate()
            begin
                if objSupplierCategory.Get(Category) then begin
                    "Category Name" := objSupplierCategory.Description;
                end;
            end;
        }
        field(14; "Fiscal Year"; Code[10])
        {
        }
        field(15; Selected; Boolean)
        {
        }
        field(16; "Pre Qualified"; Boolean)
        {
        }
        field(17; "Fax No"; Text[30])
        {
        }
        field(18; "Category Name"; Text[250])
        {
        }
        field(19; "VAT Registration No"; Code[20])
        {
        }
        field(20; "Company PIN No"; Code[20])
        {

            trigger OnValidate()
            begin
                VerifyVendor("Company PIN No", "Fiscal Year");
            end;
        }
        field(21; "Vendor No"; Code[10])
        {
            TableRelation = Vendor;

            trigger OnValidate()
            begin
                Vendor.Reset;
                Vendor.SetRange(Vendor."No.", "Vendor No");
                if Vendor.Find('-') then begin
                    "Physical Address" := Vendor."Address 2";
                    "Postal Address" := Vendor.Address;
                    City := Vendor.City;
                    "E-mail" := Vendor."E-Mail";
                    "Vendor Type" := Vendor."Vendor Type";
                    "Telephone No" := Vendor."Telex No.";
                    "Mobile No" := Vendor."Phone No.";
                    "Contact Person" := Vendor.Contact;
                    "Bank account No" := Vendor."Our Account No.";
                    "KBA Branch Code" := Vendor."KBA Branch Code";
                    Name := Vendor.Name;
                end;
            end;
        }
        field(22; "Vendor Type"; Option)
        {
            OptionMembers = "  ",Medical,Law;
        }
        field(23; Blacklisted; Boolean)
        {
        }
        field(24; "Default Payment Mode"; Code[10])
        {
            TableRelation = "Pay Mode1".Code;
        }
        field(25; "Maximum Order Quantity"; Decimal)
        {
        }
        field(26; "Minimum Order Quantity"; Decimal)
        {
        }
        field(27; "Maximum Order Amount"; Decimal)
        {
        }
        field(28; "Minimum Order Amount"; Decimal)
        {
        }
        field(29; Status; Option)
        {
            OptionCaption = 'Active,Inactive';
            OptionMembers = Active,Inactive;
        }
        field(30; "Contact No"; Code[50])
        {
            DataClassification = ToBeClassified;
            TableRelation = Contact;

            trigger OnValidate()
            var
                Contact: Record Contact;
            begin
                if Contact.Get("Contact No") then begin
                    Name := Contact.Name;
                    "E-mail" := Contact."E-Mail";
                    "Telephone No" := Contact."Phone No.";
                end;
            end;
        }
        field(31; "Line No"; Integer)
        {
            AutoIncrement = true;
        }
        field(50017; "Supplier Type"; Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = ' ,Youth,Women,PWD''s,Normal';
            OptionMembers = " ",Youth,Women,"PWD's",Normal;
        }
        field(50018; "Director 1 Name"; Text[100])
        {
            DataClassification = ToBeClassified;
        }
        field(50019; "Director 2 Name"; Text[100])
        {
            DataClassification = ToBeClassified;
        }
        field(50020; "Director 3 Name"; Text[100])
        {
            DataClassification = ToBeClassified;
        }
    }

    keys
    {
        key(Key1; "Contact No", Name, Category, "Fiscal Year", "Vendor No")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }

    var
        Text000: label 'The PIN No %1 already exists for supplier %2';
        Vendor: Record Vendor;
        objSupplierCategory: Record "Supplier Category";


    procedure CreateVend(var Prequalifiedlist: Record "Prequalified Suppliers1")
    var
        Vend: Record Vendor;
        CategoryRec: Record "Supplier Category";
    begin

        TestField("Company PIN No");
        Vendor.Reset;
        Vendor.SetRange("PIN Number", Prequalifiedlist."Company PIN No");
        if Vendor.FindSet then
            Error('The supplier %1 has already been created', Vendor."No.");

        Vend.Init;
        Vend."No." := '';
        Vend.Name := Prequalifiedlist.Name;
        Vend.Address := Prequalifiedlist."Physical Address";
        Vend."Address 2" := Prequalifiedlist."Postal Address";
        Vend."E-Mail" := Prequalifiedlist."E-mail";
        Vend."Phone No." := Prequalifiedlist."Telephone No";
        Vend."Telex No." := Prequalifiedlist."Mobile No";
        Vend.Contact := Prequalifiedlist."Contact Person";
        Vend."KBA Code" := Prequalifiedlist."KBA Bank Code";
        Vend."KBA Branch Code" := Prequalifiedlist."KBA Branch Code";
        Vend."Our Account No." := Prequalifiedlist."Bank account No";
        Vend."Vendor Type" := Prequalifiedlist."Vendor Type";
        Vend."VAT Registration No." := Prequalifiedlist."VAT Registration No";
        Vend."Maximum Order Amount" := Prequalifiedlist."Maximum Order Amount";
        Vend."Minimum Order Amount" := Prequalifiedlist."Minimum Order Amount";
        Vend."Maximum Order Quantity" := Prequalifiedlist."Maximum Order Quantity";
        Vend."Minimum Order Quantity" := Prequalifiedlist."Minimum Order Quantity";
        Vend."PIN Number" := Prequalifiedlist."Company PIN No";


        if CategoryRec.Get(Prequalifiedlist.Category) then begin
            Vend."Gen. Bus. Posting Group" := CategoryRec."Gen. Bus. Posting Group";
            Vend."VAT Bus. Posting Group" := CategoryRec."VAT Bus. Posting Group";
            Vend."Vendor Posting Group" := CategoryRec."Vendor Posting Group";
        end;
        Vend.Insert(true);

        Prequalifiedlist."Vendor No" := Vend."No.";
        Prequalifiedlist.Modify;
        Message('Supplier %1 has been created succesfully', Vend."No.")
    end;


    procedure VerifyVendor(PIN: Code[20]; FiscalYear: Code[20])
    var
        Supplier: Record "Prequalified Suppliers1";
    begin

        Supplier.Reset;
        Supplier.SetRange("Fiscal Year", FiscalYear);
        Supplier.SetRange("Company PIN No", PIN);
        if Supplier.Find('-') then
            Error(Text000, PIN, Supplier.Name);
    end;


    procedure LoadPreQualifiedVend(var Prequalifiedlist: Record "Prequalified Suppliers1")
    var
        Vend: Record Vendor;
        CategoryRec: Record "Supplier Category";
    begin
        begin
            //TESTFIELD("Company PIN No");
            Prequalifiedlist.Reset;
            Prequalifiedlist.SetRange("Vendor No", Vend."No.");
            Prequalifiedlist.SetRange(Category, Vend."Supplier Category");
            if Prequalifiedlist.FindSet = false then begin
                /*Vendor.RESET;
                Vendor.SETRANGE("PIN Number",Prequalifiedlist."Company PIN No");
                IF Vendor.FINDSET THEN
                  ERROR('The supplier %1 has already been created',Vendor."No.");*/

                Prequalifiedlist.Init;
                Prequalifiedlist."Fiscal Year" := '';
                Prequalifiedlist."Vendor No" := Vend."No.";
                Prequalifiedlist.Name := Vend.Name;
                Prequalifiedlist."Physical Address" := Vend.Address;
                Prequalifiedlist."Postal Address" := Vend."Address 2";
                Prequalifiedlist."E-mail" := Vend."E-Mail";
                Prequalifiedlist."Telephone No" := Vend."Phone No.";
                Prequalifiedlist."Mobile No" := Vend."Telex No.";
                Prequalifiedlist."Contact Person" := Vend.Contact;
                Prequalifiedlist."KBA Bank Code" := Vend."KBA Code";
                Prequalifiedlist."KBA Branch Code" := Vend."KBA Branch Code";
                Prequalifiedlist."Bank account No" := Vend."Our Account No.";
                Prequalifiedlist."Vendor Type" := Vend."Vendor Type";
                Prequalifiedlist."VAT Registration No" := Vend."VAT Registration No.";
                Prequalifiedlist."Maximum Order Amount" := Vend."Maximum Order Amount";
                Prequalifiedlist."Minimum Order Amount" := Vend."Minimum Order Amount";
                Prequalifiedlist."Maximum Order Quantity" := Vend."Maximum Order Quantity";
                Prequalifiedlist."Minimum Order Quantity" := Vend."Minimum Order Quantity";
                Prequalifiedlist."Company PIN No" := Vend."PIN Number";
                Prequalifiedlist.Category := Vend."Supplier Category";
                Prequalifiedlist."Pre Qualified" := true;

                /*IF CategoryRec.GET(Prequalifiedlist.Category) THEN
                BEGIN
                Vend."Gen. Bus. Posting Group":=CategoryRec."Gen. Bus. Posting Group";
                Vend."VAT Bus. Posting Group":=CategoryRec."VAT Bus. Posting Group";
                Vend."Vendor Posting Group":=CategoryRec."Vendor Posting Group";
                END;*/
                Prequalifiedlist.Insert(true);

            end;
        end;
        /*
        Prequalifiedlist."Vendor No":=Vend."No.";
        Prequalifiedlist.MODIFY;
        MESSAGE('Supplier %1 has been created succesfully',Vend."No.")*/

    end;
}
