#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Table 70159 "Bid Key Staff"
{
    Caption = 'IFS Key Staff';

    fields
    {
        field(1; "Document Type"; Option)
        {
            Caption = 'Document Type';
            DataClassification = ToBeClassified;
            OptionCaption = 'Quote,Order,Invoice,Credit Memo,Blanket Order,Return Order,Store Requisition,Purchase Requisition,,,,,,IEC Materials';
            OptionMembers = Quote,"Order",Invoice,"Credit Memo","Blanket Order","Return Order","Store Requisition","Purchase Requisition",,,,,,"IEC Materials";
        }
        field(2; "No."; Code[20])
        {
            Caption = 'Response No';
            DataClassification = ToBeClassified;
            TableRelation = "Purchase Header"."No.";
        }
        field(3; "Staff No."; Code[40])
        {
            Caption = 'Staff No.';
            DataClassification = ToBeClassified;
        }
        field(4; "Staff Name"; Text[80])
        {
            DataClassification = ToBeClassified;
        }
        field(5; Nationality; Code[50])
        {
            Caption = 'Country/Region Code';
            DataClassification = ToBeClassified;
            TableRelation = "Country/Region";
        }
        field(6; "Proposed Project Role ID"; Code[50])
        {
            DataClassification = ToBeClassified;
            Description = 'This is the role of each staff on the Project. The system shall apply a filter on the IFS Key Staff Table, for the relevant IFS No, Staff Category, before the user can select the designation (Mapped to Project Role Field)';
            TableRelation = "Project Role Code"."Project Role Code";
        }
        field(7; "Required Project Role"; Text[100])
        {
            DataClassification = ToBeClassified;
        }
        field(8; "Staff Category"; Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = ',Management/Executive Staff,Technical Staff,Consultant,Project Mgt Staff,Site/Delivery Staff,Support Staff,Other';
            OptionMembers = ,"Management/Executive Staff","Technical Staff",Consultant,"Project Mgt Staff","Site/Delivery Staff","Support Staff",Other;
        }
        field(9; Profession; Code[50])
        {
            DataClassification = ToBeClassified;
        }
        field(10; "Date of Birth"; Date)
        {
            DataClassification = ToBeClassified;
        }
        field(11; "Years with Firm"; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(12; "Phone No."; Text[30])
        {
            Caption = 'Phone No.';
            DataClassification = ToBeClassified;
            ExtendedDatatype = PhoneNo;
        }
        field(13; "E-Mail"; Text[80])
        {
            Caption = 'Email';
            DataClassification = ToBeClassified;
            ExtendedDatatype = EMail;

            trigger OnValidate()
            var
                MailManagement: Codeunit "Mail Management";
            begin
                MailManagement.ValidateEmailAddressField("E-Mail");
            end;
        }
        field(14; "Vendor No."; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = Vendor;
        }
        field(15; "Entry No."; Integer)
        {
            AutoIncrement = true;
            DataClassification = ToBeClassified;
        }
    }

    keys
    {
        key(Key1; "Document Type", "No.", "Staff No.", "Entry No.")
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
}
