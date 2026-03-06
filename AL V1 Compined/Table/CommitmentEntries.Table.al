#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Table 56009 "Commitment Entries"
{

    fields
    {
        field(1; "Commitment No"; Code[20])
        {

            trigger OnValidate()
            begin
                /*
                IF "Commitment No" <> xRec."Commitment No" THEN BEGIN
                    GenLedgerSetup.GET();
                    NoSeriesMgt.TestManual( GenLedgerSetup."Commitment No");
                     "Commitment No" := '';
                END;
                 */

            end;
        }
        field(2; "Commitment Date"; Date)
        {
        }
        field(3; "Commitment Type"; Option)
        {
            OptionMembers = Committed,Reversal;
        }
        field(4; Account; Code[20])
        {
            TableRelation = "G/L Account";
        }
        field(5; "Committed Amount"; Decimal)
        {
        }
        field(6; User; Code[20])
        {
        }
        field(7; "Document No"; Code[20])
        {
        }
        field(8; InvoiceNo; Code[20])
        {
        }
        field(9; "No. Series"; Code[10])
        {
            Caption = 'No. Series';
            Editable = false;
            TableRelation = "No. Series";
        }
        field(10; No; Code[20])
        {
        }
        field(11; "Entry No"; Integer)
        {
            AutoIncrement = false;
        }
        field(12; "Global Dimension 1"; Code[20])
        {
            CaptionClass = '1,1,1';
            TableRelation = "Dimension Value".Code where("Global Dimension No." = const(1));
        }
        field(13; "Global Dimension 2"; Code[20])
        {
            CaptionClass = '1,1,2';
            TableRelation = "Dimension Value".Code where("Global Dimension No." = const(2));
        }
        field(14; "Line No."; Integer)
        {
        }
        field(15; "Account No."; Code[20])
        {
            TableRelation = if ("Account Type" = const("G/L Account")) "G/L Account"
            else if ("Account Type" = const(Customer)) Customer
            else if ("Account Type" = const(Vendor)) Vendor
            else if ("Account Type" = const("Fixed Asset")) "Fixed Asset";
        }
        field(16; "Account Name"; Text[100])
        {
        }
        field(17; Description; Text[250])
        {
        }
        field(18; "Account Type"; Option)
        {
            OptionCaption = 'G/L Account,Customer,Vendor,Bank Account,Fixed Asset';
            OptionMembers = "G/L Account",Customer,Vendor,"Bank Account","Fixed Asset";
        }
        field(19; "Uncommittment Date"; Date)
        {
        }
    }

    keys
    {
        key(Key1; "Commitment No")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}
