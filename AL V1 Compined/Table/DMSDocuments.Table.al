#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Table 50007 "DMS Documents"
{

    fields
    {
        field(1; "Document Type"; Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = 'Purchase Requisition,Imprest Memo,Imprest Surrender,Store Requisition,Sales Invoices,Purchase Invoices,Standing Imprest,Petty Cash,Payment Voucher,Staff Claim,Case Management';
            OptionMembers = "Purchase Requisition","Imprest Memo","Imprest Surrender","Store Requisition","Sales Invoices","Purchase Invoices","Standing Imprest","Petty Cash","Payment Voucher","Staff Claim","Case Management";
        }
        field(2; Name; Text[200])
        {
            DataClassification = ToBeClassified;
        }
        field(3; "Sharepoint URL"; Text[250])
        {
            DataClassification = ToBeClassified;
        }
        field(4; "Document Path"; Text[250])
        {
            DataClassification = ToBeClassified;
        }
        field(5; "Library Name"; Text[250])
        {
            DataClassification = ToBeClassified;
        }
        field(6; "Folder Name"; Text[250])
        {
            DataClassification = ToBeClassified;
        }
    }

    keys
    {
        key(Key1; "Document Type")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}
