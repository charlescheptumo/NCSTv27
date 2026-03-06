#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Table 57014 "Receipts and Payment Types1"
{
    // //

    DrillDownPageID = "Advance Types";
    LookupPageID = "Advance Types";

    fields
    {
        field(1; "Code"; Code[50])
        {
            NotBlank = true;
        }
        field(2; Description; Text[250])
        {
        }
        field(3; "Account Type"; Option)
        {
            Caption = 'Account Type';
            OptionCaption = 'G/L Account,Customer,Vendor,Bank Account,Fixed Asset,IC Partner,Staff,None';
            OptionMembers = "G/L Account",Customer,Vendor,"Bank Account","Fixed Asset","IC Partner",Staff,"None";

            trigger OnValidate()
            begin
                if "Account Type" = "account type"::"G/L Account" then
                    "Direct Expense" := true
                else
                    "Direct Expense" := false;
            end;
        }
        field(4; Type; Option)
        {
            NotBlank = true;
            OptionMembers = " ",Receipt,Payment,Imprest;
        }
        field(5; "VAT Chargeable"; Option)
        {
            OptionMembers = No,Yes;
        }
        field(6; "Withholding Tax Chargeable"; Option)
        {
            OptionMembers = No,Yes;
        }
        field(7; "VAT Code"; Code[20])
        {
            TableRelation = "Tariff Codes1";
        }
        field(8; "Withholding Tax Code"; Code[20])
        {
            TableRelation = "Tariff Codes1";
        }
        field(9; "Default Grouping"; Code[20])
        {
            TableRelation = if ("Account Type" = const(Customer)) "Customer Posting Group"
            else if ("Account Type" = const(Vendor)) "Vendor Posting Group"
            else if ("Account Type" = const("Bank Account")) "Bank Account Posting Group"
            else if ("Account Type" = const("Fixed Asset")) "FA Posting Group"
            else if ("Account Type" = const("IC Partner")) "IC Partner";
        }
        field(10; "G/L Account"; Code[20])
        {
            TableRelation = if ("Account Type" = const("G/L Account")) "G/L Account"."No.";

            trigger OnValidate()
            begin
                GLAcc.Reset;
                if GLAcc.Get("G/L Account") then begin
                    if Type = Type::Payment then
                        GLAcc.TestField(GLAcc."Budget Controlled", true);
                    if GLAcc."Direct Posting" = false then begin
                        Error('Direct Posting must be True');
                    end;
                end;
            end;
        }
        field(11; "Pending Voucher"; Boolean)
        {
        }
        field(13; "Transation Remarks"; Text[250])
        {
            NotBlank = true;
        }
        field(14; "Payment Reference"; Option)
        {
            OptionMembers = Normal,"Farmer Purchase";
        }
        field(15; "Customer Payment On Account"; Boolean)
        {
        }
        field(16; "Direct Expense"; Boolean)
        {
            Editable = false;
        }
        field(17; "Calculate Retention"; Option)
        {
            OptionMembers = No,Yes;
        }
        field(18; "Retention Code"; Code[20])
        {
            TableRelation = "Tariff Codes1";
        }
        field(19; "Subsistence?"; Boolean)
        {
        }
        field(20; "VAT Withheld Code"; Code[20])
        {
            TableRelation = "Tariff Codes1";
        }
        field(57000; "Appear on Imprest?"; Boolean)
        {
            Description = '//Ushindi...Determine Types to appear on Imprest Req on go-live';
        }
        field(57001; "Account no"; Code[20])
        {
            TableRelation = Vendor."No.";
        }
        field(57002; "Appear on sclaims"; Boolean)
        {
        }
        field(57003; Subject; Text[250])
        {
        }
        field(57004; "Purchase Requisition"; Boolean)
        {
        }
    }

    keys
    {
        key(Key1; "Code")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }

    var
        GLAcc: Record "G/L Account";
}
