#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Table 70158 "Bid Business Owner"
{

    fields
    {
        field(1; "Document Type"; Option)
        {
            Caption = 'Document Type';
            OptionCaption = 'Quote,Order,Invoice,Credit Memo,Blanket Order,Return Order,Store Requisition,Purchase Requisition,,,,,,IEC Materials';
            OptionMembers = Quote,"Order",Invoice,"Credit Memo","Blanket Order","Return Order","Store Requisition","Purchase Requisition",,,,,,"IEC Materials";
        }
        field(2; "Entry No."; Integer)
        {
            Caption = 'Entry No.';
        }
        field(3; "Vendor No."; Code[20])
        {
            Caption = 'Vendor No.';
            TableRelation = Vendor;
        }
        field(4; Name; Code[100])
        {
            Caption = 'Name';
        }
        field(5; Address; Text[100])
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
        field(9; "Phone No."; Text[30])
        {
            Caption = 'Phone No.';
            ExtendedDatatype = PhoneNo;
        }
        field(10; "Nationality ID"; Code[30])
        {
            TableRelation = "Country/Region".Code;
        }
        field(11; "Citizenship Type"; Option)
        {
            Caption = 'Citizenship Type';
            OptionCaption = ',Birth,Naturalization,Registration';
            OptionMembers = ,Birth,Naturalization,Registration;
        }
        field(12; "ID/Passport No."; Code[30])
        {
        }
        field(13; "Entity Ownership %"; Decimal)
        {
            DataClassification = ToBeClassified;
            MaxValue = 100;
            MinValue = 0;
        }
        field(14; "Share Types"; Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = 'ORDINARY,PREFERENCE,OTHER';
            OptionMembers = ORDINARY,PREFERENCE,OTHER;
        }
        field(15; "No. of Shares"; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(16; "Nominal Value/Share"; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(17; "Total Nominal Value"; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(18; "Ownership Effective Date"; Date)
        {
            DataClassification = ToBeClassified;
        }
        field(19; "Country/Region Code"; Code[50])
        {
            Caption = 'Country/Region Code';
            DataClassification = ToBeClassified;
            TableRelation = "Country/Region";
        }
        field(20; "Post Code"; Code[20])
        {
            Caption = 'Post Code';
            DataClassification = ToBeClassified;
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
        field(21; County; Text[30])
        {
            CaptionClass = '5,1,' + "Country/Region Code";
            Caption = 'County';
            DataClassification = ToBeClassified;
        }
        field(22; "E-Mail"; Text[80])
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
        field(23; Blocked; Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(24; "No. Series"; Code[10])
        {
            DataClassification = ToBeClassified;
            TableRelation = "No. Series";
        }
        field(25; No; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Purchase Header"."No.";
        }
    }

    keys
    {
        key(Key1; "Document Type", No, "Entry No.")
        {
            Clustered = true;
        }
        key(Key2; "Vendor No.")
        {
        }
    }

    fieldgroups
    {
        fieldgroup(DropDown; "Document Type", "Entry No.", City, "Phone No.")
        {
        }
        fieldgroup(Brick; "Document Type", "Entry No.", City, "Phone No.")
        {
        }
    }

    trigger OnDelete()
    var
        Task: Record "To-do";
        SegLine: Record "Segment Line";
        ContIndustGrp: Record "Contact Industry Group";
        ContactWebSource: Record "Contact Web Source";
        ContJobResp: Record "Contact Job Responsibility";
        ContMailingGrp: Record "Contact Mailing Group";
        ContProfileAnswer: Record "Contact Profile Answer";
        RMCommentLine: Record "Rlshp. Mgt. Comment Line";
        ContAltAddr: Record "Contact Alt. Address";
        ContAltAddrDateRange: Record "Contact Alt. Addr. Date Range";
        InteractLogEntry: Record "Interaction Log Entry";
        Opp: Record Opportunity;
        Cont: Record Contact;
        ContBusRel: Record "Contact Business Relation";
        // //IntrastatSetup: Record "Intrastat Setup";        CampaignTargetGrMgt: Codeunit "Campaign Target Group Mgt";
        VATRegistrationLogMgt: Codeunit "VAT Registration Log Mgt.";
    begin
    end;

    var
        CannotDeleteWithOpenTasksErr: label 'You cannot delete contact %1 because there are one or more tasks open.', Comment = '%1 = Contact No.';
        Text001: label 'You cannot delete the %2 record of the %1 because the contact is assigned one or more unlogged segments.';
        Text002: label 'You cannot delete the %2 record of the %1 because one or more opportunities are in not started or progress.';
        Text003: label '%1 cannot be changed because one or more interaction log entries are linked to the contact.';
        CannotChangeWithOpenTasksErr: label '%1 cannot be changed because one or more tasks are linked to the contact.', Comment = '%1 = Contact No.';
        Text006: label '%1 cannot be changed because one or more opportunities are linked to the contact.';
        Text007: label '%1 cannot be changed because there are one or more related people linked to the contact.';
        RelatedRecordIsCreatedMsg: label 'The %1 record has been created.', Comment = 'The Customer record has been created.';
        Text010: label 'The %2 record of the %1 is not linked with any other table.';
        RMSetup: Record "Marketing Setup";
        Salesperson: Record "Salesperson/Purchaser";
        PostCode: Record "Post Code";
        DuplMgt: Codeunit DuplicateManagement;
        NoSeriesMgt: Codeunit "No. Series";
        UpdateCustVendBank: Codeunit "CustVendBank-Update";
        CampaignMgt: Codeunit "Campaign Target Group Mgt";
        ContChanged: Boolean;
        SkipDefaults: Boolean;
        Text012: label 'You cannot change %1 because one or more unlogged segments are assigned to the contact.';
        Text019: label 'The %2 record of the %1 already has the %3 with %4 %5.';
        CreateCustomerFromContactQst: label 'Do you want to create a contact as a customer using a customer template?';
        Text021: label 'You have to set up formal and informal salutation formulas in %1  language for the %2 contact.';
        Text022: label 'The creation of the customer has been aborted.';
        Text033: label 'Before you can use Online Map, you must fill in the Online Map Setup window.\See Setting Up Online Map in Help.';
        SelectContactErr: label 'You must select an existing contact.';
        AlreadyExistErr: label '%1 %2 already has a %3 with %4 %5.', Comment = '%1=Contact table caption;%2=Contact number;%3=Contact Business Relation table caption;%4=Contact Business Relation Link to Table value;%5=Contact Business Relation number';
        HideValidationDialog: Boolean;
        PrivacyBlockedPostErr: label 'You cannot post this type of document because contact %1 is blocked due to privacy.', Comment = '%1=contact no.';
        PrivacyBlockedCreateErr: label 'You cannot create this type of document because contact %1 is blocked due to privacy.', Comment = '%1=contact no.';
        PrivacyBlockedGenericErr: label 'You cannot use contact %1 because they are marked as blocked due to privacy.', Comment = '%1=contact no.';
        ParentalConsentReceivedErr: label 'Privacy Blocked cannot be cleared until Parental Consent Received is set to true for minor contact %1.', Comment = '%1=contact no.';
        ProfileForMinorErr: label 'You cannot use profiles for contacts marked as Minor.';
}
