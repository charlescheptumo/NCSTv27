#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Table 70018 Bidders
{

    fields
    {
        field(1; "Ref No."; Code[50])
        {
            TableRelation = "Procurement Request";
        }
        field(2; Name; Code[100])
        {
        }
        field(3; "Physical Address"; Text[250])
        {
        }
        field(4; "Postal Address"; Text[250])
        {
        }
        field(5; City; Code[100])
        {
        }
        field(6; "E-mail"; Text[100])
        {
        }
        field(7; "Telephone No"; Code[100])
        {
        }
        field(8; "Mobile No"; Code[50])
        {
        }
        field(9; "Contact Person"; Text[50])
        {
        }
        field(10; "KBA Bank Code"; Code[50])
        {
        }
        field(11; "KBA Branch Code"; Code[3])
        {
        }
        field(12; "Bank account No"; Code[10])
        {
        }
        field(13; Category; Code[10])
        {
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
        field(17; "Tender Amount"; Decimal)
        {
        }
        field(18; "Bid Security Amount"; Decimal)
        {
        }
        field(19; "No. of Copies Submitted"; Decimal)
        {
        }
        field(20; "Bid Expiry Date"; Date)
        {
        }
        field(21; "Proceed to Tech Evaluation"; Boolean)
        {
        }
        field(22; "Fixed Asset No"; Code[20])
        {
        }
        field(23; "Cheque No"; Code[20])
        {
        }
        field(24; Response; Option)
        {
            OptionCaption = 'Offer,Regret,No Bid';
            OptionMembers = Offer,Regret,"No Bid";
        }
        field(25; "Tender Doc Receipt Date"; Date)
        {
        }
        field(26; "Receipt No."; Code[20])
        {
            NotBlank = true;
            TableRelation = "Receipts Header1";
        }
        field(27; "Technical Marks Awarded"; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(28; "Financial Marks Awarded"; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(29; Successful; Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(30; Supplier; Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = Vendor where("Vendor Posting Group" = const('VENDORS'));

            trigger OnValidate()
            begin
                vendorrec.Reset;
                vendorrec.Get(Supplier);
                Name := vendorrec.Name;
                "E-mail" := vendorrec."E-Mail";
                "Physical Address" := vendorrec.Address;
                City := vendorrec.City;
                "Telephone No" := vendorrec."Phone No.";
            end;
        }
        field(31; "visible?"; Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(32; "Failed Mandatory"; Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(33; "Quoted Amount"; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(34; "Recommended Winner"; Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(35; "Vendor No"; Code[30])
        {
            DataClassification = ToBeClassified;

            trigger OnValidate()
            begin
                vendorrec.Reset;
                vendorrec.SetRange(vendorrec."No.", "Vendor No");
                if vendorrec.Find('-') then begin
                    "Mobile No" := vendorrec."Phone No.";
                    Category := vendorrec.Category;
                    Name := vendorrec.Name;
                    "Contact Person" := vendorrec.Contact;
                    "Bank account No" := vendorrec."Our Account No.";
                    "KBA Branch Code" := vendorrec."KBA Branch Code";
                end;
            end;
        }
        field(36; EntryNo; Integer)
        {
            AutoIncrement = true;
            DataClassification = ToBeClassified;
        }
        field(37; "Contact No"; Code[30])
        {
            DataClassification = ToBeClassified;

            trigger OnValidate()
            begin
                contacts.Reset;
                contacts.SetRange(contacts."No.", "Vendor No");
                if contacts.FindSet then begin
                    "Mobile No" := contacts."Phone No.";
                    Name := contacts.Name;
                end;
            end;
        }
    }

    keys
    {
        key(Key1; "Ref No.", "E-mail")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }

    var
        vendorrec: Record Vendor;
        contacts: Record Contact;
}
