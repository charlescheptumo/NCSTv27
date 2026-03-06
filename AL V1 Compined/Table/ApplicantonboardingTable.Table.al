#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Table 56024 "Applicant onboarding Table"
{

    fields
    {
        field(1; "No."; Code[20])
        {

            trigger OnValidate()
            begin
                if "No." <> xRec."No." then
                    NoSeriesMgt.TestManual(CopyrightSetup."Applicant Nos");
            end;
        }
        field(2; "Applicant Category"; Option)
        {
            OptionCaption = 'Individuals,Company';
            OptionMembers = Individuals,Company;
        }
        field(3; "Applicant Name"; Text[60])
        {
        }
        field(4; "Phone No"; Text[30])
        {
        }
        field(5; "E-Mail"; Text[30])
        {
        }
        field(6; "ID/Passport No"; Code[30])
        {
        }
        field(7; "P.I.N"; Code[20])
        {
        }
        field(8; "Company Registration No"; Code[20])
        {
        }
        field(9; "Date Created"; Date)
        {
            Editable = false;
        }
        field(10; "Time Created"; Time)
        {
            Editable = false;
        }
        field(11; "Created By"; Code[22])
        {
            Editable = false;
        }
        field(12; "No. Series"; Code[10])
        {
        }
        field(13; "Search Name"; Code[50])
        {
            Caption = 'Search Name';
        }
        field(14; "Name 2"; Text[50])
        {
            Caption = 'Name 2';
        }
        field(15; Address; Text[50])
        {
            Caption = 'Address';
        }
        field(16; "Address 2"; Text[50])
        {
            Caption = 'Address 2';
        }
        field(17; City; Text[30])
        {
            Caption = 'City';
            Enabled = false;
            //This property is currently not supported
            //TestTableRelation = false;
            //The property 'ValidateTableRelation' can only be set if the property 'TableRelation' is set
            //ValidateTableRelation = false;

            trigger OnValidate()
            begin
                //PostCode.ValidateCity(City,"Post Code",County,"Country/Region Code",(CurrFieldNo <> 0) AND GUIALLOWED);
            end;
        }
        field(18; Contact; Text[50])
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
        field(19; "Telex No."; Text[20])
        {
            Caption = 'Telex No.';
        }
        field(20; "Customer Posting Group"; Code[10])
        {
            Caption = 'Customer Posting Group';
            InitValue = 'COPYRIGHT';
            TableRelation = "Customer Posting Group";
        }
        field(21; "Country/Region Code"; Code[10])
        {
            Caption = 'Country/Region Code';
            TableRelation = "Country/Region";
        }
        field(22; "Gen. Bus. Posting Group"; Code[10])
        {
            Caption = 'Gen. Bus. Posting Group';
            InitValue = 'COPYRIGHT';
            TableRelation = "Gen. Business Posting Group";

            trigger OnValidate()
            begin
                /*IF xRec."Gen. Bus. Posting Group" <> "Gen. Bus. Posting Group" THEN
                  IF GenBusPostingGrp.ValidateVatBusPostingGroup(GenBusPostingGrp,"Gen. Bus. Posting Group") THEN
                    VALIDATE("VAT Bus. Posting Group",GenBusPostingGrp."Def. VAT Bus. Posting Group");
                    */

            end;
        }
        field(23; "Post Code"; Code[20])
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
        field(24; County; Text[30])
        {
            Caption = 'County';
        }
        field(25; "VAT Bus. Posting Group"; Code[10])
        {
            Caption = 'VAT Bus. Posting Group';
            TableRelation = "VAT Business Posting Group";
        }
        field(26; Type; Option)
        {
            Description = 'Person/Company';
            OptionCaption = 'Person,Company';
            OptionMembers = Person,Company;
        }
        field(27; "Customer Category"; Option)
        {
            Caption = 'Applicant Category';
            Description = 'Customer/Author/Publisher/Licensee';
            OptionCaption = ',Author,Producer/Publisher,Licensee/Assignee';
            OptionMembers = ,Author,"Producer/Publisher","Licensee/Assignee";
        }
        field(28; "Customer Type"; Option)
        {
            Caption = 'Applicant Type';
            Description = 'Customer/Applicant';
            OptionCaption = 'Customer,Copyright Applicant';
            OptionMembers = Customer,"Copyright Applicant";
        }
        field(29; Title; Code[20])
        {
            TableRelation = Salutation.Code;
        }
        field(30; Status; Option)
        {
            OptionCaption = 'Open,Pending,Approved';
            OptionMembers = Open,Pending,Approved;
        }
        field(31; "Captured by"; Code[30])
        {
        }
        field(32; Created; Boolean)
        {
        }
        field(33; "Registration Date"; Date)
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
        CopyrightSetup.Get();

        if "No." = '' then
          //  NoSeriesMgt.InitSeries(CopyrightSetup."Applicant Nos", xRec."No. Series", 0D, "No.", "No. Series");
          "No.":= NoSeriesMgt.GetNextNo(CopyrightSetup."Applicant Nos", Today, true);
        "Created By" := UserId;
        "Date Created" := Today;
        "Time Created" := Time;
    end;

    trigger OnModify()
    begin
        TestField("Applicant Name");
        if ("Applicant Category" = "applicant category"::Individuals) then begin
            TestField("ID/Passport No");

        end;
        if ("Applicant Category" = "applicant category"::Company) then begin
            TestField("Company Registration No");
            TestField("P.I.N");
        end;
        //Machira
    end;

    var
        NoSeriesMgt: Codeunit "No. Series";
        CopyrightSetup: Record "Copyright Setup";
        SalesSetup: Record "Sales & Receivables Setup";
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
        MoveEntries: Codeunit MoveEntries;
        UpdateContFromCust: Codeunit "CustCont-Update";
        DimMgt: Codeunit DimensionManagement;
        ApprovalsMgmt: Codeunit "Approvals Mgmt.";
        InsertFromContact: Boolean;
        Individuals: label 'Individuals';
}
