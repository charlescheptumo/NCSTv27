#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Table 70193 "IFP Response Line Requirement"
{

    fields
    {
        field(1; "Document Type"; Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = 'IFP Response,EOI Response';
            OptionMembers = "IFP Response","EOI Response";
        }
        field(2; "Document No."; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "RFI Response"."Document No.";

            trigger OnValidate()
            begin
                RFIResp.Reset;
                RFIResp.SetRange("Document No.", "Document No.");
                if RFIResp.FindSet then begin
                    "RFI Document No." := RFIResp."RFI Document No.";
                end;
            end;
        }
        field(3; "Procurement Category"; Code[50])
        {
            DataClassification = ToBeClassified;
            Description = 'Linked to RFI Prequalification Category Table. When the procurement category is selcted, the system shall validate the Procurement Category Description, Special Group Reservation, Unique Category Requirement, Restricted Responsibility Center ID, Prequalification Start Date and Prequalification ENd Date fields in the RFI Response Line table';
            TableRelation = "RFI Prequalification Category"."Prequalification Category ID" where("Document No" = field("RFI Document No."));
        }
        field(4; "Entry No"; Integer)
        {
            AutoIncrement = true;
            DataClassification = ToBeClassified;
        }
        field(5; "Requirement Code"; Code[40])
        {
            DataClassification = ToBeClassified;
            TableRelation = "RFI Category Requirement"."Requirement Code";

            trigger OnValidate()
            begin
                RFIReq.Reset;
                RFIReq.SetRange("Requirement Code", "Requirement Code");
                if RFIReq.FindSet then begin
                    Description := RFIReq.Description;
                end;
            end;
        }
        field(6; Description; Text[250])
        {
            DataClassification = ToBeClassified;
        }
        field(7; "Requirement Type"; Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = ',Mandatory,Supporting';
            OptionMembers = ,Mandatory,Supporting;
        }
        field(8; "RFI Document No."; Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Request For Information".Code;
        }
        field(9; "Meets Requirement"; Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(10; "Proof of compliance summary"; Text[250])
        {
            DataClassification = ToBeClassified;
        }
    }

    keys
    {
        key(Key1; "Document Type", "Document No.", "Procurement Category")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }

    var
        PrequalificationCategory: Record "RFI Prequalification Category";
        RFIResp: Record "RFI Response";
        RFIReq: Record "RFI Category Requirement";
}
