#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Table 70036 "Inspection Header1"
{

    fields
    {
        field(1; "Inspection No"; Code[20])
        {
        }
        field(2; "Order No"; Code[20])
        {
            TableRelation = "Purchase Header"."No." where("Document Type" = const(Order));

            trigger OnValidate()
            begin
                PurchLines.Reset;
                PurchLines.SetRange(PurchLines."Document Type", PurchLines."document type"::Order);
                PurchLines.SetRange(PurchLines."Document No.", "Order No");
                if PurchLines.Find('-') then begin
                    InspectLines.Init;
                    InspectLines."Inspection No" := "Inspection No";
                    InspectLines."Line No" := PurchLines."Line No.";
                    InspectLines.Description := PurchLines.Specifications;
                    InspectLines."Unit of Measure" := PurchLines."Unit of Measure";
                    InspectLines."Quantity Ordered" := PurchLines.Quantity;
                    //InspectLines."Quantity Received":=
                    if not InspectLines.Get(InspectLines."Inspection No", InspectLines."Line No") then
                        InspectLines.Insert;

                end;
                if PO.Get(PO."document type"::Order, "Order No") then begin
                    "Supplier Name" := PO."Buy-from Vendor Name";
                    "Tender/Quotation No." := PO."Contract No."
                end;
            end;
        }
        field(3; "Commitee Appointment No"; Code[20])
        {
            TableRelation = "Tender Commitee Appointment1";
        }
        field(4; "Inspection Date"; Date)
        {
        }
        field(5; "Supplier Name"; Text[80])
        {
        }
        field(6; "No. Series"; Code[20])
        {
        }
        field(7; Status; Option)
        {
            OptionCaption = 'Open,Released,Pending Approval,Pending Prepayment,Rejected,Payment Processing';
            OptionMembers = Open,Released,"Pending Approval","Pending Prepayment",Rejected,"Payment Processing";
        }
        field(8; Amount; Decimal)
        {
            CalcFormula = sum("Purchase Line".Amount where("Document Type" = const(Order),
                                                            "Document No." = field("Order No")));
            Editable = true;
            FieldClass = FlowField;
        }
        field(9; "Amount Invoiced"; Decimal)
        {
            CalcFormula = sum("Purch. Inv. Line".Amount where("Document No." = field("Order No")));
            FieldClass = FlowField;
        }
        field(10; "Temp Amount"; Decimal)
        {
        }
        field(11; "Tender/Quotation No."; Code[20])
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
    }

    keys
    {
        key(Key1; "Inspection No")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }

    trigger OnInsert()
    begin
        PurchSetup.Get;
        PurchSetup.TestField(PurchSetup."Inspection Nos");
        //NoSeriesMgt.InitSeries(PurchSetup."Inspection Nos", xRec."No. Series", 0D, "Inspection No", "No. Series");
        "Inspection No" := NoSeriesMgt.GetNextNo(PurchSetup."Inspection Nos", Today, true);
    end;

    var
        PurchLines: Record "Purchase Line";
        InspectLines: Record "Inspection Lines1";
        PO: Record "Purchase Header";
        PurchSetup: Record "Purchases & Payables Setup";
        NoSeriesMgt: Codeunit "No. Series";
}
