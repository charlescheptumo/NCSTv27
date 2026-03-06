#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Table 70118 "Vendor Debarment Entry"
{

    fields
    {
        field(1; "Entry no"; Integer)
        {
            AutoIncrement = true;
            DataClassification = ToBeClassified;
        }
        field(2; "Source Voucher No."; Code[30])
        {
            DataClassification = ToBeClassified;
        }
        field(3; "Document Type"; Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = 'Debarment,Reinstatement';
            OptionMembers = Debarment,Reinstatement;
        }
        field(4; "Firm Name"; Text[80])
        {
            DataClassification = ToBeClassified;
        }
        field(5; "Reason Code"; Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Debarment Reason Code".Code;
        }
        field(6; Description; Text[80])
        {
            DataClassification = ToBeClassified;
        }
        field(7; "Ineligibility Start Date"; Date)
        {
            DataClassification = ToBeClassified;
            Description = 'Date available on Debarment Voucher';
            Editable = false;
        }
        field(8; "Ineligibility End Date"; Date)
        {
            DataClassification = ToBeClassified;
            Description = 'Date available on Debarment Voucher';
            Editable = false;
        }
        field(9; "Reinstatement Date"; Date)
        {
            DataClassification = ToBeClassified;
            Description = 'Date available on Reinstatement Voucher';
            Editable = false;
        }
        field(10; "Vendor No."; Code[10])
        {
            DataClassification = ToBeClassified;
            Description = 'Link to Vendor records, if the Vendor exists on our database';
            TableRelation = Vendor;

            trigger OnValidate()
            begin
                Vend.Reset;
                Vend.SetRange("No.", "Vendor No.");
                if Vend.FindSet then begin
                    "Firm Name" := Vend.Name;
                    "Tax Registration (PIN) No." := Vend."VAT Registration No.";
                    "Incorporation/Reg No." := Vend."Incorporation Certificate No.";
                    Address := Vend.Address;
                    "Address 2" := Vend."Address 2";
                    "Country/Region Code" := Vend."Country/Region Code";
                end;
            end;
        }
        field(11; "Tax Registration (PIN) No."; Code[20])
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(12; "Incorporation/Reg No."; Code[30])
        {
            DataClassification = ToBeClassified;
        }
        field(13; Address; Text[300])
        {
            Caption = 'Address';
        }
        field(14; "Address 2"; Text[300])
        {
            Caption = 'Address 2';
        }
        field(15; "Country/Region Code"; Code[10])
        {
            Caption = 'Country/Region Code';
            TableRelation = "Country/Region";
        }
        field(16; Blocked; Boolean)
        {
            DataClassification = ToBeClassified;
        }
    }

    keys
    {
        key(Key1; "Entry no", "Source Voucher No.", "Document Type")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }

    var
        ProcurementSetup: Record "Procurement Setup";
        NoMgt: Codeunit "No. Series";
        Vend: Record Vendor;
}
