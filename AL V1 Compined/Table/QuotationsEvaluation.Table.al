#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Table 70039 "Quotations Evaluation"
{
    DrillDownPageID = "Quotations Evaluation";
    LookupPageID = "Quotations Evaluation";

    fields
    {
        field(1; "Ref No."; Code[50])
        {
            TableRelation = "Procurement Request";
        }
        field(2; Name; Text[50])
        {
            NotBlank = true;
        }
        field(3; "Physical Address"; Text[250])
        {
        }
        field(4; "Postal Address"; Text[250])
        {
        }
        field(5; City; Code[10])
        {
        }
        field(6; "E-mail"; Text[50])
        {
        }
        field(7; "Telephone No"; Code[50])
        {
        }
        field(8; "Mobile No"; Code[15])
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
        field(12; "Bank account No"; Code[10])
        {
        }
        field(13; Category; Code[10])
        {
            TableRelation = "Supplier Category";

            trigger OnValidate()
            begin
                catrec.Reset;
                catrec.Get(Category);
                "Category Name" := catrec.Description;
            end;
        }
        field(14; "Fiscal Year"; Code[10])
        {
        }
        field(15; Selected; Boolean)
        {

            trigger OnValidate()
            var
                rec1: Record "Prequalified Suppliers1";
            begin
            end;
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
                //VerifyVendor("Company PIN No","Fiscal Year");
            end;
        }
        field(21; "Vendor No"; Code[10])
        {
            TableRelation = Vendor;
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
            TableRelation = "Payment Method".Code;
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

            trigger OnValidate()
            var
                Contact: Record Contact;
            begin
                if Contact.Get("Contact No") then begin
                    Name := Contact.Name;
                end;
            end;
        }
        field(50017; "Supplier Type"; Option)
        {
            OptionCaption = ' ,Youth,Women,PWD''s,Normal';
            OptionMembers = " ",Youth,Women,"PWD's",Normal;
        }
        field(50018; "Director 1 Name"; Text[100])
        {
        }
        field(50019; "Director 2 Name"; Text[100])
        {
        }
        field(50020; "Director 3 Name"; Text[100])
        {
        }
        field(50021; "Passes Technical?"; Boolean)
        {
        }
        field(50022; "Financial Amount"; Decimal)
        {
        }
        field(50023; "Quotation Awarded?"; Boolean)
        {
        }
        field(50024; "in Technical?"; Boolean)
        {
        }
        field(50025; "in FINANCIAL?"; Boolean)
        {
        }
        field(50026; "Item Description"; Text[250])
        {
        }
        field(50027; "Quotation minutes"; Text[250])
        {
        }
        field(50028; "Linked vendor"; Code[20])
        {
            TableRelation = Vendor;
        }
        field(50029; entryno; Integer)
        {
        }
        field(50030; created; Boolean)
        {
        }
    }

    keys
    {
        key(Key1; Name, Category, "Fiscal Year", entryno, "Ref No.")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }

    var
        Text000: label 'The PIN No %1 already exists for supplier %2';
        catrec: Record "Supplier Category";


    procedure CreateVend(var Prequalifiedlist: Record "Prequalified Suppliers1")
    var
        Vend: Record Vendor;
        CategoryRec: Record "Supplier Category";
    begin
        /*
        Vend.INIT;
        Vend."No.":='';
        Vend.Name:=Prequalifiedlist.Name;
        Vend.Address:=Prequalifiedlist."Physical Address";
        Vend."Address 2":=Prequalifiedlist."Postal Address";
        Vend."E-Mail":=Prequalifiedlist."E-mail";
        Vend."Phone No.":=Prequalifiedlist."Telephone No";
        Vend."Telex No.":=Prequalifiedlist."Mobile No";
        Vend.Contact:=Prequalifiedlist."Contact Person";
        Vend."KBA Code":=Prequalifiedlist."KBA Bank Code";
        Vend."KBA Branch Code":=Prequalifiedlist."KBA Branch Code";
        Vend."Our Account No.":=Prequalifiedlist."Bank account No";
        Vend."Vendor Type":=Prequalifiedlist."Vendor Type";
        Vend."VAT Registration No.":=Prequalifiedlist."VAT Registration No";
        Vend."Maximum Order Amount":=Prequalifiedlist."Maximum Order Amount";
        Vend."Minimum Order Amount":=Prequalifiedlist."Minimum Order Amount";
        Vend."Maximum Order Quantity":=Prequalifiedlist."Maximum Order Quantity";
        Vend."Minimum Order Quantity":=Prequalifiedlist."Minimum Order Quantity";
        Vend."PIN No.":=Prequalifiedlist."Company PIN No";
        
        
        IF CategoryRec.GET(Prequalifiedlist.Category) THEN
        BEGIN
        Vend."Gen. Bus. Posting Group":=CategoryRec."Gen. Bus. Posting Group";
        Vend."VAT Bus. Posting Group":=CategoryRec."VAT Bus. Posting Group";
        Vend."Vendor Posting Group":=CategoryRec."Vendor Posting Group";
        END;
        Vend.INSERT(TRUE);
        
        Prequalifiedlist."Vendor No":=Vend."No.";
        Prequalifiedlist.MODIFY;
         */

    end;


    procedure VerifyVendor(PIN: Code[20]; FiscalYear: Code[20])
    var
        Supplier: Record "Prequalified Suppliers1";
    begin
        /*
        Supplier.RESET;
        Supplier.SETRANGE("Fiscal Year",FiscalYear);
        Supplier.SETRANGE("Company PIN No",PIN);
         IF Supplier.FIND('-') THEN
          ERROR(Text000,PIN,Supplier.Name);
         */

    end;


    procedure getreferencenobd(refnobd: Code[20])
    begin
    end;
}
