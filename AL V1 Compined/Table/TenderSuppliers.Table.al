#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Table 70024 "Tender Suppliers"
{

    fields
    {
        field(1; "Reference No."; Code[50])
        {
            TableRelation = "Procurement Request";

            trigger OnValidate()
            begin
                if ProcurementRequest.Get("Reference No.") then begin
                    "Supplier Category" := ProcurementRequest."Supplier Category";
                end;
            end;
        }
        field(2; "Supplier Name"; Text[100])
        {
            TableRelation = Bidders.Name where("Ref No." = field("Reference No."));
        }
        field(3; "Supplier Category"; Code[10])
        {
        }
        field(4; Awarded; Boolean)
        {
        }
        field(5; "Supplier No"; Code[20])
        {

            trigger OnValidate()
            begin
                //Bidder.RESET;
                //Bidder.SETRANGE(Bidder.Name);
                //IF Vendor.GET("Supplier No") THEN
                //  "Supplier Name":=Vendor.Name;
            end;
        }
        field(6; Remarks; Text[250])
        {
        }
    }

    keys
    {
        key(Key1; "Reference No.", "Supplier No")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }

    var
        ProcurementRequest: Record "Procurement Request";
        Vendor: Record Vendor;
        Bidder: Record Bidders;


    procedure CreateQuote(var SupplierSelection: Record "Tender Suppliers")
    var
        PurchaseHeader: Record "Purchase Header";
        PurchaseLine: Record "Purchase Line";
        PurchaseRequest: Record "Procurement Request";
        PreQualifiedList: Record "Prequalified Suppliers1";
        ProcurementRequestLine: Record "Procurement Request Lines";
    begin
        /* Create a supplier from the list of Pre-Qualified Suppliers */
        if Awarded then begin
            PurchaseHeader.Init;
            PurchaseHeader."Document Type" := PurchaseHeader."document type"::Quote;
            PurchaseHeader."No." := '';
            PurchaseHeader."Buy-from Vendor No." := "Supplier No";
            PurchaseHeader.Validate(PurchaseHeader."Buy-from Vendor No.");
            //PurchaseHeader."Procurement Plan Year":=
            PurchaseHeader.Insert(true);

            ProcurementRequestLine.Reset;
            ProcurementRequestLine.SetRange(ProcurementRequestLine."Requisition No", SupplierSelection."Reference No.");
            if ProcurementRequestLine.Find('-') then
                repeat

                    PurchaseLine.Init;
                    PurchaseLine."Document Type" := PurchaseHeader."Document Type";
                    PurchaseLine."Document No." := PurchaseHeader."No.";
                    PurchaseLine."Line No." := ProcurementRequestLine."Line No";
                    PurchaseLine.Type := ProcurementRequestLine.Type;
                    PurchaseLine."No." := ProcurementRequestLine.No;
                    //MESSAGE('pURCHASE nO. %1',PurchaseLine."No.");
                    PurchaseLine.Validate(PurchaseLine."No.");
                    PurchaseLine.Description := ProcurementRequestLine.Description;
                    PurchaseLine."Unit of Measure" := ProcurementRequestLine."Unit of Measure";
                    PurchaseLine.Quantity := ProcurementRequestLine.Quantity;
                    PurchaseLine.Validate(Quantity);
                    PurchaseLine."Direct Unit Cost" := ProcurementRequestLine."Unit Price";
                    PurchaseLine.Validate("Direct Unit Cost");
                    PurchaseLine.Insert;


                until ProcurementRequestLine.Next = 0;
        end;

    end;
}
