#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Table 70056 "Bid Opening Register Lines2"
{

    fields
    {
        field(1; "Requisition No"; Code[50])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Procurement Request";

            trigger OnValidate()
            begin

                /*
                IF ReqHeader.GET("Requisition No") THEN
                BEGIN
                 "Procurement Plan":=ReqHeader."Procurement Plan";
                 "Global Dimension 1 Code":=ReqHeader."Global Dimension 1 Code";
                END;*/
                ProcurementLines.Reset;
                ProcurementLines.SetRange("Requisition No", "Requisition No");
                if ProcurementLines.FindSet then begin
                    Type := ProcurementLines.Type;
                    No := ProcurementLines.No;
                    Description := ProcurementLines.Description;

                end;

            end;
        }
        field(2; "Bidder Name"; Text[150])
        {
            DataClassification = ToBeClassified;
        }
        field(3; "Bidder Email"; Text[60])
        {
            DataClassification = ToBeClassified;
        }
        field(4; "Line No"; Integer)
        {
            DataClassification = ToBeClassified;

            trigger OnValidate()
            begin
                /*
                IF ReqHeader.GET("Requisition No") THEN
                BEGIN
                 "Procurement Plan":=ReqHeader."Procurement Plan";
                 "Global Dimension 1 Code":=ReqHeader."Global Dimension 1 Code";
                END;
                */

            end;
        }
        field(5; Type; Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = ' ,Non Stock Item,Item,,Fixed Asset';
            OptionMembers = " ","Non Stock Item",Item,,"Fixed Asset";
        }
        field(6; No; Code[10])
        {
            DataClassification = ToBeClassified;
            TableRelation = if (Type = const("Non Stock Item")) "G/L Account"
            else if (Type = const(Item)) Item
            else if (Type = const("Fixed Asset")) "Fixed Asset";
        }
        field(7; Description; Text[250])
        {
            DataClassification = ToBeClassified;
        }
        field(8; Quantity; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(9; "Unit of Measure"; Code[50])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Unit of Measure";
        }
        field(10; "Unit Price"; Decimal)
        {
            DataClassification = ToBeClassified;

            trigger OnValidate()
            begin

                Amount := Quantity * "Unit Price";
            end;
        }
        field(11; Amount; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(12; "Amount LCY"; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(13; Discount; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(14; Remarks; Text[250])
        {
            DataClassification = ToBeClassified;
        }
        field(15; contactNo; Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(16; Selected; Boolean)
        {
            DataClassification = ToBeClassified;

            trigger OnValidate()
            var
                rec1: Record "Prequalified Suppliers1";
            begin
            end;
        }
        field(17; "Vendor No"; Code[30])
        {
            DataClassification = ToBeClassified;
        }
        field(18; EntryNo; Integer)
        {
            AutoIncrement = true;
            DataClassification = ToBeClassified;
        }
        field(19; Awarded; Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(20; "Linked vendor"; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = Vendor;
        }
        field(21; "Item No"; Code[10])
        {
            DataClassification = ToBeClassified;
            TableRelation = if (Type = const("Non Stock Item")) "G/L Account"
            else if (Type = const(Item)) Item
            else if (Type = const("Fixed Asset")) "Fixed Asset";
        }
        field(22; "Tender Document Source"; Code[10])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Tender Document Source".Code;
        }
        field(23; "Respresentative Name"; Text[250])
        {
            DataClassification = ToBeClassified;
        }
        field(24; "Representative Designation"; Text[250])
        {
            DataClassification = ToBeClassified;
        }
        field(25; "Evaluation Decision"; Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = 'Responsive,Non Responsive';
            OptionMembers = Responsive,"Non Responsive";
        }
        field(26; "Technical Score"; Integer)
        {
            DataClassification = ToBeClassified;
            MaxValue = 100;
            MinValue = 0;
        }
        field(27; "Financial Evaluation Decision"; Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = 'Pass,Fail';
            OptionMembers = Pass,Fail;
        }
        field(28; "Financial Score"; Integer)
        {
            DataClassification = ToBeClassified;
            MaxValue = 100;
            MinValue = 0;
        }
        field(29; "Tender bid line no"; Integer)
        {
            DataClassification = ToBeClassified;
        }
        field(30; "Passed Technical"; Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(31; "Financial Opening"; Boolean)
        {
            DataClassification = ToBeClassified;
        }
    }

    keys
    {
        key(Key1; "Requisition No", "Bidder Name", "Bidder Email", No, "Tender bid line no", "Line No")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }

    var
        ProcurementLines: Record "Procurement Request Lines";
        TenderBids: Record "Tender Bids";
        ReqHeader: Record "Procurement Request";
}
