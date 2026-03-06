#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Table 59071 "File Movement Line"
{

    fields
    {
        field(1; "Document No."; Code[20])
        {
        }
        field(2; "File Type"; Code[20])
        {
            TableRelation = "File Types SetUp";

            trigger OnValidate()
            begin
                Setup.Reset;
                Setup.SetRange(Code, "File Type");
                if Setup.Find('-') then begin
                    "File Description" := Setup.Description;
                end;
            end;
        }
        field(3; "Account Type"; Option)
        {
            Caption = 'File Type:';
            DataClassification = ToBeClassified;
            OptionCaption = 'Finance,Customer,Vendor,Bank Account,Fixed Asset,Partner/Collaborators,Employee';
            OptionMembers = "G/L Account",Customer,Vendor,"Bank Account","Fixed Asset","IC Partner",Employee;
        }
        field(4; "Account No."; Code[20])
        {
            Caption = 'File No.';
            DataClassification = ToBeClassified;
            TableRelation = if ("Account Type" = const("G/L Account")) "G/L Account" where("Account Type" = const(Posting),
                                                                                          Blocked = const(false))
            else if ("Account Type" = const(Customer)) Customer
            else if ("Account Type" = const(Vendor)) Vendor
            else if ("Account Type" = const("Bank Account")) "Bank Account"
            else if ("Account Type" = const("Fixed Asset")) "Fixed Asset"
            else if ("Account Type" = const("IC Partner")) Contact
            else if ("Account Type" = const(Employee)) Employee;

            trigger OnValidate()
            begin
                /*
                
                CASE "Account Type" OF
                  "Account Type"::"G/L Account":
                    IF GlAccount.GET("Account No.") THEN BEGIN
                        "Account Name":=GlAccount.Name;
                      END;
                  "Account Type"::Customer:
                   IF Customer.GET("Account No.") THEN BEGIN
                        "Account Name":=Customer.Name;
                      END;
                  "Account Type"::Vendor:
                    IF Vendor.GET("Account No.") THEN BEGIN
                        "Account Name":=Vendor.Name;
                      END;
                  "Account Type"::Employee:
                    IF Employee.GET("Account No.") THEN BEGIN
                        "Account Name":=Employee."First Name"+' '+Employee."Middle Name"+' '+Employee."Last Name";
                      END;
                  "Account Type"::"Bank Account":
                   IF Bank.GET("Account No.") THEN BEGIN
                        "Account Name":=Bank.Name;
                      END;
                  "Account Type"::"Fixed Asset":
                  IF FixedAsset.GET("Account No.") THEN BEGIN
                        "Account Name":=FixedAsset.Description;
                      END;
                  "Account Type"::"IC Partner":
                   IF Partners.GET("Account No.") THEN BEGIN
                        "Account Name":=Partners.Name;
                      END;
                END;
                */

            end;
        }
        field(5; "Purpose/Description"; Text[100])
        {
        }
        field(6; "Global Dimension 1 Code"; Code[20])
        {
            TableRelation = "Dimension Value".Code where("Global Dimension No." = filter(1));

            trigger OnValidate()
            begin
                Dept.Reset;
                Dept.SetRange(Code, "Global Dimension 1 Code");
                if Dept.Find('-') then begin
                    "Department Name" := Dept.Name;
                end;
            end;
        }
        field(7; "Global Dimension 2 Code"; Code[20])
        {
            TableRelation = "Dimension Value".Code where("Global Dimension No." = filter(2));
        }
        field(8; "Account Name"; Text[100])
        {
            Caption = 'File Name ';
            Editable = false;
        }
        field(9; "File Number"; Code[50])
        {
            TableRelation = "Record Creation"."File No" where("File Type" = field("File Type"),
                                                               Disposed = const(false));

            trigger OnValidate()
            begin
                /*File1.RESET;
                File1.SETRANGE ("Registry Code)
                IF File1.FIND ('-') THEN
                  "File Name":=File1."File Name";*/


            end;
        }
        field(10; "Line No."; Integer)
        {
            AutoIncrement = true;
        }
        field(11; "Destination File Location"; Code[40])
        {
            TableRelation = "File Locations Setup".Location;
        }
        field(12; "Department Name"; Code[100])
        {
            DataClassification = ToBeClassified;
        }
        field(13; "File Description"; Text[250])
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(14; "File Name"; Text[250])
        {
            DataClassification = ToBeClassified;
        }
    }

    keys
    {
        key(Key1; "Line No.", "Document No.")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }

    var
        Vendor: Record Vendor;
        Customer: Record Customer;
        GlAccount: Record "G/L Account";
        Employee: Record Employee;
        Partners: Record Contact;
        Bank: Record "Bank Account";
        FixedAsset: Record "Fixed Asset";
        Dept: Record "Dimension Value";
        Setup: Record "File Types SetUp";
        File1: Record "Record Creation";
}
