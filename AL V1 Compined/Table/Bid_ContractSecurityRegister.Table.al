#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Table 70169 "Bid_Contract Security Register"
{

    fields
    {
        field(1; "Document Type"; Option)
        {
            Caption = 'Document Type';
            DataClassification = ToBeClassified;
            OptionCaption = 'Quote,Order,Invoice,Credit Memo,Blanket Order,Return Order,Store Requisition,Purchase Requisition,,,,,,IEC Materials';
            OptionMembers = Quote,"Order",Invoice,"Credit Memo","Blanket Order","Return Order","Store Requisition","Purchase Requisition",,,,,,"IEC Materials";
        }
        field(2; "No."; Code[200])
        {
            Caption = 'No.';
            DataClassification = ToBeClassified;
            TableRelation = "Purchase Header"."No.";
        }
        field(3; "Form of Security"; Code[100])
        {
            Caption = 'Form of Security';
            DataClassification = ToBeClassified;
            Description = 'Submitted Bid Security Form/Type';
            TableRelation = "IFS Securities"."Form of Security" where("IFS Code" = field("IFS No"),
                                                                       "Security Type" = const("Bid/Tender Security"));

            trigger OnValidate()
            begin
                IfsSecurity.Reset;
                IfsSecurity.SetRange("Form of Security", "Form of Security");
                if IfsSecurity.FindSet then begin
                    "Security Type" := IfsSecurity."Security Type";
                    Description := IfsSecurity.Description;

                end;
            end;
        }
        field(4; "Vendor No."; Code[100])
        {
            DataClassification = ToBeClassified;
            TableRelation = Vendor;
        }
        field(5; "Security Type"; Option)
        {
            DataClassification = ToBeClassified;
            Editable = false;
            OptionCaption = 'Bid/Tender Security,Performance/Contract Security,Advance Payment Security';
            OptionMembers = "Bid/Tender Security","Performance/Contract Security","Advance Payment Security";
        }
        field(6; "Issuer Institution Type"; Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = 'Bank,Insurance,Other Guarantor';
            OptionMembers = Bank,Insurance,"Other Guarantor";
        }
        field(7; "Issuer/Guarantor Name"; Text[100])
        {
            DataClassification = ToBeClassified;
        }
        field(8; "Issuer Registered Offices"; Text[50])
        {
            DataClassification = ToBeClassified;
        }
        field(9; Description; Text[100])
        {
            DataClassification = ToBeClassified;
        }
        field(10; "Security Amount (LCY)"; Decimal)
        {
            DataClassification = ToBeClassified;

            trigger OnValidate()
            begin
                IfsSecurity.Reset;
                IfsSecurity.SetRange("IFS Code", "IFS No");
                //IfsSecurity.SETRANGE("Form of Security","Form of Security");
                IfsSecurity.SetRange("Nature of Security", IfsSecurity."nature of security"::Monetary);
                if IfsSecurity.FindSet then begin
                    //MESSAGE('%1',IfsSecurity."IFS Code");
                    if "Security Amount (LCY)" < IfsSecurity."Security Amount (LCY)" then
                        Error('Bid security value is below defined minimum Security Amount %1 on the IFS Notice.', IfsSecurity."Security Amount (LCY)");
                end;
            end;
        }
        field(11; "Bid Security Effective Date"; Date)
        {
            Caption = 'Bid Security Validity Expiry Date';
            DataClassification = ToBeClassified;
            Description = 'Bid Security Validity Expiry Date';
        }
        field(12; "Bid Security Validity Expiry"; Date)
        {
            Caption = 'Bid Security Validity Expiry Date';
            DataClassification = ToBeClassified;
            Description = 'Bid Security Validity Expiry Date';

            trigger OnValidate()
            begin
                IfsSecurity.Reset;
                IfsSecurity.SetRange("IFS Code", "IFS No");
                //IfsSecurity.SETRANGE("Form of Security","Form of Security");
                if IfsSecurity.FindSet then begin
                    if "Bid Security Validity Expiry" < IfsSecurity."Bid Security Validity Expiry" then
                        Error('validity expiry date of the submitted bid/tender security should  match the requirements of the IFS Notice %1', IfsSecurity."Bid Security Validity Expiry");
                end;
            end;
        }
        field(13; "Security ID"; Integer)
        {
            AutoIncrement = true;
            DataClassification = ToBeClassified;
        }
        field(14; "Security Closure Date"; Date)
        {
            DataClassification = ToBeClassified;
        }
        field(15; "Security Closure Voucher No."; Code[100])
        {
            DataClassification = ToBeClassified;
        }
        field(16; "Security Closure Type"; Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = 'Claim/Forfeiture,Released/Returned';
            OptionMembers = "Claim/Forfeiture","Released/Returned";
        }
        field(17; Blocked; Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(18; "IFS No"; Code[100])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Standard Purchase Code".Code;
        }
    }

    keys
    {
        key(Key1; "Document Type", "No.", "IFS No", "Vendor No.", "Security ID")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }

    var
        IfsSecurity: Record "IFS Securities";
}
