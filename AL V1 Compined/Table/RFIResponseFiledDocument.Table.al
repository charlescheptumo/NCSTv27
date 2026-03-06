#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Table 70089 "RFI Response Filed Document"
{

    fields
    {
        field(1; "Document Type"; Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = ',IFP Response,EOI Response';
            OptionMembers = ,"IFP Response","EOI Response";
        }
        field(2; "Document No"; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "RFI Response"."Document No.";

            trigger OnValidate()
            begin
                RFIResponse.Reset;
                RFIResponse.SetRange("Document No.", "Document No");
                if RFIResponse.FindSet then begin
                    "Vendor No" := RFIResponse."Vendor No.";
                    //"RFI Document No." := RFIResponse."RFI Document No.";

                end;
            end;
        }
        field(3; "Entry No"; Integer)
        {
            AutoIncrement = true;
            DataClassification = ToBeClassified;
        }
        field(4; "Date Filed"; Date)
        {
            DataClassification = ToBeClassified;
        }
        field(5; "Vendor No"; Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = Vendor;
        }
        field(6; "Procurement Document Type ID"; Code[100])
        {
            DataClassification = ToBeClassified;
            Description = 'Linked to Procurement Document Type table';
            TableRelation = "Procurement Document Type".Code;

            trigger OnValidate()
            begin
                ProcDocType.Reset;
                ProcDocType.SetRange(Code, "Procurement Document Type ID");
                if ProcDocType.FindSet then
                    "Document Description" := ProcDocType.Description
            end;
        }
        field(7; "Document Description"; Text[250])
        {
            DataClassification = ToBeClassified;
        }
        field(8; "Certificate No."; Code[30])
        {
            Caption = 'External Document/Certificate No.';
            DataClassification = ToBeClassified;
            Description = 'External Document/Certificate No.';
        }
        field(9; "Issue Date"; Date)
        {
            DataClassification = ToBeClassified;
        }
        field(10; "Expiry Date"; Date)
        {
            DataClassification = ToBeClassified;
        }
        field(11; "File Name"; Text[750])
        {
            Caption = 'Specialized Provider Requirement';
            DataClassification = ToBeClassified;
        }
        field(12; "File Type"; Text[30])
        {
            DataClassification = ToBeClassified;
        }
        field(13; "File Extension"; Text[30])
        {
            DataClassification = ToBeClassified;
        }
        field(14; "Procurement Process"; Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = ',Registration,Prequalification,EOI Response,RFQ Response,ITT Response,Negotiations/Contract,Transactional';
            OptionMembers = ,Registration,Prequalification,"EOI Response","RFQ Response","ITT Response","Negotiations/Contract",Transactional;
        }
        field(15; "Document Link"; Text[750])
        {
            DataClassification = ToBeClassified;
            ExtendedDatatype = URL;
        }
        field(16; "RFI Document No."; Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Request For Information".Code;
        }
    }

    keys
    {
        key(Key1; "Document Type", "Document No", "Entry No")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }

    var
        RFIResponse: Record "RFI Response";
        ProcDocType: Record "Procurement Document Type";
}
