#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Table 51000 "Goods & Services Inspection"
{
    DrillDownPageID = "Goods & Services Inspection";
    LookupPageID = "Goods & Services Inspection";

    fields
    {
        field(1; "No."; Code[20])
        {
            TableRelation = "Purchase Header"."No.";

            trigger OnValidate()
            begin
                PurchaseHeader.SetRange(PurchaseHeader."No.", "No.");
                if PurchaseHeader.Find('-') then begin
                    "Document Type" := PurchaseHeader."Document Type";
                    "Buy-from Vendor No." := PurchaseHeader."Buy-from Vendor No.";
                    "Buy-from Vendor Name" := PurchaseHeader."Buy-from Vendor Name";
                    "Vendor Shipment No." := PurchaseHeader."Vendor Shipment No.";
                    "Vendor Invoice No." := PurchaseHeader."Vendor Invoice No.";
                    "Vendor Order No." := PurchaseHeader."Vendor Order No.";
                    "Vendor Cr. Memo No." := PurchaseHeader."Vendor Cr. Memo No.";
                    "Assigned By" := UserId;
                    "Assignment Date-Time" := CurrentDatetime;
                end;
            end;
        }
        field(2; "User ID"; Code[50])
        {
            Caption = 'User ID';
            NotBlank = true;
            TableRelation = User."User Name";

            trigger OnLookup()
            var
                UserMgt: Codeunit "User Management";
            begin
                UserMgt.DisplayUserInformation("User ID");
            end;

            trigger OnValidate()
            var
                USER1: RECORD User;
                UserMgt: Codeunit "User Management";
            begin
                UserMgt.ValidateUserName(USER1, USER1, "User ID");
                TestField("Vendor Shipment No.");
                TestField("Vendor Invoice No.");
            end;
        }
        field(3; "Committee Role"; Option)
        {
            OptionCaption = 'Member,Chairperson,Alternate Chairperson';
            OptionMembers = Member,Chairperson,"Alternate Chairperson";
        }
        field(4; Decision; Option)
        {
            OptionCaption = ' ,Approved,Rejected';
            OptionMembers = " ",Approved,Rejected;
        }
        field(5; Comments; Text[80])
        {
        }
        field(6; "Date-Time Sent for Approval"; DateTime)
        {
            Caption = 'Date-Time Sent for Approval';
        }
        field(7; "Locked?"; Boolean)
        {
        }
        field(8; Approved; Boolean)
        {
        }
        field(13; "Vendor Shipment No."; Code[35])
        {
            Caption = 'Vendor Shipment No.';
            Editable = false;
        }
        field(14; "Assigned By"; Code[50])
        {
            Caption = 'Assigned By';
            Editable = false;

            trigger OnValidate()
            begin
                /*IF "Assigned User ID" <> '' THEN BEGIN
                  "Assignment Date" := TODAY;
                  "Assignment Time" := TIME;
                END ELSE BEGIN
                  "Assignment Date" := 0D;
                  "Assignment Time" := 0T;
                END;
                */

            end;
        }
        field(15; "Assignment Date-Time"; DateTime)
        {
            Caption = 'Assignment Date';
            Editable = false;
        }
        field(16; "Vendor Order No."; Code[35])
        {
            Caption = 'Vendor Order No.';
            Editable = false;
        }
        field(17; "Vendor Invoice No."; Code[35])
        {
            Caption = 'Vendor Invoice No.';
            Editable = false;
        }
        field(18; "Vendor Cr. Memo No."; Code[35])
        {
            Caption = 'Vendor Cr. Memo No.';
            Editable = false;
        }
        field(19; "Document Type"; Option)
        {
            Caption = 'Document Type';
            Editable = false;
            OptionCaption = 'Quote,Order,Invoice,Credit Memo,Blanket Order,Return Order,Store Requisition,Purchase Requisition,Leave Application';
            OptionMembers = Quote,"Order",Invoice,"Credit Memo","Blanket Order","Return Order","Store Requisition","Purchase Requisition","Leave Application";
        }
        field(20; "Buy-from Vendor No."; Code[20])
        {
            Caption = 'Buy-from Vendor No.';
            Editable = false;
            TableRelation = Vendor;
        }
        field(21; "Buy-from Vendor Name"; Text[50])
        {
            Caption = 'Buy-from Vendor Name';
            Editable = false;
        }
    }

    keys
    {
        key(Key1; "No.", "User ID", "Vendor Shipment No.")
        {
            Clustered = true;
        }
        key(Key2; "User ID", "Vendor Shipment No.")
        {
        }
    }

    fieldgroups
    {
    }

    var
        PurchaseHeader: Record "Purchase Header";
}
